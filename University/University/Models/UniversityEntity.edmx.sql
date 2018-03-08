
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/08/2018 16:00:19
-- Generated from EDMX file: E:\visual studio 2017\University\University\Models\UniversityEntity.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [practicum];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_CourseEnrollment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EnrollmentSet] DROP CONSTRAINT [FK_CourseEnrollment];
GO
IF OBJECT_ID(N'[dbo].[FK_StudentEnrollment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EnrollmentSet] DROP CONSTRAINT [FK_StudentEnrollment];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[CourseSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CourseSet];
GO
IF OBJECT_ID(N'[dbo].[EnrollmentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EnrollmentSet];
GO
IF OBJECT_ID(N'[dbo].[StudentSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StudentSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'CourseSet'
CREATE TABLE [dbo].[CourseSet] (
    [CourseID] int IDENTITY(1,1) NOT NULL,
    [Title] nvarchar(max)  NOT NULL,
    [Credits] int  NOT NULL
);
GO

-- Creating table 'EnrollmentSet'
CREATE TABLE [dbo].[EnrollmentSet] (
    [EnrollmentID] int IDENTITY(1,1) NOT NULL,
    [CourseID] int  NOT NULL,
    [StudentID] int  NOT NULL,
    [Grade] nvarchar(max)  NOT NULL,
    [Course_CourseID] int  NOT NULL,
    [Student_ID] int  NOT NULL
);
GO

-- Creating table 'StudentSet'
CREATE TABLE [dbo].[StudentSet] (
    [ID] int IDENTITY(1,1) NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [FirstMidName] nvarchar(max)  NOT NULL,
    [Enrollment] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CourseID] in table 'CourseSet'
ALTER TABLE [dbo].[CourseSet]
ADD CONSTRAINT [PK_CourseSet]
    PRIMARY KEY CLUSTERED ([CourseID] ASC);
GO

-- Creating primary key on [EnrollmentID] in table 'EnrollmentSet'
ALTER TABLE [dbo].[EnrollmentSet]
ADD CONSTRAINT [PK_EnrollmentSet]
    PRIMARY KEY CLUSTERED ([EnrollmentID] ASC);
GO

-- Creating primary key on [ID] in table 'StudentSet'
ALTER TABLE [dbo].[StudentSet]
ADD CONSTRAINT [PK_StudentSet]
    PRIMARY KEY CLUSTERED ([ID] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Course_CourseID] in table 'EnrollmentSet'
ALTER TABLE [dbo].[EnrollmentSet]
ADD CONSTRAINT [FK_CourseEnrollment]
    FOREIGN KEY ([Course_CourseID])
    REFERENCES [dbo].[CourseSet]
        ([CourseID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CourseEnrollment'
CREATE INDEX [IX_FK_CourseEnrollment]
ON [dbo].[EnrollmentSet]
    ([Course_CourseID]);
GO

-- Creating foreign key on [Student_ID] in table 'EnrollmentSet'
ALTER TABLE [dbo].[EnrollmentSet]
ADD CONSTRAINT [FK_StudentEnrollment]
    FOREIGN KEY ([Student_ID])
    REFERENCES [dbo].[StudentSet]
        ([ID])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StudentEnrollment'
CREATE INDEX [IX_FK_StudentEnrollment]
ON [dbo].[EnrollmentSet]
    ([Student_ID]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------