USE CoreSSO
GO

--Iniciar transa��o
BEGIN TRANSACTION
SET XACT_ABORT ON
		
		DECLARE @nomeSistema VARCHAR(100) = 'SERAp'

		-- Insere modulo no menu do sistema no CoreSSO
		EXEC MS_InserePaginaMenu
			@nomeSistema = @nomeSistema -- Nome do sistema (obrigat�rio)			
			,@nomeModuloPai = 'Cadastros' -- Nome do m�dulo pai (Opicional, ap�nas quando houver)
			,@nomeModulo = '�rea de conhecimento' -- Nome do m�dulo (Obrigat�rio)
			,@SiteMap1Nome = 'Consultar �reas de conhecimento'
			,@SiteMap1Url = '/KnowledgeArea/List'
			,@SiteMap2Nome = 'Cadastrar �reas de conhecimento' 
			,@SiteMap2Url = '/KnowledgeArea/Form'						
			,@possuiVisaoAdm = 1 -- Indicar se possui vis�o de administador
			,@possuiVisaoGestao = 1 -- Indicar se possui vis�o de Gest�o
			,@possuiVisaoUA = 0 -- Indicar se possui vis�o de UA
			,@possuiVisaoIndividual = 0 -- Indicar se possui vis�o de individual

			-- Insere modulo no menu do sistema no CoreSSO
		EXEC MS_InserePaginaMenu
			@nomeSistema = @nomeSistema -- Nome do sistema (obrigat�rio)			
			,@nomeModuloPai = 'Cadastros' -- Nome do m�dulo pai (Opicional, ap�nas quando houver)
			,@nomeModulo = 'Assunto e subassunto' -- Nome do m�dulo (Obrigat�rio)
			,@SiteMap1Nome = 'Consultar assuntos e subassuntos'
			,@SiteMap1Url = '/Subject/List'
			,@SiteMap2Nome = 'Cadastrar assuntos e subassuntos' 
			,@SiteMap2Url = '/Subject/Form'						
			,@possuiVisaoAdm = 1 -- Indicar se possui vis�o de administador
			,@possuiVisaoGestao = 1 -- Indicar se possui vis�o de Gest�o
			,@possuiVisaoUA = 0 -- Indicar se possui vis�o de UA
			,@possuiVisaoIndividual = 0 -- Indicar se possui vis�o de individual
		
		PRINT '--> Termino da execu��o do script.'	
	
-- Fechar transa��o
SET XACT_ABORT OFF
COMMIT TRANSACTION	
