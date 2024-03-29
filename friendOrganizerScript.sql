USE [master]
GO
/****** Object:  Database [FriendOrganizer]    Script Date: 6/14/2021 1:27:38 PM ******/
CREATE DATABASE [FriendOrganizer]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FriendOrganizer', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FriendOrganizer.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FriendOrganizer_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\FriendOrganizer_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FriendOrganizer] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FriendOrganizer].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FriendOrganizer] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FriendOrganizer] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FriendOrganizer] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FriendOrganizer] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FriendOrganizer] SET ARITHABORT OFF 
GO
ALTER DATABASE [FriendOrganizer] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FriendOrganizer] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FriendOrganizer] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FriendOrganizer] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FriendOrganizer] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FriendOrganizer] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FriendOrganizer] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FriendOrganizer] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FriendOrganizer] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FriendOrganizer] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FriendOrganizer] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FriendOrganizer] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FriendOrganizer] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FriendOrganizer] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FriendOrganizer] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FriendOrganizer] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FriendOrganizer] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FriendOrganizer] SET RECOVERY FULL 
GO
ALTER DATABASE [FriendOrganizer] SET  MULTI_USER 
GO
ALTER DATABASE [FriendOrganizer] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FriendOrganizer] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FriendOrganizer] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FriendOrganizer] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FriendOrganizer] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FriendOrganizer] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'FriendOrganizer', N'ON'
GO
ALTER DATABASE [FriendOrganizer] SET QUERY_STORE = OFF
GO
USE [FriendOrganizer]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 6/14/2021 1:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friend]    Script Date: 6/14/2021 1:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friend](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[FavoriteLanguageId] [int] NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Friend] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FriendPhoneNumber]    Script Date: 6/14/2021 1:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FriendPhoneNumber](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](max) NOT NULL,
	[FriendId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.FriendPhoneNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meeting]    Script Date: 6/14/2021 1:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meeting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DateFrom] [datetime] NOT NULL,
	[DateTo] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Meeting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MeetingFriend]    Script Date: 6/14/2021 1:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MeetingFriend](
	[Meeting_Id] [int] NOT NULL,
	[Friend_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.MeetingFriend] PRIMARY KEY CLUSTERED 
(
	[Meeting_Id] ASC,
	[Friend_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgrammingLanguage]    Script Date: 6/14/2021 1:27:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgrammingLanguage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_dbo.ProgrammingLanguage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_FavoriteLanguageId]    Script Date: 6/14/2021 1:27:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_FavoriteLanguageId] ON [dbo].[Friend]
(
	[FavoriteLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_FriendId]    Script Date: 6/14/2021 1:27:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_FriendId] ON [dbo].[FriendPhoneNumber]
(
	[FriendId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Friend_Id]    Script Date: 6/14/2021 1:27:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Friend_Id] ON [dbo].[MeetingFriend]
(
	[Friend_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Meeting_Id]    Script Date: 6/14/2021 1:27:38 PM ******/
CREATE NONCLUSTERED INDEX [IX_Meeting_Id] ON [dbo].[MeetingFriend]
(
	[Meeting_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Friend]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Friend_dbo.ProgrammingLanguage_FavoriteLanguageId] FOREIGN KEY([FavoriteLanguageId])
REFERENCES [dbo].[ProgrammingLanguage] ([Id])
GO
ALTER TABLE [dbo].[Friend] CHECK CONSTRAINT [FK_dbo.Friend_dbo.ProgrammingLanguage_FavoriteLanguageId]
GO
ALTER TABLE [dbo].[FriendPhoneNumber]  WITH CHECK ADD  CONSTRAINT [FK_dbo.FriendPhoneNumber_dbo.Friend_FriendId] FOREIGN KEY([FriendId])
REFERENCES [dbo].[Friend] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FriendPhoneNumber] CHECK CONSTRAINT [FK_dbo.FriendPhoneNumber_dbo.Friend_FriendId]
GO
ALTER TABLE [dbo].[MeetingFriend]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MeetingFriend_dbo.Friend_Friend_Id] FOREIGN KEY([Friend_Id])
REFERENCES [dbo].[Friend] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MeetingFriend] CHECK CONSTRAINT [FK_dbo.MeetingFriend_dbo.Friend_Friend_Id]
GO
ALTER TABLE [dbo].[MeetingFriend]  WITH CHECK ADD  CONSTRAINT [FK_dbo.MeetingFriend_dbo.Meeting_Meeting_Id] FOREIGN KEY([Meeting_Id])
REFERENCES [dbo].[Meeting] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MeetingFriend] CHECK CONSTRAINT [FK_dbo.MeetingFriend_dbo.Meeting_Meeting_Id]
GO
USE [master]
GO
ALTER DATABASE [FriendOrganizer] SET  READ_WRITE 
GO
