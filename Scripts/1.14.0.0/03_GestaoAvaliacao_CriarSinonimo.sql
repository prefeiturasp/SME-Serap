USE [GestaoAvaliacao]
GO

--Iniciar transa��o
BEGIN TRANSACTION
SET XACT_ABORT ON

	IF (NOT EXISTS (SELECT * FROM sys.synonyms WITH(NOLOCK) WHERE name = 'SGP_ACA_CalendarioAnual'))
	BEGIN
		CREATE SYNONYM [dbo].[SGP_ACA_CalendarioAnual] FOR [GestaoAvaliacao_SGP].[dbo].[ACA_CalendarioAnual]
	END

--Fechar transa��o
SET XACT_ABORT OFF
COMMIT TRANSACTION