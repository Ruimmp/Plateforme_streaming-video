USE [master]
GO
/****** Object:  Database [Plateform_streaming]    Script Date: 06.01.2021 16:01:13 ******/
CREATE DATABASE [Plateform_streaming]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Plateform_streaming', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Plateform_streaming.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Plateform_streaming_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Plateform_streaming_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Plateform_streaming] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Plateform_streaming].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Plateform_streaming] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Plateform_streaming] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Plateform_streaming] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Plateform_streaming] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Plateform_streaming] SET ARITHABORT OFF 
GO
ALTER DATABASE [Plateform_streaming] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Plateform_streaming] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Plateform_streaming] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Plateform_streaming] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Plateform_streaming] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Plateform_streaming] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Plateform_streaming] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Plateform_streaming] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Plateform_streaming] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Plateform_streaming] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Plateform_streaming] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Plateform_streaming] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Plateform_streaming] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Plateform_streaming] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Plateform_streaming] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Plateform_streaming] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Plateform_streaming] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Plateform_streaming] SET RECOVERY FULL 
GO
ALTER DATABASE [Plateform_streaming] SET  MULTI_USER 
GO
ALTER DATABASE [Plateform_streaming] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Plateform_streaming] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Plateform_streaming] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Plateform_streaming] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Plateform_streaming] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Plateform_streaming] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Plateform_streaming', N'ON'
GO
ALTER DATABASE [Plateform_streaming] SET QUERY_STORE = OFF
GO
USE [Plateform_streaming]
GO
/****** Object:  Table [dbo].[Audio resolutions]    Script Date: 06.01.2021 16:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audio resolutions](
	[Name] [varchar](50) NOT NULL,
	[Resoltion] [numeric](18, 0) NULL,
	[Format] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 06.01.2021 16:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Name] [varchar](50) NULL,
	[Type] [varchar](50) NOT NULL,
	[Decription] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Episodes]    Script Date: 06.01.2021 16:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Episodes](
	[Title] [text] NULL,
	[Episode number] [numeric](18, 0) NULL,
	[Duration] [numeric](18, 0) NOT NULL,
	[Description] [text] NOT NULL,
	[Miniature] [image] NOT NULL,
	[Evaluation] [numeric](18, 0) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 06.01.2021 16:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[LastName] [text] NULL,
	[Name] [varchar](50) NULL,
	[Pseudo] [varchar](50) NULL,
	[Mail address] [varchar](50) NULL,
	[PhoneNumber] [numeric](18, 0) NULL,
	[DateOfBirth] [date] NULL,
	[NPA] [numeric](18, 0) NULL,
	[City] [varchar](50) NULL,
	[Street] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Production studio]    Script Date: 06.01.2021 16:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Production studio](
	[Name] [nchar](10) NOT NULL,
	[IDE] [nchar](10) NULL,
	[Mail address] [nchar](10) NOT NULL,
	[Phone number] [numeric](18, 0) NOT NULL,
	[Postcode] [numeric](18, 0) NOT NULL,
	[City] [nchar](10) NOT NULL,
	[Street] [nchar](10) NOT NULL,
	[Creation date] [numeric](18, 0) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 06.01.2021 16:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Type] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Serie]    Script Date: 06.01.2021 16:01:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Serie](
	[Title] [varchar](50) NULL,
	[On-line] [date] NULL,
	[Description] [varchar](50) NOT NULL,
	[Miniature] [image] NOT NULL,
	[Trailer] [varchar](50) NULL,
	[Evaluation] [numeric](18, 0) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [Plateform_streaming] SET  READ_WRITE 
GO
