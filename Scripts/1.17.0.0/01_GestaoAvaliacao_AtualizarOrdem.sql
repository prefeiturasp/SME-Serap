USE GestaoAvaliacao
GO

--Iniciar transa��o
BEGIN TRANSACTION
SET XACT_ABORT ON

	UPDATE Test
		SET [Order] = Id

-- Fechar transa��o
SET XACT_ABORT OFF
COMMIT TRANSACTION	