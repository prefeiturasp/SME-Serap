USE CoreSSO
GO

--Iniciar transa��o
BEGIN TRANSACTION
SET XACT_ABORT ON
		
		DECLARE @nomeSistema VARCHAR(100) = 'SERAp'

		-- Insere modulo no menu do sistema no CoreSSO
		EXEC MS_InserePaginaMenu
			@nomeSistema = @nomeSistema -- Nome do sistema (obrigat�rio)			
			,@nomeModuloPai = 'Relat�rios' -- Nome do m�dulo pai (Opicional, ap�nas quando houver)
			,@nomeModulo = 'Relat�rio de desempenho por prova' -- Nome do m�dulo (Obrigat�rio)
			,@SiteMap1Nome = 'Relat�rio de desempenho por prova'
			,@SiteMap1Url = '/ReportTestPerformance/IndexDRE'
			,@SiteMap2Nome = 'Relat�rio de desempenho por prova' 
			,@SiteMap2Url = '/ReportTestPerformance/IndexSchool'						
			,@possuiVisaoAdm = 1 -- Indicar se possui vis�o de administador
			,@possuiVisaoGestao = 0 -- Indicar se possui vis�o de Gest�o
			,@possuiVisaoUA = 0 -- Indicar se possui vis�o de UA
			,@possuiVisaoIndividual = 0 -- Indicar se possui vis�o de individual

		-- Insere modulo no menu do sistema no CoreSSO
		EXEC MS_InserePaginaMenu
			@nomeSistema = @nomeSistema -- Nome do sistema (obrigat�rio)			
			,@nomeModuloPai = 'Relat�rios' -- Nome do m�dulo pai (Opicional, ap�nas quando houver)
			,@nomeModulo = 'Relat�rio de desempenho por quest�o' -- Nome do m�dulo (Obrigat�rio)
			,@SiteMap1Nome = 'Relat�rio de desempenho por quest�o'
			,@SiteMap1Url = '/ReportItemPerformance/IndexDRE'
			,@SiteMap2Nome = 'Relat�rio de desempenho por quest�o' 
			,@SiteMap2Url = '/ReportItemPerformance/IndexSchool'						
			,@possuiVisaoAdm = 1 -- Indicar se possui vis�o de administador
			,@possuiVisaoGestao = 0 -- Indicar se possui vis�o de Gest�o
			,@possuiVisaoUA = 0 -- Indicar se possui vis�o de UA
			,@possuiVisaoIndividual = 0 -- Indicar se possui vis�o de individual

		-- Insere modulo no menu do sistema no CoreSSO
		EXEC MS_InserePaginaMenu
			@nomeSistema = @nomeSistema -- Nome do sistema (obrigat�rio)			
			,@nomeModuloPai = 'Relat�rios' -- Nome do m�dulo pai (Opicional, ap�nas quando houver)
			,@nomeModulo = 'Relat�rio de escolha por alternativa' -- Nome do m�dulo (Obrigat�rio)
			,@SiteMap1Nome = 'Relat�rio de escolha por alternativa'
			,@SiteMap1Url = '/ReportItemChoice'						
			,@possuiVisaoAdm = 1 -- Indicar se possui vis�o de administador
			,@possuiVisaoGestao = 0 -- Indicar se possui vis�o de Gest�o
			,@possuiVisaoUA = 0 -- Indicar se possui vis�o de UA
			,@possuiVisaoIndividual = 0 -- Indicar se possui vis�o de individual
		
		PRINT '--> Termino da execu��o do script.'	
	
-- Fechar transa��o
SET XACT_ABORT OFF
COMMIT TRANSACTION	
