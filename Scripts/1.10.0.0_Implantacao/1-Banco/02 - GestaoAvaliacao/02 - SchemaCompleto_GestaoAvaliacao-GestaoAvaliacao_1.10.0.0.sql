USE GestaoAvaliacao



GO
PRINT N'Creating [dbo].[AbsenceReason]...';


GO
CREATE TABLE [dbo].[AbsenceReason] (
    [Id]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (500)    NOT NULL,
    [AllowRetry]  BIT              NOT NULL,
    [EntityId]    UNIQUEIDENTIFIER NOT NULL,
    [CreateDate]  DATETIME         NOT NULL,
    [UpdateDate]  DATETIME         NOT NULL,
    [State]       TINYINT          NOT NULL,
    [IsDefault]   BIT              NOT NULL,
    CONSTRAINT [PK_dbo.AbsenceReason] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Adherence]...';


GO
CREATE TABLE [dbo].[Adherence] (
    [Id]            BIGINT   IDENTITY (1, 1) NOT NULL,
    [EntityId]      BIGINT   NOT NULL,
    [ParentId]      INT      NULL,
    [TypeEntity]    TINYINT  NOT NULL,
    [TypeSelection] TINYINT  NOT NULL,
    [Test_Id]       BIGINT   NOT NULL,
    [CreateDate]    DATETIME NOT NULL,
    [UpdateDate]    DATETIME NOT NULL,
    [State]         TINYINT  NOT NULL,
    CONSTRAINT [PK_dbo.Adherence] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Adherence].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[Adherence]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[Alternative]...';


GO
CREATE TABLE [dbo].[Alternative] (
    [Id]                     BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description]            VARCHAR (MAX)  NULL,
    [Correct]                BIT            NULL,
    [Order]                  INT            NULL,
    [Justificative]          VARCHAR (MAX)  NULL,
    [Numeration]             VARCHAR (10)   NULL,
    [TCTBiserialCoefficient] DECIMAL (9, 3) NULL,
    [TCTDificulty]           DECIMAL (9, 3) NULL,
    [TCTDiscrimination]      DECIMAL (9, 3) NULL,
    [CreateDate]             DATETIME       NOT NULL,
    [UpdateDate]             DATETIME       NOT NULL,
    [State]                  TINYINT        NOT NULL,
    [Item_Id]                BIGINT         NOT NULL,
    CONSTRAINT [PK_dbo.Alternative] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Alternative].[IX_Item_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Item_Id]
    ON [dbo].[Alternative]([Item_Id] ASC);


GO
PRINT N'Creating [dbo].[AnswerSheetBatch]...';


GO
CREATE TABLE [dbo].[AnswerSheetBatch] (
    [Id]            BIGINT           IDENTITY (1, 1) NOT NULL,
    [Description]   VARCHAR (MAX)    NOT NULL,
    [Test_Id]       BIGINT           NOT NULL,
    [SupAdmUnit_Id] UNIQUEIDENTIFIER NULL,
    [School_Id]     INT              NULL,
    [Section_Id]    BIGINT           NULL,
    [CreatedBy_Id]  UNIQUEIDENTIFIER NULL,
    [Processing]    TINYINT          NOT NULL,
    [CreateDate]    DATETIME         NOT NULL,
    [UpdateDate]    DATETIME         NOT NULL,
    [State]         TINYINT          NOT NULL,
    [BatchType]     TINYINT          NOT NULL,
    [OwnerEntity]   TINYINT          NOT NULL,
    CONSTRAINT [PK_dbo.AnswerSheetBatch] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[AnswerSheetBatch].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[AnswerSheetBatch]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[AnswerSheetBatchFiles]...';


GO
CREATE TABLE [dbo].[AnswerSheetBatchFiles] (
    [Id]                       BIGINT           IDENTITY (1, 1) NOT NULL,
    [File_Id]                  BIGINT           NOT NULL,
    [AnswerSheetBatch_Id]      BIGINT           NULL,
    [Student_Id]               BIGINT           NULL,
    [Sent]                     BIT              NOT NULL,
    [CreateDate]               DATETIME         NOT NULL,
    [UpdateDate]               DATETIME         NOT NULL,
    [State]                    TINYINT          NOT NULL,
    [Section_Id]               BIGINT           NULL,
    [SupAdmUnit_Id]            UNIQUEIDENTIFIER NULL,
    [School_Id]                INT              NULL,
    [Situation]                TINYINT          NOT NULL,
    [CreatedBy_Id]             UNIQUEIDENTIFIER NULL,
    [AnswerSheetBatchQueue_Id] BIGINT           NULL,
    CONSTRAINT [PK_dbo.AnswerSheetBatchFiles] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[AnswerSheetBatchFiles].[IX_AnswerSheetBatch_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_AnswerSheetBatch_Id]
    ON [dbo].[AnswerSheetBatchFiles]([AnswerSheetBatch_Id] ASC);


GO
PRINT N'Creating [dbo].[AnswerSheetBatchFiles].[IX_File_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_File_Id]
    ON [dbo].[AnswerSheetBatchFiles]([File_Id] ASC);


GO
PRINT N'Creating [dbo].[AnswerSheetBatchFiles].[IX_AnswerSheetBatchQueue_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_AnswerSheetBatchQueue_Id]
    ON [dbo].[AnswerSheetBatchFiles]([AnswerSheetBatchQueue_Id] ASC);


GO
PRINT N'Creating [dbo].[AnswerSheetBatchLog]...';


GO
CREATE TABLE [dbo].[AnswerSheetBatchLog] (
    [Id]                      BIGINT        IDENTITY (1, 1) NOT NULL,
    [AnswerSheetBatchFile_Id] BIGINT        NOT NULL,
    [Situation]               TINYINT       NOT NULL,
    [Description]             VARCHAR (MAX) NULL,
    [CreateDate]              DATETIME      NOT NULL,
    [UpdateDate]              DATETIME      NOT NULL,
    [State]                   TINYINT       NOT NULL,
    [File_Id]                 BIGINT        NULL,
    CONSTRAINT [PK_dbo.AnswerSheetBatchLog] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[AnswerSheetBatchLog].[IX_AnswerSheetBatchFile_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_AnswerSheetBatchFile_Id]
    ON [dbo].[AnswerSheetBatchLog]([AnswerSheetBatchFile_Id] ASC);


GO
PRINT N'Creating [dbo].[AnswerSheetBatchLog].[IX_File_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_File_Id]
    ON [dbo].[AnswerSheetBatchLog]([File_Id] ASC);


GO
PRINT N'Creating [dbo].[AnswerSheetBatchLog].[IX_AnswerSheetBatchLog_State]...';


GO
CREATE NONCLUSTERED INDEX [IX_AnswerSheetBatchLog_State]
    ON [dbo].[AnswerSheetBatchLog]([State] ASC)
    INCLUDE([AnswerSheetBatchFile_Id], [Situation]);


GO
PRINT N'Creating [dbo].[AnswerSheetBatchQueue]...';


GO
CREATE TABLE [dbo].[AnswerSheetBatchQueue] (
    [Id]                  BIGINT           IDENTITY (1, 1) NOT NULL,
    [File_Id]             BIGINT           NOT NULL,
    [AnswerSheetBatch_Id] BIGINT           NULL,
    [SupAdmUnit_Id]       UNIQUEIDENTIFIER NULL,
    [School_Id]           INT              NULL,
    [CountFiles]          INT              NULL,
    [Situation]           TINYINT          NOT NULL,
    [Description]         VARCHAR (MAX)    NULL,
    [CreatedBy_Id]        UNIQUEIDENTIFIER NOT NULL,
    [EntityId]            UNIQUEIDENTIFIER NOT NULL,
    [CreateDate]          DATETIME         NOT NULL,
    [UpdateDate]          DATETIME         NOT NULL,
    [State]               TINYINT          NOT NULL,
    CONSTRAINT [PK_dbo.AnswerSheetBatchQueue] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[AnswerSheetBatchQueue].[IX_File_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_File_Id]
    ON [dbo].[AnswerSheetBatchQueue]([File_Id] ASC);


GO
PRINT N'Creating [dbo].[AnswerSheetBatchQueue].[IX_AnswerSheetBatch_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_AnswerSheetBatch_Id]
    ON [dbo].[AnswerSheetBatchQueue]([AnswerSheetBatch_Id] ASC);


GO
PRINT N'Creating [dbo].[AnswerSheetLot]...';


GO
CREATE TABLE [dbo].[AnswerSheetLot] (
    [Id]             BIGINT           IDENTITY (1, 1) NOT NULL,
    [Test_Id]        BIGINT           NULL,
    [StateExecution] TINYINT          NOT NULL,
    [uad_id]         UNIQUEIDENTIFIER NULL,
    [esc_id]         INT              NULL,
    [CreateDate]     DATETIME         NOT NULL,
    [UpdateDate]     DATETIME         NOT NULL,
    [State]          TINYINT          NOT NULL,
    [Type]           TINYINT          NOT NULL,
    [RequestDate]    DATETIME         NULL,
    [Parent_Id]      BIGINT           NULL,
    [ExecutionOwner] VARCHAR (1000)   NULL,
    CONSTRAINT [PK_dbo.AnswerSheetLot] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[AnswerSheetLot].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[AnswerSheetLot]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[AnswerSheetLot].[IX_Parent_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Parent_Id]
    ON [dbo].[AnswerSheetLot]([Parent_Id] ASC);


GO
PRINT N'Creating [dbo].[BaseText]...';


GO
CREATE TABLE [dbo].[BaseText] (
    [Id]                        BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description]               VARCHAR (MAX)  NULL,
    [CreateDate]                DATETIME       NOT NULL,
    [UpdateDate]                DATETIME       NOT NULL,
    [State]                     TINYINT        NOT NULL,
    [Source]                    VARCHAR (MAX)  NULL,
    [InitialOrientation]        NVARCHAR (500) NULL,
    [InitialStatement]          NVARCHAR (300) NULL,
    [NarrationInitialStatement] BIT            NULL,
    [StudentBaseText]           BIT            NULL,
    [NarrationStudentBaseText]  BIT            NULL,
    [BaseTextOrientation]       NVARCHAR (300) NULL,
    CONSTRAINT [PK_dbo.BaseText] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Block]...';


GO
CREATE TABLE [dbo].[Block] (
    [Id]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (10) NOT NULL,
    [CreateDate]  DATETIME     NOT NULL,
    [UpdateDate]  DATETIME     NOT NULL,
    [State]       TINYINT      NOT NULL,
    [Booklet_Id]  BIGINT       NULL,
    [Test_Id]     BIGINT       NULL,
    CONSTRAINT [PK_dbo.Block] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Block].[IX_Booklet_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Booklet_Id]
    ON [dbo].[Block]([Booklet_Id] ASC);


GO
PRINT N'Creating [dbo].[Block].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[Block]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[BlockItem]...';


GO
CREATE TABLE [dbo].[BlockItem] (
    [Block_Id]   BIGINT   NOT NULL,
    [Item_Id]    BIGINT   NOT NULL,
    [Id]         BIGINT   IDENTITY (1, 1) NOT NULL,
    [Order]      INT      NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [UpdateDate] DATETIME NOT NULL,
    [State]      TINYINT  NOT NULL,
    CONSTRAINT [PK_dbo.BlockItem] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[BlockItem].[IX_Item_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Item_Id]
    ON [dbo].[BlockItem]([Item_Id] ASC);


GO
PRINT N'Creating [dbo].[BlockItem].[IX_Block_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Block_Id]
    ON [dbo].[BlockItem]([Block_Id] ASC);


GO
PRINT N'Creating [dbo].[Booklet]...';


GO
CREATE TABLE [dbo].[Booklet] (
    [Id]         BIGINT   IDENTITY (1, 1) NOT NULL,
    [Order]      INT      NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [UpdateDate] DATETIME NOT NULL,
    [State]      TINYINT  NOT NULL,
    [Test_Id]    BIGINT   NULL,
    CONSTRAINT [PK_dbo.Booklet] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Booklet].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[Booklet]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[CognitiveCompetence]...';


GO
CREATE TABLE [dbo].[CognitiveCompetence] (
    [Id]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (500)    NOT NULL,
    [EntityId]    UNIQUEIDENTIFIER NOT NULL,
    [CreateDate]  DATETIME         NOT NULL,
    [UpdateDate]  DATETIME         NOT NULL,
    [State]       TINYINT          NOT NULL,
    CONSTRAINT [PK_dbo.CognitiveCompetence] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[CorrelatedSkill]...';


GO
CREATE TABLE [dbo].[CorrelatedSkill] (
    [Id]         BIGINT   IDENTITY (1, 1) NOT NULL,
    [CreateDate] DATETIME NOT NULL,
    [UpdateDate] DATETIME NOT NULL,
    [State]      TINYINT  NOT NULL,
    [Skill1_Id]  BIGINT   NULL,
    [Skill2_Id]  BIGINT   NULL,
    CONSTRAINT [PK_dbo.CorrelatedSkill] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[CorrelatedSkill].[IX_Skill1_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Skill1_Id]
    ON [dbo].[CorrelatedSkill]([Skill1_Id] ASC);


GO
PRINT N'Creating [dbo].[CorrelatedSkill].[IX_Skill2_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Skill2_Id]
    ON [dbo].[CorrelatedSkill]([Skill2_Id] ASC);


GO
PRINT N'Creating [dbo].[Discipline]...';


GO
CREATE TABLE [dbo].[Discipline] (
    [Id]                   BIGINT           IDENTITY (1, 1) NOT NULL,
    [Description]          VARCHAR (500)    NOT NULL,
    [DisciplineTypeId]     INT              NOT NULL,
    [CreateDate]           DATETIME         NOT NULL,
    [UpdateDate]           DATETIME         NOT NULL,
    [State]                TINYINT          NOT NULL,
    [TypeLevelEducationId] INT              NOT NULL,
    [EntityId]             UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_dbo.Discipline] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[EvaluationMatrix]...';


GO
CREATE TABLE [dbo].[EvaluationMatrix] (
    [Id]                       BIGINT         IDENTITY (1, 1) NOT NULL,
    [Description]              VARCHAR (500)  NOT NULL,
    [Edition]                  NVARCHAR (MAX) NULL,
    [CreateDate]               DATETIME       NOT NULL,
    [UpdateDate]               DATETIME       NOT NULL,
    [State]                    TINYINT        NOT NULL,
    [Discipline_Id]            BIGINT         NULL,
    [ModelEvaluationMatrix_Id] BIGINT         NULL,
    CONSTRAINT [PK_dbo.EvaluationMatrix] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[EvaluationMatrix].[IX_Discipline_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Discipline_Id]
    ON [dbo].[EvaluationMatrix]([Discipline_Id] ASC);


GO
PRINT N'Creating [dbo].[EvaluationMatrix].[IX_ModelEvaluationMatrix_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ModelEvaluationMatrix_Id]
    ON [dbo].[EvaluationMatrix]([ModelEvaluationMatrix_Id] ASC);


GO
PRINT N'Creating [dbo].[EvaluationMatrixCourse]...';


GO
CREATE TABLE [dbo].[EvaluationMatrixCourse] (
    [Id]                   BIGINT   IDENTITY (1, 1) NOT NULL,
    [CourseId]             INT      NOT NULL,
    [CreateDate]           DATETIME NOT NULL,
    [UpdateDate]           DATETIME NOT NULL,
    [State]                TINYINT  NOT NULL,
    [EvaluationMatrix_Id]  BIGINT   NOT NULL,
    [TypeLevelEducationId] INT      NOT NULL,
    [ModalityId]           INT      NOT NULL,
    CONSTRAINT [PK_dbo.EvaluationMatrixCourse] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[EvaluationMatrixCourse].[IX_EvaluationMatrix_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_EvaluationMatrix_Id]
    ON [dbo].[EvaluationMatrixCourse]([EvaluationMatrix_Id] ASC);


GO
PRINT N'Creating [dbo].[EvaluationMatrixCourseCurriculumGrade]...';


GO
CREATE TABLE [dbo].[EvaluationMatrixCourseCurriculumGrade] (
    [Id]                        BIGINT   IDENTITY (1, 1) NOT NULL,
    [CurriculumGradeId]         INT      NOT NULL,
    [CreateDate]                DATETIME NOT NULL,
    [UpdateDate]                DATETIME NOT NULL,
    [State]                     TINYINT  NOT NULL,
    [EvaluationMatrixCourse_Id] BIGINT   NOT NULL,
    [TypeCurriculumGradeId]     INT      NOT NULL,
    [Ordem]                     INT      NOT NULL,
    CONSTRAINT [PK_dbo.EvaluationMatrixCourseCurriculumGrade] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[EvaluationMatrixCourseCurriculumGrade].[IX_EvaluationMatrixCourse_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_EvaluationMatrixCourse_Id]
    ON [dbo].[EvaluationMatrixCourseCurriculumGrade]([EvaluationMatrixCourse_Id] ASC);


GO
PRINT N'Creating [dbo].[ExportAnalysis]...';


GO
CREATE TABLE [dbo].[ExportAnalysis] (
    [Id]             BIGINT   IDENTITY (1, 1) NOT NULL,
    [Test_Id]        BIGINT   NOT NULL,
    [StateExecution] TINYINT  NOT NULL,
    [CreateDate]     DATETIME NOT NULL,
    [UpdateDate]     DATETIME NOT NULL,
    [State]          TINYINT  NOT NULL,
    CONSTRAINT [PK_dbo.ExportAnalysis] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ExportAnalysis].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[ExportAnalysis]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[File]...';


GO
CREATE TABLE [dbo].[File] (
    [Id]            BIGINT           IDENTITY (1, 1) NOT NULL,
    [Name]          VARCHAR (500)    NOT NULL,
    [Path]          VARCHAR (500)    NULL,
    [CreateDate]    DATETIME         NOT NULL,
    [UpdateDate]    DATETIME         NOT NULL,
    [State]         TINYINT          NOT NULL,
    [ContentType]   VARCHAR (500)    NOT NULL,
    [OwnerId]       BIGINT           NULL,
    [OwnerType]     TINYINT          NULL,
    [ParentOwnerId] BIGINT           NULL,
    [OriginalName]  NVARCHAR (MAX)   NULL,
    [CreatedBy_Id]  UNIQUEIDENTIFIER NULL,
    [DeletedBy_Id]  UNIQUEIDENTIFIER NULL,
    CONSTRAINT [PK_dbo.File] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[FormatType]...';


GO
CREATE TABLE [dbo].[FormatType] (
    [Id]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (500) NOT NULL,
    [CreateDate]  DATETIME      NOT NULL,
    [UpdateDate]  DATETIME      NOT NULL,
    [State]       TINYINT       NOT NULL,
    CONSTRAINT [PK_dbo.FormatType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Item]...';


GO
CREATE TABLE [dbo].[Item] (
    [Id]                        BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemCode]                  VARCHAR (32)   NOT NULL,
    [ItemVersion]               INT            NOT NULL,
    [Statement]                 VARCHAR (MAX)  NULL,
    [Keywords]                  VARCHAR (MAX)  NULL,
    [Tips]                      VARCHAR (MAX)  NULL,
    [TRIDiscrimination]         DECIMAL (9, 3) NULL,
    [TRIDifficulty]             DECIMAL (9, 3) NULL,
    [TRICasualSetting]          DECIMAL (9, 3) NULL,
    [CreateDate]                DATETIME       NOT NULL,
    [UpdateDate]                DATETIME       NOT NULL,
    [State]                     TINYINT        NOT NULL,
    [BaseText_Id]               BIGINT         NULL,
    [EvaluationMatrix_Id]       BIGINT         NOT NULL,
    [ItemLevel_Id]              BIGINT         NULL,
    [ItemSituation_Id]          BIGINT         NOT NULL,
    [ItemType_Id]               BIGINT         NOT NULL,
    [proficiency]               INT            NULL,
    [descriptorSentence]        VARCHAR (170)  NULL,
    [LastVersion]               BIT            NULL,
    [IsRestrict]                BIT            NOT NULL,
    [ItemNarrated]              BIT            NULL,
    [StudentStatement]          BIT            NULL,
    [NarrationStudentStatement] BIT            NULL,
    [NarrationAlternatives]     BIT            NULL,
    [Revoked]                   BIT            NULL,
    [ItemCodeVersion]           INT            NOT NULL,
    CONSTRAINT [PK_dbo.Item] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Item].[UN_Item_ItemCodeVersion_ItemVersion]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_Item_ItemCodeVersion_ItemVersion]
    ON [dbo].[Item]([ItemCodeVersion] ASC, [ItemVersion] ASC);


GO
PRINT N'Creating [dbo].[Item].[IX_BaseText_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_BaseText_Id]
    ON [dbo].[Item]([BaseText_Id] ASC);


GO
PRINT N'Creating [dbo].[Item].[IX_EvaluationMatrix_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_EvaluationMatrix_Id]
    ON [dbo].[Item]([EvaluationMatrix_Id] ASC);


GO
PRINT N'Creating [dbo].[Item].[IX_ItemLevel_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ItemLevel_Id]
    ON [dbo].[Item]([ItemLevel_Id] ASC);


GO
PRINT N'Creating [dbo].[Item].[IX_ItemSituation_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ItemSituation_Id]
    ON [dbo].[Item]([ItemSituation_Id] ASC);


GO
PRINT N'Creating [dbo].[Item].[IX_ItemType_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ItemType_Id]
    ON [dbo].[Item]([ItemType_Id] ASC);


GO
PRINT N'Creating [dbo].[ItemCurriculumGrade]...';


GO
CREATE TABLE [dbo].[ItemCurriculumGrade] (
    [Id]                    BIGINT   IDENTITY (1, 1) NOT NULL,
    [CreateDate]            DATETIME NOT NULL,
    [UpdateDate]            DATETIME NOT NULL,
    [State]                 TINYINT  NOT NULL,
    [Item_Id]               BIGINT   NULL,
    [TypeCurriculumGradeId] INT      NOT NULL,
    CONSTRAINT [PK_dbo.ItemCurriculumGrade] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ItemCurriculumGrade].[IX_Item_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Item_Id]
    ON [dbo].[ItemCurriculumGrade]([Item_Id] ASC);


GO
PRINT N'Creating [dbo].[ItemLevel]...';


GO
CREATE TABLE [dbo].[ItemLevel] (
    [Id]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (500)    NOT NULL,
    [Value]       INT              NOT NULL,
    [CreateDate]  DATETIME         NOT NULL,
    [UpdateDate]  DATETIME         NOT NULL,
    [State]       TINYINT          NOT NULL,
    [EntityId]    UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_dbo.ItemLevel] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ItemSituation]...';


GO
CREATE TABLE [dbo].[ItemSituation] (
    [Id]           BIGINT           IDENTITY (1, 1) NOT NULL,
    [Description]  VARCHAR (500)    NOT NULL,
    [CreateDate]   DATETIME         NOT NULL,
    [UpdateDate]   DATETIME         NOT NULL,
    [State]        TINYINT          NOT NULL,
    [EntityId]     UNIQUEIDENTIFIER NOT NULL,
    [AllowVersion] BIT              NOT NULL,
    CONSTRAINT [PK_dbo.ItemSituation] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ItemSituation].[UN_ItemSituation_Description_EntityId]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UN_ItemSituation_Description_EntityId]
    ON [dbo].[ItemSituation]([Description] ASC, [EntityId] ASC);


GO
PRINT N'Creating [dbo].[ItemSkill]...';


GO
CREATE TABLE [dbo].[ItemSkill] (
    [Id]            BIGINT   IDENTITY (1, 1) NOT NULL,
    [OriginalSkill] BIT      NULL,
    [CreateDate]    DATETIME NOT NULL,
    [UpdateDate]    DATETIME NOT NULL,
    [State]         TINYINT  NOT NULL,
    [Item_Id]       BIGINT   NOT NULL,
    [Skill_Id]      BIGINT   NOT NULL,
    CONSTRAINT [PK_dbo.ItemSkill] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ItemSkill].[IX_Item_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Item_Id]
    ON [dbo].[ItemSkill]([Item_Id] ASC);


GO
PRINT N'Creating [dbo].[ItemSkill].[IX_Skill_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Skill_Id]
    ON [dbo].[ItemSkill]([Skill_Id] ASC);


GO
PRINT N'Creating [dbo].[ItemType]...';


GO
CREATE TABLE [dbo].[ItemType] (
    [Id]                  BIGINT           IDENTITY (1, 1) NOT NULL,
    [Description]         VARCHAR (500)    NOT NULL,
    [UniqueAnswer]        BIT              NOT NULL,
    [CreateDate]          DATETIME         NOT NULL,
    [UpdateDate]          DATETIME         NOT NULL,
    [State]               TINYINT          NOT NULL,
    [EntityId]            UNIQUEIDENTIFIER NOT NULL,
    [IsVisibleTestType]   BIT              NOT NULL,
    [IsDefault]           BIT              NOT NULL,
    [QuantityAlternative] INT              NULL,
    CONSTRAINT [PK_dbo.ItemType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ModelEvaluationMatrix]...';


GO
CREATE TABLE [dbo].[ModelEvaluationMatrix] (
    [Id]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (500)    NOT NULL,
    [EntityId]    UNIQUEIDENTIFIER NOT NULL,
    [CreateDate]  DATETIME         NOT NULL,
    [UpdateDate]  DATETIME         NOT NULL,
    [State]       TINYINT          NOT NULL,
    CONSTRAINT [PK_dbo.ModelEvaluationMatrix] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ModelSkillLevel]...';


GO
CREATE TABLE [dbo].[ModelSkillLevel] (
    [Id]                       BIGINT        IDENTITY (1, 1) NOT NULL,
    [Description]              VARCHAR (500) NOT NULL,
    [Level]                    INT           NOT NULL,
    [LastLevel]                BIT           NOT NULL,
    [CreateDate]               DATETIME      NOT NULL,
    [UpdateDate]               DATETIME      NOT NULL,
    [State]                    TINYINT       NOT NULL,
    [ModelEvaluationMatrix_Id] BIGINT        NULL,
    CONSTRAINT [PK_dbo.ModelSkillLevel] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ModelSkillLevel].[IX_ModelEvaluationMatrix_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ModelEvaluationMatrix_Id]
    ON [dbo].[ModelSkillLevel]([ModelEvaluationMatrix_Id] ASC);


GO
PRINT N'Creating [dbo].[ModelTest]...';


GO
CREATE TABLE [dbo].[ModelTest] (
    [Id]                                 BIGINT           IDENTITY (1, 1) NOT NULL,
    [EntityId]                           UNIQUEIDENTIFIER NOT NULL,
    [Description]                        NVARCHAR (MAX)   NULL,
    [DefaultModel]                       BIT              NOT NULL,
    [ShowCoverPage]                      BIT              NOT NULL,
    [ShowBorder]                         BIT              NOT NULL,
    [LogoHeaderPosition]                 INT              NOT NULL,
    [LogoHeaderSize]                     INT              NOT NULL,
    [LogoHeaderWaterMark]                BIT              NOT NULL,
    [MessageHeaderPosition]              INT              NOT NULL,
    [ShowMessageHeader]                  BIT              NOT NULL,
    [MessageHeader]                      TEXT             NULL,
    [MessageHeaderWaterMark]             BIT              NOT NULL,
    [ShowLineBelowHeader]                BIT              NOT NULL,
    [ShowLogoHeader]                     BIT              NOT NULL,
    [FileHeader_Id]                      BIGINT           NULL,
    [HeaderHtml]                         TEXT             NULL,
    [LogoFooterPosition]                 INT              NOT NULL,
    [LogoFooterSize]                     INT              NOT NULL,
    [LogoFooterWaterMark]                BIT              NOT NULL,
    [MessageFooterPosition]              INT              NOT NULL,
    [ShowMessageFooter]                  BIT              NOT NULL,
    [MessageFooter]                      TEXT             NULL,
    [MessageFooterWaterMark]             BIT              NOT NULL,
    [ShowLineAboveFooter]                BIT              NOT NULL,
    [ShowLogoFooter]                     BIT              NOT NULL,
    [FileFooter_Id]                      BIGINT           NULL,
    [FooterHtml]                         TEXT             NULL,
    [ShowSchool]                         BIT              NOT NULL,
    [ShowStudentName]                    BIT              NOT NULL,
    [ShowTeacherName]                    BIT              NOT NULL,
    [ShowClassName]                      BIT              NOT NULL,
    [ShowStudentNumber]                  BIT              NOT NULL,
    [ShowDate]                           BIT              NOT NULL,
    [ShowLineBelowStudentInformation]    BIT              NOT NULL,
    [StudentInformationHtml]             TEXT             NULL,
    [CoverPageText]                      TEXT             NULL,
    [ShowStudentInformationsOnCoverPage] BIT              NOT NULL,
    [ShowHeaderOnCoverPage]              BIT              NOT NULL,
    [ShowFooterOnCoverPage]              BIT              NOT NULL,
    [ShowBorderOnCoverPage]              BIT              NOT NULL,
    [CreateDate]                         DATETIME         NOT NULL,
    [UpdateDate]                         DATETIME         NOT NULL,
    [State]                              TINYINT          NOT NULL,
    [ShowItemLine]                       BIT              NOT NULL,
    CONSTRAINT [PK_dbo.ModelTest] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ModelTest].[IX_FileFooter_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_FileFooter_Id]
    ON [dbo].[ModelTest]([FileFooter_Id] ASC);


GO
PRINT N'Creating [dbo].[ModelTest].[IX_FileHeader_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_FileHeader_Id]
    ON [dbo].[ModelTest]([FileHeader_Id] ASC);


GO
PRINT N'Creating [dbo].[Parameter]...';


GO
CREATE TABLE [dbo].[Parameter] (
    [Id]                   BIGINT           IDENTITY (1, 1) NOT NULL,
    [Key]                  VARCHAR (100)    NOT NULL,
    [Value]                VARCHAR (300)    NOT NULL,
    [Description]          VARCHAR (200)    NULL,
    [StartDate]            DATETIME         NOT NULL,
    [EndDate]              DATETIME         NULL,
    [CreateDate]           DATETIME         NOT NULL,
    [UpdateDate]           DATETIME         NOT NULL,
    [State]                TINYINT          NOT NULL,
    [EntityId]             UNIQUEIDENTIFIER NOT NULL,
    [Obligatory]           BIT              NULL,
    [Versioning]           BIT              NULL,
    [ParameterCategory_Id] BIGINT           NOT NULL,
    [ParameterPage_Id]     BIGINT           NOT NULL,
    [ParameterType_Id]     BIGINT           NOT NULL,
    CONSTRAINT [PK_dbo.Parameter] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Parameter].[IX_ParameterCategory_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ParameterCategory_Id]
    ON [dbo].[Parameter]([ParameterCategory_Id] ASC);


GO
PRINT N'Creating [dbo].[Parameter].[IX_ParameterPage_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ParameterPage_Id]
    ON [dbo].[Parameter]([ParameterPage_Id] ASC);


GO
PRINT N'Creating [dbo].[Parameter].[IX_ParameterType_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ParameterType_Id]
    ON [dbo].[Parameter]([ParameterType_Id] ASC);


GO
PRINT N'Creating [dbo].[ParameterCategory]...';


GO
CREATE TABLE [dbo].[ParameterCategory] (
    [Id]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (100) NOT NULL,
    [CreateDate]  DATETIME      NOT NULL,
    [UpdateDate]  DATETIME      NOT NULL,
    [State]       TINYINT       NOT NULL,
    CONSTRAINT [PK_dbo.ParameterCategory] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ParameterPage]...';


GO
CREATE TABLE [dbo].[ParameterPage] (
    [Id]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [Description]    VARCHAR (100) NOT NULL,
    [CreateDate]     DATETIME      NOT NULL,
    [UpdateDate]     DATETIME      NOT NULL,
    [State]          TINYINT       NOT NULL,
    [pageVersioning] BIT           NOT NULL,
    [pageObligatory] BIT           NOT NULL,
    CONSTRAINT [PK_dbo.ParameterPage] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ParameterType]...';


GO
CREATE TABLE [dbo].[ParameterType] (
    [Id]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (100) NOT NULL,
    [CreateDate]  DATETIME      NOT NULL,
    [UpdateDate]  DATETIME      NOT NULL,
    [State]       TINYINT       NOT NULL,
    CONSTRAINT [PK_dbo.ParameterType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PerformanceLevel]...';


GO
CREATE TABLE [dbo].[PerformanceLevel] (
    [Id]          BIGINT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (50)     NOT NULL,
    [Code]        VARCHAR (15)     NOT NULL,
    [EntityId]    UNIQUEIDENTIFIER NOT NULL,
    [CreateDate]  DATETIME         NOT NULL,
    [UpdateDate]  DATETIME         NOT NULL,
    [State]       TINYINT          NOT NULL,
    CONSTRAINT [PK_dbo.PerformanceLevel] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[RequestRevoke]...';


GO
CREATE TABLE [dbo].[RequestRevoke] (
    [Id]            BIGINT           IDENTITY (1, 1) NOT NULL,
    [UsuId]         UNIQUEIDENTIFIER NOT NULL,
    [Test_Id]       BIGINT           NOT NULL,
    [Situation]     INT              NOT NULL,
    [Justification] VARCHAR (500)    NOT NULL,
    [BlockItem_Id]  BIGINT           NOT NULL,
    [CreateDate]    DATETIME         NOT NULL,
    [UpdateDate]    DATETIME         NOT NULL,
    [State]         TINYINT          NOT NULL,
    CONSTRAINT [PK_dbo.RequestRevoke] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[RequestRevoke].[IX_BlockItem_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_BlockItem_Id]
    ON [dbo].[RequestRevoke]([BlockItem_Id] ASC);


GO
PRINT N'Creating [dbo].[RequestRevoke].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[RequestRevoke]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[Skill]...';


GO
CREATE TABLE [dbo].[Skill] (
    [Id]                     BIGINT        IDENTITY (1, 1) NOT NULL,
    [Description]            VARCHAR (500) NOT NULL,
    [Code]                   VARCHAR (500) NOT NULL,
    [LastLevel]              BIT           NOT NULL,
    [CreateDate]             DATETIME      NOT NULL,
    [UpdateDate]             DATETIME      NOT NULL,
    [State]                  TINYINT       NOT NULL,
    [EvaluationMatrix_Id]    BIGINT        NULL,
    [ModelSkillLevel_Id]     BIGINT        NULL,
    [Parent_Id]              BIGINT        NULL,
    [CognitiveCompetence_Id] BIGINT        NULL,
    CONSTRAINT [PK_dbo.Skill] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Skill].[IX_EvaluationMatrix_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_EvaluationMatrix_Id]
    ON [dbo].[Skill]([EvaluationMatrix_Id] ASC);


GO
PRINT N'Creating [dbo].[Skill].[IX_ModelSkillLevel_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ModelSkillLevel_Id]
    ON [dbo].[Skill]([ModelSkillLevel_Id] ASC);


GO
PRINT N'Creating [dbo].[Skill].[IX_Parent_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Parent_Id]
    ON [dbo].[Skill]([Parent_Id] ASC);


GO
PRINT N'Creating [dbo].[Skill].[IX_CognitiveCompetence_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_CognitiveCompetence_Id]
    ON [dbo].[Skill]([CognitiveCompetence_Id] ASC);


GO
PRINT N'Creating [dbo].[StudentTestAbsenceReason]...';


GO
CREATE TABLE [dbo].[StudentTestAbsenceReason] (
    [Id]               BIGINT   IDENTITY (1, 1) NOT NULL,
    [alu_id]           BIGINT   NOT NULL,
    [Test_Id]          BIGINT   NOT NULL,
    [tur_id]           BIGINT   NOT NULL,
    [AbsenceReason_Id] BIGINT   NOT NULL,
    [CreateDate]       DATETIME NOT NULL,
    [UpdateDate]       DATETIME NOT NULL,
    [State]            TINYINT  NOT NULL,
    CONSTRAINT [PK_dbo.StudentTestAbsenceReason] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[StudentTestAbsenceReason].[IX_AbsenceReason_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_AbsenceReason_Id]
    ON [dbo].[StudentTestAbsenceReason]([AbsenceReason_Id] ASC);


GO
PRINT N'Creating [dbo].[StudentTestAbsenceReason].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[StudentTestAbsenceReason]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[StudentTestAbsenceReason].[IX_StudentTestAbsenceReason_Test_Id_tur_id]...';


GO
CREATE NONCLUSTERED INDEX [IX_StudentTestAbsenceReason_Test_Id_tur_id]
    ON [dbo].[StudentTestAbsenceReason]([Test_Id] ASC, [tur_id] ASC);


GO
PRINT N'Creating [dbo].[Test]...';


GO
CREATE TABLE [dbo].[Test] (
    [Id]                      BIGINT           IDENTITY (1, 1) NOT NULL,
    [Description]             VARCHAR (60)     NOT NULL,
    [Bib]                     BIT              NOT NULL,
    [TestType_Id]             BIGINT           NOT NULL,
    [NumberItemsBlock]        INT              NOT NULL,
    [Discipline_Id]           BIGINT           NOT NULL,
    [NumberBlock]             INT              NOT NULL,
    [NumberItem]              INT              NULL,
    [ApplicationStartDate]    DATETIME         NOT NULL,
    [ApplicationEndDate]      DATETIME         NOT NULL,
    [FormatType_Id]           BIGINT           NOT NULL,
    [CorrectionStartDate]     DATETIME         NOT NULL,
    [CorrectionEndDate]       DATETIME         NOT NULL,
    [UsuId]                   UNIQUEIDENTIFIER NOT NULL,
    [CreateDate]              DATETIME         NOT NULL,
    [UpdateDate]              DATETIME         NOT NULL,
    [State]                   TINYINT          NOT NULL,
    [AllAdhered]              BIT              NOT NULL,
    [TestSituation]           INT              NOT NULL,
    [PublicFeedback]          BIT              NOT NULL,
    [ProcessedCorrection]     BIT              NOT NULL,
    [ProcessedCorrectionDate] DATETIME         NULL,
    [Visible]                 BIT              NOT NULL,
    [FrequencyApplication]    INT              NOT NULL,
    CONSTRAINT [PK_dbo.Test] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Test].[IX_FormatType_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_FormatType_Id]
    ON [dbo].[Test]([FormatType_Id] ASC);


GO
PRINT N'Creating [dbo].[Test].[IX_Discipline_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Discipline_Id]
    ON [dbo].[Test]([Discipline_Id] ASC);


GO
PRINT N'Creating [dbo].[Test].[IX_TestType_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_TestType_Id]
    ON [dbo].[Test]([TestType_Id] ASC);


GO
PRINT N'Creating [dbo].[TestCurriculumGrade]...';


GO
CREATE TABLE [dbo].[TestCurriculumGrade] (
    [Id]                    BIGINT   IDENTITY (1, 1) NOT NULL,
    [TypeCurriculumGradeId] BIGINT   NOT NULL,
    [CreateDate]            DATETIME NOT NULL,
    [UpdateDate]            DATETIME NOT NULL,
    [State]                 TINYINT  NOT NULL,
    [Test_Id]               BIGINT   NULL,
    CONSTRAINT [PK_dbo.TestCurriculumGrade] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TestCurriculumGrade].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[TestCurriculumGrade]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[TestFiles]...';


GO
CREATE TABLE [dbo].[TestFiles] (
    [Id]         BIGINT           IDENTITY (1, 1) NOT NULL,
    [File_Id]    BIGINT           NOT NULL,
    [Test_Id]    BIGINT           NOT NULL,
    [UserId]     UNIQUEIDENTIFIER NULL,
    [CreateDate] DATETIME         NOT NULL,
    [UpdateDate] DATETIME         NOT NULL,
    [State]      TINYINT          NOT NULL,
    CONSTRAINT [PK_dbo.TestFiles] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TestFiles].[IX_File_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_File_Id]
    ON [dbo].[TestFiles]([File_Id] ASC);


GO
PRINT N'Creating [dbo].[TestFiles].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[TestFiles]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[TestItemLevel]...';


GO
CREATE TABLE [dbo].[TestItemLevel] (
    [Id]           BIGINT   IDENTITY (1, 1) NOT NULL,
    [Value]        INT      NULL,
    [CreateDate]   DATETIME NOT NULL,
    [UpdateDate]   DATETIME NOT NULL,
    [State]        TINYINT  NOT NULL,
    [ItemLevel_Id] BIGINT   NULL,
    [Test_Id]      BIGINT   NULL,
    [PercentValue] INT      NULL,
    CONSTRAINT [PK_dbo.TestItemLevel] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TestItemLevel].[IX_ItemLevel_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ItemLevel_Id]
    ON [dbo].[TestItemLevel]([ItemLevel_Id] ASC);


GO
PRINT N'Creating [dbo].[TestItemLevel].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[TestItemLevel]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[TestPerformanceLevel]...';


GO
CREATE TABLE [dbo].[TestPerformanceLevel] (
    [Id]                  BIGINT   IDENTITY (1, 1) NOT NULL,
    [Order]               INT      NOT NULL,
    [Value1]              INT      NULL,
    [Value2]              INT      NULL,
    [CreateDate]          DATETIME NOT NULL,
    [UpdateDate]          DATETIME NOT NULL,
    [State]               TINYINT  NOT NULL,
    [PerformanceLevel_Id] BIGINT   NULL,
    [Test_Id]             BIGINT   NULL,
    CONSTRAINT [PK_dbo.TestPerformanceLevel] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TestPerformanceLevel].[IX_PerformanceLevel_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_PerformanceLevel_Id]
    ON [dbo].[TestPerformanceLevel]([PerformanceLevel_Id] ASC);


GO
PRINT N'Creating [dbo].[TestPerformanceLevel].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[TestPerformanceLevel]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[TestSectionStatusCorrection]...';


GO
CREATE TABLE [dbo].[TestSectionStatusCorrection] (
    [Id]               BIGINT   IDENTITY (1, 1) NOT NULL,
    [Test_Id]          BIGINT   NOT NULL,
    [tur_id]           BIGINT   NOT NULL,
    [StatusCorrection] TINYINT  NOT NULL,
    [CreateDate]       DATETIME NOT NULL,
    [UpdateDate]       DATETIME NOT NULL,
    [State]            TINYINT  NOT NULL,
    CONSTRAINT [PK_dbo.TestSectionStatusCorrection] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TestSectionStatusCorrection].[IX_Test_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_Test_Id]
    ON [dbo].[TestSectionStatusCorrection]([Test_Id] ASC);


GO
PRINT N'Creating [dbo].[TestSectionStatusCorrection].[IX_TestSectionStatusCorrection_Test_Id_tur_id]...';


GO
CREATE NONCLUSTERED INDEX [IX_TestSectionStatusCorrection_Test_Id_tur_id]
    ON [dbo].[TestSectionStatusCorrection]([Test_Id] ASC, [tur_id] ASC);


GO
PRINT N'Creating [dbo].[TestType]...';


GO
CREATE TABLE [dbo].[TestType] (
    [Id]                   BIGINT           IDENTITY (1, 1) NOT NULL,
    [Description]          VARCHAR (500)    NOT NULL,
    [EntityId]             UNIQUEIDENTIFIER NOT NULL,
    [CreateDate]           DATETIME         NOT NULL,
    [UpdateDate]           DATETIME         NOT NULL,
    [State]                TINYINT          NOT NULL,
    [AnswerSheet_Id]       BIGINT           NOT NULL,
    [FormatType_Id]        BIGINT           NULL,
    [Bib]                  BIT              NOT NULL,
    [Global]               BIT              NOT NULL,
    [TypeLevelEducationId] INT              NOT NULL,
    [ItemType_Id]          BIGINT           NULL,
    [ModelTest_Id]         BIGINT           NULL,
    [FrequencyApplication] INT              NOT NULL,
    CONSTRAINT [PK_dbo.TestType] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TestType].[IX_ModelTest_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ModelTest_Id]
    ON [dbo].[TestType]([ModelTest_Id] ASC);


GO
PRINT N'Creating [dbo].[TestType].[IX_FormatType_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_FormatType_Id]
    ON [dbo].[TestType]([FormatType_Id] ASC);


GO
PRINT N'Creating [dbo].[TestType].[IX_ItemType_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ItemType_Id]
    ON [dbo].[TestType]([ItemType_Id] ASC);


GO
PRINT N'Creating [dbo].[TestTypeCourse]...';


GO
CREATE TABLE [dbo].[TestTypeCourse] (
    [Id]          BIGINT   IDENTITY (1, 1) NOT NULL,
    [CourseId]    INT      NOT NULL,
    [CreateDate]  DATETIME NOT NULL,
    [UpdateDate]  DATETIME NOT NULL,
    [State]       TINYINT  NOT NULL,
    [TestType_Id] BIGINT   NOT NULL,
    [ModalityId]  INT      NOT NULL,
    CONSTRAINT [PK_dbo.TestTypeCourse] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TestTypeCourse].[IX_TestType_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_TestType_Id]
    ON [dbo].[TestTypeCourse]([TestType_Id] ASC);


GO
PRINT N'Creating [dbo].[TestTypeCourseCurriculumGrade]...';


GO
CREATE TABLE [dbo].[TestTypeCourseCurriculumGrade] (
    [Id]                    BIGINT   IDENTITY (1, 1) NOT NULL,
    [CurriculumGradeId]     INT      NOT NULL,
    [CreateDate]            DATETIME NOT NULL,
    [UpdateDate]            DATETIME NOT NULL,
    [State]                 TINYINT  NOT NULL,
    [TestTypeCourse_Id]     BIGINT   NOT NULL,
    [TypeCurriculumGradeId] INT      NOT NULL,
    [Ordem]                 INT      NOT NULL,
    CONSTRAINT [PK_dbo.TestTypeCourseCurriculumGrade] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TestTypeCourseCurriculumGrade].[IX_TestTypeCourse_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_TestTypeCourse_Id]
    ON [dbo].[TestTypeCourseCurriculumGrade]([TestTypeCourse_Id] ASC);


GO
PRINT N'Creating [dbo].[TestTypeItemLevel]...';


GO
CREATE TABLE [dbo].[TestTypeItemLevel] (
    [Id]           BIGINT   IDENTITY (1, 1) NOT NULL,
    [Value]        INT      NULL,
    [CreateDate]   DATETIME NOT NULL,
    [UpdateDate]   DATETIME NOT NULL,
    [State]        TINYINT  NOT NULL,
    [ItemLevel_Id] BIGINT   NOT NULL,
    [TestType_Id]  BIGINT   NOT NULL,
    CONSTRAINT [PK_dbo.TestTypeItemLevel] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[TestTypeItemLevel].[IX_ItemLevel_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_ItemLevel_Id]
    ON [dbo].[TestTypeItemLevel]([ItemLevel_Id] ASC);


GO
PRINT N'Creating [dbo].[TestTypeItemLevel].[IX_TestType_Id]...';


GO
CREATE NONCLUSTERED INDEX [IX_TestType_Id]
    ON [dbo].[TestTypeItemLevel]([TestType_Id] ASC);


GO
PRINT N'Creating [dbo].[SGP_ACA_Aluno]...';


GO
CREATE SYNONYM [dbo].[SGP_ACA_Aluno] FOR [GestaoAvaliacao_SGP].[dbo].[ACA_Aluno];


GO
PRINT N'Creating [dbo].[SGP_ACA_CurriculoPeriodo]...';


GO
CREATE SYNONYM [dbo].[SGP_ACA_CurriculoPeriodo] FOR [GestaoAvaliacao_SGP].[dbo].[ACA_CurriculoPeriodo];


GO
PRINT N'Creating [dbo].[SGP_ACA_Curso]...';


GO
CREATE SYNONYM [dbo].[SGP_ACA_Curso] FOR [GestaoAvaliacao_SGP].[dbo].[ACA_Curso];


GO
PRINT N'Creating [dbo].[SGP_ACA_Docente]...';


GO
CREATE SYNONYM [dbo].[SGP_ACA_Docente] FOR [GestaoAvaliacao_SGP].[dbo].[ACA_Docente];


GO
PRINT N'Creating [dbo].[SGP_ACA_TipoCurriculoPeriodo]...';


GO
CREATE SYNONYM [dbo].[SGP_ACA_TipoCurriculoPeriodo] FOR [GestaoAvaliacao_SGP].[dbo].[ACA_TipoCurriculoPeriodo];


GO
PRINT N'Creating [dbo].[SGP_ACA_TipoTurno]...';


GO
CREATE SYNONYM [dbo].[SGP_ACA_TipoTurno] FOR [GestaoAvaliacao_SGP].[dbo].[ACA_TipoTurno];


GO
PRINT N'Creating [dbo].[SGP_ESC_Escola]...';


GO
CREATE SYNONYM [dbo].[SGP_ESC_Escola] FOR [GestaoAvaliacao_SGP].[dbo].[ESC_Escola];


GO
PRINT N'Creating [dbo].[SGP_MTR_MatriculaTurma]...';


GO
CREATE SYNONYM [dbo].[SGP_MTR_MatriculaTurma] FOR [GestaoAvaliacao_SGP].[dbo].[MTR_MatriculaTurma];


GO
PRINT N'Creating [dbo].[SGP_SYS_UnidadeAdministrativa]...';


GO
CREATE SYNONYM [dbo].[SGP_SYS_UnidadeAdministrativa] FOR [GestaoAvaliacao_SGP].[dbo].[SYS_UnidadeAdministrativa];


GO
PRINT N'Creating [dbo].[SGP_TUR_Turma]...';


GO
CREATE SYNONYM [dbo].[SGP_TUR_Turma] FOR [GestaoAvaliacao_SGP].[dbo].[TUR_Turma];


GO
PRINT N'Creating [dbo].[SGP_TUR_TurmaCurriculo]...';


GO
CREATE SYNONYM [dbo].[SGP_TUR_TurmaCurriculo] FOR [GestaoAvaliacao_SGP].[dbo].[TUR_TurmaCurriculo];


GO
PRINT N'Creating [dbo].[SGP_TUR_TurmaDisciplina]...';


GO
CREATE SYNONYM [dbo].[SGP_TUR_TurmaDisciplina] FOR [GestaoAvaliacao_SGP].[dbo].[TUR_TurmaDisciplina];


GO
PRINT N'Creating [dbo].[SGP_TUR_TurmaDocente]...';


GO
CREATE SYNONYM [dbo].[SGP_TUR_TurmaDocente] FOR [GestaoAvaliacao_SGP].[dbo].[TUR_TurmaDocente];


GO
PRINT N'Creating [dbo].[SGP_TUR_TurmaTipoCurriculoPeriodo]...';


GO
CREATE SYNONYM [dbo].[SGP_TUR_TurmaTipoCurriculoPeriodo] FOR [GestaoAvaliacao_SGP].[dbo].[TUR_TurmaTipoCurriculoPeriodo];


GO
PRINT N'Creating [dbo].[Synonym_Core_PES_Pessoa]...';


GO
CREATE SYNONYM [dbo].[Synonym_Core_PES_Pessoa] FOR [CoreSSO].[dbo].[PES_Pessoa];


GO
PRINT N'Creating [dbo].[Synonym_Core_SYS_Grupo]...';


GO
CREATE SYNONYM [dbo].[Synonym_Core_SYS_Grupo] FOR [CoreSSO].[dbo].[SYS_Grupo];


GO
PRINT N'Creating [dbo].[Synonym_Core_SYS_Usuario]...';


GO
CREATE SYNONYM [dbo].[Synonym_Core_SYS_Usuario] FOR [CoreSSO].[dbo].[SYS_Usuario];


GO
PRINT N'Creating [dbo].[Synonym_Core_SYS_UsuarioGrupo]...';


GO
CREATE SYNONYM [dbo].[Synonym_Core_SYS_UsuarioGrupo] FOR [CoreSSO].[dbo].[SYS_UsuarioGrupo];


GO
PRINT N'Creating [dbo].[Synonym_Core_SYS_UsuarioGrupoUA]...';


GO
CREATE SYNONYM [dbo].[Synonym_Core_SYS_UsuarioGrupoUA] FOR [CoreSSO].[dbo].[SYS_UsuarioGrupoUA];


GO
PRINT N'Creating unnamed constraint on [dbo].[AbsenceReason]...';


GO
ALTER TABLE [dbo].[AbsenceReason]
    ADD DEFAULT ((0)) FOR [IsDefault];


GO
PRINT N'Creating unnamed constraint on [dbo].[AnswerSheetBatch]...';


GO
ALTER TABLE [dbo].[AnswerSheetBatch]
    ADD DEFAULT ((0)) FOR [BatchType];


GO
PRINT N'Creating unnamed constraint on [dbo].[AnswerSheetBatch]...';


GO
ALTER TABLE [dbo].[AnswerSheetBatch]
    ADD DEFAULT ((0)) FOR [OwnerEntity];


GO
PRINT N'Creating unnamed constraint on [dbo].[AnswerSheetBatchFiles]...';


GO
ALTER TABLE [dbo].[AnswerSheetBatchFiles]
    ADD DEFAULT ((0)) FOR [Situation];


GO
PRINT N'Creating unnamed constraint on [dbo].[AnswerSheetLot]...';


GO
ALTER TABLE [dbo].[AnswerSheetLot]
    ADD DEFAULT ((0)) FOR [Parent_Id];


GO
PRINT N'Creating unnamed constraint on [dbo].[AnswerSheetLot]...';


GO
ALTER TABLE [dbo].[AnswerSheetLot]
    ADD DEFAULT ((0)) FOR [Type];


GO
PRINT N'Creating unnamed constraint on [dbo].[Item]...';


GO
ALTER TABLE [dbo].[Item]
    ADD DEFAULT ((0)) FOR [IsRestrict];


GO
PRINT N'Creating unnamed constraint on [dbo].[Item]...';


GO
ALTER TABLE [dbo].[Item]
    ADD DEFAULT ((0)) FOR [ItemCodeVersion];


GO
PRINT N'Creating unnamed constraint on [dbo].[Item]...';


GO
ALTER TABLE [dbo].[Item]
    ADD DEFAULT ('') FOR [descriptorSentence];


GO
PRINT N'Creating unnamed constraint on [dbo].[ModelTest]...';


GO
ALTER TABLE [dbo].[ModelTest]
    ADD DEFAULT ((0)) FOR [ShowItemLine];


GO
PRINT N'Creating unnamed constraint on [dbo].[Parameter]...';


GO
ALTER TABLE [dbo].[Parameter]
    ADD DEFAULT ((0)) FOR [ParameterCategory_Id];


GO
PRINT N'Creating unnamed constraint on [dbo].[Parameter]...';


GO
ALTER TABLE [dbo].[Parameter]
    ADD DEFAULT ((0)) FOR [ParameterPage_Id];


GO
PRINT N'Creating unnamed constraint on [dbo].[Parameter]...';


GO
ALTER TABLE [dbo].[Parameter]
    ADD DEFAULT ((0)) FOR [ParameterType_Id];


GO
PRINT N'Creating unnamed constraint on [dbo].[ParameterPage]...';


GO
ALTER TABLE [dbo].[ParameterPage]
    ADD DEFAULT ((0)) FOR [pageVersioning];


GO
PRINT N'Creating unnamed constraint on [dbo].[ParameterPage]...';


GO
ALTER TABLE [dbo].[ParameterPage]
    ADD DEFAULT ((0)) FOR [pageObligatory];


GO
PRINT N'Creating unnamed constraint on [dbo].[Test]...';


GO
ALTER TABLE [dbo].[Test]
    ADD DEFAULT ((0)) FOR [ProcessedCorrection];


GO
PRINT N'Creating unnamed constraint on [dbo].[Test]...';


GO
ALTER TABLE [dbo].[Test]
    ADD DEFAULT ((1)) FOR [Visible];


GO
PRINT N'Creating unnamed constraint on [dbo].[Test]...';


GO
ALTER TABLE [dbo].[Test]
    ADD DEFAULT ((0)) FOR [PublicFeedback];


GO
PRINT N'Creating unnamed constraint on [dbo].[Test]...';


GO
ALTER TABLE [dbo].[Test]
    ADD DEFAULT ((1)) FOR [FrequencyApplication];


GO
PRINT N'Creating unnamed constraint on [dbo].[TestType]...';


GO
ALTER TABLE [dbo].[TestType]
    ADD DEFAULT ((0)) FOR [Bib];


GO
PRINT N'Creating unnamed constraint on [dbo].[TestType]...';


GO
ALTER TABLE [dbo].[TestType]
    ADD DEFAULT ((0)) FOR [Global];


GO
PRINT N'Creating unnamed constraint on [dbo].[TestType]...';


GO
ALTER TABLE [dbo].[TestType]
    ADD DEFAULT ((0)) FOR [TypeLevelEducationId];


GO
PRINT N'Creating unnamed constraint on [dbo].[TestType]...';


GO
ALTER TABLE [dbo].[TestType]
    ADD DEFAULT ((1)) FOR [FrequencyApplication];


GO
PRINT N'Creating unnamed constraint on [dbo].[TestTypeCourse]...';


GO
ALTER TABLE [dbo].[TestTypeCourse]
    ADD DEFAULT ((0)) FOR [ModalityId];


GO
PRINT N'Creating [dbo].[FK_dbo.Adherence_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[Adherence] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Adherence_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Alternative_dbo.Item_Item_Id]...';


GO
ALTER TABLE [dbo].[Alternative] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Alternative_dbo.Item_Item_Id] FOREIGN KEY ([Item_Id]) REFERENCES [dbo].[Item] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetBatch_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetBatch] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetBatch_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetBatchFiles_dbo.AnswerSheetBatch_AnswerSheetBatch_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetBatchFiles] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetBatchFiles_dbo.AnswerSheetBatch_AnswerSheetBatch_Id] FOREIGN KEY ([AnswerSheetBatch_Id]) REFERENCES [dbo].[AnswerSheetBatch] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetBatchFiles_dbo.AnswerSheetBatchQueue_AnswerSheetBatchQueue_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetBatchFiles] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetBatchFiles_dbo.AnswerSheetBatchQueue_AnswerSheetBatchQueue_Id] FOREIGN KEY ([AnswerSheetBatchQueue_Id]) REFERENCES [dbo].[AnswerSheetBatchQueue] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetBatchFiles_dbo.File_File_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetBatchFiles] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetBatchFiles_dbo.File_File_Id] FOREIGN KEY ([File_Id]) REFERENCES [dbo].[File] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetBatchLog_dbo.AnswerSheetBatchFiles_AnswerSheetBatchFile_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetBatchLog] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetBatchLog_dbo.AnswerSheetBatchFiles_AnswerSheetBatchFile_Id] FOREIGN KEY ([AnswerSheetBatchFile_Id]) REFERENCES [dbo].[AnswerSheetBatchFiles] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetBatchLog_dbo.File_File_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetBatchLog] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetBatchLog_dbo.File_File_Id] FOREIGN KEY ([File_Id]) REFERENCES [dbo].[File] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetBatchQueue_dbo.AnswerSheetBatch_AnswerSheetBatch_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetBatchQueue] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetBatchQueue_dbo.AnswerSheetBatch_AnswerSheetBatch_Id] FOREIGN KEY ([AnswerSheetBatch_Id]) REFERENCES [dbo].[AnswerSheetBatch] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetBatchQueue_dbo.File_File_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetBatchQueue] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetBatchQueue_dbo.File_File_Id] FOREIGN KEY ([File_Id]) REFERENCES [dbo].[File] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetLot_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetLot] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetLot_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.AnswerSheetLot_dbo.AnswerSheetLot_Parent_Id]...';


GO
ALTER TABLE [dbo].[AnswerSheetLot] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.AnswerSheetLot_dbo.AnswerSheetLot_Parent_Id] FOREIGN KEY ([Parent_Id]) REFERENCES [dbo].[AnswerSheetLot] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.Block_dbo.Booklet_Booklet_Id]...';


GO
ALTER TABLE [dbo].[Block] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Block_dbo.Booklet_Booklet_Id] FOREIGN KEY ([Booklet_Id]) REFERENCES [dbo].[Booklet] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.Block_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[Block] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Block_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.BlockItem_dbo.Item_Item_Id]...';


GO
ALTER TABLE [dbo].[BlockItem] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BlockItem_dbo.Item_Item_Id] FOREIGN KEY ([Item_Id]) REFERENCES [dbo].[Item] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.BlockItem_dbo.Block_Block_Id]...';


GO
ALTER TABLE [dbo].[BlockItem] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.BlockItem_dbo.Block_Block_Id] FOREIGN KEY ([Block_Id]) REFERENCES [dbo].[Block] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Booklet_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[Booklet] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Booklet_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.CorrelatedSkill_dbo.Skill_Skill1_Id]...';


GO
ALTER TABLE [dbo].[CorrelatedSkill] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.CorrelatedSkill_dbo.Skill_Skill1_Id] FOREIGN KEY ([Skill1_Id]) REFERENCES [dbo].[Skill] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.CorrelatedSkill_dbo.Skill_Skill2_Id]...';


GO
ALTER TABLE [dbo].[CorrelatedSkill] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.CorrelatedSkill_dbo.Skill_Skill2_Id] FOREIGN KEY ([Skill2_Id]) REFERENCES [dbo].[Skill] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.EvaluationMatrix_dbo.Discipline_Discipline_Id]...';


GO
ALTER TABLE [dbo].[EvaluationMatrix] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.EvaluationMatrix_dbo.Discipline_Discipline_Id] FOREIGN KEY ([Discipline_Id]) REFERENCES [dbo].[Discipline] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.EvaluationMatrix_dbo.ModelEvaluationMatrix_ModelEvaluationMatrix_Id]...';


GO
ALTER TABLE [dbo].[EvaluationMatrix] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.EvaluationMatrix_dbo.ModelEvaluationMatrix_ModelEvaluationMatrix_Id] FOREIGN KEY ([ModelEvaluationMatrix_Id]) REFERENCES [dbo].[ModelEvaluationMatrix] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.EvaluationMatrixCourse_dbo.EvaluationMatrix_EvaluationMatrix_Id]...';


GO
ALTER TABLE [dbo].[EvaluationMatrixCourse] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.EvaluationMatrixCourse_dbo.EvaluationMatrix_EvaluationMatrix_Id] FOREIGN KEY ([EvaluationMatrix_Id]) REFERENCES [dbo].[EvaluationMatrix] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.EvaluationMatrixCourseCurriculumGrade_dbo.EvaluationMatrixCourse_EvaluationMatrixCourse_Id]...';


GO
ALTER TABLE [dbo].[EvaluationMatrixCourseCurriculumGrade] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.EvaluationMatrixCourseCurriculumGrade_dbo.EvaluationMatrixCourse_EvaluationMatrixCourse_Id] FOREIGN KEY ([EvaluationMatrixCourse_Id]) REFERENCES [dbo].[EvaluationMatrixCourse] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.ExportAnalysis_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[ExportAnalysis] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.ExportAnalysis_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Item_dbo.BaseText_BaseText_Id]...';


GO
ALTER TABLE [dbo].[Item] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Item_dbo.BaseText_BaseText_Id] FOREIGN KEY ([BaseText_Id]) REFERENCES [dbo].[BaseText] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.Item_dbo.EvaluationMatrix_EvaluationMatrix_Id]...';


GO
ALTER TABLE [dbo].[Item] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Item_dbo.EvaluationMatrix_EvaluationMatrix_Id] FOREIGN KEY ([EvaluationMatrix_Id]) REFERENCES [dbo].[EvaluationMatrix] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Item_dbo.ItemSituation_ItemSituation_Id]...';


GO
ALTER TABLE [dbo].[Item] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Item_dbo.ItemSituation_ItemSituation_Id] FOREIGN KEY ([ItemSituation_Id]) REFERENCES [dbo].[ItemSituation] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Item_dbo.ItemType_ItemType_Id]...';


GO
ALTER TABLE [dbo].[Item] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Item_dbo.ItemType_ItemType_Id] FOREIGN KEY ([ItemType_Id]) REFERENCES [dbo].[ItemType] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Item_dbo.ItemLevel_ItemLevel_Id]...';


GO
ALTER TABLE [dbo].[Item] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Item_dbo.ItemLevel_ItemLevel_Id] FOREIGN KEY ([ItemLevel_Id]) REFERENCES [dbo].[ItemLevel] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.ItemCurriculumGrade_dbo.Item_Item_Id]...';


GO
ALTER TABLE [dbo].[ItemCurriculumGrade] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.ItemCurriculumGrade_dbo.Item_Item_Id] FOREIGN KEY ([Item_Id]) REFERENCES [dbo].[Item] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.ItemSkill_dbo.Skill_Skill_Id]...';


GO
ALTER TABLE [dbo].[ItemSkill] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.ItemSkill_dbo.Skill_Skill_Id] FOREIGN KEY ([Skill_Id]) REFERENCES [dbo].[Skill] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.ItemSkill_dbo.Item_Item_Id]...';


GO
ALTER TABLE [dbo].[ItemSkill] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.ItemSkill_dbo.Item_Item_Id] FOREIGN KEY ([Item_Id]) REFERENCES [dbo].[Item] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.ModelSkillLevel_dbo.ModelEvaluationMatrix_ModelEvaluationMatrix_Id]...';


GO
ALTER TABLE [dbo].[ModelSkillLevel] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.ModelSkillLevel_dbo.ModelEvaluationMatrix_ModelEvaluationMatrix_Id] FOREIGN KEY ([ModelEvaluationMatrix_Id]) REFERENCES [dbo].[ModelEvaluationMatrix] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.ModelTest_dbo.File_FileFooter_Id]...';


GO
ALTER TABLE [dbo].[ModelTest] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.ModelTest_dbo.File_FileFooter_Id] FOREIGN KEY ([FileFooter_Id]) REFERENCES [dbo].[File] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.ModelTest_dbo.File_FileHeader_Id]...';


GO
ALTER TABLE [dbo].[ModelTest] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.ModelTest_dbo.File_FileHeader_Id] FOREIGN KEY ([FileHeader_Id]) REFERENCES [dbo].[File] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.Parameter_dbo.ParameterPage_ParameterPage_Id]...';


GO
ALTER TABLE [dbo].[Parameter] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Parameter_dbo.ParameterPage_ParameterPage_Id] FOREIGN KEY ([ParameterPage_Id]) REFERENCES [dbo].[ParameterPage] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Parameter_dbo.ParameterCategory_ParameterCategory_Id]...';


GO
ALTER TABLE [dbo].[Parameter] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Parameter_dbo.ParameterCategory_ParameterCategory_Id] FOREIGN KEY ([ParameterCategory_Id]) REFERENCES [dbo].[ParameterCategory] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Parameter_dbo.ParameterType_ParameterType_Id]...';


GO
ALTER TABLE [dbo].[Parameter] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Parameter_dbo.ParameterType_ParameterType_Id] FOREIGN KEY ([ParameterType_Id]) REFERENCES [dbo].[ParameterType] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.RequestRevoke_dbo.BlockItem_BlockItem_Id]...';


GO
ALTER TABLE [dbo].[RequestRevoke] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.RequestRevoke_dbo.BlockItem_BlockItem_Id] FOREIGN KEY ([BlockItem_Id]) REFERENCES [dbo].[BlockItem] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.RequestRevoke_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[RequestRevoke] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.RequestRevoke_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Skill_dbo.CognitiveCompetence_CognitiveCompetence_Id]...';


GO
ALTER TABLE [dbo].[Skill] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Skill_dbo.CognitiveCompetence_CognitiveCompetence_Id] FOREIGN KEY ([CognitiveCompetence_Id]) REFERENCES [dbo].[CognitiveCompetence] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.Skill_dbo.EvaluationMatrix_EvaluationMatrix_Id]...';


GO
ALTER TABLE [dbo].[Skill] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Skill_dbo.EvaluationMatrix_EvaluationMatrix_Id] FOREIGN KEY ([EvaluationMatrix_Id]) REFERENCES [dbo].[EvaluationMatrix] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.Skill_dbo.ModelSkillLevel_ModelSkillLevel_Id]...';


GO
ALTER TABLE [dbo].[Skill] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Skill_dbo.ModelSkillLevel_ModelSkillLevel_Id] FOREIGN KEY ([ModelSkillLevel_Id]) REFERENCES [dbo].[ModelSkillLevel] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.Skill_dbo.Skill_Parent_Id]...';


GO
ALTER TABLE [dbo].[Skill] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Skill_dbo.Skill_Parent_Id] FOREIGN KEY ([Parent_Id]) REFERENCES [dbo].[Skill] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.StudentTestAbsenceReason_dbo.AbsenceReason_AbsenceReason_Id]...';


GO
ALTER TABLE [dbo].[StudentTestAbsenceReason] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.StudentTestAbsenceReason_dbo.AbsenceReason_AbsenceReason_Id] FOREIGN KEY ([AbsenceReason_Id]) REFERENCES [dbo].[AbsenceReason] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.StudentTestAbsenceReason_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[StudentTestAbsenceReason] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.StudentTestAbsenceReason_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Test_dbo.FormatType_FormatType_Id]...';


GO
ALTER TABLE [dbo].[Test] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Test_dbo.FormatType_FormatType_Id] FOREIGN KEY ([FormatType_Id]) REFERENCES [dbo].[FormatType] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Test_dbo.Discipline_Discipline_Id]...';


GO
ALTER TABLE [dbo].[Test] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Test_dbo.Discipline_Discipline_Id] FOREIGN KEY ([Discipline_Id]) REFERENCES [dbo].[Discipline] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Test_dbo.TestType_TestType_Id]...';


GO
ALTER TABLE [dbo].[Test] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.Test_dbo.TestType_TestType_Id] FOREIGN KEY ([TestType_Id]) REFERENCES [dbo].[TestType] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.TestCurriculumGrade_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[TestCurriculumGrade] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestCurriculumGrade_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.TestFiles_dbo.File_File_Id]...';


GO
ALTER TABLE [dbo].[TestFiles] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestFiles_dbo.File_File_Id] FOREIGN KEY ([File_Id]) REFERENCES [dbo].[File] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.TestFiles_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[TestFiles] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestFiles_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.TestItemLevel_dbo.ItemLevel_ItemLevel_Id]...';


GO
ALTER TABLE [dbo].[TestItemLevel] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestItemLevel_dbo.ItemLevel_ItemLevel_Id] FOREIGN KEY ([ItemLevel_Id]) REFERENCES [dbo].[ItemLevel] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.TestItemLevel_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[TestItemLevel] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestItemLevel_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.TestPerformanceLevel_dbo.PerformanceLevel_PerformanceLevel_Id]...';


GO
ALTER TABLE [dbo].[TestPerformanceLevel] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestPerformanceLevel_dbo.PerformanceLevel_PerformanceLevel_Id] FOREIGN KEY ([PerformanceLevel_Id]) REFERENCES [dbo].[PerformanceLevel] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.TestPerformanceLevel_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[TestPerformanceLevel] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestPerformanceLevel_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.TestSectionStatusCorrection_dbo.Test_Test_Id]...';


GO
ALTER TABLE [dbo].[TestSectionStatusCorrection] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestSectionStatusCorrection_dbo.Test_Test_Id] FOREIGN KEY ([Test_Id]) REFERENCES [dbo].[Test] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.TestType_dbo.FormatType_FormatType_Id]...';


GO
ALTER TABLE [dbo].[TestType] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestType_dbo.FormatType_FormatType_Id] FOREIGN KEY ([FormatType_Id]) REFERENCES [dbo].[FormatType] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.TestType_dbo.ModelTest_ModelTest_Id]...';


GO
ALTER TABLE [dbo].[TestType] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestType_dbo.ModelTest_ModelTest_Id] FOREIGN KEY ([ModelTest_Id]) REFERENCES [dbo].[ModelTest] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.TestType_dbo.ItemType_ItemType_Id]...';


GO
ALTER TABLE [dbo].[TestType] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestType_dbo.ItemType_ItemType_Id] FOREIGN KEY ([ItemType_Id]) REFERENCES [dbo].[ItemType] ([Id]);


GO
PRINT N'Creating [dbo].[FK_dbo.TestTypeCourse_dbo.TestType_TestType_Id]...';


GO
ALTER TABLE [dbo].[TestTypeCourse] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestTypeCourse_dbo.TestType_TestType_Id] FOREIGN KEY ([TestType_Id]) REFERENCES [dbo].[TestType] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.TestTypeCourseCurriculumGrade_dbo.TestTypeCourse_TestTypeCourse_Id]...';


GO
ALTER TABLE [dbo].[TestTypeCourseCurriculumGrade] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestTypeCourseCurriculumGrade_dbo.TestTypeCourse_TestTypeCourse_Id] FOREIGN KEY ([TestTypeCourse_Id]) REFERENCES [dbo].[TestTypeCourse] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.TestTypeItemLevel_dbo.ItemLevel_ItemLevel_Id]...';


GO
ALTER TABLE [dbo].[TestTypeItemLevel] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestTypeItemLevel_dbo.ItemLevel_ItemLevel_Id] FOREIGN KEY ([ItemLevel_Id]) REFERENCES [dbo].[ItemLevel] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.TestTypeItemLevel_dbo.TestType_TestType_Id]...';


GO
ALTER TABLE [dbo].[TestTypeItemLevel] WITH NOCHECK
    ADD CONSTRAINT [FK_dbo.TestTypeItemLevel_dbo.TestType_TestType_Id] FOREIGN KEY ([TestType_Id]) REFERENCES [dbo].[TestType] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[GetTestAdhered]...';


GO

-- =============================================
-- Author:		<Luís Henrique Pupo Maron>
-- Create date: <06/01/2016>
-- Description:	<Seleciona os testes que estão aderidos conforme os parâmetros passados>
-- =============================================
CREATE FUNCTION [dbo].[GetTestAdhered]
(	
	@typeEntity int, 
	@uad_id UNIQUEIDENTIFIER = NULL,
	@esc_id INT = NULL,
	@ttn_id INT = NULL,
	@tne_id INT = NULL,
	@crp_ordem INT = NULL
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT DISTINCT t.*, tt.Description AS TestTypeDescription
	FROM Test t
	INNER JOIN TestType tt ON tt.Id = t.TestType_Id
	INNER JOIN Adherence a ON t.Id = a.Test_Id AND a.TypeEntity = @typeEntity AND a.ParentId = ISNULL(@esc_id, a.ParentId)
	INNER JOIN SGP_TUR_Turma tur ON tur.tur_id = a.EntityId AND tur.ttn_id = ISNULL(@ttn_id, tur.ttn_id)
	INNER JOIN SGP_ESC_Escola e ON e.esc_id = tur.esc_id AND e.uad_idSuperiorGestao = ISNULL(@uad_id, e.uad_idSuperiorGestao)
	INNER JOIN SGP_TUR_TurmaTipoCurriculoPeriodo ttcp ON ttcp.tur_id = tur.tur_id AND ttcp.tne_id = ISNULL(@tne_id, ttcp.tne_id) AND ttcp.crp_ordem = ISNULL(@crp_ordem, ttcp.crp_ordem)
	WHERE t.AllAdhered = 0 AND t.State = 1 AND tt.State = 1 AND tt.Global = 0

	UNION
	SELECT DISTINCT t.*, tt.Description AS TestTypeDescription
	FROM Test t
	LEFT JOIN TestType tt ON tt.Id = t.TestType_Id
	LEFT JOIN Adherence a ON t.Id = a.Test_Id AND a.TypeEntity = @typeEntity AND a.ParentId = ISNULL(@esc_id, a.ParentId)
	LEFT JOIN SGP_TUR_Turma tur ON tur.tur_id = a.EntityId AND tur.ttn_id = ISNULL(@ttn_id, tur.ttn_id)
	LEFT JOIN SGP_ESC_Escola e ON e.esc_id = tur.esc_id AND e.uad_idSuperiorGestao = ISNULL(@uad_id, e.uad_idSuperiorGestao)
	LEFT JOIN SGP_TUR_TurmaTipoCurriculoPeriodo ttcp ON ttcp.tur_id = tur.tur_id AND ttcp.tne_id = ISNULL(@tne_id, ttcp.tne_id) AND ttcp.crp_ordem = ISNULL(@crp_ordem, ttcp.crp_ordem)
	WHERE t.AllAdhered = 1 AND a.Id IS NULL AND t.State = 1 AND tt.State = 1 AND tt.Global = 0

)
GO
PRINT N'Creating [dbo].[GetUserSection]...';


GO
-- =============================================
-- Author:		<Luís Maron>
-- Create date: <11/12/2015>
-- Description:	<Retorna as turmas que um usuário tem acesso>
-- =============================================
CREATE FUNCTION [dbo].[GetUserSection]
(	
	@gru_id UNIQUEIDENTIFIER,
	@usu_id UNIQUEIDENTIFIER, 
	@pes_id UNIQUEIDENTIFIER, 
	@ent_id UNIQUEIDENTIFIER, 
	@vis_id INT,
	@state INT,
	@esc_id INT = NULL,
	@uad_id UNIQUEIDENTIFIER = NULL,
	@ttn_id INT = NULL,
	@tne_id INT = NULL,
	@crp_ordem INT = NULL
)
RETURNS @tur_ids TABLE 
(
	tur_id BIGINT
)
AS
BEGIN
	IF(@vis_id = 2)
	BEGIN	
		INSERT INTO @tur_ids
		select t.tur_id		
		from Synonym_Core_SYS_UsuarioGrupo ug (NOLOCK)
		INNER JOIN Synonym_Core_SYS_UsuarioGrupoUA ua (NOLOCK) ON ug.gru_id = ua.gru_id AND ug.usu_id = ua.usu_id
		INNER JOIN SGP_ESC_Escola e (NOLOCK) ON e.uad_idSuperiorGestao = ua.uad_id AND e.esc_situacao = @state
		INNER JOIN SGP_TUR_Turma t (NOLOCK) ON t.esc_id = e.esc_id AND t.tur_situacao = @state
		INNER JOIN SGP_TUR_TurmaTipoCurriculoPeriodo ttcp (NOLOCK) ON ttcp.tur_id = t.tur_id
		where ug.usu_id = @usu_id and ug.gru_id = @gru_id AND ug.usg_situacao = @state 
			AND e.esc_id = ISNULL(@esc_id, e.esc_id) AND e.uad_idSuperiorGestao = ISNULL(@uad_id, e.uad_idSuperiorGestao)
			AND t.ttn_id = ISNULL(@ttn_id, t.ttn_id) AND ttcp.tne_id = ISNULL(@tne_id, ttcp.tne_id) AND ttcp.crp_ordem = ISNULL(@crp_ordem, ttcp.crp_ordem)
	END

	ELSE IF (@vis_id = 3)
	BEGIN
		INSERT INTO @tur_ids
		select t.tur_id
		from Synonym_Core_SYS_UsuarioGrupo ug (NOLOCK)
		INNER JOIN Synonym_Core_SYS_UsuarioGrupoUA ua (NOLOCK) ON ug.gru_id = ua.gru_id AND ug.usu_id = ua.usu_id
		INNER JOIN SGP_ESC_Escola e (NOLOCK) ON e.uad_id = ua.uad_id AND e.esc_situacao = @state
		INNER JOIN SGP_TUR_Turma t (NOLOCK) ON t.esc_id = e.esc_id AND t.tur_situacao = @state
		INNER JOIN SGP_TUR_TurmaTipoCurriculoPeriodo ttcp (NOLOCK) ON ttcp.tur_id = t.tur_id
		where ug.usu_id = @usu_id and ug.gru_id = @gru_id AND ug.usg_situacao = @state
			AND e.esc_id = ISNULL(@esc_id, e.esc_id) AND e.uad_idSuperiorGestao = ISNULL(@uad_id, e.uad_idSuperiorGestao)
			AND t.ttn_id = ISNULL(@ttn_id, t.ttn_id) AND ttcp.tne_id = ISNULL(@tne_id, ttcp.tne_id) AND ttcp.crp_ordem = ISNULL(@crp_ordem, ttcp.crp_ordem)
	END
	ELSE IF(@vis_id = 4)
	BEGIN
		INSERT INTO @tur_ids
		SELECT DISTINCT tud.tur_id
		FROM SGP_ACA_Docente d (NOLOCK)
		INNER JOIN SGP_TUR_TurmaDocente td (NOLOCK) ON d.doc_id = td.doc_id AND td.tdt_situacao = @state
		INNER JOIN SGP_TUR_TurmaDisciplina tud (NOLOCK) ON tud.tud_id = td.tud_id AND tud.tud_situacao = @state
		INNER JOIN SGP_TUR_Turma t (NOLOCK) ON t.tur_id = tud.tur_id
		INNER JOIN SGP_ESC_Escola e (NOLOCK) ON e.esc_id = t.esc_id
		INNER JOIN SGP_TUR_TurmaTipoCurriculoPeriodo ttcp (NOLOCK) ON ttcp.tur_id = t.tur_id
		WHERE d.pes_id = @pes_id AND d.ent_id = @ent_id AND d.doc_situacao = @state 
			AND e.esc_id = ISNULL(@esc_id, e.esc_id) AND e.uad_idSuperiorGestao = ISNULL(@uad_id, e.uad_idSuperiorGestao)
			AND t.ttn_id = ISNULL(@ttn_id, t.ttn_id) AND ttcp.tne_id = ISNULL(@tne_id, ttcp.tne_id) AND ttcp.crp_ordem = ISNULL(@crp_ordem, ttcp.crp_ordem)
	END
	RETURN
END
GO
PRINT N'Creating [dbo].[SplitString]...';


GO
CREATE FUNCTION [dbo].[SplitString] (@String nvarchar(4000), @Delimiter char(1))
RETURNS @Results TABLE (
  Items nvarchar(4000)
)
AS
BEGIN
  DECLARE @Index int
  DECLARE @Slice nvarchar(4000)

  SELECT
    @Index = 1
  IF @String IS NULL
    RETURN

  WHILE @Index != 0
  BEGIN
    SELECT
      @Index = CHARINDEX(@Delimiter, @String)
    IF @Index <> 0

      SELECT
        @Slice = LEFT(@String, @Index - 1)

    ELSE

      SELECT
        @Slice = @String
    INSERT INTO @Results (Items)
      VALUES (@Slice)
    SELECT
      @String = RIGHT(@String, LEN(@String) - @Index)

    IF LEN(@String) = 0
      BREAK

  END
  RETURN
END
GO
PRINT N'Creating [dbo].[TestsByUser]...';


GO

-- =============================================
-- Author:		<Luís Maron>
-- Create date: <10/12/2015>
-- Description:	<Retorna as provas que um professor tem acesso>
-- =============================================
CREATE FUNCTION [dbo].[TestsByUser]
(	
	@usuId UNIQUEIDENTIFIER, 
	@pes_id UNIQUEIDENTIFIER, 
	@ent_id UNIQUEIDENTIFIER, 
	@state int, 
	@typeEntity int, 
	@typeSelected INT, 
	@typeNotSelected INT,
	@gru_id UNIQUEIDENTIFIER,
	@vis_id INT,
	@uad_id UNIQUEIDENTIFIER = NULL,
	@esc_id INT = NULL,
	@ttn_id INT = NULL,
	@tne_id INT = NULL,
	@crp_ordem INT = NULL
)
RETURNS TABLE 
AS
RETURN 
(
	WITH Turmas AS(
		SELECT tur_id
		FROM GetUserSection(@gru_id, @usuId, @pes_id, @ent_id,	@vis_id, @state, @esc_id, @uad_id, @ttn_id, @tne_id, @crp_ordem)
	)

	SELECT t.Id
	FROM Test t
	INNER JOIN Discipline d ON d.Id = t.Discipline_Id
	INNER JOIN Adherence a ON t.Id = a.Test_Id AND a.TypeEntity = @typeEntity
	INNER JOIN Turmas tur ON tur.tur_id = a.EntityId
	WHERE t.UsuId <> @usuId AND t.AllAdhered = 0 
	
	UNION
	SELECT t.Id
	FROM Test t
	LEFT JOIN (
		SELECT DISTINCT a.Test_Id
		FROM Adherence a 
		INNER JOIN Turmas tur ON tur.tur_id = a.EntityId
		WHERE a.TypeEntity = @typeEntity AND TypeSelection = @typeNotSelected) adherence ON adherence.Test_Id = t.Id
	WHERE t.UsuId <> @usuId AND t.AllAdhered = 1 AND adherence.Test_Id IS NULL
	AND (@vis_id <> 3 OR (@vis_id = 3 AND ((SELECT COUNT(tur_id) FROM Turmas) > 0)))
	
	UNION
	SELECT t.Id
	FROM Test t
	WHERE t.UsuId = @usuId
)
GO
PRINT N'Creating [dbo].[MS_Block_SearchItems]...';


GO



-- =============================================
-- Author:		Guilherme Mendonca
-- Create date: 22/05/2015
-- Description:	Busca itens para inclusão no bloco
-- =============================================
-- =============================================
-- Alter by:		Gabriel Moreli
-- Date: 01/11/2016
-- Description:	Campo ItemCode foi alterado de INT para VARCHAR,
--				sendo assim necessário a modificação da consulta
-- =============================================

CREATE PROCEDURE [dbo].[MS_Block_SearchItems]
    @ItemCode VARCHAR(32),    
    @ProficiencyStart INT,
    @ProficiencyEnd INT,
    @Keywords VARCHAR(MAX),
    @DisciplineId BIGINT, 
    @EvaluationMatrixId BIGINT,
    @Skills VARCHAR(MAX),
	@ItemLevel VARCHAR(MAX),
    @TypeCurriculumGrades VARCHAR(MAX),
	@Global BIT,
    @pageSize INT,
    @pageNumber INT,
	@ItemTypeID BIGINT = NULL,
    @totalRecords INT OUTPUT
AS 
    BEGIN
    
    IF OBJECT_ID('tempdb..#tmp') > 0 DROP TABLE #tmp

    SELECT  ItemId,
			ItemCode, 
			ItemVersion, 
			Revoked,
			BaseTextDescription, 
			[Statement],
			MatrixDescription, 
			DescriptorSentence,
			BaseTextId,
			MatrixId,
			LastVersion,
			ItemLevelDescription,
			ItemLevelValue,
			TypeCurriculumGradeId,
			[Order],
			ROW_NUMBER() OVER ( ORDER BY ItemCode, ItemVersion) AS RowNumber
	INTO #tmp
	FROM    (
							SELECT  i.Id AS ItemId,
									i.ItemCode, 
									i.ItemVersion, 
									i.Revoked,
									bt.[Description] AS BaseTextDescription, 
									i.[Statement],
									em.[Description] AS MatrixDescription, 
									i.descriptorSentence AS DescriptorSentence,
									bt.Id AS BaseTextId,
									em.Id AS MatrixId,
									i.ItemSituation_Id,
									i.proficiency,
									i.LastVersion,
									i.Keywords,
									em.Discipline_Id,
									i.EvaluationMatrix_Id,
									ik.Skill_Id,
									icg.TypeCurriculumGradeId,
									it.[Description] AS ItemLevelDescription,
									it.Value AS ItemLevelValue,
									bi.[Order],
									ROW_NUMBER() OVER ( PARTITION BY i.Id ORDER BY i.Id ) AS RowNumber2
							FROM    Item i WITH ( NOLOCK )
									LEFT JOIN BaseText bt WITH ( NOLOCK ) ON bt.Id = i.BaseText_Id AND bt.[State] = 1
									INNER JOIN ItemSkill ik WITH ( NOLOCK ) ON ik.Item_Id = i.Id 
									INNER JOIN ItemCurriculumGrade icg WITH ( NOLOCK ) ON icg.Item_Id = i.Id
									INNER JOIN EvaluationMatrix em WITH ( NOLOCK ) ON em.Id = i.EvaluationMatrix_Id
									LEFT JOIN ItemLevel it WITH ( NOLOCK ) ON i.ItemLevel_Id = it.Id AND it.[State] = 1
									INNER JOIN ItemSituation its WITH ( NOLOCK ) ON i.ItemSituation_Id = its.Id
									LEFT JOIN BlockItem bi WITH ( NOLOCK ) ON bi.Item_Id = i.Id AND bi.[State] = 1
							WHERE   i.[State] = 1 AND em.[State] = 1 AND ik.[State] = 1 AND  icg.[State] = 1 AND its.[State] = 1
							AND (i.ItemNarrated IS NULL OR i.ItemNarrated = 0)
							AND i.ItemCode = ISNULL(UPPER(LTRIM(RTRIM(@ItemCode))), UPPER(LTRIM(RTRIM(i.ItemCode))))

							AND (i.IsRestrict = 0 OR (i.IsRestrict = 1 AND @Global = 1))

							and i.ItemType_Id = ISNULL(@ItemTypeID, i.ItemType_Id)
							AND ((@ProficiencyStart IS NULL AND @ProficiencyEnd IS NULL) 
								OR (@ProficiencyStart IS NOT NULL AND @ProficiencyEnd IS NULL AND proficiency >= @ProficiencyStart)
								OR (@ProficiencyStart IS NULL AND @ProficiencyEnd IS NOT NULL AND proficiency <= @ProficiencyEnd)
								OR (@ProficiencyStart IS NOT NULL AND @ProficiencyEnd IS NOT NULL AND proficiency BETWEEN @ProficiencyStart AND @ProficiencyEnd)
							)
							AND (@Keywords IS NULL 
								OR (@Keywords IS NOT NULL AND EXISTS (SELECT SI.Items FROM dbo.SplitString(Keywords,';') SI INNER JOIN dbo.SplitString(@Keywords,',') I ON SI.Items = I.Items))
							)
							AND Discipline_Id = ISNULL(@DisciplineId, Discipline_Id)
							AND EvaluationMatrix_Id = ISNULL(@EvaluationMatrixId, EvaluationMatrix_Id)
							AND (@TypeCurriculumGrades IS NULL 
								OR (@TypeCurriculumGrades IS NOT NULL AND TypeCurriculumGradeId IN (SELECT Items FROM dbo.SplitString(@TypeCurriculumGrades,',')))
							)
							AND (@Skills IS NULL 
								OR Skill_Id IN (SELECT Items FROM dbo.SplitString(@Skills,','))
							)
							AND (@ItemLevel IS NULL 
								OR i.ItemLevel_Id IN (SELECT Items from dbo.SplitString(@ItemLevel,','))
							)
							AND LastVersion = 1
							AND its.[Description] = 'Aceito'
														
					) as R
	WHERE @Skills IS NOT NULL OR (@Skills IS NULL AND RowNumber2 = 1)
	ORDER BY ItemCode, ItemVersion

	SELECT @totalRecords = COUNT(ItemId) from #tmp
		
	SELECT	TOP (@pageSize) 
			ItemId, 
			ItemCode, 
			ItemVersion, 
			Revoked,
			BaseTextDescription, 
			[Statement], 
			MatrixDescription, 
			DescriptorSentence, 
			BaseTextId, 
			MatrixId,  
			LastVersion, 
			ItemLevelDescription, 
			ItemLevelValue,
			TypeCurriculumGradeId,  
			[Order], 
			RowNumber
	FROM	#tmp
	WHERE   RowNumber > ( @pageSize * ( @pageNumber ) )
	ORDER BY RowNumber
	
    END
GO
PRINT N'Creating [dbo].[MS_CorrelatedSkill_SELECTBY_EvaluationMatrixId]...';


GO
-- =============================================
-- Author:		Leticia Martin
-- Create date: 01/10/2014
-- Description:	Lista todas as habilidades correlacionadas entre as matrizes
-- =============================================
CREATE PROCEDURE [dbo].[MS_CorrelatedSkill_SELECTBY_EvaluationMatrixId]
    @MatrizId INT ,
    @pageSize INT ,
    @pageNumber INT ,
    @totalRecords INT OUTPUT
AS 
    BEGIN

        SELECT  @totalRecords = COUNT(DISTINCT ck.Id)
        FROM    CorrelatedSkill ck WITH ( NOLOCK )
                INNER JOIN Skill sk1 WITH ( NOLOCK ) ON ck.Skill1_Id = sk1.Id
                INNER JOIN Skill sk2 WITH ( NOLOCK ) ON ck.skill2_id = sk2.Id
                INNER JOIN EvaluationMatrix em1 WITH ( NOLOCK ) ON SK1.EvaluationMatrix_Id = em1.Id
                INNER JOIN EvaluationMatrix em2 WITH ( NOLOCK ) ON SK2.EvaluationMatrix_Id = em2.Id
        WHERE   ck.id IN (
                SELECT  cs.Id
                FROM    Skill s WITH ( NOLOCK )
                        INNER JOIN CorrelatedSkill cs WITH ( NOLOCK ) ON cs.Skill1_Id = s.Id OR cs.Skill2_Id = s.Id
                WHERE   s.EvaluationMatrix_Id = @MatrizId )
                AND sk1.State = 1
                AND sk2.State = 1
                AND ck.State = 1
                AND em1.State = 1
                AND em2.State = 1


        SELECT TOP ( @pageSize )
                Matriz1 ,
                UltimoNivel1 ,
                Matriz2 ,
                UltimoNivel2,
                Id
        FROM    ( SELECT    ROW_NUMBER() OVER ( ORDER BY Id ) AS RowNumber ,
                            Matriz1 ,
                            UltimoNivel1 ,
                            Matriz2 ,
                            UltimoNivel2,
                           Id 
                  FROM      ( SELECT    em1.Description AS Matriz1 ,
                                        sk1.Description AS UltimoNivel1 ,
                                        em2.Description AS Matriz2 ,
                                        sk2.Description AS UltimoNivel2 ,
                                        ck.Id
                              FROM      CorrelatedSkill ck WITH ( NOLOCK )
                                        INNER JOIN Skill sk1 WITH ( NOLOCK ) ON ck.Skill1_Id = sk1.Id
                                        INNER JOIN Skill sk2 WITH ( NOLOCK ) ON ck.skill2_id = sk2.Id
                                        INNER JOIN EvaluationMatrix em1 WITH ( NOLOCK ) ON SK1.EvaluationMatrix_Id = em1.Id
                                        INNER JOIN EvaluationMatrix em2 WITH ( NOLOCK ) ON SK2.EvaluationMatrix_Id = em2.Id
                              WHERE     ck.id IN (
                                        SELECT  cs.Id
                                        FROM    Skill s WITH ( NOLOCK )
                                                INNER JOIN CorrelatedSkill cs WITH ( NOLOCK ) ON cs.Skill1_Id = s.Id
                                        WHERE   s.EvaluationMatrix_Id = @MatrizId )
                                        AND sk1.State = 1
                                        AND sk2.State = 1
                                        AND ck.State = 1
                                        AND em1.State = 1
                                        AND em2.State = 1
                              UNION
                              SELECT    em2.Description AS Matriz1 ,
                                        sk2.Description AS UltimoNivel1 ,
                                        em1.Description AS Matriz2 ,
                                        sk1.Description AS UltimoNivel2 ,
                                        ck.Id
                              FROM      CorrelatedSkill ck WITH ( NOLOCK )
                                        INNER JOIN Skill sk1 WITH ( NOLOCK ) ON ck.Skill1_Id = sk1.Id
                                        INNER JOIN Skill sk2 WITH ( NOLOCK ) ON ck.skill2_id = sk2.Id
                                        INNER JOIN EvaluationMatrix em1 WITH ( NOLOCK ) ON SK1.EvaluationMatrix_Id = em1.Id
                                        INNER JOIN EvaluationMatrix em2 WITH ( NOLOCK ) ON SK2.EvaluationMatrix_Id = em2.Id
                              WHERE     ck.id IN (
                                        SELECT  cs.Id
                                        FROM    Skill s WITH ( NOLOCK )
												INNER JOIN CorrelatedSkill cs WITH ( NOLOCK ) ON cs.Skill2_Id = s.Id
                                        WHERE   s.EvaluationMatrix_Id = @MatrizId )
                                        AND sk1.State = 1
                                        AND sk2.State = 1
                                        AND ck.State = 1
                                        AND em1.State = 1
                                        AND em2.State = 1
                            ) AS tab
                ) AS tab1
        WHERE   RowNumber > ( @pageSize * ( @pageNumber ) )
        ORDER BY Matriz1 ,
                Matriz2 ,
                RowNumber
    END
GO
PRINT N'Creating [dbo].[MS_Item_ReportItem]...';


GO
-- =============================================
-- Author:		<Leticia Martin Corral>
-- Create date: <14/10/2014>
-- Description:	<Lista a quantidade total de itens cadastrados e quantidade de itens por disciplina>
-- =============================================
CREATE PROCEDURE [dbo].[MS_Item_ReportItem]
    @EntityId UNIQUEIDENTIFIER ,
	@typeLevelEducation INT,
    @total INT = NULL
	
AS 
    BEGIN

        SELECT  @total = COUNT(item.Id)
        FROM    Item item WITH ( NOLOCK )
				INNER JOIN [EvaluationMatrix] em WITH ( NOLOCK ) ON em.Id = item.EvaluationMatrix_Id
				INNER JOIN [Discipline] dis WITH ( NOLOCK ) ON dis.Id = em.Discipline_Id
                LEFT JOIN [ModelEvaluationMatrix] mem WITH ( NOLOCK ) ON mem.id = em.ModelEvaluationMatrix_Id
        WHERE item.State = 1
				AND em.State = 1
                AND mem.State = 1
				AND mem.EntityId = @EntityId
				AND (@typeLevelEducation IS NULL OR dis.TypeLevelEducationId = @typeLevelEducation)
				AND item.LastVersion = 1

        SELECT  @total AS TotalItem ,
                COUNT(item.Id) AS Total ,
                dis.Description AS Description
        FROM    [Item] item WITH ( NOLOCK )
                INNER JOIN [EvaluationMatrix] em WITH ( NOLOCK ) ON em.Id = item.EvaluationMatrix_Id
                LEFT JOIN [ModelEvaluationMatrix] mem WITH ( NOLOCK ) ON mem.id = em.ModelEvaluationMatrix_Id
                INNER JOIN [Discipline] dis WITH ( NOLOCK ) ON dis.Id = em.Discipline_Id
        WHERE   item.state = 1
                AND em.State = 1
                AND dis.state = 1
                AND mem.State = 1
				AND (@typeLevelEducation IS NULL OR dis.TypeLevelEducationId = @typeLevelEducation)
                AND mem.EntityId = @EntityId
                AND item.LastVersion = 1
        GROUP BY dis.Description

    END
GO
PRINT N'Creating [dbo].[MS_Item_ReportItemCurriculumGrade]...';


GO
-- =============================================
-- Author:		<Leticia Martin Corral>
-- Create date: <14/10/2014>
-- Description:	<retorna quantidade de questões vinculadas aos periodos escolares>
-- =============================================
CREATE PROCEDURE [dbo].[MS_Item_ReportItemCurriculumGrade]
    @disciplina INT ,
    @situacao INT ,
    @EntityId UNIQUEIDENTIFIER ,
	@typeLevelEducation INT
AS 
    BEGIN

  SELECT  Id ,
						SUM(total) AS Total
        FROM    ( 
        SELECT    icg.TypeCurriculumGradeId AS Id, COUNT(item.id) AS Total
                  FROM   [ItemCurriculumGrade] icg WITH ( NOLOCK )
                            LEFT JOIN [Item] item WITH ( NOLOCK ) ON icg.Item_Id = item.id AND item.LastVersion = 1
                            LEFT JOIN [EvaluationMatrix] em WITH ( NOLOCK ) ON em.Id = item.EvaluationMatrix_Id
                            LEFT JOIN [Discipline] d WITH ( NOLOCK ) ON d.Id = em.Discipline_Id
                            LEFT JOIN [ModelEvaluationMatrix] mem WITH ( NOLOCK ) ON mem.Id = em.ModelEvaluationMatrix_Id
                            LEFT JOIN [ItemSituation] its WITH ( NOLOCK ) ON its.Id = item.ItemSituation_Id
                  WHERE     ( @disciplina IS NULL
                              OR d.id = @disciplina
                            )
                            AND its.Id = @situacao
							AND (@typeLevelEducation IS NULL OR d.TypeLevelEducationId = @typeLevelEducation)
                            AND icg.state = 1
                            AND item.state = 1
                            AND em.state = 1
                            AND d.state = 1
                            AND mem.state = 1
                            AND mem.entityId = @EntityId
                  GROUP BY icg.TypeCurriculumGradeId
                  
                  UNION
                  SELECT    emcc.TypeCurriculumGradeId AS Id, 0
                  FROM     [EvaluationMatrixCourseCurriculumGrade] emcc WITH ( NOLOCK )
							LEFT JOIN [EvaluationMatrixCourse] emc WITH (NOLOCK) ON emc.id = emcc.EvaluationMatrixCourse_Id
							LEFT JOIN [EvaluationMatrix] em WITH ( NOLOCK ) ON em.Id = emc.EvaluationMatrix_Id
							LEFT JOIN [Discipline] d WITH ( NOLOCK ) ON d.Id = em.Discipline_Id
							LEFT JOIN [ModelEvaluationMatrix] mem WITH ( NOLOCK ) ON mem.Id = em.ModelEvaluationMatrix_Id
                  WHERE     emcc.state = 1
                            AND emc.state = 1
                            AND em.state = 1
                            AND mem.state = 1
                            AND mem.entityId = @EntityId
							AND (@typeLevelEducation IS NULL OR d.TypeLevelEducationId = @typeLevelEducation)
                  GROUP BY  emcc.TypeCurriculumGradeId
                ) Tabela
        GROUP BY Id


    END
GO
PRINT N'Creating [dbo].[MS_Item_ReportItemLevel]...';


GO
-- =============================================
-- Author:		<Leticia Martin Corral>
-- Create date: <14/10/2014>
-- Description:	<Retorna total de questões de cada grau de dificuldade>
-- =============================================
CREATE PROCEDURE [dbo].[MS_Item_ReportItemLevel]
    @disciplina INT ,
    @situacao INT ,
    @EntityId UNIQUEIDENTIFIER ,
	@typeLevelEducation INT ,
    @total DECIMAL = NULL
AS 
    BEGIN
        SELECT  @total = COUNT(item.Id)
        FROM   [ItemLevel] itlevel WITH ( NOLOCK )
                LEFT JOIN [Item] item WITH ( NOLOCK ) ON itlevel.id = ItemLevel_id AND item.LastVersion = 1
                LEFT JOIN [EvaluationMatrix] em WITH ( NOLOCK ) ON em.Id = item.EvaluationMatrix_Id
                LEFT JOIN [ModelEvaluationMatrix] mem WITH ( NOLOCK ) ON mem.Id = em.ModelEvaluationMatrix_Id
                LEFT JOIN [Discipline] d WITH ( NOLOCK ) ON d.Id = em.Discipline_Id
                LEFT JOIN [ItemSituation] its WITH ( NOLOCK ) ON its.Id = item.ItemSituation_Id
        WHERE    ( @disciplina IS NULL
                              OR d.id = @disciplina
                            )
                            AND its.Id = @situacao
                            AND mem.EntityId = @EntityId
							AND (@typeLevelEducation IS NULL OR d.TypeLevelEducationId = @typeLevelEducation)
                            AND itlevel.state = 1
                            AND item.state = 1
                            AND em.State = 1
                            AND d.State = 1
                            AND mem.State = 1
                            AND its.State = 1

        SELECT  description ,
                SUM(total) AS Total
        FROM    ( SELECT    itlevel.Description AS Description ,
                            CAST( COUNT(item.ItemLevel_id) / @total * 100 AS DECIMAL(18, 2)) AS Total
                  FROM      [ItemLevel] itlevel WITH ( NOLOCK )
                            LEFT JOIN [Item] item WITH ( NOLOCK ) ON itlevel.id = ItemLevel_id AND item.LastVersion = 1
                            LEFT JOIN [EvaluationMatrix] em WITH ( NOLOCK ) ON em.Id = item.EvaluationMatrix_Id
                            LEFT JOIN [Discipline] d WITH ( NOLOCK ) ON d.Id = em.Discipline_Id
                            LEFT JOIN [ModelEvaluationMatrix] mem WITH ( NOLOCK ) ON mem.Id = em.ModelEvaluationMatrix_Id
                            LEFT JOIN [ItemSituation] its WITH ( NOLOCK ) ON its.Id = item.ItemSituation_Id
                  WHERE     ( @disciplina IS NULL
                              OR d.id = @disciplina
                            )
                            AND its.Id = @situacao
                            AND mem.EntityId = @EntityId
							AND (@typeLevelEducation IS NULL OR d.TypeLevelEducationId = @typeLevelEducation)
                            AND itlevel.state = 1
                            AND item.state = 1
                            AND em.State = 1
                            AND d.State = 1
                            AND mem.State = 1
                            AND its.State = 1
                  GROUP BY  itlevel.Description
                  UNION
                  SELECT    description ,
                            0
                  FROM      [ItemLevel] itlevel WITH ( NOLOCK )
				  WHERE state = 1  
				  AND EntityId = @EntityId
                ) Tabela
        GROUP BY description

    END
GO
PRINT N'Creating [dbo].[MS_Item_ReportItemSituation]...';


GO
-- =============================================
-- Author:		<Leticia Martin Corral>
-- Create date: <14/10/2014>
-- Description:	<retorna quantidade de itens conforme sua situação>
-- =============================================
CREATE PROCEDURE [dbo].[MS_Item_ReportItemSituation]
    @disciplina INT ,
    @inicio VARCHAR(10) ,
    @fim VARCHAR(10) ,
    @EntityId UNIQUEIDENTIFIER ,
	@typeLevelEducation INT
AS 
    BEGIN

-- codigo 103 para converter data yyyy-mm-dd
              
        SELECT  description ,
			SUM(total) AS Total
	FROM    ( SELECT    its.Description AS Description ,
						COUNT(item.id) AS Total
			  FROM      [ItemSituation] its WITH ( NOLOCK )
						LEFT JOIN [Item] item WITH ( NOLOCK ) ON item.ItemSituation_Id = its.id AND item.LastVersion = 1
						LEFT JOIN [EvaluationMatrix] em WITH ( NOLOCK ) ON em.Id = item.EvaluationMatrix_Id
						LEFT JOIN [Discipline] d WITH ( NOLOCK ) ON d.Id = em.Discipline_Id
						LEFT JOIN [ModelEvaluationMatrix] mem WITH ( NOLOCK ) ON mem.Id = em.ModelEvaluationMatrix_Id
			  WHERE     ( @disciplina IS NULL
						  OR d.id = @disciplina
						)
						AND (@inicio IS NULL AND @fim IS NULL 
						OR @inicio IS NOT NULL AND @fim IS NULL AND CAST(item.CreateDate AS DATE) >= @inicio
						OR @inicio IS NULL AND @fim IS NOT NULL AND CAST(item.CreateDate AS DATE)<= @fim
						OR @inicio IS NOT NULL AND @fim IS NOT NULL AND CAST(item.CreateDate AS DATE) 
						BETWEEN  CONVERT(DATE, @inicio) AND CONVERT(DATE, @fim)
						)
						AND its.state = 1
						AND item.state = 1
						AND em.State = 1
						AND d.State = 1
						AND mem.State = 1
						AND mem.entityId = @EntityId
						AND (@typeLevelEducation IS NULL OR d.TypeLevelEducationId = @typeLevelEducation)
			  GROUP BY  its.Description
			  UNION
			  SELECT    description ,
						0
			  FROM      [ItemSituation] its WITH ( NOLOCK )
			  WHERE state = 1  
			  AND EntityId = @EntityId  
			) Tabela
	GROUP BY description

    END
GO
PRINT N'Creating [dbo].[MS_Item_ReportItemSkill]...';


GO
-- =============================================
-- Author:		<Leticia Martin Corral>
-- Create date: <22/10/2014>
-- Description:	<retorna lista de ultimos níveis da skill>
-- =============================================
CREATE PROCEDURE [dbo].[MS_Item_ReportItemSkill]
    @disciplina INT ,
    @skill INT ,
    @EntityId UNIQUEIDENTIFIER ,
	@typeLevelEducation INT
AS 
    BEGIN
        SELECT  
					mem.Description AS ModelDescription, s.Description, s.Code as Code, COUNT (its.Item_Id) AS Total
        FROM [Skill] s WITH ( NOLOCK )
					INNER JOIN [ItemSkill] its WITH (NOLOCK) ON its.Skill_Id = s.id AND s.LastLevel = 1
					INNER JOIN [Item] item WITH ( NOLOCK ) ON item.Id = its.Item_Id AND item.LastVersion = 1
					INNER JOIN [EvaluationMatrix] em WITH ( NOLOCK ) ON em.Id = item.EvaluationMatrix_Id
					INNER JOIN [ModelEvaluationMatrix] mem WITH ( NOLOCK ) ON mem.Id = em.ModelEvaluationMatrix_Id
					INNER JOIN [Discipline] d WITH ( NOLOCK ) ON d.Id = em.Discipline_Id
        WHERE ( @disciplina IS NULL
                          OR d.id = @disciplina
                        )
					AND mem.EntityId = @EntityId
					AND s.Parent_Id = @skill
					AND (@typeLevelEducation IS NULL OR d.TypeLevelEducationId = @typeLevelEducation)
					AND s.state = 1
					AND item.state = 1
					AND em.State = 1
					AND mem.State = 1
					AND d.State = 1
					AND its.State = 1
        GROUP BY s.Description, mem.Description, s.Code
    END
GO
PRINT N'Creating [dbo].[MS_Item_ReportItemSkillOneLevel]...';


GO
-- =============================================
-- Author:		
-- Create date: 
-- Description:	<retorna lista de ultimo níveis da matriz de 1 nível>
-- =============================================
CREATE PROCEDURE [dbo].[MS_Item_ReportItemSkillOneLevel]
    @disciplina INT ,
    @MatrizId INT ,
    @EntityId UNIQUEIDENTIFIER ,
	@typeLevelEducation INT
AS 
    BEGIN
        SELECT  
					mem.Description AS ModelDescription, s.Description, s.Code as Code, COUNT (its.Item_Id) AS Total
        FROM [Skill] s WITH ( NOLOCK )
					INNER JOIN [ItemSkill] its WITH (NOLOCK) ON its.Skill_Id = s.id --AND s.LastLevel = 1
					INNER JOIN [Item] item WITH ( NOLOCK ) ON item.Id = its.Item_Id AND item.LastVersion = 1
					INNER JOIN [EvaluationMatrix] em WITH ( NOLOCK ) ON em.Id = item.EvaluationMatrix_Id
					INNER JOIN [ModelEvaluationMatrix] mem WITH ( NOLOCK ) ON mem.Id = em.ModelEvaluationMatrix_Id
					INNER JOIN [Discipline] d WITH ( NOLOCK ) ON d.Id = em.Discipline_Id
        WHERE ( @disciplina IS NULL
                          OR d.id = @disciplina
                        )
					AND mem.EntityId = @EntityId
					AND em.Id = @MatrizId
					AND (@typeLevelEducation IS NULL OR d.TypeLevelEducationId = @typeLevelEducation)
					AND s.state = 1
					AND item.state = 1
					AND em.State = 1
					AND mem.State = 1
					AND d.State = 1
					AND its.State = 1
        GROUP BY s.Description, mem.Description, s.Code
    END
GO
PRINT N'Creating [dbo].[MS_Item_ReportItemType]...';


GO
-- =============================================
-- Author:		<Leticia Martin Corral>
-- Create date: <13/10/2014>
-- Description:	<Retorna dados para o relatorio de tipos de questão>
-- =============================================
CREATE PROCEDURE [dbo].[MS_Item_ReportItemType]
    @disciplina INT ,
    @situacao INT ,
    @EntityId UNIQUEIDENTIFIER ,
	@typeLevelEducation INT
AS 
    BEGIN

        SELECT  description ,
                SUM(total) AS Total
        FROM    ( SELECT    it.Description AS Description ,
                            COUNT(item.Id) AS Total
                  FROM      [ItemType] it WITH ( NOLOCK )
                            INNER JOIN [Item] item WITH ( NOLOCK ) ON it.Id = item.ItemType_Id AND item.LastVersion = 1
                            INNER JOIN [EvaluationMatrix] em WITH ( NOLOCK ) ON em.Id = item.EvaluationMatrix_Id
                            INNER JOIN [Discipline] d WITH ( NOLOCK ) ON d.Id = em.Discipline_Id
                            LEFT JOIN [ModelEvaluationMatrix] mem WITH ( NOLOCK ) ON mem.Id = em.ModelEvaluationMatrix_Id
                            LEFT JOIN [ItemSituation] its WITH ( NOLOCK ) ON its.Id = item.ItemSituation_Id
                  WHERE     ( @disciplina IS NULL
                              OR d.id = @disciplina
                            )
                            AND its.Id = @situacao
                            AND mem.EntityId = @EntityId
							AND (@typeLevelEducation IS NULL OR d.TypeLevelEducationId = @typeLevelEducation)
                            AND it.State = 1
                            AND item.State = 1
                            AND em.State = 1
                            AND d.State = 1
                            AND mem.State = 1
                            AND its.State = 1
                  GROUP BY  it.description
                  UNION
                  SELECT    description ,
                            0
                  FROM      [ItemType] it WITH ( NOLOCK )
                  WHERE state = 1  
                  AND EntityId = @EntityId  
                ) Tabela
        GROUP BY description

    END
GO
PRINT N'Creating [dbo].[MS_Item_SearchFiltered]...';


GO



-- =============================================
-- Author:		Leticia Goes
-- Create date: 16/10/2014
-- Description:	Busca o banco de itens
-- =============================================
-- =============================================
-- Alter by:		Marcelo Franco
-- Date: 01/04/2015
-- Description:	Melhora performance e correção na busca de itens versionados
-- =============================================
-- =============================================
-- Alter by:		Gabriel Moreli
-- Date: 01/11/2016
-- Description:	Campo ItemCode foi alterado de INT para VARCHAR,
--				sendo assim necessário a modificação da consulta
-- =============================================
CREATE PROCEDURE [dbo].[MS_Item_SearchFiltered]
    @ItemCode VARCHAR(32),
	@Revoked BIT,
    @ItemSituation VARCHAR(MAX),	
    @ShowVersion BIT,
    @ProficiencyStart INT,
    @ProficiencyEnd INT,
    @Keywords VARCHAR(MAX),
    @DisciplineId BIGINT, 
    @EvaluationMatrixId BIGINT,
    @ShowItemNarrated BIT,
    @Skills VARCHAR(MAX),
    @TypeCurriculumGrades VARCHAR(MAX),
    @pageSize INT,
    @pageNumber INT,
    @totalRecords INT OUTPUT
AS 
    BEGIN
    
    IF OBJECT_ID('tempdb..#tmp') > 0 DROP TABLE #tmp

    SELECT  ItemId,
			ItemCode, 
			Revoked,
			ItemVersion, 
			BaseTextDescription, 
			Statement,
			MatrixDescription, 
			DescriptorSentence,
			BaseTextId,
			MatrixId,
			LastVersion,
			ItemNarrated,
			Discipline_Id AS DisciplineId,
			DisciplineDescription,
			ROW_NUMBER() OVER ( ORDER BY ItemCode, ItemVersion) AS RowNumber
	INTO #tmp
	FROM    (
							SELECT  i.Id AS ItemId,
									i.ItemCode, 
									i.Revoked,
									i.ItemVersion, 
									bt.Description AS BaseTextDescription, 
									i.Statement,
									em.Description AS MatrixDescription, 
									i.descriptorSentence AS DescriptorSentence,
									bt.Id AS BaseTextId,
									em.Id AS MatrixId,
									i.ItemSituation_Id,
									i.proficiency,
									i.LastVersion,
									i.Keywords,
									em.Discipline_Id,
									d.Description AS DisciplineDescription,
									i.EvaluationMatrix_Id,
									ik.Skill_Id,
									icg.TypeCurriculumGradeId,
									i.ItemNarrated,
									ROW_NUMBER() OVER ( PARTITION BY i.Id ORDER BY i.Id ) AS RowNumber2
							FROM    Item i WITH ( NOLOCK )
									LEFT JOIN BaseText bt WITH ( NOLOCK ) ON bt.Id = i.BaseText_Id AND bt.State = 1
									INNER JOIN ItemSkill ik WITH ( NOLOCK ) ON ik.Item_Id = i.Id 
									INNER JOIN ItemCurriculumGrade icg WITH ( NOLOCK ) ON icg.Item_Id = i.Id
									INNER JOIN EvaluationMatrix em WITH ( NOLOCK ) ON em.Id = i.EvaluationMatrix_Id
									LEFT JOIN Discipline d WITH ( NOLOCK) ON d.Id = em.Discipline_Id
							WHERE   i.State = 1 AND em.State = 1 AND ik.State = 1 AND  icg.State = 1
							AND (@ItemCode IS NULL OR @ItemCode IS NOT NULL AND UPPER(LTRIM(RTRIM(i.ItemCode))) = UPPER(LTRIM(RTRIM(@ItemCode))))
							AND ((@Revoked IS NULL OR @Revoked = 0 )OR @Revoked IS NOT NULL AND i.Revoked = @Revoked)
							AND (@ItemSituation IS NULL OR @ItemSituation IS NOT NULL AND ItemSituation_Id IN (SELECT Items FROM dbo.SplitString(@ItemSituation,',')))
							AND (@ProficiencyStart IS NULL AND @ProficiencyEnd IS NULL 
							OR @ProficiencyStart IS NOT NULL AND @ProficiencyEnd IS NULL AND proficiency >= @ProficiencyStart
							OR @ProficiencyStart IS NULL AND @ProficiencyEnd IS NOT NULL AND proficiency <= @ProficiencyEnd
							OR @ProficiencyStart IS NOT NULL AND @ProficiencyEnd IS NOT NULL AND proficiency BETWEEN @ProficiencyStart AND @ProficiencyEnd)
							AND (@ShowVersion = 1 OR @ShowVersion IS NOT NULL AND @ShowVersion = 0 AND LastVersion = 1)
							AND (@ShowItemNarrated = 0 OR @ShowItemNarrated IS NOT NULL AND @ShowItemNarrated = 1 AND i.ItemNarrated = 1)
							AND (@Keywords IS NULL OR (@Keywords IS NOT NULL AND EXISTS (SELECT SI.Items FROM dbo.SplitString(Keywords,';') SI INNER JOIN dbo.SplitString(@Keywords,',') I ON SI.Items = I.Items)))
							AND (@DisciplineId IS NULL OR @DisciplineId IS NOT NULL AND Discipline_Id = @DisciplineId)
							AND (@EvaluationMatrixId IS NULL OR @EvaluationMatrixId IS NOT NULL AND EvaluationMatrix_Id = @EvaluationMatrixId)
							AND (@TypeCurriculumGrades IS NULL OR @TypeCurriculumGrades IS NOT NULL AND TypeCurriculumGradeId IN (SELECT Items FROM dbo.SplitString(@TypeCurriculumGrades,',')))
							AND (@Skills IS NULL OR Skill_Id IN (SELECT Items FROM dbo.SplitString(@Skills,',')))
					) as R
	WHERE @Skills IS NOT NULL OR (@Skills IS NULL AND RowNumber2 = 1)
	ORDER BY ItemCode, ItemVersion

	SELECT @totalRecords = COUNT(ItemId) from #tmp
		
	SELECT TOP (@pageSize) ItemId, ItemCode, Revoked, ItemVersion, BaseTextDescription, Statement, MatrixDescription, DescriptorSentence, BaseTextId, MatrixId,  LastVersion, ItemNarrated, DisciplineId, DisciplineDescription, RowNumber
	FROM #tmp
	WHERE   RowNumber > ( @pageSize * ( @pageNumber ) )
	ORDER BY RowNumber
	
    END
GO
PRINT N'Creating [dbo].[MS_Test_SearchFiltered]...';


GO

-- =============================================
-- Author:		Guilherme Mendonça
-- Create date: 27/05/2015
-- Description:	Retorna informações da prova de acordo com os filtros
-- =============================================
CREATE PROCEDURE [dbo].[MS_Test_SearchFiltered] 
	@TestId BIGINT = NULL,
	@TestType BIGINT = NULL,
	@DisciplineId BIGINT = NULL,
	@CreationDateStart DATETIME = NULL,
	@CreationDateEnd DATETIME = NULL,
	@Pendente BIT = NULL,
	@Cadastrada BIT = NULL,
	@Andamento BIT = NULL,
	@Aplicada BIT = NULL,
	@global BIT = NULL,
	@pageSize INT,
    @pageNumber INT,
	@uad_id UNIQUEIDENTIFIER = NULL,
	@esc_id INT = NULL,
	@ttn_id INT = NULL,
	@tne_id INT = NULL,
	@crp_ordem INT = NULL,
	@typeEntity TINYINT,
	@visible BIT = NULL,
	@testFrequencyApplication INT = NULL
AS
BEGIN
	
	IF OBJECT_ID('tempdb..#tmp') > 0 DROP TABLE #tmp
	IF OBJECT_ID('tempdb..#tmpTestes') > 0 DROP TABLE #tmpTestes

	CREATE TABLE #tmpTestes (
	[Id] [bigint] NOT NULL,
	[Description] [varchar](60) NOT NULL,
	[Bib] [bit] NOT NULL,
	[NumberItemsBlock] [int] NOT NULL,
	[NumberBlock] [int] NOT NULL,
	[NumberItem] [int] NULL,
	[ApplicationStartDate] [datetime] NOT NULL,
	[ApplicationEndDate] [datetime] NOT NULL,
	[CorrectionStartDate] [datetime] NOT NULL,
	[CorrectionEndDate] [datetime] NOT NULL,
	[UsuId] [uniqueidentifier] NOT NULL,
	[TestSituation] [int] NOT NULL,
	[AllAdhered] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[State] [tinyint] NOT NULL,
	[Discipline_Id] [bigint] NULL,
	[FormatType_Id] [bigint] NULL,
	[TestType_Id] [bigint] NOT NULL,
	[Visible] [bit] NOT NULL,
	[TestFrequencyApplication] [int] NOT NULL,
	[TestTypeDescription] [varchar](500) NOT NULL,
	[ItemType_Id] [bigint] NULL,
	[Global] [bit] NOT NULL,
	[TestTypeFrequencyApplication] [int] NOT NULL)

	IF(@global = 1 OR (@global = 0 AND @uad_id IS NULL) OR @global IS NULL)
	BEGIN
		INSERT INTO #tmpTestes
		SELECT t.Id,t.Description,t.Bib,t.NumberItemsBlock,t.NumberBlock,t.NumberItem,t.ApplicationStartDate,t.ApplicationEndDate,t.CorrectionStartDate,t.CorrectionEndDate,t.UsuId,
		t.TestSituation,t.AllAdhered,t.CreateDate,t.UpdateDate,t.State,t.Discipline_Id,t.FormatType_Id,t.TestType_Id, t.Visible, t.FrequencyApplication AS TestFrequencyApplication ,
		tt.Description AS TestTypeDescription, tt.ItemType_Id, tt.[Global], tt.FrequencyApplication AS TestTypeFrequencyApplication 		
		FROM Test t
		INNER JOIN TestType tt ON tt.Id = t.TestType_Id
		WHERE t.State = 1 AND tt.State = 1 AND tt.Global = ISNULL(@global, tt.Global) AND t.Id = ISNULL(@TestId, t.Id)
	END

	ELSE
	BEGIN
		INSERT INTO #tmpTestes
		SELECT t.Id,t.Description,t.Bib,t.NumberItemsBlock,t.NumberBlock,t.NumberItem,t.ApplicationStartDate,t.ApplicationEndDate,t.CorrectionStartDate,t.CorrectionEndDate,t.UsuId,
		t.TestSituation,t.AllAdhered,t.CreateDate,t.UpdateDate,t.State,t.Discipline_Id,t.FormatType_Id,t.TestType_Id, t.TestTypeDescription, t.Visible, t.FrequencyApplication AS TestFrequencyApplication, 
		tt.ItemType_Id, tt.[Global], tt.FrequencyApplication AS TestTypeFrequencyApplication 	
		FROM GetTestAdhered(@typeEntity, @uad_id, @esc_id, @ttn_id, @tne_id, @crp_ordem) AS t		
		INNER JOIN TestType tt ON tt.Id = t.TestType_Id
	END

	SELECT  TestId,
			UsuId,
			TestDescription, 
			TestTypeDescription,
			[Global], 
			ItemType_Id,
			CreateDate, 
			TestCreateDate,
			Discipline,
			TestFrequencyApplication, 
			TestTypeFrequencyApplication,
			ApplicationStartDate,
			ApplicationEndDate,
			CorrectionStartDate,
			CorrectionEndDate,
			Bib,
			Desempenho,
			TestSituation,
			Visible,
			ROW_NUMBER() OVER ( ORDER BY TestCreateDate DESC, TestTypeDescription ASC, TestDescription ASC) AS RowNumber
	INTO #tmp
	FROM    (
	
			 SELECT t.Id AS TestId,
					t.UsuId AS UsuId,
					t.Description AS TestDescription,
					t.TestTypeDescription,
					t.[Global],
					t.ItemType_Id,
					CONVERT(VARCHAR(50), t.CreateDate, 103) AS CreateDate,
					t.CreateDate AS TestCreateDate,
					d.Description AS Discipline,
					t.TestFrequencyApplication,
					t.TestTypeFrequencyApplication,
					t.Visible,
					CONVERT(VARCHAR(50), t.ApplicationStartDate, 103) AS ApplicationStartDate,
					CONVERT(VARCHAR(50), t.ApplicationEndDate, 103) AS ApplicationEndDate,
					CONVERT(VARCHAR(50), t.CorrectionStartDate, 103) AS CorrectionStartDate,
					CONVERT(VARCHAR(50), t.CorrectionEndDate, 103) AS CorrectionEndDate,
					t.Bib,
					CONVERT(Bit,(CASE WHEN COUNT(tpl.Id) > 0 THEN 1 ELSE 0 END)) AS Desempenho,
					(CASE
						WHEN t.TestSituation = 1 THEN 1
						WHEN t.TestSituation = 2 AND CAST(GETDATE() AS Date) < t.ApplicationStartDate THEN 2 
						WHEN t.TestSituation = 2 AND CAST(GETDATE() AS Date) BETWEEN t.ApplicationStartDate AND t.ApplicationEndDate THEN 3
						WHEN t.TestSituation = 2 AND CAST(GETDATE() AS Date) > t.ApplicationEndDate THEN 4
					 END) AS TestSituation
			 FROM #tmpTestes t WITH(NOLOCK)
				  INNER JOIN Discipline d WITH(NOLOCK) ON d.Id = t.Discipline_Id 
				  LEFT JOIN TestPerformanceLevel tpl WITH(NOLOCK) ON tpl.Test_Id = t.Id AND tpl.State = 1
			 WHERE  d.State = 1
			 AND t.Id = ISNULL(@TestId, t.Id)
			 AND t.TestType_Id = ISNULL(@TestType, t.TestType_Id)
			 AND t.Discipline_Id = ISNULL(@DisciplineId, t.Discipline_Id)
			 AND t.TestFrequencyApplication = ISNULL(@testFrequencyApplication, t.TestFrequencyApplication)
			 AND (@CreationDateStart IS NULL AND @CreationDateEnd IS NULL 
				 OR (@CreationDateStart IS NOT NULL AND @CreationDateEnd IS NULL AND CAST(t.CreateDate AS Date) >= CAST(@CreationDateStart AS Date))
				 OR (@CreationDateStart IS NULL AND @CreationDateEnd IS NOT NULL AND CAST(t.CreateDate AS Date) <= CAST(@CreationDateEnd AS Date))
				 OR (@CreationDateStart IS NOT NULL AND @CreationDateEnd IS NOT NULL AND CAST(t.CreateDate AS Date)  BETWEEN CAST(@CreationDateStart AS Date) AND CAST(@CreationDateEnd AS Date))
			 )
			 AND (@Pendente IS NULL AND @Cadastrada IS NULL AND @Andamento IS NULL AND @Aplicada IS NULL
				 OR (@Pendente IS NOT NULL AND t.TestSituation = 1)
				 OR (@Cadastrada IS NOT NULL AND (t.TestSituation = 2 AND CAST(GETDATE() AS Date) < CAST(t.ApplicationStartDate AS Date)))
				 OR (@Andamento IS NOT NULL AND (t.TestSituation = 2 AND CAST(GETDATE() AS Date) BETWEEN CAST(t.ApplicationStartDate AS Date) AND CAST(t.ApplicationEndDate AS Date)))
				 OR (@Aplicada IS NOT NULL AND (t.TestSituation = 2 AND CAST(GETDATE() AS Date) > CAST(t.ApplicationEndDate AS Date)))
			 )
			 AND t.Visible = ISNULL(@visible, t.Visible)
			 GROUP BY t.Id,
					  t.UsuId,
					  t.Description,
					  t.TestTypeDescription,
					  t.[Global],
					  t.ItemType_Id,
					  t.CreateDate,
					  d.Description,
					  t.TestFrequencyApplication,
					  t.TestTypeFrequencyApplication,
					  t.ApplicationStartDate,
					  t.ApplicationEndDate,
					  t.CorrectionStartDate,
					  t.CorrectionEndDate,
					  t.Bib,
					  t.TestSituation,
					  t.Visible
			) AS R
	ORDER BY TestCreateDate DESC, TestTypeDescription ASC, TestDescription ASC

	

		
	SELECT TOP (@pageSize) TestId, UsuId, TestDescription, TestTypeDescription, [Global], ItemType_Id, CreateDate, Discipline, TestFrequencyApplication,
					TestTypeFrequencyApplication, ApplicationStartDate, ApplicationEndDate, CorrectionStartDate, CorrectionEndDate, Bib, Visible, Desempenho, TestSituation, RowNumber
	FROM #tmp
	WHERE   RowNumber > ( @pageSize * ( @pageNumber ) )
	ORDER BY RowNumber
	 
	SELECT COUNT(TestId) from #tmp
	 
END
GO
PRINT N'Creating [dbo].[MS_Test_SearchFilteredUser]...';


GO

-- =============================================
-- Author:		Guilherme Mendonça
-- Create date: 27/05/2015
-- Description:	Retorna informações da prova de acordo com os filtros
-- =============================================
CREATE PROCEDURE [dbo].[MS_Test_SearchFilteredUser] 
	@TestId BIGINT = NUll,
	@TestType BIGINT = NUll,
	@DisciplineId BIGINT = NUll,
	@Bimester INT = NUll,
	@CreationDateStart DATETIME = NULL,
	@CreationDateEnd DATETIME = NULL,
	@Pendente BIT = NUll,
	@Cadastrada BIT = NUll,
	@Andamento BIT = NUll,
	@Aplicada BIT = NUll,
	@global BIT = NULL,
	@pageSize INT = NUll,
    @pageNumber INT,
	@ent_id UNIQUEIDENTIFIER,
	@pes_id UNIQUEIDENTIFIER,
	@usuId UNIQUEIDENTIFIER,
	@state TINYINT,
	@typeEntity TINYINT,
	@typeSelected TINYINT,
	@typeNotSelected TINYINT,
	@gru_id UNIQUEIDENTIFIER,
	@vis_id INT,
	@uad_id UNIQUEIDENTIFIER = NULL,
	@esc_id INT = NULL,
	@ttn_id INT = NULL,
	@tne_id INT = NULL,
	@crp_ordem INT = NULL,
	@testFrequencyApplication INT = NULL
AS
BEGIN
	
	IF OBJECT_ID('tempdb..#tmp') > 0 DROP TABLE #tmp
	
	SELECT  TestId,
			UsuId,
			TestDescription, 
			TestTypeDescription, 
			[Global],
			ItemType_Id,
			CreateDate, 
			TestCreateDate,
			Discipline,
			TestFrequencyApplication,
			TestTypeFrequencyApplication, 
			ApplicationStartDate,
			ApplicationEndDate,
			CorrectionStartDate,
			CorrectionEndDate,
			Bib,
			Desempenho,
			TestSituation,
			Visible,
			ROW_NUMBER() OVER ( ORDER BY TestCreateDate DESC, TestTypeDescription ASC, TestDescription ASC) AS RowNumber
	INTO #tmp
	FROM    (
	
			 SELECT t.Id AS TestId,
					t.UsuId AS UsuId,
					t.Description AS TestDescription,
					tt.Description AS TestTypeDescription,
					tt.[Global],
					tt.ItemType_Id,
					CONVERT(VARCHAR(50), t.CreateDate, 103) AS CreateDate,
					t.CreateDate AS TestCreateDate,
					d.Description AS Discipline,
					t.FrequencyApplication AS TestFrequencyApplication,
					tt.FrequencyApplication AS TestTypeFrequencyApplication,
					CONVERT(VARCHAR(50), t.ApplicationStartDate, 103) AS ApplicationStartDate,
					CONVERT(VARCHAR(50), t.ApplicationEndDate, 103) AS ApplicationEndDate,
					CONVERT(VARCHAR(50), t.CorrectionStartDate, 103) AS CorrectionStartDate,
					CONVERT(VARCHAR(50), t.CorrectionEndDate, 103) AS CorrectionEndDate,
					t.Bib,
					t.Visible,
					CONVERT(Bit,(CASE WHEN COUNT(tpl.Id) > 0 THEN 1 ELSE 0 END)) AS Desempenho,
					(CASE
						WHEN t.TestSituation = 1 THEN 1
						WHEN t.TestSituation = 2 AND CAST(GETDATE() AS Date) < t.ApplicationStartDate THEN 2 
						WHEN t.TestSituation = 2 AND CAST(GETDATE() AS Date) BETWEEN t.ApplicationStartDate AND t.ApplicationEndDate THEN 3
						WHEN t.TestSituation = 2 AND CAST(GETDATE() AS Date) > t.ApplicationEndDate THEN 4
					 END) AS TestSituation
			 FROM Test t WITH(NOLOCK)
				  INNER JOIN TestType tt WITH(NOLOCK) ON tt.Id = t.TestType_Id 
				  INNER JOIN Discipline d WITH(NOLOCK) ON d.Id = t.Discipline_Id 
				  INNER JOIN TestsByUser(@usuId, @pes_id, @ent_id, @state, @typeEntity, @typeSelected, @typeNotSelected, @gru_id, @vis_id, @uad_id, @esc_id, @ttn_id, @tne_id, @crp_ordem) teacher ON t.Id = teacher.Id
				  LEFT JOIN TestPerformanceLevel tpl WITH(NOLOCK) ON tpl.Test_Id = t.Id AND tpl.State = @state
			 WHERE t.State = @state AND tt.State = @state AND d.State = @state
			 AND t.Id = ISNULL(@TestId, t.Id)
			 AND t.TestType_Id = ISNULL(@TestType, t.TestType_Id)
			 AND t.Discipline_Id = ISNULL(@DisciplineId, t.Discipline_Id)
			 AND t.FrequencyApplication = ISNULL(@testFrequencyApplication, t.FrequencyApplication)
			 AND (@CreationDateStart IS NULL AND @CreationDateEnd IS NULL 
				 OR (@CreationDateStart IS NOT NULL AND @CreationDateEnd IS NULL AND CAST(t.CreateDate AS Date) >= CAST(@CreationDateStart AS Date))
				 OR (@CreationDateStart IS NULL AND @CreationDateEnd IS NOT NULL AND CAST(t.CreateDate AS Date) <= CAST(@CreationDateEnd AS Date))
				 OR (@CreationDateStart IS NOT NULL AND @CreationDateEnd IS NOT NULL AND CAST(t.CreateDate AS Date)  BETWEEN CAST(@CreationDateStart AS Date) AND CAST(@CreationDateEnd AS Date))
			 )
			 AND (@Pendente IS NULL AND @Cadastrada IS NULL AND @Andamento IS NULL AND @Aplicada IS NULL
				 OR (@Pendente IS NOT NULL AND t.TestSituation = 1)
				 OR (@Cadastrada IS NOT NULL AND (t.TestSituation = 2 AND CAST(GETDATE() AS Date) < CAST(t.ApplicationStartDate AS Date)))
				 OR (@Andamento IS NOT NULL AND (t.TestSituation = 2 AND CAST(GETDATE() AS Date) BETWEEN CAST(t.ApplicationStartDate AS Date) AND CAST(t.ApplicationEndDate AS Date)))
				 OR (@Aplicada IS NOT NULL AND (t.TestSituation = 2 AND CAST(GETDATE() AS Date) > CAST(t.ApplicationEndDate AS Date)))
			 )
			 AND tt.[Global] = ISNULL(@global, tt.[Global])
			 AND t.Visible = 1
			 GROUP BY t.Id,
					  t.UsuId,
					  t.Description,
					  tt.Description,
					  tt.[Global],
					  tt.ItemType_Id,
					  t.CreateDate,
					  d.Description,
					  t.FrequencyApplication,
					  tt.FrequencyApplication,
					  t.ApplicationStartDate,
					  t.ApplicationEndDate,
					  t.CorrectionStartDate,
					  t.CorrectionEndDate,
					  t.Bib,
					  t.TestSituation,
					  t.Visible
			) AS R
	ORDER BY TestCreateDate DESC, TestTypeDescription ASC, TestDescription ASC


		
	SELECT TOP (@pageSize) TestId, UsuId, TestDescription, TestTypeDescription, [Global], ItemType_Id, CreateDate, Discipline, TestFrequencyApplication,
					TestTypeFrequencyApplication, ApplicationStartDate, ApplicationEndDate, CorrectionStartDate, CorrectionEndDate, Bib, Visible, Desempenho, TestSituation, RowNumber
	FROM #tmp
	WHERE   RowNumber > ( @pageSize * ( @pageNumber ) )
	ORDER BY RowNumber
	 
	SELECT COUNT(TestId) from #tmp
	 
END
GO
PRINT N'Checking existing data against newly created constraints';



GO
ALTER TABLE [dbo].[Adherence] WITH CHECK CHECK CONSTRAINT [FK_dbo.Adherence_dbo.Test_Test_Id];

ALTER TABLE [dbo].[Alternative] WITH CHECK CHECK CONSTRAINT [FK_dbo.Alternative_dbo.Item_Item_Id];

ALTER TABLE [dbo].[AnswerSheetBatch] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetBatch_dbo.Test_Test_Id];

ALTER TABLE [dbo].[AnswerSheetBatchFiles] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetBatchFiles_dbo.AnswerSheetBatch_AnswerSheetBatch_Id];

ALTER TABLE [dbo].[AnswerSheetBatchFiles] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetBatchFiles_dbo.AnswerSheetBatchQueue_AnswerSheetBatchQueue_Id];

ALTER TABLE [dbo].[AnswerSheetBatchFiles] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetBatchFiles_dbo.File_File_Id];

ALTER TABLE [dbo].[AnswerSheetBatchLog] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetBatchLog_dbo.AnswerSheetBatchFiles_AnswerSheetBatchFile_Id];

ALTER TABLE [dbo].[AnswerSheetBatchLog] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetBatchLog_dbo.File_File_Id];

ALTER TABLE [dbo].[AnswerSheetBatchQueue] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetBatchQueue_dbo.AnswerSheetBatch_AnswerSheetBatch_Id];

ALTER TABLE [dbo].[AnswerSheetBatchQueue] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetBatchQueue_dbo.File_File_Id];

ALTER TABLE [dbo].[AnswerSheetLot] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetLot_dbo.Test_Test_Id];

ALTER TABLE [dbo].[AnswerSheetLot] WITH CHECK CHECK CONSTRAINT [FK_dbo.AnswerSheetLot_dbo.AnswerSheetLot_Parent_Id];

ALTER TABLE [dbo].[Block] WITH CHECK CHECK CONSTRAINT [FK_dbo.Block_dbo.Booklet_Booklet_Id];

ALTER TABLE [dbo].[Block] WITH CHECK CHECK CONSTRAINT [FK_dbo.Block_dbo.Test_Test_Id];

ALTER TABLE [dbo].[BlockItem] WITH CHECK CHECK CONSTRAINT [FK_dbo.BlockItem_dbo.Item_Item_Id];

ALTER TABLE [dbo].[BlockItem] WITH CHECK CHECK CONSTRAINT [FK_dbo.BlockItem_dbo.Block_Block_Id];

ALTER TABLE [dbo].[Booklet] WITH CHECK CHECK CONSTRAINT [FK_dbo.Booklet_dbo.Test_Test_Id];

ALTER TABLE [dbo].[CorrelatedSkill] WITH CHECK CHECK CONSTRAINT [FK_dbo.CorrelatedSkill_dbo.Skill_Skill1_Id];

ALTER TABLE [dbo].[CorrelatedSkill] WITH CHECK CHECK CONSTRAINT [FK_dbo.CorrelatedSkill_dbo.Skill_Skill2_Id];

ALTER TABLE [dbo].[EvaluationMatrix] WITH CHECK CHECK CONSTRAINT [FK_dbo.EvaluationMatrix_dbo.Discipline_Discipline_Id];

ALTER TABLE [dbo].[EvaluationMatrix] WITH CHECK CHECK CONSTRAINT [FK_dbo.EvaluationMatrix_dbo.ModelEvaluationMatrix_ModelEvaluationMatrix_Id];

ALTER TABLE [dbo].[EvaluationMatrixCourse] WITH CHECK CHECK CONSTRAINT [FK_dbo.EvaluationMatrixCourse_dbo.EvaluationMatrix_EvaluationMatrix_Id];

ALTER TABLE [dbo].[EvaluationMatrixCourseCurriculumGrade] WITH CHECK CHECK CONSTRAINT [FK_dbo.EvaluationMatrixCourseCurriculumGrade_dbo.EvaluationMatrixCourse_EvaluationMatrixCourse_Id];

ALTER TABLE [dbo].[ExportAnalysis] WITH CHECK CHECK CONSTRAINT [FK_dbo.ExportAnalysis_dbo.Test_Test_Id];

ALTER TABLE [dbo].[Item] WITH CHECK CHECK CONSTRAINT [FK_dbo.Item_dbo.BaseText_BaseText_Id];

ALTER TABLE [dbo].[Item] WITH CHECK CHECK CONSTRAINT [FK_dbo.Item_dbo.EvaluationMatrix_EvaluationMatrix_Id];

ALTER TABLE [dbo].[Item] WITH CHECK CHECK CONSTRAINT [FK_dbo.Item_dbo.ItemSituation_ItemSituation_Id];

ALTER TABLE [dbo].[Item] WITH CHECK CHECK CONSTRAINT [FK_dbo.Item_dbo.ItemType_ItemType_Id];

ALTER TABLE [dbo].[Item] WITH CHECK CHECK CONSTRAINT [FK_dbo.Item_dbo.ItemLevel_ItemLevel_Id];

ALTER TABLE [dbo].[ItemCurriculumGrade] WITH CHECK CHECK CONSTRAINT [FK_dbo.ItemCurriculumGrade_dbo.Item_Item_Id];

ALTER TABLE [dbo].[ItemSkill] WITH CHECK CHECK CONSTRAINT [FK_dbo.ItemSkill_dbo.Skill_Skill_Id];

ALTER TABLE [dbo].[ItemSkill] WITH CHECK CHECK CONSTRAINT [FK_dbo.ItemSkill_dbo.Item_Item_Id];

ALTER TABLE [dbo].[ModelSkillLevel] WITH CHECK CHECK CONSTRAINT [FK_dbo.ModelSkillLevel_dbo.ModelEvaluationMatrix_ModelEvaluationMatrix_Id];

ALTER TABLE [dbo].[ModelTest] WITH CHECK CHECK CONSTRAINT [FK_dbo.ModelTest_dbo.File_FileFooter_Id];

ALTER TABLE [dbo].[ModelTest] WITH CHECK CHECK CONSTRAINT [FK_dbo.ModelTest_dbo.File_FileHeader_Id];

ALTER TABLE [dbo].[Parameter] WITH CHECK CHECK CONSTRAINT [FK_dbo.Parameter_dbo.ParameterPage_ParameterPage_Id];

ALTER TABLE [dbo].[Parameter] WITH CHECK CHECK CONSTRAINT [FK_dbo.Parameter_dbo.ParameterCategory_ParameterCategory_Id];

ALTER TABLE [dbo].[Parameter] WITH CHECK CHECK CONSTRAINT [FK_dbo.Parameter_dbo.ParameterType_ParameterType_Id];

ALTER TABLE [dbo].[RequestRevoke] WITH CHECK CHECK CONSTRAINT [FK_dbo.RequestRevoke_dbo.BlockItem_BlockItem_Id];

ALTER TABLE [dbo].[RequestRevoke] WITH CHECK CHECK CONSTRAINT [FK_dbo.RequestRevoke_dbo.Test_Test_Id];

ALTER TABLE [dbo].[Skill] WITH CHECK CHECK CONSTRAINT [FK_dbo.Skill_dbo.CognitiveCompetence_CognitiveCompetence_Id];

ALTER TABLE [dbo].[Skill] WITH CHECK CHECK CONSTRAINT [FK_dbo.Skill_dbo.EvaluationMatrix_EvaluationMatrix_Id];

ALTER TABLE [dbo].[Skill] WITH CHECK CHECK CONSTRAINT [FK_dbo.Skill_dbo.ModelSkillLevel_ModelSkillLevel_Id];

ALTER TABLE [dbo].[Skill] WITH CHECK CHECK CONSTRAINT [FK_dbo.Skill_dbo.Skill_Parent_Id];

ALTER TABLE [dbo].[StudentTestAbsenceReason] WITH CHECK CHECK CONSTRAINT [FK_dbo.StudentTestAbsenceReason_dbo.AbsenceReason_AbsenceReason_Id];

ALTER TABLE [dbo].[StudentTestAbsenceReason] WITH CHECK CHECK CONSTRAINT [FK_dbo.StudentTestAbsenceReason_dbo.Test_Test_Id];

ALTER TABLE [dbo].[Test] WITH CHECK CHECK CONSTRAINT [FK_dbo.Test_dbo.FormatType_FormatType_Id];

ALTER TABLE [dbo].[Test] WITH CHECK CHECK CONSTRAINT [FK_dbo.Test_dbo.Discipline_Discipline_Id];

ALTER TABLE [dbo].[Test] WITH CHECK CHECK CONSTRAINT [FK_dbo.Test_dbo.TestType_TestType_Id];

ALTER TABLE [dbo].[TestCurriculumGrade] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestCurriculumGrade_dbo.Test_Test_Id];

ALTER TABLE [dbo].[TestFiles] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestFiles_dbo.File_File_Id];

ALTER TABLE [dbo].[TestFiles] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestFiles_dbo.Test_Test_Id];

ALTER TABLE [dbo].[TestItemLevel] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestItemLevel_dbo.ItemLevel_ItemLevel_Id];

ALTER TABLE [dbo].[TestItemLevel] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestItemLevel_dbo.Test_Test_Id];

ALTER TABLE [dbo].[TestPerformanceLevel] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestPerformanceLevel_dbo.PerformanceLevel_PerformanceLevel_Id];

ALTER TABLE [dbo].[TestPerformanceLevel] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestPerformanceLevel_dbo.Test_Test_Id];

ALTER TABLE [dbo].[TestSectionStatusCorrection] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestSectionStatusCorrection_dbo.Test_Test_Id];

ALTER TABLE [dbo].[TestType] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestType_dbo.FormatType_FormatType_Id];

ALTER TABLE [dbo].[TestType] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestType_dbo.ModelTest_ModelTest_Id];

ALTER TABLE [dbo].[TestType] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestType_dbo.ItemType_ItemType_Id];

ALTER TABLE [dbo].[TestTypeCourse] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestTypeCourse_dbo.TestType_TestType_Id];

ALTER TABLE [dbo].[TestTypeCourseCurriculumGrade] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestTypeCourseCurriculumGrade_dbo.TestTypeCourse_TestTypeCourse_Id];

ALTER TABLE [dbo].[TestTypeItemLevel] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestTypeItemLevel_dbo.ItemLevel_ItemLevel_Id];

ALTER TABLE [dbo].[TestTypeItemLevel] WITH CHECK CHECK CONSTRAINT [FK_dbo.TestTypeItemLevel_dbo.TestType_TestType_Id];


GO
PRINT N'Update complete.';


GO


