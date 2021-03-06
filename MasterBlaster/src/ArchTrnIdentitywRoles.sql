IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] DROP CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Quizzes_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Quizzes]'))
ALTER TABLE [dbo].[Quizzes] DROP CONSTRAINT [FK_Quizzes_Courses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT [FK_LessonViews_Lessons]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] DROP CONSTRAINT [FK_LessonViews_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons] DROP CONSTRAINT [FK_Lessons_Courses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Courses_TrainingCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Courses]'))
ALTER TABLE [dbo].[Courses] DROP CONSTRAINT [FK_Courses_TrainingCategories]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT [FK_CourseCompletions_Courses]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] DROP CONSTRAINT [FK_CourseCompletions_AspNetUsers]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
DROP TABLE [dbo].[UserDetails]
GO
/****** Object:  Table [dbo].[TrainingCategories]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrainingCategories]') AND type in (N'U'))
DROP TABLE [dbo].[TrainingCategories]
GO
/****** Object:  Table [dbo].[Quizzes]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quizzes]') AND type in (N'U'))
DROP TABLE [dbo].[Quizzes]
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
DROP TABLE [dbo].[LessonViews]
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
DROP TABLE [dbo].[Lessons]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
DROP TABLE [dbo].[Courses]
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
DROP TABLE [dbo].[CourseCompletions]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUsers]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserRoles]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserLogins]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetUserClaims]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
DROP TABLE [dbo].[AspNetRoles]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/17/2017 9:09:01 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
DROP TABLE [dbo].[__MigrationHistory]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[__MigrationHistory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AspNetUsers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[CourseCompletions]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CourseCompletions]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CourseCompletions](
	[CourseCompletionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[CourseID] [int] NOT NULL,
	[DateCompleted] [date] NOT NULL,
 CONSTRAINT [PK_CourseCompletions] PRIMARY KEY CLUSTERED 
(
	[CourseCompletionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Courses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[CategoryID] [int] NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Lessons]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Lessons]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Lessons](
	[LessonID] [int] IDENTITY(1,1) NOT NULL,
	[LessonName] [nvarchar](150) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Introduction] [nvarchar](500) NULL,
	[VideoUrl] [nvarchar](150) NULL,
	[PdfFileName] [nvarchar](150) NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Lessons] PRIMARY KEY CLUSTERED 
(
	[LessonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[LessonViews]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LessonViews]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LessonViews](
	[LessonViewID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[LessonID] [int] NOT NULL,
	[DateViewed] [date] NOT NULL,
 CONSTRAINT [PK_LessonViews] PRIMARY KEY CLUSTERED 
(
	[LessonViewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Quizzes]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Quizzes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Quizzes](
	[QuizID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](150) NOT NULL,
	[CorrectAnswer] [nvarchar](150) NOT NULL,
	[Answer2] [nvarchar](150) NOT NULL,
	[Answer3] [nvarchar](150) NOT NULL,
	[Answer4] [nvarchar](150) NOT NULL,
	[CourseID] [int] NOT NULL,
	[IsInUse] [bit] NOT NULL,
 CONSTRAINT [PK_Quizzes] PRIMARY KEY CLUSTERED 
(
	[QuizID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TrainingCategories]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TrainingCategories]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TrainingCategories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Description] [nvarchar](500) NULL,
 CONSTRAINT [PK_TrainingCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 10/17/2017 9:09:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserDetails]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[TopImage] [nvarchar](150) NULL,
	[BackImage] [nvarchar](150) NULL,
	[FrontImage] [nvarchar](150) NULL,
	[Notes] [nvarchar](1000) NULL,
 CONSTRAINT [PK_UserInformation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201710170919392_InitialCreate', N'ArchersTraining.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5CD96EE4B6127DBFC0FD07414FB9174ECBCB9DC1C4E89E81D3B6738D78C3B41DE46DC096D86D61244A9128C746902FCB433E29BF90A2446D5CB474AB17070182692EA78AC543B2582AFAAF3FFE1C7F7AF13DE31947B11B908979343A340D4CECC071C972622674F1ED07F3D3C77FFF6B7CE1F82FC64F79BB13D60E7A9278623E511A9E5A566C3F611FC523DFB5A3200E16746407BE859CC03A3E3CFCCE3A3AB2304098806518E3CF09A1AE8FD31FF0731A101B873441DE4DE0602FE6E550334B518D5BE4E33844369E9867111445F143845C024A8EB21EA671E6B908B499616F611A889080220ABA9E3EC67846A3802C67211420EFE135C4D06E81BC18F3319C96CDBB0EE7F0980DC72A3BE6507612D3C0EF097874C2ED6389DD57B2B259D80F2C780196A6AF6CD4A91527E69583D3A2CF81070610059E4EBD88359E98378588B338BCC57494771C65909711C0FD1A445F4755C403A373BF83824FC7A343F6DF81314D3C9A447842704223E41D18F7C9DC73ED1FF1EB43F01593C9C9D17C71F2E1DD7BE49CBCFF1F3E79571D298C15DAD50AA0E83E0A421C816E78518CDF34AC7A3F4BEC5874ABF4C9AC025C02D699C60D7AB9C664499F60D11C7F308D4BF7053B790927D72371612541271A25F0F336F13C34F770516F35CA64FF6F907AFCEEFD20526FD1B3BB4CA75E900F0B278275F5197B696DFCE486D9F2AACDF717DEEC320A7CF6BBCEAFACF6CB2C48229B0D26D0367940D112D3BA7663AB246F274A33A8E1699DA3EE3FB599A632BD954DD980565909B9886DAF865CDFCDCAEDCCB8B33084C94BA9C52CD24438F5813512100E0CB1DDE355C9A2A3AE2C2230BA7FF2A678E946316DD919E19F9D44374BBA465B1274E123D71B60A3EF2005FCAC851BF9B898B8EF03585688F49E867B14C7B0CF39FF47F1D3C60D34C37612C1F29B51E4871B9776FF14107C9BF873B6AAB7276BB0A979F835B844360DA20BC27AAD8D771DD85F83845E10E71C51FC48ED1C90FD7C70FDEE0083A87366DB388E2F81CCD89906708DC801AF083D39EE0DC7B6DE5D3B5A530FB9BEDAD3120E892F79D3D2DB52B7903C2E4D3395D7D5A4EA75B074493755F3A67A55B316ADAAF2667D556560DD34E52DF58AA60D5AF5CC5A0DE6C7A63334BC239BC2EEBF27BB9E3FA2DB0B2A669CC10E897FC00447B08D39F788521C917206BAEC1BBBF07FD2E96342377E36A5927E425E32B4A8955643BA090CBF1A52D8FD5F0DA99A50FCEC3ACC2BE970BDCB1B037CA7F6EA9B63FB9A1334DBF672A80D73DBC2B7B307E896CB591C07B69BAE0245608F8765EAFA830F67B4C768B2D188711E181810DD65471E94C0D84C915477E41C7B9862E3CCCE029F5314DBC891CD0803727A28969FA80AC5CA784F5DB9FF4A3281E938629D10BB04C5945DB2A9BC2C5C62BB21F25AAD24F4EC7884B1B11732C49A731C62C204B65AA28B707578872950C81126A5CD4263ABC2B866226ABC56DD9CB7B9B0E5BC4B5197AD70B2C577D6F092FB6F1B2166B3C5B640CE66937451401BAADC0541F95DA52B01C48BCBBE1154B8316908CA5DAAAD10B46EB11D10B46E923747D0EC8ADA75FE85FBEABED1B37E51DEFEB1DE68AE1D70B3668F3DA366E67B421F0A3D7024D3F37CCE2AF10B555CCE404F7E3F8BB9AB2B528481CF30AD876C4A7F57E9875ACD2022899A004BA2B580F28F9C1290B4A07A2897C7F21AB5E35E440FD83CEED608CBF77E01B6C20119BBFAB1B7D250FF49582467A7DB4731B2820D12C93B5D162A380A42889B577DE01D8CA28BCBCA86E9E20BF7F1862B03E393D160A016CF5563A47C30835B29A766BB95540E591F976C2D2B09EE93C64AF96006B712E768BB91144E410FB7602D13D58FF081165B1EE9284E9BA26E6C657960BC606C6912C6C637280C5DB2AC2490F1126396658F4DBF9DF54FA9F2330CCB8E15995585B685241A446889855A100D9AA69FAFCF114573C4E23C53C7979A29CF56CDF69F8BAC1E9FF224E6E740DE9AFD9B534F9D9A503B6F658784E35CC2287DE6D5A4A1740507D4DD0D96D4873C1429A2F7D3C04B7CA277B2F4BDB36F78D5FE59898C30B604FD25274AB298E4EAD6CDDF6972E48531E044157ECCEA93A587D0993CF742AB46D779A67A943C505545D105AF7636793A87A6F78489FE62FFF96A45D8CCFAAAE4DD54412AC5DDB1CACC9A2A5459DA1D89A7CE546178514F8C4AF6850456A9EB8E5A4F90A962D66BBA230A59305548A1AA8796D55C979A92D58A95F0341655B7E82E41CE6EA9A2CBB53D5829E7B9D4E82957AF80ADD059ACEB8EAA4885A9022BAABB63977931E2F6BEC7E7AAF66EB5D6C19A5DC1D73B5935189BD9AB8739982B990655A04A714F2C9E4B2081F1F2BD6494F61EBA16A3B2E8CB7A8CD260E877A0DA77FAFA06D4985CA0C7AC7D7CAF6DF24DC9077ABC7EBCDD283BA4ABA8D8A4905E5C4985ABE7985F03DB1F3449F7C2AC8969E4668403FE35A6D81FB106A3D92FDED47331DBCEF3063788B80B1CD32CE1C43C3E3C3A16DE43EDCFDB242B8E1D4F718DD63D50AACFD91672C7C83382158C223993638DF73B25A81424BF220E7E9998BFA5BD4ED3780BFB575A7C605CC58FC4FD25818A8728C1C6EF7266EA30EF199AAF817BFAFAA4BB55AF7EFE92753D30EE225831A7C6A160CB5566B8FE26A5973659D735B459F9A5CADB5D50D2DB8F1CF91B1FBDFCA70AB7CAFB8EB5C06A6F38940316D6EAEA4F36E62E1DE4B9C65AE3553EC9580B51F1EC6228BC414CA87B56B10A96F64985033F69FAA4A22797954F2C56514DFBBCC225FDC1C4C715DD77C8BCE70E4F41C5956D1BBB656AE7D6E4F4B53255777D6C4A39EC6B2D74394FBD07DC1AB9E82B30E38DA5710F76702BB2B407C3DE25B5379E9ABD2FD9D8659ECC6E93B0B79977DDF04DED1F956EBD0709828A84A7DD27556F9B6BBA30F39E67A6F64B9DDE33B2F134B8DD27486F9B6CBA08F49E93AD571AF49E716D57E7E78E99D6F908DD7952B39C9FA5F95CA40A53B7252D67317DB8E1CF032041E651666F4DD559724D19BE2D02CB267AA1FAF43C51B0B47024B9528B66B1FDC6CA0FFCC6C1F236CD623549AD4DB2F9FEDF289BB76996AD4915DD45BAB53259539502DFB28F356590BDA5F4EADA485AB2F9DB7CD6C66FFF6F299B7A10A3D4568FE6F3F5DB499E1EC424432E9D1EC9D2F29768383B2B7F8013CEEFD85D9610ECCF71126CD74ECDA2CD155904F9E12D689437112234379822078ED4B388BA0B6453A86631E6F4B17C1AB7635F3AE6D8B92277090D130A43C6FEDCAB05BC9813D0243FCD08AFEB3CBE0BD3BFFB32C410404D97C5E6EFC8F789EB3985DE978A9890068279173CA2CBE692B2C8EEF2B540BA0D4847206EBEC2297AC07EE801587C4766E819AFA21BD0EF1A2F91FD5A46007520ED135137FBF8DC45CB08F931C728FBC34FE0B0E3BF7CFC1B3422990087560000, N'6.1.3-40302')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'1a1ea2ca-f4ab-424c-b238-2a7f1fba67fa', N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'ebee3525-bc6c-4cab-80e0-9a77bdc396b1', N'Archer')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'f21dacad-7e3e-47e7-b460-01b10abf1d17', N'Coach')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'44a6b1a3-5073-4626-bb8a-86abb98f223a', N'1a1ea2ca-f4ab-424c-b238-2a7f1fba67fa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ed0ac126-3892-440a-b298-e4377c84ace6', N'1a1ea2ca-f4ab-424c-b238-2a7f1fba67fa')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9d16f32a-3424-4176-a3a1-520b3adc0db1', N'ebee3525-bc6c-4cab-80e0-9a77bdc396b1')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7347be04-037a-47f4-af39-bbf88d02e95b', N'f21dacad-7e3e-47e7-b460-01b10abf1d17')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'44a6b1a3-5073-4626-bb8a-86abb98f223a', NULL, NULL, N'admin@jeff.com', 0, N'ACltWImIr5+kEThEIgtln0GcnPjRQz2WvKxBiyGgyC43rk9YGiPQgqdWFrikuUhztQ==', N'a89c0145-c0a5-4910-9ea3-b36cb2835a2e', NULL, 0, 0, NULL, 0, 0, N'admin@jeff.com')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'7347be04-037a-47f4-af39-bbf88d02e95b', N'Kisik', N'Lee', N'coach@jg.com', 1, N'ADzQeozQWMglLkbKxhP9zBGhpwIlLWz+5e4ynxiwktK/yeegDOA3BD0MGgVYaUL4Gw==', N'a431dbc1-500d-444f-92ee-7b4063b37f85', NULL, 0, 0, NULL, 1, 0, N'coach@jg.com')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'9d16f32a-3424-4176-a3a1-520b3adc0db1', N'One', N'Arrow', N'archer@jg.com', 1, N'AISjLHbaB28du3lBNixYt56h9OcFiAVXZJBhK9OzZkyHAkKm/7ChRWWemRzjgVizxQ==', N'7550a2f6-50e5-4056-ad04-0201fb67ea3f', NULL, 0, 0, NULL, 1, 0, N'archer@jg.com')
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ed0ac126-3892-440a-b298-e4377c84ace6', N'Jeff', N'Gochenour', N'admin@jg.com', 1, N'ABnQQsRtRr/PBbBO1nVxh1koy22pJW0ygc3clCR1GsU5/HlSIn4FVOuDtQNyKuApSw==', N'de8c1f9e-e5d6-43a7-a0e7-abbf140181bd', NULL, 0, 0, NULL, 1, 0, N'admin@jg.com')
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserClaims]'))
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserLogins]'))
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[AspNetUserRoles]'))
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_AspNetUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions]  WITH CHECK ADD  CONSTRAINT [FK_CourseCompletions_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CourseCompletions_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[CourseCompletions]'))
ALTER TABLE [dbo].[CourseCompletions] CHECK CONSTRAINT [FK_CourseCompletions_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Courses_TrainingCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Courses]'))
ALTER TABLE [dbo].[Courses]  WITH CHECK ADD  CONSTRAINT [FK_Courses_TrainingCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[TrainingCategories] ([CategoryID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Courses_TrainingCategories]') AND parent_object_id = OBJECT_ID(N'[dbo].[Courses]'))
ALTER TABLE [dbo].[Courses] CHECK CONSTRAINT [FK_Courses_TrainingCategories]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons]  WITH CHECK ADD  CONSTRAINT [FK_Lessons_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Lessons_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Lessons]'))
ALTER TABLE [dbo].[Lessons] CHECK CONSTRAINT [FK_Lessons_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_AspNetUsers]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews]  WITH CHECK ADD  CONSTRAINT [FK_LessonViews_Lessons] FOREIGN KEY([LessonID])
REFERENCES [dbo].[Lessons] ([LessonID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LessonViews_Lessons]') AND parent_object_id = OBJECT_ID(N'[dbo].[LessonViews]'))
ALTER TABLE [dbo].[LessonViews] CHECK CONSTRAINT [FK_LessonViews_Lessons]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Quizzes_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Quizzes]'))
ALTER TABLE [dbo].[Quizzes]  WITH CHECK ADD  CONSTRAINT [FK_Quizzes_Courses] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Quizzes_Courses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Quizzes]'))
ALTER TABLE [dbo].[Quizzes] CHECK CONSTRAINT [FK_Quizzes_Courses]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_UserDetails_AspNetUsers]') AND parent_object_id = OBJECT_ID(N'[dbo].[UserDetails]'))
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_AspNetUsers]
GO
