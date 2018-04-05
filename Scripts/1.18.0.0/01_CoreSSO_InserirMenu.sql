USE PUB_DEV_SPO_CoreSSO
GO

--Iniciar transa��o
BEGIN TRANSACTION
SET XACT_ABORT ON
		
		DECLARE @nomeSistema VARCHAR(MAX) = 'SERAp' 
		DECLARE @nomeModuloAvo VARCHAR(MAX) 
		DECLARE @nomeModuloPai VARCHAR(MAX) 
		DECLARE @nomeModulo VARCHAR(MAX) 

		SET @nomeModuloAvo = NULL
		SET @nomeModuloPai = NULL
		SET @nomeModulo = 'Auditoria'
 
		EXEC MS_InserePaginaMenu 
		  @nomeSistema = @nomeSistema,  
		  @nomeModuloPai = @nomeModuloPai,  
		  @nomeModulo = @nomeModulo,  
		  @SiteMap1Nome = 'Auditoria',  
		  @SiteMap1Url = 'Auditoria',  
		  @possuiVisaoAdm = 1,  
		  @possuiVisaoGestao = 1,  
		  @possuiVisaoUA = 0,  
		  @possuiVisaoIndividual = 0,  
		  @nomeModuloAvo = @nomeModuloAvo  

		-- Insere modulo no menu do sistema no CoreSSO
		EXEC MS_InserePaginaMenu
			@nomeSistema = @nomeSistema -- Nome do sistema (obrigat�rio)			
			,@nomeModuloPai = 'Auditoria' -- Nome do m�dulo pai (Opicional, ap�nas quando houver)
			,@nomeModulo = 'Log de altera��es nas respostas' -- Nome do m�dulo (Obrigat�rio)
			,@SiteMap1Nome = 'Log de altera��es nas respostas'
			,@SiteMap1Url = '/ResponseChangeLog/Index'					
			,@possuiVisaoAdm = 1 -- Indicar se possui vis�o de administador
			,@possuiVisaoGestao = 1 -- Indicar se possui vis�o de Gest�o
			,@possuiVisaoUA = 0 -- Indicar se possui vis�o de UA
			,@possuiVisaoIndividual = 0 -- Indicar se possui vis�o de individual
				
		PRINT '--> Termino da execu��o do script.'	
	
-- Fechar transa��o
SET XACT_ABORT OFF
COMMIT TRANSACTION	
