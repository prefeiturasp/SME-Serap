USE [GestaoAvaliacao_SGP]
GO

--Iniciar transa��o
BEGIN TRANSACTION
SET XACT_ABORT ON

	IF NOT EXISTS(SELECT * FROM sys.indexes WHERE name = 'IX_MTR_MatriculaTurma_01' AND object_id = OBJECT_ID('MTR_MatriculaTurma'))
	BEGIN
		CREATE NONCLUSTERED INDEX [IX_MTR_MatriculaTurma_01]
		ON [dbo].[MTR_MatriculaTurma] ([esc_id],[mtu_situacao])
		INCLUDE ([alu_id],[tur_id],[mtu_numeroChamada])
	END  

--Fechar transa��o
SET XACT_ABORT OFF
COMMIT TRANSACTION