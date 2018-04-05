USE CoreSSO
GO

--Iniciar transa��o
BEGIN TRANSACTION
SET XACT_ABORT ON
		
		DECLARE @nomeSistema VARCHAR(MAX) = 'SERAp' 
		DECLARE @nomeModuloAvo VARCHAR(MAX) 
		DECLARE @nomeModuloPai VARCHAR(MAX) 
		DECLARE @nomeModulo VARCHAR(MAX) 

		SET @nomeModuloAvo = NULL
		SET @nomeModuloPai = 'Provas'
		SET @nomeModulo = 'Prova eletr�nica'

		-- Insere modulo no menu do sistema no CoreSSO
		EXEC MS_InserePaginaMenu
			@nomeSistema = @nomeSistema -- Nome do sistema (obrigat�rio)			
			,@nomeModuloPai = @nomeModuloPai -- Nome do m�dulo pai (Opicional, ap�nas quando houver)
			,@nomeModulo = @nomeModulo -- Nome do m�dulo (Obrigat�rio)
			,@SiteMap1Nome = 'Consulta de provas eletr�nicas'
			,@SiteMap1Url = '/ElectronicTest/Index'		
			,@SiteMap2Nome = 'Prova eletr�nica'
			,@SiteMap2Url = '/ElectronicTest/Form'				
			,@possuiVisaoAdm = 1 -- Indicar se possui vis�o de administador
			,@possuiVisaoGestao = 1 -- Indicar se possui vis�o de Gest�o
			,@possuiVisaoUA = 1 -- Indicar se possui vis�o de UA
			,@possuiVisaoIndividual = 1 -- Indicar se possui vis�o de individual

		-- Insere modulo no menu do sistema no CoreSSO
		EXEC MS_InserePaginaMenu
			@nomeSistema = @nomeSistema -- Nome do sistema (obrigat�rio)			
			,@nomeModuloPai = 'Par�metros' -- Nome do m�dulo pai (Opicional, ap�nas quando houver)
			,@nomeModulo = 'Configura��o da p�gina inicial' -- Nome do m�dulo (Obrigat�rio)
			,@SiteMap1Nome = 'Consulta de configura��es da p�gina inicial'
			,@SiteMap1Url = '/PageConfiguration/List'		
			,@SiteMap2Nome = 'Cadastro de configura��es da p�gina inicial'
			,@SiteMap2Url = '/PageConfiguration/Form'				
			,@possuiVisaoAdm = 1 -- Indicar se possui vis�o de administador
			,@possuiVisaoGestao = 0 -- Indicar se possui vis�o de Gest�o
			,@possuiVisaoUA = 0 -- Indicar se possui vis�o de UA
			,@possuiVisaoIndividual = 0 -- Indicar se possui vis�o de individual
				
		PRINT '--> Termino da execu��o do script.'	
	
-- Fechar transa��o
SET XACT_ABORT OFF
COMMIT TRANSACTION	
