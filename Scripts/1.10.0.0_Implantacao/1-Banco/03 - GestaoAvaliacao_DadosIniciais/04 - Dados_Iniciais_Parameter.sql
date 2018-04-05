GO
SET NUMERIC_ROUNDABORT OFF
GO
SET ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
IF EXISTS (SELECT * FROM tempdb..sysobjects WHERE id=OBJECT_ID('tempdb..#tmpErrors')) DROP TABLE #tmpErrors
GO
CREATE TABLE #tmpErrors (Error int)
GO
SET XACT_ABORT ON
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO
BEGIN TRANSACTION
GO 

USE CoreSSO

DECLARE @ent_id AS UNIQUEIDENTIFIER = ( SELECT  ent_id
										FROM    SYS_Entidade
										WHERE   
										ent_sigla = 'SMESP' and ent_situacao = 1
									  )
									  


USE GestaoAvaliacao




IF EXISTS ( SELECT  [Description] 
			FROM	[Parameter] ) 
BEGIN    
    DELETE  FROM [Parameter]
    DBCC CHECKIDENT ('Parameter', RESEED, 0);
END

IF EXISTS ( SELECT  [Description] 
			FROM	[ParameterType] ) 
BEGIN    
    DELETE  FROM [ParameterType]
    DBCC CHECKIDENT ('ParameterType', RESEED, 0);
END

IF EXISTS ( SELECT  [Description] 
			FROM	[ParameterCategory] ) 
BEGIN    
    DELETE  FROM [ParameterCategory]
    DBCC CHECKIDENT ('ParameterCategory', RESEED, 0);
END

IF EXISTS ( SELECT  [Description] 
			FROM	[ParameterPage] ) 
BEGIN    
    DELETE  FROM [ParameterPage]
    DBCC CHECKIDENT ('ParameterPage', RESEED, 0);
END

    
  
INSERT INTO [ParameterPage]
			([Description]
			,[CreateDate]
			,[UpdateDate]
			,[State]
			,[pageVersioning]
			,[pageObligatory])
		VALUES
			('Geral'
			,GETDATE()
			,GETDATE()
			,1
			,0
			,0)
	

        
INSERT INTO [ParameterPage]
			([Description]
			,[CreateDate]
			,[UpdateDate]
			,[State]
			,[pageVersioning]
			,[pageObligatory])
		VALUES
			('Item'
			,GETDATE()
			,GETDATE()
			,1
			,1
			,1)
	


INSERT INTO [ParameterPage] 
			([Description], 
			[pageVersioning], 
			[pageObligatory], 
			[CreateDate], 
			[UpdateDate], 
			[State]) 
			VALUES 
			('Prova', 
			0, 
			0, 
			GETDATE(), 
			GETDATE(), 
			1)
	           


INSERT INTO [dbo].[ParameterPage] 
			([Description], 
			[pageVersioning], 
			[pageObligatory], 
			[CreateDate], 
			[UpdateDate], 
			[State]) 
			VALUES 
			('Sistema', 
			0, 
			0, 
			GETDATE(), 
			GETDATE(), 
			1)
	

-- Insere as categorias dos par�metros  
 
INSERT INTO [ParameterCategory]
			([Description]
			,[CreateDate]
			,[UpdateDate]
			,[State])
		VALUES
			('Geral'
			,GETDATE()
			,GETDATE()
			,1)
		

          
INSERT INTO [ParameterCategory]
			([Description]
			,[CreateDate]
			,[UpdateDate]
			,[State])
		VALUES
			('Extens�es de imagens permitidas nos uploads'
			,GETDATE()
			,GETDATE()
			,1)
		
           

INSERT [dbo].[ParameterCategory] 
		([Description], 
		CreateDate, 
		UpdateDate, 
		State) 
VALUES ('Narra��o', 
		GETDATE(), 
		GETDATE(), 
		1)

INSERT INTO [dbo].[ParameterCategory] 
			([Description]
			,[CreateDate]
			,[UpdateDate]
			,[State]) 
		VALUES 
			(N'Configura��o'
			,GETDATE()
			,GETDATE()
			,1)		
           
-- Insere os tipos dos par�metros 
   
INSERT INTO [ParameterType]
			([Description]
			,[CreateDate]
			,[UpdateDate]
			,[State])
		VALUES
			('Input'
			,GETDATE()
			,GETDATE()
			,1)
		

INSERT INTO [ParameterType]
			([Description]
			,[CreateDate]
			,[UpdateDate]
			,[State])
		VALUES
			('Checkbox'
			,GETDATE()
			,GETDATE()
			,1)
		
           
-- Insere par�metros
DECLARE 
	@itempage_id AS INT = (SELECT Id FROM ParameterPage WHERE Description = 'Item'),
	@geralpage_id AS INT = (SELECT Id FROM ParameterPage WHERE Description = 'Geral'),
	@geralcategory_id AS INT = (SELECT Id FROM ParameterCategory WHERE Description = 'Geral'),
	@extensoescategory_id AS INT = (SELECT Id FROM ParameterCategory WHERE Description = 'Extens�es de imagens permitidas nos uploads'),
	@inputtype_id AS INT = (SELECT Id FROM ParameterType WHERE Description = 'Input'),
	@ckeckboxtype_id AS INT = (SELECT Id FROM ParameterType WHERE Description = 'Checkbox')

--Insere as p�ginas dos par�metros



-- PARAMETROS ITEM
------------------------------------------------------

INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('BASETEXT'
           ,'Texto base'
           ,'Texto base item'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)

INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id])
     VALUES
           ('ITEMSITUATION'
           ,'Situa��o do item'
           ,'Situa��o do item'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id)
                     
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('SOURCE'
           ,'Fonte'
           ,'Fonte texto base item'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)
           
          
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('DESCRIPTORSENTENCE'
           ,'Senten�a descritora do item'
           ,'Senten�a descritora do item'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,2
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)
         
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning])
     VALUES
           ('ITEMTYPE'
           ,'Tipo do item'
           ,'Tipo do item'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1)
           
           
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning])
     VALUES
           ('ITEMCURRICULUMGRADE'
           ,'Ano'
           ,'Selecione o per�odo'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1)
           
          
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('KEYWORDS'
           ,'Palavras-chave'
           ,'Palavras-chave'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)
           
           
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('PROFICIENCY'
           ,'Profici�ncia'
           ,'Profici�ncia'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)
           
           
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('ITEMLEVEL'
           ,'Dificuldade sugerida'
           ,'Dificuldade sugerida'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)
           
          
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('STATEMENT'
           ,'Enunciado'
           ,'Enunciado'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)
           
         
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('TRI'
           ,'TRI'
           ,'TRI'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)
                   
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('TCT'
           ,'TCT'
           ,'TCT'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)
           
           
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('TIPS'
           ,'Observa��o'
           ,'Observa��o'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)
           
           
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('ALTERNATIVES'
           ,'Alternativas'
           ,'Alternativas'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)
           
          
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning]
           ,[Obligatory])
     VALUES
           ('JUSTIFICATIVE'
           ,'Justificativa'
           ,'Justificativa'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1
           ,1)
                     
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning])
     VALUES
           ('ISRESTRICT'
           ,'Sigiloso'
           ,'Sigiloso'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1)
           
INSERT INTO [Parameter]
           ([Key]
           ,[Value]
           ,[Description]
           ,[StartDate]
           ,[CreateDate]
           ,[UpdateDate]
           ,[State]
           ,[EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]
           ,[Versioning])
     VALUES
           ('NIVEISMATRIZ'
           ,'Altera��o nos n�veis da matriz'
           ,'Altera��o nos n�veis da matriz'
           ,GETDATE()
           ,GETDATE()
           ,GETDATE()
           ,1
           ,@ent_id
           ,@geralcategory_id
           ,@itempage_id
           ,@inputtype_id
           ,1)
--------------------------------------------------

-- PARAMETROS GERAL
--------------------------------------------------
    
INSERT  INTO [Parameter]
        ( [Key] ,
          [Value] ,
          [Description] ,
          [StartDate] ,
          [CreateDate] ,
          [UpdateDate] ,
          [State] ,
          [EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]        
                
        )
VALUES  ( 'JPEG' ,
          'True' ,
          'JPEG' ,
          GETDATE() ,
          GETDATE() ,
          GETDATE() ,
          1 ,
          @ent_id 
           ,@extensoescategory_id
           ,@geralpage_id
           ,@ckeckboxtype_id             
        )

INSERT  INTO [Parameter]
        ( [Key] ,
          [Value] ,
          [Description] ,
          [StartDate] ,
          [CreateDate] ,
          [UpdateDate] ,
          [State] ,
          [EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]        
                
        )
VALUES  ( 'GIF' ,
          'True' ,
          'GIF' ,
          GETDATE() ,
          GETDATE() ,
          GETDATE() ,
          1 ,
          @ent_id 
           ,@extensoescategory_id
           ,@geralpage_id
           ,@ckeckboxtype_id        
        )
   
INSERT  INTO [Parameter]
        ( [Key] ,
          [Value] ,
          [Description] ,
          [StartDate] ,
          [CreateDate] ,
          [UpdateDate] ,
          [State] ,
          [EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]        
                
        )
VALUES  ( 'PNG' ,
          'True' ,
          'PNG' ,
          GETDATE() ,
          GETDATE() ,
          GETDATE() ,
          1 ,
          @ent_id 
           ,@extensoescategory_id
           ,@geralpage_id
           ,@ckeckboxtype_id        
        )

INSERT  INTO [Parameter]
        ( [Key] ,
          [Value] ,
          [Description] ,
          [StartDate] ,
          [CreateDate] ,
          [UpdateDate] ,
          [State] ,
          [EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]        
                
        )
VALUES  ( 'BMP' ,
          'True' ,
          'BMP' ,
          GETDATE() ,
          GETDATE() ,
          GETDATE() ,
          1 ,
          @ent_id 
           ,@extensoescategory_id
           ,@geralpage_id
           ,@ckeckboxtype_id        
        )
         

INSERT  INTO [Parameter]
        ( [Key] ,
          [Value] ,
          [Description] ,
          [StartDate] ,
          [CreateDate] ,
          [UpdateDate] ,
          [State] ,
          [EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]     
        )
VALUES  ( 'IMAGE_GIF_COMPRESSION' ,
          'False' ,
          'Comprimir GIF (sim ou n�o), ap�s compress�o se tornar� imagem est�tica' ,
          GETDATE() ,
          GETDATE() ,
          GETDATE() ,
          1 ,
          @ent_id
           ,@geralcategory_id
           ,@geralpage_id
           ,@ckeckboxtype_id      
        )
    

INSERT  INTO [Parameter]
        ( [Key] ,
          [Value] ,
          [Description] ,
          [StartDate] ,
          [CreateDate] ,
          [UpdateDate] ,
          [State] ,
          [EntityId]
            ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]    
        )
VALUES  ( 'IMAGE_MAX_SIZE_FILE' ,
          '51200' ,
          'Tamanho m�ximo de imagens permitido (kB)' ,
          GETDATE() ,
          GETDATE() ,
          GETDATE() ,
          1 ,
          @ent_id
          ,@geralcategory_id
           ,@geralpage_id
           ,@inputtype_id       
        )
    

INSERT  INTO [Parameter]
        ( [Key] ,
          [Value] ,
          [Description] ,
          [StartDate] ,
          [CreateDate] ,
          [UpdateDate] ,
          [State] ,
          [EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]     
        )
VALUES  ( 'IMAGE_QUALITY' ,
          '100' ,
          'Qualidade das imagens em porcentagem' ,
          GETDATE() ,
          GETDATE() ,
          GETDATE() ,
          1 ,
          @ent_id
          ,@geralcategory_id
           ,@geralpage_id
           ,@inputtype_id      
        )
    

INSERT  INTO [Parameter]
        ( [Key] ,
          [Value] ,
          [Description] ,
          [StartDate] ,
          [CreateDate] ,
          [UpdateDate] ,
          [State] ,
          [EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]     
        )
VALUES  ( 'IMAGE_MAX_RESOLUTION_HEIGHT' ,
          '500' ,
          'Resolu��o das imagens: Altura m�xima' ,
          GETDATE() ,
          GETDATE() ,
          GETDATE() ,
          1 ,
          @ent_id
          ,@geralcategory_id
           ,@geralpage_id
           ,@inputtype_id       
        )

INSERT  INTO [Parameter]
        ( [Key] ,
          [Value] ,
          [Description] ,
          [StartDate] ,
          [CreateDate] ,
          [UpdateDate] ,
          [State] ,
          [EntityId]
           ,[ParameterCategory_Id]
           ,[ParameterPage_Id]
           ,[ParameterType_Id]     
        )
VALUES  ( 'IMAGE_MAX_RESOLUTION_WIDTH' ,
          '500' ,
          'Resolu��o das imagens: Largura m�xima' ,
          GETDATE() ,
          GETDATE() ,
          GETDATE() ,
          1 ,
          @ent_id
          ,@geralcategory_id
           ,@geralpage_id
           ,@inputtype_id      
        )


INSERT INTO [dbo].[Parameter]
			([Key]
			,[Value]
			,[Description]
			,[StartDate]
			,[EndDate]
			,[CreateDate]
			,[UpdateDate]
			,[State]
			,[EntityId]
			,[Obligatory]
			,[Versioning]
			,[ParameterCategory_Id]
			,[ParameterPage_Id]
			,[ParameterType_Id])
		VALUES
			('UTILIZACDNMATHJAX'
			,'True'
			,'Utilizar CDN na biblioteca MathJax'
			,GETDATE()
			,NULL
			,GETDATE()
			,GETDATE()
			,1
			,@ent_id
			,1
			,0
			,@geralcategory_id
			,@geralpage_id
			,@ckeckboxtype_id)


INSERT INTO [dbo].[Parameter] 
			([Key], 
			[Value], 
			[Description], 
			[EntityId], 
			[StartDate], 
			[EndDate], 
			[Obligatory], 
			[Versioning], 
			[ParameterPage_Id], 
			[CreateDate], 
			[UpdateDate], 
			[State], 
			[ParameterCategory_Id], 
			[ParameterType_Id]) 
		VALUES 
			('FILE_MAX_SIZE',
			'51200', 
			'Tamanho m�ximo de arquivos permitido (kB)', 
			@ent_id, 
			GETDATE(), 
			NULL, 
			NULL, 
			NULL, 
			1, 
			GETDATE(), 
			GETDATE(), 
			@geralcategory_id, 
			@geralpage_id, 
			@inputtype_id)


DECLARE @PAGE INT = (SELECT Id FROM [dbo].[ParameterPage] WHERE [Description] = N'Prova')


INSERT [dbo].[Parameter] 
		([Key], 
		[Value], 
		[Description], 
		[EntityId], 
		[StartDate], 
		[EndDate], 
		[Obligatory], 
		[Versioning], 
		[ParameterPage_Id], 
		[CreateDate], 
		[UpdateDate], 
		[State], 
		[ParameterCategory_Id], 
		[ParameterType_Id]) 
VALUES ('BASE_TEXT_DEFAULT',
		'Utilize o texto a seguir para responder as quest�es', 
		'Texto de orienta��o para texto base', 
		@ent_id, 
		GETDATE(), 
		NULL, 
		NULL, 
		NULL, 
		@PAGE, 
		GETDATE(), 
		GETDATE(), 
		1, 
		@geralcategory_id, 
		@inputtype_id)




DECLARE @CAT INT = (SELECT Id FROM [dbo].[ParameterCategory] WHERE [Description] = 'Narra��o')


INSERT [dbo].[Parameter] 
		([Key], 
		[Value], 
		[Description], 
		[EntityId], 
		[StartDate], 
		[EndDate], 
		[Obligatory], 
		[Versioning], 
		[ParameterPage_Id], 
		[CreateDate], 
		[UpdateDate], 
		[State], 
		[ParameterCategory_Id], 
		[ParameterType_Id]) 
VALUES ('INITIAL_ORIENTATION', 
		'Orienta��o inicial para aplicador', 
		'Orienta��o inicial para aplicador', 
		@ent_id, 
		GETDATE(), 
		NULL, 
		1, 
		1, 
		@itempage_id, 
		GETDATE(), 
		GETDATE(), 
		1, 
		@CAT, 
		@inputtype_id)
		

INSERT [dbo].[Parameter] 
		([Key], 
		[Value], 
		[Description], 
		[EntityId], 
		[StartDate], 
		[EndDate], 
		[Obligatory], 
		[Versioning], 
		[ParameterPage_Id], 
		[CreateDate], 
		[UpdateDate], 
		[State], 
		[ParameterCategory_Id], 
		[ParameterType_Id]) 
VALUES ('INITIAL_STATEMENT', 
		'Enunciado de abertura do item', 
		'Enunciado de abertura do item', 
		@ent_id, 
		GETDATE(), 
		NULL, 
		1, 
		1, 
		@itempage_id, 
		GETDATE(), 
		GETDATE(), 
		1, 
		@CAT, 
		@inputtype_id)


INSERT [dbo].[Parameter] 
		([Key], 
		[Value], 
		[Description], 
		[EntityId], 
		[StartDate], 
		[EndDate], 
		[Obligatory], 
		[Versioning], 
		[ParameterPage_Id], 
		[CreateDate], 
		[UpdateDate], 
		[State], 
		[ParameterCategory_Id], 
		[ParameterType_Id]) 
VALUES ('BASETEXT_ORIENTATION', 
		'Orienta��o complementar sobre o texto base', 
		'Orienta��o complementar sobre o texto base', 
		@ent_id, 
		GETDATE(), 
		NULL, 
		1, 
		1, 
		@itempage_id, 
		GETDATE(), 
		GETDATE(), 
		1, 
		@CAT, 
		@inputtype_id)



SET @PAGE = (SELECT Id FROM [dbo].[ParameterPage] WHERE [Description] = 'Sistema')


INSERT [dbo].[Parameter] 
		([Key], 
		[Value], 
		[Description], 
		[EntityId], 
		[StartDate], 
		[EndDate], 
		[Obligatory], 
		[Versioning], 
		[ParameterPage_Id], 
		[CreateDate], 
		[UpdateDate], 
		[State], 
		[ParameterCategory_Id], 
		[ParameterType_Id]) 
VALUES ('SHOW_ITEM_NARRATED', 
		'True', 
		'Habilitar item narrado', 
		@ent_id, 
		GETDATE(), 
		NULL, 
		NULL, 
		NULL, 
		@PAGE, 
		GETDATE(), 
		GETDATE(), 
		1, 
		@geralcategory_id, 
		@ckeckboxtype_id)

INSERT [dbo].[Parameter] 
		([Key], 
		[Value], 
		[Description], 
		[EntityId], 
		[StartDate], 
		[EndDate],  
		[ParameterPage_Id], 
		[CreateDate], 
		[UpdateDate], 
		[State], 
		[ParameterCategory_Id], 
		[ParameterType_Id]) 
VALUES ('ANSWERSHEET_USE_COLUMN_TEMPLATE', 
		'false', 
		'Gerar folha de resposta utilizando o template de colunas (20, 40, 60 e 80 quest�es)', 
		@ent_id, 
		GETDATE(), 
		NULL,  
		@PAGE, 
		GETDATE(), 
		GETDATE(), 
		1, 
		@geralcategory_id, 
		@ckeckboxtype_id)


SET @PAGE = (SELECT Id FROM [dbo].[ParameterPage] WHERE [Description] = 'Prova')


INSERT [dbo].[Parameter] 
		([Key], 
		[Value], 
		[Description], 
		[EntityId], 
		[StartDate], 
		[EndDate], 
		[Obligatory], 
		[Versioning], 
		[ParameterPage_Id], 
		[CreateDate], 
		[UpdateDate], 
		[State], 
		[ParameterCategory_Id], 
		[ParameterType_Id]) 
VALUES ('CODE_ALTERNATIVE_DUPLICATE', 
		'R', 
		'Sigla para Rasurado (Mais de uma resposta preenchida na mesma quest�o)', 
		@ent_id, 
		GETDATE(), 
		NULL, 
		1, 
		1, 
		@PAGE, 
		GETDATE(), 
		GETDATE(), 
		1, 
		@geralcategory_id, 
		@inputtype_id)


INSERT [dbo].[Parameter] 
		([Key], 
		[Value], 
		[Description], 
		[EntityId], 
		[StartDate], 
		[EndDate], 
		[Obligatory], 
		[Versioning], 
		[ParameterPage_Id], 
		[CreateDate], 
		[UpdateDate], 
		[State], 
		[ParameterCategory_Id], 
		[ParameterType_Id]) 
VALUES ('CODE_ALTERNATIVE_EMPTY', 
		'N', 
		'Sigla para Nulo (Nenhuma resposta preenchida)', 
		@ent_id, 
		GETDATE(), 
		NULL, 
		1, 
		1, 
		@PAGE, 
		GETDATE(), 
		GETDATE(), 
		1, 
		@geralcategory_id, 
		@inputtype_id)

INSERT [dbo].[Parameter] 
		([Key], 
		[Value], 
		[Description], 
		[EntityId], 
		[StartDate], 
		[EndDate],  
		[ParameterPage_Id], 
		[CreateDate], 
		[UpdateDate], 
		[State], 
		[ParameterCategory_Id], 
		[ParameterType_Id]) 
VALUES ('STUDENT_NUMBER_ID', 
		'False', 
		'Habilitar folha de resposta identificada por n�mero de chamada', 
		@ent_id, 
		GETDATE(), 
		NULL,  
		@PAGE, 
		GETDATE(), 
		GETDATE(), 
		1, 
		@geralcategory_id, 
		@ckeckboxtype_id)

INSERT [dbo].[Parameter] 
		([Key], 
		[Value], 
		[Description], 
		[EntityId], 
		[StartDate], 
		[EndDate],  
		[ParameterPage_Id], 
		[CreateDate], 
		[UpdateDate], 
		[State], 
		[ParameterCategory_Id], 
		[ParameterType_Id]) 
VALUES ('CHAR_SEP_CSV', 
		';', 
		'Caractere utilizado para separar valores no arquivo csv', 
		@ent_id, 
		GETDATE(), 
		NULL,  
		@geralpage_id, 
		GETDATE(), 
		GETDATE(), 
		1, 
		@geralcategory_id, 
		@inputtype_id)



DECLARE @storage_path VARCHAR(MAX) = N'\\caminho_da_rede\'
---
DECLARE @virtual_path VARCHAR(MAX) =  N'http://gestaoavaliacao-dev.build.sistemas/Files/'



DECLARE @page_prova BIGINT = (SELECT [Id] FROM [dbo].[ParameterPage] WHERE [Description] = N'Prova')
DECLARE @page_sistema BIGINT = (SELECT [Id] FROM [dbo].[ParameterPage] WHERE [Description] = N'Sistema')


DECLARE @category_config BIGINT = (SELECT [Id] FROM [dbo].[ParameterCategory] WHERE [Description] = N'Configura��o')


INSERT [dbo].[Parameter] 
		([Key]
		, [Value]
		, [Description]
		, [EntityId]
		, [StartDate]
		, [EndDate]
		, [Obligatory]
		, [Versioning]
		, [ParameterPage_Id]
		, [CreateDate]
		, [UpdateDate]
		, [State]
		, [ParameterCategory_Id]
		, [ParameterType_Id]) 
VALUES (N'DOWNLOAD_OMR_FILE'
		, N'False'
		, N'Habilitar o download das imagens das folhas de respostas dos alunos - OMR'
		, @ent_id
		, GETDATE()
		, NULL
		, NULL
		, NULL
		, @page_sistema
		, GETDATE()
		, GETDATE()
		, 1
		, @geralcategory_id
		, @ckeckboxtype_id)

	

INSERT [dbo].[Parameter] 
		([Key]
		, [Value]
		, [Description]
		, [EntityId]
		, [StartDate]
		, [EndDate]
		, [Obligatory]
		, [Versioning]
		, [ParameterPage_Id]
		, [CreateDate]
		, [UpdateDate]
		, [State]
		, [ParameterCategory_Id]
		, [ParameterType_Id])
VALUES (N'SHOW_MANUAL'
		, N'True'
		, N'Exibir link de manual para download'
		, @ent_id
		, GETDATE()
		, NULL
		, NULL
		, NULL
		, @page_sistema
		, GETDATE()
		, GETDATE()
		, 1
		, @geralcategory_id
		, @ckeckboxtype_id)


INSERT [dbo].[Parameter] 
		([Key]
		, [Value]
		, [Description]
		, [EntityId]
		, [StartDate]
		, [EndDate]
		, [Obligatory]
		, [Versioning]
		, [ParameterPage_Id]
		, [CreateDate]
		, [UpdateDate]
		, [State]
		, [ParameterCategory_Id]
		, [ParameterType_Id]) 
VALUES (N'ZIP_FILES_ALLOWED'
		, N'image/jpeg;image/png;'
		, N'Arquivos permitidos dentro do zip'
		, @ent_id
		, GETDATE()
		, NULL
		, NULL
		, NULL
		, @page_sistema
		, GETDATE()
		, GETDATE()
		, 1
		, @category_config
		, @inputtype_id)



INSERT [dbo].[Parameter] 
		([Key]
		, [Value]
		, [Description]
		, [EntityId]
		, [StartDate]
		, [EndDate]
		, [Obligatory]
		, [Versioning]
		, [ParameterPage_Id]
		, [CreateDate]
		, [UpdateDate]
		, [State]
		, [ParameterCategory_Id]
		, [ParameterType_Id]) 
VALUES (N'IMAGE_FILES'
		, N'image/jpeg;image/png;'
		, N'Arquivos de imagens permitidos'
		, @ent_id
		, GETDATE()
		, NULL
		, NULL
		, NULL
		, @page_sistema
		, GETDATE()
		, GETDATE()
		, 1
		, @category_config
		, @inputtype_id)



INSERT [dbo].[Parameter] 
		([Key]
		, [Value]
		, [Description]
		, [EntityId]
		, [StartDate]
		, [EndDate]
		, [Obligatory]
		, [Versioning]
		, [ParameterPage_Id]
		, [CreateDate]
		, [UpdateDate]
		, [State]
		, [ParameterCategory_Id]
		, [ParameterType_Id]) 
VALUES (N'ZIP_FILES'
		, N'application/x-zip-compressed;application/zip;application/x-rar-compressed;application/rar;zip;rar;'
		, N'Arquivos compactados permitidos'
		, @ent_id
		, GETDATE()
		, NULL
		, NULL
		, NULL
		, @page_sistema
		, GETDATE()
		, GETDATE()
		, 1
		, @category_config
		, @inputtype_id)


INSERT [dbo].[Parameter] 
		([Key]
		, [Value]
		, [Description]
		, [EntityId]
		, [StartDate]
		, [EndDate]
		, [Obligatory]
		, [Versioning]
		, [ParameterPage_Id]
		, [CreateDate]
		, [UpdateDate]
		, [State]
		, [ParameterCategory_Id]
		, [ParameterType_Id]) 
VALUES (N'STORAGE_PATH'
		, @storage_path
		, N'Caminho fsico responsvel por armazenar os arquivos do sistema'
		, @ent_id
		, GETDATE()
		, NULL
		, NULL
		, NULL
		, @page_sistema
		, GETDATE()
		, GETDATE()
		, 1
		, @category_config
		, @inputtype_id)


INSERT [dbo].[Parameter] 
		([Key]
		, [Value]
		, [Description]
		, [EntityId]
		, [StartDate]
		, [EndDate]
		, [Obligatory]
		, [Versioning]
		, [ParameterPage_Id]
		, [CreateDate]
		, [UpdateDate]
		, [State]
		, [ParameterCategory_Id]
		, [ParameterType_Id]) 
VALUES (N'GLOBAL_TERM'
		, N'Externo'
		, N'Nomenclatura para o termo Global do sistema'
		, @ent_id
		, GETDATE()
		, NULL
		, NULL
		, NULL
		, @page_prova
		, GETDATE()
		, GETDATE()
		, 1
		, @geralcategory_id
		, @inputtype_id)


INSERT [dbo].[Parameter] 
		([Key]
		, [Value]
		, [Description]
		, [EntityId]
		, [StartDate]
		, [EndDate]
		, [Obligatory]
		, [Versioning]
		, [ParameterPage_Id]
		, [CreateDate]
		, [UpdateDate]
		, [State]
		, [ParameterCategory_Id]
		, [ParameterType_Id]) 
VALUES (N'LOCAL_TERM'
		, N'Interno'
		, N'Nomenclatura para o termo Local do sistema'
		, @ent_id
		, GETDATE()
		, NULL
		, NULL
		, NULL
		, @page_prova
		, GETDATE()
		, GETDATE()
		, 1
		, @geralcategory_id
		, @inputtype_id)

INSERT [dbo].[Parameter] 
		([Key]
		, [Value]
		, [Description]
		, [EntityId]
		, [StartDate]
		, [EndDate]
		, [Obligatory]
		, [Versioning]
		, [ParameterPage_Id]
		, [CreateDate]
		, [UpdateDate]
		, [State]
		, [ParameterCategory_Id]
		, [ParameterType_Id]) 
VALUES (N'VIRTUAL_PATH'
		, @virtual_path
		, N'Caminho virtual do armazenamento dos arquivos do sistema'
		, @ent_id
		, GETDATE()
		, NULL
		, NULL
		, NULL
		, @page_sistema
		, GETDATE()
		, GETDATE()
		, 1
		, @category_config
		, @inputtype_id)


INSERT [dbo].[Parameter] 
		([Key]
		, [Value]
		, [Description]
		, [EntityId]
		, [StartDate]
		, [EndDate]
		, [Obligatory]
		, [Versioning]
		, [ParameterPage_Id]
		, [CreateDate]
		, [UpdateDate]
		, [State]
		, [ParameterCategory_Id]
		, [ParameterType_Id]) 
VALUES (N'DELETE_BATCH_FILES'
		, N'false'
		, N'Habilitar excluso dos arquivos da correo automtica de provas'
		, @ent_id
		, GETDATE()
		, NULL
		, NULL
		, NULL
		, @page_sistema
		, GETDATE()
		, GETDATE()
		, 1
		, @geralcategory_id
		, @ckeckboxtype_id)

 

INSERT INTO [dbo].[Parameter]
		([Key]
		,[Value]
		,[Description]
		,[EntityId]
		,[StartDate]
		,[EndDate]
		,[Obligatory]
		,[Versioning]
		,[ParameterPage_Id]
		,[CreateDate]
		,[UpdateDate]
		,[State]
		,[ParameterCategory_Id]
		,[ParameterType_Id])
VALUES  ('CODE'
		,'C�digo'
		,'C�digo do item'
		,@ent_id
		,CAST(GETDATE() AS DATE)
		,null
		,0
		,null
		,@itempage_id
		,CAST(GETDATE() AS DATE)
		,CAST(GETDATE() AS DATE)
		,1
		,@geralcategory_id
		,@ckeckboxtype_id)


INSERT INTO [dbo].[Parameter]
		([Key]
		,[Value]
		,[Description]
		,[EntityId]
		,[StartDate]
		,[EndDate]
		,[Obligatory]
		,[Versioning]
		,[ParameterPage_Id]
		,[CreateDate]
		,[UpdateDate]
		,[State]
		,[ParameterCategory_Id]
		,[ParameterType_Id])
VALUES  ('WARNING_UPLOAD_BATCH_DETAIL'
		,'false'
		,'Exibir status conferir como sucesso quando realizado corre��o de provas'
		, @ent_id
		,CAST(GETDATE() AS DATE)
		,null
		,null
		,null
		,@geralpage_id
		,CAST(GETDATE() AS DATE)
		,CAST(GETDATE() AS DATE)
		,1
		,@category_config
		,@ckeckboxtype_id)

GO
IF @@ERROR<>0 AND @@TRANCOUNT>0 ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT=0 BEGIN INSERT INTO #tmpErrors (Error) SELECT 1 BEGIN TRANSACTION END
GO
IF EXISTS (SELECT * FROM #tmpErrors) 
  ROLLBACK TRANSACTION
GO
IF @@TRANCOUNT>0 
  BEGIN
    PRINT 'The database update succeeded'
    COMMIT TRANSACTION
  END
ELSE 
  PRINT 'The database update failed - ROLLBACK aplied'
GO
DROP TABLE #tmpErrors 
GO