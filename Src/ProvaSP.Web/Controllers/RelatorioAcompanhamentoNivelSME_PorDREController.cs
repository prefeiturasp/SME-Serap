﻿using ProvaSP.Data;
using ProvaSP.Web.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProvaSP.Web.Controllers
{
    public class RelatorioAcompanhamentoNivelSME_PorDREController : Controller
    {
        // GET: RelatorioAcompanhamentoNivelSME_PorDRE
        public ActionResult Index(string usu_id)
        {
            var usuario = DataUsuario.RetornarUsuario(usu_id);

            if (usuario.AcessoNivelSME)
            {
                ViewBag.Usuario = usuario;
                var model = new RelatorioAcompanhamentoEscola();
                var indicadores = Data.DataAcompanhamentoAplicacao.RecuperarAcompanhamentoEscolaNivelSME_PorDRE(Data.Funcionalidades.Prova.Edicao);
                model.IndicadoresAgrupadosChave = Data.DataAcompanhamentoAplicacao.MontarGridQuantidadeRespondentes(indicadores);
                return View(model);
            }
            else
                return RedirectToAction("Index", "RelatorioAcompanhamento");
        }
    }
}