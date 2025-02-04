/*
   sexta-feira, 07 de novembro de 2017 - 08:45:04
   Database: ProvaSP
*/

USE ProvaSP

BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.MediaEdicaoAluno
	DROP CONSTRAINT FK_MediaAluno_AreaConhecimento
GO
ALTER TABLE dbo.AreaConhecimento SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.AreaConhecimento', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.AreaConhecimento', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.AreaConhecimento', 'Object', 'CONTROL') as Contr_Per BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_MediaEdicaoAluno
	(
	alu_matricula varchar(50) NOT NULL,
	AreaConhecimentoID tinyint NOT NULL,
	Edicao varchar(10) NOT NULL,
	esc_codigo varchar(20) NOT NULL,
	tur_id bigint NULL,
	tur_codigo varchar(20) NOT NULL,
	Valor varchar(50) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_MediaEdicaoAluno SET (LOCK_ESCALATION = TABLE)
GO
IF EXISTS(SELECT * FROM dbo.MediaEdicaoAluno)
	 EXEC('INSERT INTO dbo.Tmp_MediaEdicaoAluno (alu_matricula, AreaConhecimentoID, Edicao, esc_codigo, tur_codigo, Valor)
		SELECT alu_matricula, AreaConhecimentoID, Edicao, esc_codigo, tur_codigo, Valor FROM dbo.MediaEdicaoAluno WITH (HOLDLOCK TABLOCKX)')
GO
DROP TABLE dbo.MediaEdicaoAluno
GO
EXECUTE sp_rename N'dbo.Tmp_MediaEdicaoAluno', N'MediaEdicaoAluno', 'OBJECT' 
GO
ALTER TABLE dbo.MediaEdicaoAluno ADD CONSTRAINT
	PK_MediaEdicaoAluno PRIMARY KEY CLUSTERED 
	(
	alu_matricula,
	AreaConhecimentoID,
	Edicao
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.MediaEdicaoAluno ADD CONSTRAINT
	FK_MediaAluno_AreaConhecimento FOREIGN KEY
	(
	AreaConhecimentoID
	) REFERENCES dbo.AreaConhecimento
	(
	AreaConhecimentoID
	) ON UPDATE  NO ACTION 
	 ON DELETE  NO ACTION 
	
GO
COMMIT
select Has_Perms_By_Name(N'dbo.MediaEdicaoAluno', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.MediaEdicaoAluno', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.MediaEdicaoAluno', 'Object', 'CONTROL') as Contr_Per 