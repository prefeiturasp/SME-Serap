﻿using GestaoAvaliacao.Entities;
using GestaoAvaliacao.IBusiness;
using GestaoAvaliacao.IRepository;
using GestaoAvaliacao.Util;
using System;
using System.Collections.Generic;
using System.Linq;

namespace GestaoAvaliacao.Business
{
    public class PageConfigurationBusiness : IPageConfigurationBusiness
    {
        private readonly IPageConfigurationRepository pageConfigurationRepository;

        public PageConfigurationBusiness(IPageConfigurationRepository pageConfigurationRepository)
        {
            this.pageConfigurationRepository = pageConfigurationRepository;
        }

        #region Custom

        private Validate Validate(PageConfiguration entity, ValidateAction action, Validate valid)
        {
            valid.Message = null;
            if (action == ValidateAction.Save || action == ValidateAction.Update)
            {
                if (entity.Category == (short)PageConfigurationCategory.Video && entity.Featured && ExistsFeaturedVideo(entity.Id))
                    valid.Message += "<br/>Já existe um vídeo cadastrado como destaque.";
            }
            else if (action == ValidateAction.Delete)
            {
                PageConfiguration ent = Get(entity.Id);
                if (ent == null)
                {
                    valid.Message = "Não foi encontrada a configuração da página a ser excluída.";
                    valid.Code = 404;
                }
            }

            if (!string.IsNullOrEmpty(valid.Message))
            {
                string br = "<br/>";
                valid.Message = valid.Message.TrimStart(br.ToCharArray());

                valid.IsValid = false;

                if (valid.Code <= 0)
                    valid.Code = 400;

                valid.Type = ValidateType.alert.ToString();
            }
            else
                valid.IsValid = true;

            return valid;
        }

        #endregion

        #region Read

        public PageConfiguration Get(long id)
        {
            return pageConfigurationRepository.Get(id);
        }
        public PageConfiguration Find(long id)
        {
            return pageConfigurationRepository.Find(id);
        }

        public IEnumerable<PageConfiguration> LoadAll()
        {
            return pageConfigurationRepository.LoadAll();
        }

        public IEnumerable<PageConfiguration> Load(ref Pager pager)
        {
            return pageConfigurationRepository.Load(ref pager);
        }

        public IEnumerable<PageConfiguration> Search(string search, string category, ref Pager pager)
        {
            return pageConfigurationRepository.Search(search, category, ref pager);
        }

        public bool ExistsModelDescription(long id, string description)
        {
            return pageConfigurationRepository.ExistsModelDescription(id, description);
        }

        public bool ExistsFeaturedVideo(long id)
        {
            return pageConfigurationRepository.ExistsFeaturedVideo(id);
        }

        public PageConfiguration ObterLinkAdminSeraEstudantes()
        {
            PageConfiguration pageAdminSerapEstudantes = new PageConfiguration()
            {
                Title = "Serap Estudantes",
                Description = "Serap Estudantes",
                ButtonDescription = "Serap Estudantes",
                Link = "/AdminSerapEstudantes",
                Category = (short)PageConfigurationCategory.ExternalAccess,
                Featured = true
            };

            return pageAdminSerapEstudantes;
        }

        public bool VerificaPerfilAcessoAdminSerapEstudantes(Guid grupo)
        {
            List<Guid> gruposPermissaoAcesso = new List<Guid>();

            gruposPermissaoAcesso.Add(Guid.Parse("aad9d772-41a3-e411-922d-782bcb3d218e"));
            gruposPermissaoAcesso.Add(Guid.Parse("104f0759-87e8-e611-9541-782bcb3d218e"));
            gruposPermissaoAcesso.Add(Guid.Parse("22366a3e-9e4c-e711-9541-782bcb3d218e"));
            gruposPermissaoAcesso.Add(Guid.Parse("ecf7a20d-1a1e-e811-b259-782bcb3d2d76"));
            gruposPermissaoAcesso.Add(Guid.Parse("d4026f2c-1a1e-e811-b259-782bcb3d2d76"));
            gruposPermissaoAcesso.Add(Guid.Parse("75dcab30-2c1e-e811-b259-782bcb3d2d76"));
            gruposPermissaoAcesso.Add(Guid.Parse("4318d329-17dc-4c48-8e59-7d80557f7e77"));
            gruposPermissaoAcesso.Add(Guid.Parse("e77e81b1-191e-e811-b259-782bcb3d2d76"));
            gruposPermissaoAcesso.Add(Guid.Parse("067d9b21-a1ff-e611-9541-782bcb3d218e"));
            gruposPermissaoAcesso.Add(Guid.Parse("e77e81b1-191e-e811-b259-782bcb3d2d76"));
            gruposPermissaoAcesso.Add(Guid.Parse("067d9b21-a1ff-e611-9541-782bcb3d218e"));

            return gruposPermissaoAcesso.Any(g => g == grupo);
        }

        #endregion

        #region Write

        public PageConfiguration Save(PageConfiguration entity)
        {
            entity.Validate = Validate(entity, ValidateAction.Save, entity.Validate);
            if (entity.Validate.IsValid)
            {
                entity = pageConfigurationRepository.Save(entity);
                entity.Validate.Type = ValidateType.Save.ToString();
                entity.Validate.Message = "Configuração da página salva com sucesso.";
            }

            return entity;
        }

        public PageConfiguration Update(PageConfiguration entity)
        {
            entity.Validate = Validate(entity, ValidateAction.Update, entity.Validate);
            if (entity.Validate.IsValid)
            {
                pageConfigurationRepository.Update(entity);
                entity.Validate.Type = ValidateType.Update.ToString();
                entity.Validate.Message = "Configuração da página alterada com sucesso.";
            }

            return entity;
        }

        public PageConfiguration Delete(long id)
        {
            PageConfiguration entity = new PageConfiguration { Id = id };
            entity.Validate = Validate(entity, ValidateAction.Delete, entity.Validate);
            if (entity.Validate.IsValid)
            {
                pageConfigurationRepository.Delete(entity);
                entity.Validate.Type = ValidateType.Delete.ToString();
                entity.Validate.Message = "Configuração da página excluída com sucesso.";
            }

            return entity;
        }

        #endregion
    }
}
