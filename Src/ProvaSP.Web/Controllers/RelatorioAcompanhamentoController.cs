﻿using ProvaSP.Data;
using ProvaSP.Model.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProvaSP.Web.Controllers
{
    public class RelatorioAcompanhamentoController : Controller
    {
        // GET: RelatorioAcompanhamento
        public ActionResult Index(string usu_id)
        {
            var usuario = DataUsuario.RetornarUsuario(usu_id);

            if (usuario != null)
            {
                if (usuario.AcessoNivelSME)
                {
                    return RedirectToAction("Index", "RelatorioAcompanhamentoNivelSME", new { usu_id = usu_id });
                }
                else if (usuario.AcessoNivelSME || usuario.AcessoNivelDRE || usuario.Supervisor)
                {
                    //RecuperarCodigoComBaseNoPerfilDaPessoa
                    string uad_codigo = DataDRE.RecuperarCodigoDREComBaseNoPerfilDaPessoa(Data.Funcionalidades.Prova.Edicao, usuario.usu_id);
                    return RedirectToAction("Index", "RelatorioAcompanhamentoNivelDRE", new { usu_id = usu_id, uad_codigo = uad_codigo });
                }
                else if (usuario.AcessoNivelSME || usuario.AcessoNivelDRE || usuario.Supervisor || usuario.Diretor || usuario.Coordenador)
                {
                    string esc_codigo = DataEscola.RecuperarPrimeiroCodigoEscola(Data.Funcionalidades.Prova.Edicao, usuario.usu_id);
                    return RedirectToAction("Index", "RelatorioAcompanhamentoNivelEscola", new { usu_id = usu_id, esc_codigo = esc_codigo });
                }
            }
            return View();

        }
    }
}