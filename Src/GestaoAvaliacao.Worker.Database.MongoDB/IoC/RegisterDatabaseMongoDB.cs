﻿using GestaoAvaliacao.Worker.Database.MongoDB.Contexts;
using GestaoAvaliacao.Worker.Database.MongoDB.Settings;
using GestaoAvaliacao.Worker.IoC.Contracts;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;

namespace GestaoAvaliacao.Worker.Database.MongoDB.IoC
{
    public class RegisterDatabaseMongoDB : IIoCRegisterBootstrap
    {
        public void Register(IServiceCollection services, IConfiguration configuration)
        {
            services.Configure<GestaoAvaliacaoWorkerMongoDBSettings>(configuration.GetSection(nameof(GestaoAvaliacaoWorkerMongoDBSettings)));
            services.AddSingleton<IGestaoAvaliacaoWorkerMongoDBSettings>(sp => sp.GetRequiredService<IOptions<GestaoAvaliacaoWorkerMongoDBSettings>>().Value);
            services.AddTransient<IGestaoAvaliacaoWorkerMongoDBContext, GestaoAvaliacaoWorkerMongoDBContext>();
        }
    }
}