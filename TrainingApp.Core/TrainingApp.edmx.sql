
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, and Azure
-- --------------------------------------------------
-- Date Created: 04/08/2014 20:24:28
-- Generated from EDMX file: C:\Users\mmiller\Desktop\git_repos\TrainingApp\TrainingApp.Core\TrainingApp.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [TrainingApp];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_QuestionTrainingCategory]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Questions] DROP CONSTRAINT [FK_QuestionTrainingCategory];
GO
IF OBJECT_ID(N'[dbo].[FK_InterviewInterviewQuestion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InterviewQuestions] DROP CONSTRAINT [FK_InterviewInterviewQuestion];
GO
IF OBJECT_ID(N'[dbo].[FK_QuestionInterviewQuestion]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InterviewQuestions] DROP CONSTRAINT [FK_QuestionInterviewQuestion];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Questions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Questions];
GO
IF OBJECT_ID(N'[dbo].[TrainingCategories]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TrainingCategories];
GO
IF OBJECT_ID(N'[dbo].[Interviews]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Interviews];
GO
IF OBJECT_ID(N'[dbo].[InterviewQuestions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InterviewQuestions];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Questions'
CREATE TABLE [dbo].[Questions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [QuestionText] nvarchar(max)  NOT NULL,
    [ProjectName] nvarchar(max)  NOT NULL,
    [Revision] nvarchar(max)  NOT NULL,
    [TrainingCategoryId] int  NOT NULL
);
GO

-- Creating table 'TrainingCategories'
CREATE TABLE [dbo].[TrainingCategories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Category] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Interviews'
CREATE TABLE [dbo].[Interviews] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'InterviewQuestions'
CREATE TABLE [dbo].[InterviewQuestions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [InterviewId] int  NOT NULL,
    [QuestionId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Questions'
ALTER TABLE [dbo].[Questions]
ADD CONSTRAINT [PK_Questions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TrainingCategories'
ALTER TABLE [dbo].[TrainingCategories]
ADD CONSTRAINT [PK_TrainingCategories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Interviews'
ALTER TABLE [dbo].[Interviews]
ADD CONSTRAINT [PK_Interviews]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'InterviewQuestions'
ALTER TABLE [dbo].[InterviewQuestions]
ADD CONSTRAINT [PK_InterviewQuestions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [TrainingCategoryId] in table 'Questions'
ALTER TABLE [dbo].[Questions]
ADD CONSTRAINT [FK_QuestionTrainingCategory]
    FOREIGN KEY ([TrainingCategoryId])
    REFERENCES [dbo].[TrainingCategories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_QuestionTrainingCategory'
CREATE INDEX [IX_FK_QuestionTrainingCategory]
ON [dbo].[Questions]
    ([TrainingCategoryId]);
GO

-- Creating foreign key on [InterviewId] in table 'InterviewQuestions'
ALTER TABLE [dbo].[InterviewQuestions]
ADD CONSTRAINT [FK_InterviewInterviewQuestion]
    FOREIGN KEY ([InterviewId])
    REFERENCES [dbo].[Interviews]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_InterviewInterviewQuestion'
CREATE INDEX [IX_FK_InterviewInterviewQuestion]
ON [dbo].[InterviewQuestions]
    ([InterviewId]);
GO

-- Creating foreign key on [QuestionId] in table 'InterviewQuestions'
ALTER TABLE [dbo].[InterviewQuestions]
ADD CONSTRAINT [FK_QuestionInterviewQuestion]
    FOREIGN KEY ([QuestionId])
    REFERENCES [dbo].[Questions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_QuestionInterviewQuestion'
CREATE INDEX [IX_FK_QuestionInterviewQuestion]
ON [dbo].[InterviewQuestions]
    ([QuestionId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------