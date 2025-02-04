﻿using GestaoAvaliacao.API.App_Start;
using System;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;

namespace GestaoAvaliacao.API.Controllers
{
    [RoutePrefix("api/File")]
	[ApiExplorerSettings(IgnoreApi = true)]
	public class FileUploadController : ApiController
	{
		private readonly string root = System.Web.Hosting.HostingEnvironment.MapPath("~/Files");

        [HttpOptions]
		[Route("Upload")]
		public object UploadFileOptions()
		{
			return Request.CreateResponse(HttpStatusCode.OK);
		}

        [HttpGet]
		[Route("Upload")]
		public object Upload(int resumableChunkNumber, string resumableIdentifier)
		{
			return ChunkIsHere(resumableChunkNumber, resumableIdentifier) ? Request.CreateResponse(HttpStatusCode.OK) : Request.CreateResponse(HttpStatusCode.NoContent);
		}

        [HttpPost]
		[Route("Upload")]
		public async Task<object> Upload()
		{
			// Check if the request contains multipart/form-data.
			if (!Request.Content.IsMimeMultipartContent())
			{
				throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
			}
			if (!Directory.Exists(root)) Directory.CreateDirectory(root);
			var provider = new MultipartFormDataStreamProvider(root);

			if (await ReadPart(provider))
			{
				// Success
				return Request.CreateResponse(HttpStatusCode.OK);
			}
			else
			{
				// Fail
				var message = DeleteInvalidChunkData(provider) ? "Cannot read multi part file data." : "Cannot delete temporary file chunk data.";
				return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, new System.Exception(message));
			}
		}

		private static bool DeleteInvalidChunkData(MultipartFormDataStreamProvider provider)
		{
			try
			{
				var localFileName = provider.FileData[0].LocalFileName;
				if (File.Exists(localFileName))
				{
					File.Delete(localFileName);
				}
				return true;
			}
			catch {
				return false;
			}
		}

		private async Task<bool> ReadPart(MultipartFormDataStreamProvider provider)
		{
			try
			{
				await Request.Content.ReadAsMultipartAsync(provider);
				ResumableConfiguration configuration = GetUploadConfiguration(provider);
				int chunkNumber = GetChunkNumber(provider);

				// Rename generated file
				MultipartFileData chunk = provider.FileData[0]; // Only one file in multipart message
				RenameChunk(chunk, chunkNumber, configuration.Identifier);

				// Assemble chunks into single file if they're all here
				TryAssembleFile(configuration);
				return true;
			}
			catch {
				return false;
			}
		}

		#region Get configuration

		
		private ResumableConfiguration GetUploadConfiguration(MultipartFormDataStreamProvider provider)
		{
			return ResumableConfiguration.Create(identifier: GetId(provider), filename: GetFileName(provider), chunks: GetTotalChunks(provider));
		}

		
		private string GetFileName(MultipartFormDataStreamProvider provider)
		{
			var filename = provider.FormData["resumableFilename"];
			return !String.IsNullOrEmpty(filename) ? filename : provider.FileData[0].Headers.ContentDisposition.FileName.Trim('\"');
		}

		
		private string GetId(MultipartFormDataStreamProvider provider)
		{
			var id = provider.FormData["resumableIdentifier"];
			return !String.IsNullOrEmpty(id) ? id : Guid.NewGuid().ToString();
		}

		
		private int GetTotalChunks(MultipartFormDataStreamProvider provider)
		{
			var total = provider.FormData["resumableTotalChunks"];
			return !String.IsNullOrEmpty(total) ? Convert.ToInt32(total) : 1;
		}

		
		private int GetChunkNumber(MultipartFormDataStreamProvider provider)
		{
			var chunk = provider.FormData["resumableChunkNumber"];
			return !String.IsNullOrEmpty(chunk) ? Convert.ToInt32(chunk) : 1;
		}

		#endregion

		#region Chunk methods

		private string GetChunkFileName(int chunkNumber, string identifier)
		{
			return Path.Combine(root, string.Format("{0}_{1}", identifier, chunkNumber.ToString()));
		}

		private void RenameChunk(MultipartFileData chunk, int chunkNumber, string identifier)
		{
			string generatedFileName = chunk.LocalFileName;
			string chunkFileName = GetChunkFileName(chunkNumber, identifier);
			if (File.Exists(chunkFileName)) File.Delete(chunkFileName);
			File.Move(generatedFileName, chunkFileName);

		}

		private string GetFilePath(ResumableConfiguration configuration)
		{
			return Path.Combine(root, configuration.Identifier);
		}

		private bool ChunkIsHere(int chunkNumber, string identifier)
		{
			string fileName = GetChunkFileName(chunkNumber, identifier);
			return File.Exists(fileName);
		}

		private bool AllChunksAreHere(ResumableConfiguration configuration)
		{
			for (int chunkNumber = 1; chunkNumber <= configuration.Chunks; chunkNumber++)
				if (!ChunkIsHere(chunkNumber, configuration.Identifier)) return false;
			return true;
		}
	
		private void TryAssembleFile(ResumableConfiguration configuration)
		{
			if (AllChunksAreHere(configuration))
			{
				// Create a single file
				var path = ConsolidateFile(configuration);

				// Rename consolidated with original name of upload
				RenameFile(path, Path.Combine(root, configuration.FileName));

				// Delete chunk files
				DeleteChunks(configuration);
			}
		}

		private void DeleteChunks(ResumableConfiguration configuration)
		{
			for (int chunkNumber = 1; chunkNumber <= configuration.Chunks; chunkNumber++)
			{
				var chunkFileName = GetChunkFileName(chunkNumber, configuration.Identifier);
				File.Delete(chunkFileName);
			}
		}
		
		private string ConsolidateFile(ResumableConfiguration configuration)
		{
			var path = GetFilePath(configuration);
			using (var destStream = File.Create(path, 15000))
			{
				for (int chunkNumber = 1; chunkNumber <= configuration.Chunks; chunkNumber++)
				{
					var chunkFileName = GetChunkFileName(chunkNumber, configuration.Identifier);
					using (var sourceStream = File.OpenRead(chunkFileName))
					{
						sourceStream.CopyTo(destStream);
					}
				}
				destStream.Close();
			}

			return path;
		}

		#endregion

		private void RenameFile(string sourceName, string targetName)
		{
			targetName = Path.GetFileName(targetName); // Strip to filename if directory is specified (avoid cross-directory attack)
			string realFileName = Path.Combine(root, targetName);
			if (File.Exists(realFileName)) File.Delete(realFileName);
			File.Move(sourceName, realFileName);
		}
	}
}