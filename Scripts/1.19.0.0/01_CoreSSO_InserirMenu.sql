USE CoreSSO
GO

--Iniciar transa��o
BEGIN TRANSACTION
SET XACT_ABORT ON
		
		DECLARE @nomeSistema VARCHAR(MAX) = 'SERAp' 
		DECLARE @nomeModuloAvo VARCHAR(MAX) 
		DECLARE @nomeModuloPai VARCHAR(MAX) 
		DECLARE @nomeModulo VARCHAR(MAX) 

	
		-- Insere modulo no menu do sistema no CoreSSO
		EXEC MS_InserePaginaMenu
			@nomeSistema = @nomeSistema -- Nome do sistema (obrigat�rio)			
			,@nomeModuloPai = 'Resultados' -- Nome do m�dulo pai (Opicional, ap�nas quando houver)
			,@nomeModulo = 'Comparativo de desempenho da rede' -- Nome do m�dulo (Obrigat�rio)
			,@SiteMap1Nome = 'Comparativo de desempenho da rede'
			,@SiteMap1Url = '/ReportPerformance/Index'					
			,@possuiVisaoAdm = 1 -- Indicar se possui vis�o de administador
			,@possuiVisaoGestao = 1 -- Indicar se possui vis�o de Gest�o
			,@possuiVisaoUA = 0 -- Indicar se possui vis�o de UA
			,@possuiVisaoIndividual = 0 -- Indicar se possui vis�o de individual
				
		PRINT '--> Termino da execu��o do script.'	
	
-- Fechar transa��o
SET XACT_ABORT OFF
COMMIT TRANSACTION	
