USE CoreSSO
GO

--Iniciar transa��o
BEGIN TRANSACTION
SET XACT_ABORT ON

	DECLARE @nomeSistema VARCHAR(100) = 'SERAp'
	DECLARE @idSistema INT = (SELECT sis_id FROM SYS_Sistema WHERE sis_nome = @nomeSistema)

	UPDATE SYS_Modulo 
		SET mod_nome = 'Relat�rio de envio de folhas de respostas' 
	WHERE sis_id = @idSistema 
		AND mod_nome = 'Acompanhamento de envio de folhas de respostas' 
		AND mod_situacao = 1

	UPDATE SYS_Modulo 
		SET mod_nome = 'Relat�rio de processamento de corre��o'
	WHERE sis_id = @idSistema 
		AND mod_nome = 'Acompanhamento de processamento de corre��o' 
		AND mod_situacao = 1

	UPDATE SYS_ModuloSiteMap 
		SET msm_nome = 'Relat�rio de envio de folhas de respostas'
	WHERE sis_id = @idSistema 
		AND msm_nome = 'Acompanhamento de envio de folhas de respostas'

	UPDATE SYS_ModuloSiteMap
		SET msm_nome = 'Relat�rio de processamento de corre��o'
	WHERE sis_id = @idSistema 
	AND msm_nome = 'Acompanhamento de processamento de corre��o'

	UPDATE SYS_Modulo 
		SET mod_nome = 'Relat�rio de desempenho por item' 	
	WHERE sis_id = @idSistema 
		AND mod_nome = 'Relat�rio de desempenho por quest�o' 
		AND mod_situacao = 1
	
	UPDATE SYS_ModuloSiteMap 
		SET msm_nome = 'Relat�rio de desempenho por item'	
	WHERE sis_id = @idSistema 
		AND msm_nome = 'Relat�rio de desempenho por quest�o'

	UPDATE SYS_Modulo 
		SET mod_nome = 'Relat�rio de desempenho por alternativa' 	
	WHERE sis_id = @idSistema 
		AND mod_nome = 'Relat�rio de escolha por alternativa' 
		AND mod_situacao = 1
	
	UPDATE SYS_ModuloSiteMap 
		SET msm_nome = 'Relat�rio de desempenho por alternativa'	
	WHERE sis_id = @idSistema 
		AND msm_nome = 'Relat�rio de escolha por alternativa'

-- Fechar transa��o
SET XACT_ABORT OFF
COMMIT TRANSACTION	