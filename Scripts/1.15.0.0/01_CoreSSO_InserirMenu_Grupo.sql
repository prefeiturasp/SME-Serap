USE [CoreSSO]
GO

--Iniciar transa��o
BEGIN TRANSACTION
SET XACT_ABORT ON
		
		DECLARE @nomeSistema VARCHAR(100) = 'SERAp'

		-- Insere modulo no menu do sistema no CoreSSO
		EXEC MS_InserePaginaMenu
			@nomeSistema = @nomeSistema -- Nome do sistema (obrigat�rio)			
			,@nomeModuloPai = 'Cadastros' -- Nome do m�dulo pai (Opicional, ap�nas quando houver)
			,@nomeModulo = 'Grupo de prova' -- Nome do m�dulo (Obrigat�rio)
			,@SiteMap1Nome = 'Consultar grupos de prova'
			,@SiteMap1Url = '/TestGroup/List'
			,@SiteMap2Nome = 'Cadastrar grupos de prova' 
			,@SiteMap2Url = '/TestGroup/Form'						
			,@possuiVisaoAdm = 1 -- Indicar se possui vis�o de administador
			,@possuiVisaoGestao = 1 -- Indicar se possui vis�o de Gest�o
			,@possuiVisaoUA = 0 -- Indicar se possui vis�o de UA
			,@possuiVisaoIndividual = 0 -- Indicar se possui vis�o de individual
		
		PRINT '--> Termino da execu��o do script.'	
	
-- Fechar transa��o
SET XACT_ABORT OFF
COMMIT TRANSACTION	
