﻿
(function (angular, $) {

    //~SETTER
    angular
        .module('appMain', ['services', 'filters', 'directives', 'tooltip']);

    //~GETTER
    angular
        .module('appMain')
        .controller("ReportStudiesController", ReportStudiesController);

    ReportStudiesController.$inject = ['$scope', 'ReportStudiesModel', '$notification', '$pager', '$util', '$http', '$q', '$window'];


    function ReportStudiesController($scope, ReportStudiesModel, $notification, $pager, $util, $http, $q, $window) {

        var self = this;
        var params = $util.getUrlParams();

        $scope.processando = true;
        $scope.tipoResultado = null;
        $scope.listaGrupos = [];
        $scope.listaDestinatarios = [];
        $scope.listaImportacoes = null;
        $scope.campoPesquisa = "";
        $scope.arquivoSelecionado = null;
        $scope.paginate = $pager(ReportStudiesModel.carregaImportacoes);
        $scope.pageSize = 10;

        $scope.load = function _load() {
            self.chamadasBack = {};
            $notification.clear();
            $scope.carregaImportacoesPaginado(null);
            $scope.carregaGrupos();
            $scope.carregaDestinatarios();
        };

        $scope.pesquisarArquivo = function _pesquisarArquivo() {
            $scope.pages = 0;
            $scope.totalItens = 0;
            $scope.paginate.indexPage(0);
            $scope.pageSize = $scope.paginate.getPageSize();
            if ($scope.campoPesquisa === '' || $scope.campoPesquisa === null || $scope.campoPesquisa === undefined)
                $scope.carregaImportacoesPaginado(null);
            else
                $scope.carregaImportacoes($scope.campoPesquisa);
        };

        $scope.carregaImportacoes = function __Importacoes(campoPesquisa) {
            $scope.listaImportacoes = [];
            ReportStudiesModel.carregaImportacoes({ searchFilter: campoPesquisa },
                function (result) {
                    if (result.success) {
                        if (result.lista.length > 0) {
                            $scope.listaImportacoes = result.lista;
                            $scope.pageSize = result.pageSize;
                            $scope.totalItens = result.lista.length;
                        } else {
                            $scope.listaImportacoes = null;
                        }
                        $scope.campoPesquisa = "";
                    } else {
                        $notification[result.type ? result.type : 'error'](result.message);
                    }
                });
        }

        $scope.carregaGrupos = function __carregaGrupos() {
            $scope.listaGrupos = [
                { Codigo: 1, Nome: 'UE' },
                { Codigo: 2, Nome: 'DRE' },
                { Codigo: 3, Nome: 'SME' },
                { Codigo: 4, Nome: 'Geral' },
                { Codigo: 4, Nome: 'Público' }
            ];
        }

        $scope.carregaDestinatarios = function __carregaDestinatarios() {
            $scope.listaDestinatarios = [
                { Codigo: 1, Nome: 'BT - Butanta' },
                { Codigo: 2, Nome: 'Geral' },
                { Codigo: 3, Nome: '191 - Alipio' }
            ];
        }

        $scope.carregaImportacoesPaginado = function __ImportacoesPaginado(paginate) {
            $scope.listaImportacoes = [];

            $scope.paginate.paginate().then(
                function (result) {
                    if (result.success) {
                        if (result.lista.length > 0) {
                            $scope.listaImportacoes = result.lista;
                            $scope.pageSize = result.pageSize;
                            $scope.totalItens = $scope.paginate.totalItens();

                            if (!$scope.pages > 0) {
                                $scope.pages = $scope.paginate.totalPages();
                            }
                        } else {
                            $scope.listaImportacoes = null;
                        }
                    } else {
                        $notification[result.type ? result.type : 'error'](result.message);
                    }
                });
        }

        $scope.callModalNovaImportacao = function __callModalNovaImportacao() {
            $scope.limparDados();
            angular.element("#modalNovaImportacao").modal({ backdrop: 'static' });
        };

        $scope.selecionarArquivo = function __selecionarArquivo(element) {
            $scope.arquivoSelecionado = element.files[0];
            $scope.validacoesArquivo();
        }

        $scope.validacoesArquivo = function __validacoesArquivo() {
            var tamanhoArquivo = parseInt($scope.arquivoSelecionado.size);
            var fileSize = kmgtbytes(tamanhoArquivo);
            if ($scope.arquivoSelecionado.type !== 'text/html') {
                $scope.arquivoSelecionado = null;
                angular.element("input[type='file']").val(null);
                $notification['error']("Selecione um arquivo HTML");
                return false;
            }
        }

        $scope.exibirLoading = function __exibirLoading(exibir) {
            if (exibir)
                angular.element('#div_loading').css('display', 'block');
            else
                angular.element('#div_loading').css('display', 'none');
        }

        $scope.limparDados = function __limpar() {
            $scope.grupo = null;
            $scope.destinatario = null;
            $scope.arquivoSelecionado = null;
            angular.element("input[type='file']").val(null);
        }
        
        $scope.confirmarDeletar = function __confirmarDeletar(item) {
            $scope.itemParaDeletar = item;
            angular.element('#modalDelete').modal({ backdrop: 'static' });
        };

        $scope.abrirLink = function __abrirLink(link) {
            $window.open(link, '_blank', 'noreferrer');
        };
        
        $scope.deletar = function __deletar() {
            ReportStudiesModel.delete({ id: $scope.itemParaDeletar.Codigo }, function (result) {
                if (result.success) {
                    $notification.success('Registro excluido com sucesso!');
                    $scope.load();
                } else {
                    if (result.type && result.message)
                        $notification[result.type ? result.type : 'error'](result.message);
                }
            });
            angular.element('#modalDelete').modal('hide');
        };

        $scope.salvarImportacao = function __salvarImportacao() {            

            if ($scope.arquivoSelecionado === null || $scope.arquivoSelecionado === undefined) {
                $scope.callModalNovaImportacao();
                $notification['error']("Selecione um arquivo!");
                return false;
            }

            $scope.validacoesArquivo();

            $scope.exibirLoading(true);

            $scope.UploadFile().then(function (data) {
                if (data.success) {
                    $scope.limparDados();
                    $scope.exibirLoading(false);
                    $scope.carregaImportacoesPaginado();
                    $notification.success("Arquivo importado com sucesso!");
                }
                else {
                    $scope.limparDados();
                    $scope.exibirLoading(false);
                    $notification[data.type ? data.type : 'error'](data.message);
                }
            }, function (e) {
                $scope.limparDados();
                $scope.exibirLoading(false);
                $notification.error(e);
            });

        }

        $scope.UploadFile = function () {

            var form = new FormData();

            form.append('file', $scope.arquivoSelecionado);
            form.append('Name', $scope.arquivoSelecionado.FileName);
            form.append('TypeGroup', $scope.grupo.Codigo);
            form.append('Addressee', $scope.destinatario.Nome);
            form.append('Link', '');

            var defer = $q.defer();
            $http.post("/ReportStudies/Save", form,
                {
                    headers: { 'Content-Type': undefined },
                    transformRequest: angular.identity
                })
                .success(function (d) {
                    defer.resolve(d);
                })
                .error(function (e) {
                    $notification.error(e);
                });

            return defer.promise;
        }

        function kmgtbytes(num) {
            if (num > 0) {
                if (num < 1024) { return [num, 'Byte'] }
                if (num < 1048576) { return [parseInt(num / 1024), 'KB'] }
                if (num < 1073741824) { return [parseInt(num / 1024 / 1024), 'MB'] }
                if (num < 1099511600000) { return [parseInt(num / 1024 / 1024 / 1024), 'GB'] }
                return [num / 1024 / 1024 / 1024 / 1024, "TB"]
            }
            return num
        };        

        $scope.load();

    };

})
    (angular, jQuery);