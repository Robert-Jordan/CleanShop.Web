USE [master]
GO
/****** Object:  Database [CleanShop]    Script Date: 7/29/2020 10:45:18 AM ******/
CREATE DATABASE [CleanShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CleanShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CleanShop.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CleanShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CleanShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CleanShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CleanShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CleanShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CleanShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CleanShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CleanShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CleanShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [CleanShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CleanShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CleanShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CleanShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CleanShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CleanShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CleanShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CleanShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CleanShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CleanShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CleanShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CleanShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CleanShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CleanShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CleanShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CleanShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CleanShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CleanShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CleanShop] SET  MULTI_USER 
GO
ALTER DATABASE [CleanShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CleanShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CleanShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CleanShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CleanShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CleanShop] SET QUERY_STORE = OFF
GO
USE [CleanShop]
GO
/****** Object:  User [NtGuilty]    Script Date: 7/29/2020 10:45:18 AM ******/
CREATE USER [NtGuilty] FOR LOGIN [NtGuilty] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Admin]    Script Date: 7/29/2020 10:45:18 AM ******/
CREATE USER [Admin] FOR LOGIN [Admin] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NtGuilty]
GO
ALTER ROLE [db_owner] ADD MEMBER [Admin]
GO
/****** Object:  Table [dbo].[cmsContentNu]    Script Date: 7/29/2020 10:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentNu](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[data] [ntext] NOT NULL,
	[rv] [bigint] NOT NULL,
 CONSTRAINT [PK_cmsContentNu] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](255) NULL,
	[icon] [nvarchar](255) NULL,
	[thumbnail] [nvarchar](255) NOT NULL,
	[description] [nvarchar](1500) NULL,
	[isContainer] [bit] NOT NULL,
	[isElement] [bit] NOT NULL,
	[allowAtRoot] [bit] NOT NULL,
	[variations] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentType2ContentType]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentType2ContentType](
	[parentContentTypeId] [int] NOT NULL,
	[childContentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentType2ContentType] PRIMARY KEY CLUSTERED 
(
	[parentContentTypeId] ASC,
	[childContentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsContentTypeAllowedContentType]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsContentTypeAllowedContentType](
	[Id] [int] NOT NULL,
	[AllowedId] [int] NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_cmsContentTypeAllowedContentType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[AllowedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDictionary]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDictionary](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[id] [uniqueidentifier] NOT NULL,
	[parent] [uniqueidentifier] NULL,
	[key] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_cmsDictionary] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsDocumentType]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsDocumentType](
	[contentTypeNodeId] [int] NOT NULL,
	[templateNodeId] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
 CONSTRAINT [PK_cmsDocumentType] PRIMARY KEY CLUSTERED 
(
	[contentTypeNodeId] ASC,
	[templateNodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsLanguageText]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsLanguageText](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[languageId] [int] NOT NULL,
	[UniqueId] [uniqueidentifier] NOT NULL,
	[value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsLanguageText] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacro]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[macroUseInEditor] [bit] NOT NULL,
	[macroRefreshRate] [int] NOT NULL,
	[macroAlias] [nvarchar](255) NOT NULL,
	[macroName] [nvarchar](255) NULL,
	[macroCacheByPage] [bit] NOT NULL,
	[macroCachePersonalized] [bit] NOT NULL,
	[macroDontRender] [bit] NOT NULL,
	[macroSource] [nvarchar](255) NOT NULL,
	[macroType] [int] NOT NULL,
 CONSTRAINT [PK_cmsMacro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMacroProperty]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMacroProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniquePropertyId] [uniqueidentifier] NOT NULL,
	[editorAlias] [nvarchar](255) NOT NULL,
	[macro] [int] NOT NULL,
	[macroPropertySortOrder] [int] NOT NULL,
	[macroPropertyAlias] [nvarchar](50) NOT NULL,
	[macroPropertyName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_cmsMacroProperty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember](
	[nodeId] [int] NOT NULL,
	[Email] [nvarchar](1000) NOT NULL,
	[LoginName] [nvarchar](1000) NOT NULL,
	[Password] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_cmsMember] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMember2MemberGroup]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMember2MemberGroup](
	[Member] [int] NOT NULL,
	[MemberGroup] [int] NOT NULL,
 CONSTRAINT [PK_cmsMember2MemberGroup] PRIMARY KEY CLUSTERED 
(
	[Member] ASC,
	[MemberGroup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsMemberType]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsMemberType](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[NodeId] [int] NOT NULL,
	[propertytypeId] [int] NOT NULL,
	[memberCanEdit] [bit] NOT NULL,
	[viewOnProfile] [bit] NOT NULL,
	[isSensitive] [bit] NOT NULL,
 CONSTRAINT [PK_cmsMemberType] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyType]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dataTypeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
	[propertyTypeGroupId] [int] NULL,
	[Alias] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[mandatoryMessage] [nvarchar](500) NULL,
	[validationRegExp] [nvarchar](255) NULL,
	[validationRegExpMessage] [nvarchar](500) NULL,
	[Description] [nvarchar](2000) NULL,
	[variations] [int] NOT NULL,
	[UniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsPropertyTypeGroup]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsPropertyTypeGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[contenttypeNodeId] [int] NOT NULL,
	[text] [nvarchar](255) NOT NULL,
	[sortorder] [int] NOT NULL,
	[uniqueID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_cmsPropertyTypeGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTagRelationship]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTagRelationship](
	[nodeId] [int] NOT NULL,
	[tagId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
 CONSTRAINT [PK_cmsTagRelationship] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC,
	[propertyTypeId] ASC,
	[tagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTags]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTags](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group] [nvarchar](100) NOT NULL,
	[languageId] [int] NULL,
	[tag] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_cmsTags] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cmsTemplate]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cmsTemplate](
	[pk] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[alias] [nvarchar](100) NULL,
 CONSTRAINT [PK_cmsTemplate] PRIMARY KEY CLUSTERED 
(
	[pk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccess]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccess](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[loginNodeId] [int] NOT NULL,
	[noAccessNodeId] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccess] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAccessRule]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAccessRule](
	[id] [uniqueidentifier] NOT NULL,
	[accessId] [uniqueidentifier] NOT NULL,
	[ruleValue] [nvarchar](255) NOT NULL,
	[ruleType] [nvarchar](255) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoAccessRule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoAudit]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoAudit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[performingUserId] [int] NOT NULL,
	[performingDetails] [nvarchar](1024) NULL,
	[performingIp] [nvarchar](64) NULL,
	[eventDateUtc] [datetime] NOT NULL,
	[affectedUserId] [int] NOT NULL,
	[affectedDetails] [nvarchar](1024) NULL,
	[eventType] [nvarchar](256) NOT NULL,
	[eventDetails] [nvarchar](1024) NULL,
 CONSTRAINT [PK_umbracoAudit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoCacheInstruction]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoCacheInstruction](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[utcStamp] [datetime] NOT NULL,
	[jsonInstruction] [ntext] NOT NULL,
	[originated] [nvarchar](500) NOT NULL,
	[instructionCount] [int] NOT NULL,
 CONSTRAINT [PK_umbracoCacheInstruction] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoConsent]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoConsent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[current] [bit] NOT NULL,
	[source] [nvarchar](512) NOT NULL,
	[context] [nvarchar](128) NOT NULL,
	[action] [nvarchar](512) NOT NULL,
	[createDate] [datetime] NOT NULL,
	[state] [int] NOT NULL,
	[comment] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoConsent] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContent]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContent](
	[nodeId] [int] NOT NULL,
	[contentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_umbracoContent] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentSchedule]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentSchedule](
	[id] [uniqueidentifier] NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[date] [datetime] NOT NULL,
	[action] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoContentSchedule] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersion]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[versionDate] [datetime] NOT NULL,
	[userId] [int] NULL,
	[current] [bit] NOT NULL,
	[text] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoContentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoContentVersionCultureVariation]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoContentVersionCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[date] [datetime] NOT NULL,
	[availableUserId] [int] NULL,
 CONSTRAINT [PK_umbracoContentVersionCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDataType]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDataType](
	[nodeId] [int] NOT NULL,
	[propertyEditorAlias] [nvarchar](255) NOT NULL,
	[dbType] [nvarchar](50) NOT NULL,
	[config] [ntext] NULL,
 CONSTRAINT [PK_umbracoDataType] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocument]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocument](
	[nodeId] [int] NOT NULL,
	[published] [bit] NOT NULL,
	[edited] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocument] PRIMARY KEY CLUSTERED 
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentCultureVariation]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentCultureVariation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nodeId] [int] NOT NULL,
	[languageId] [int] NOT NULL,
	[edited] [bit] NOT NULL,
	[available] [bit] NOT NULL,
	[published] [bit] NOT NULL,
	[name] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoDocumentCultureVariation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDocumentVersion]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDocumentVersion](
	[id] [int] NOT NULL,
	[templateId] [int] NULL,
	[published] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoDocumentVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoDomain]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoDomain](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[domainDefaultLanguage] [int] NULL,
	[domainRootStructureID] [int] NULL,
	[domainName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoDomain] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoExternalLogin]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoExternalLogin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[loginProvider] [nvarchar](4000) NOT NULL,
	[providerKey] [nvarchar](4000) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoExternalLogin] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoKeyValue]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoKeyValue](
	[key] [nvarchar](256) NOT NULL,
	[value] [nvarchar](255) NULL,
	[updated] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoKeyValue] PRIMARY KEY CLUSTERED 
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLanguage]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLanguage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[languageISOCode] [nvarchar](14) NULL,
	[languageCultureName] [nvarchar](100) NULL,
	[isDefaultVariantLang] [bit] NOT NULL,
	[mandatory] [bit] NOT NULL,
	[fallbackLanguageId] [int] NULL,
 CONSTRAINT [PK_umbracoLanguage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLock]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLock](
	[id] [int] NOT NULL,
	[value] [int] NOT NULL,
	[name] [nvarchar](64) NOT NULL,
 CONSTRAINT [PK_umbracoLock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoLog]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[NodeId] [int] NOT NULL,
	[entityType] [nvarchar](50) NULL,
	[Datestamp] [datetime] NOT NULL,
	[logHeader] [nvarchar](50) NOT NULL,
	[logComment] [nvarchar](4000) NULL,
	[parameters] [nvarchar](500) NULL,
 CONSTRAINT [PK_umbracoLog] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoMediaVersion]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoMediaVersion](
	[id] [int] NOT NULL,
	[path] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoMediaVersion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoNode]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[uniqueId] [uniqueidentifier] NOT NULL,
	[parentId] [int] NOT NULL,
	[level] [int] NOT NULL,
	[path] [nvarchar](150) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[trashed] [bit] NOT NULL,
	[nodeUser] [int] NULL,
	[text] [nvarchar](255) NULL,
	[nodeObjectType] [uniqueidentifier] NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_umbracoNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoPropertyData]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoPropertyData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[versionId] [int] NOT NULL,
	[propertyTypeId] [int] NOT NULL,
	[languageId] [int] NULL,
	[segment] [nvarchar](256) NULL,
	[intValue] [int] NULL,
	[decimalValue] [decimal](38, 6) NULL,
	[dateValue] [datetime] NULL,
	[varcharValue] [nvarchar](512) NULL,
	[textValue] [ntext] NULL,
 CONSTRAINT [PK_umbracoPropertyData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRedirectUrl]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRedirectUrl](
	[id] [uniqueidentifier] NOT NULL,
	[contentKey] [uniqueidentifier] NOT NULL,
	[createDateUtc] [datetime] NOT NULL,
	[url] [nvarchar](255) NOT NULL,
	[culture] [nvarchar](255) NULL,
	[urlHash] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_umbracoRedirectUrl] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelation]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentId] [int] NOT NULL,
	[childId] [int] NOT NULL,
	[relType] [int] NOT NULL,
	[datetime] [datetime] NOT NULL,
	[comment] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_umbracoRelation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoRelationType]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoRelationType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeUniqueId] [uniqueidentifier] NOT NULL,
	[dual] [bit] NOT NULL,
	[parentObjectType] [uniqueidentifier] NULL,
	[childObjectType] [uniqueidentifier] NULL,
	[name] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_umbracoRelationType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoServer]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoServer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[address] [nvarchar](500) NOT NULL,
	[computerName] [nvarchar](255) NOT NULL,
	[registeredDate] [datetime] NOT NULL,
	[lastNotifiedDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[isMaster] [bit] NOT NULL,
 CONSTRAINT [PK_umbracoServer] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userDisabled] [bit] NOT NULL,
	[userNoConsole] [bit] NOT NULL,
	[userName] [nvarchar](255) NOT NULL,
	[userLogin] [nvarchar](125) NOT NULL,
	[userPassword] [nvarchar](500) NOT NULL,
	[passwordConfig] [nvarchar](500) NULL,
	[userEmail] [nvarchar](255) NOT NULL,
	[userLanguage] [nvarchar](10) NULL,
	[securityStampToken] [nvarchar](255) NULL,
	[failedLoginAttempts] [int] NULL,
	[lastLockoutDate] [datetime] NULL,
	[lastPasswordChangeDate] [datetime] NULL,
	[lastLoginDate] [datetime] NULL,
	[emailConfirmedDate] [datetime] NULL,
	[invitedDate] [datetime] NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[avatar] [nvarchar](500) NULL,
	[tourData] [ntext] NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2NodeNotify]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2NodeNotify](
	[userId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[action] [nchar](1) NOT NULL,
 CONSTRAINT [PK_umbracoUser2NodeNotify] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[nodeId] ASC,
	[action] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUser2UserGroup]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUser2UserGroup](
	[userId] [int] NOT NULL,
	[userGroupId] [int] NOT NULL,
 CONSTRAINT [PK_user2userGroup] PRIMARY KEY CLUSTERED 
(
	[userId] ASC,
	[userGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userGroupAlias] [nvarchar](200) NOT NULL,
	[userGroupName] [nvarchar](200) NOT NULL,
	[userGroupDefaultPermissions] [nvarchar](50) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[icon] [nvarchar](255) NULL,
	[startContentId] [int] NULL,
	[startMediaId] [int] NULL,
 CONSTRAINT [PK_umbracoUserGroup] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2App]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2App](
	[userGroupId] [int] NOT NULL,
	[app] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_userGroup2App] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[app] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserGroup2NodePermission]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserGroup2NodePermission](
	[userGroupId] [int] NOT NULL,
	[nodeId] [int] NOT NULL,
	[permission] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_umbracoUserGroup2NodePermission] PRIMARY KEY CLUSTERED 
(
	[userGroupId] ASC,
	[nodeId] ASC,
	[permission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserLogin]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserLogin](
	[sessionId] [uniqueidentifier] NOT NULL,
	[userId] [int] NOT NULL,
	[loggedInUtc] [datetime] NOT NULL,
	[lastValidatedUtc] [datetime] NOT NULL,
	[loggedOutUtc] [datetime] NULL,
	[ipAddress] [nvarchar](255) NULL,
 CONSTRAINT [PK_umbracoUserLogin] PRIMARY KEY CLUSTERED 
(
	[sessionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[umbracoUserStartNode]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[umbracoUserStartNode](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NOT NULL,
	[startNode] [int] NOT NULL,
	[startNodeType] [int] NOT NULL,
 CONSTRAINT [PK_userStartNode] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrCountry]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrCountry](
	[id] [uniqueidentifier] NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[defaultCurrencyId] [uniqueidentifier] NULL,
	[defaultShippingMethodId] [uniqueidentifier] NULL,
	[defaultPaymentMethodId] [uniqueidentifier] NULL,
	[sortOrder] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
 CONSTRAINT [PK_vendrCountry] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrCurrency]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrCurrency](
	[id] [uniqueidentifier] NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[cultureName] [nvarchar](255) NOT NULL,
	[formatTemplate] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
 CONSTRAINT [PK_vendrCurrency] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrCurrencyAllowedCountry]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrCurrencyAllowedCountry](
	[id] [uniqueidentifier] NOT NULL,
	[currencyId] [uniqueidentifier] NOT NULL,
	[countryId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_vendrCurrencyAllowedCountry] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrDiscount]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrDiscount](
	[id] [uniqueidentifier] NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[type] [int] NOT NULL,
	[startDate] [datetime] NULL,
	[expiryDate] [datetime] NULL,
	[blockFurtherDiscounts] [bit] NOT NULL,
	[blockIfPreviousDiscounts] [bit] NOT NULL,
	[isActive] [bit] NOT NULL,
	[sortOrder] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[rules] [nvarchar](max) NULL,
	[rewards] [nvarchar](max) NULL,
 CONSTRAINT [PK_vendrDiscount] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrDiscountCode]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrDiscountCode](
	[id] [uniqueidentifier] NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[discountId] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[usageLimit] [int] NULL,
	[usageCount] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
	[isUnlimited] [bit] NOT NULL,
 CONSTRAINT [PK_vendrDiscountCode] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrEmailTemplate]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrEmailTemplate](
	[id] [uniqueidentifier] NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[sendToCustomer] [bit] NOT NULL,
	[subject] [nvarchar](255) NULL,
	[senderName] [nvarchar](255) NULL,
	[senderAddress] [nvarchar](255) NULL,
	[toAddresses] [nvarchar](255) NULL,
	[ccAddresses] [nvarchar](255) NULL,
	[bccAddresses] [nvarchar](255) NULL,
	[templateView] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
	[category] [int] NOT NULL,
 CONSTRAINT [PK_vendrEmailTemplate] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrFrozenPrice]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrFrozenPrice](
	[id] [uniqueidentifier] NOT NULL,
	[orderId] [uniqueidentifier] NOT NULL,
	[key] [nvarchar](255) NOT NULL,
	[currencyId] [uniqueidentifier] NOT NULL,
	[countryId] [uniqueidentifier] NULL,
	[regionId] [uniqueidentifier] NULL,
	[value] [decimal](19, 4) NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_vendrFrozenPrice] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrGiftCard]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrGiftCard](
	[id] [uniqueidentifier] NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[orderId] [uniqueidentifier] NULL,
	[code] [nvarchar](255) NOT NULL,
	[currencyId] [uniqueidentifier] NOT NULL,
	[originalAmount] [decimal](19, 4) NOT NULL,
	[remainingAmount] [decimal](19, 4) NOT NULL,
	[expiryDate] [datetime] NULL,
	[createDate] [datetime] NOT NULL,
	[isActive] [bit] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
 CONSTRAINT [PK_vendrGiftCard] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrGiftCardProperty]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrGiftCardProperty](
	[id] [uniqueidentifier] NOT NULL,
	[giftCardId] [uniqueidentifier] NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
	[isServerSideOnly] [bit] NOT NULL,
	[isReadOnly] [bit] NOT NULL,
 CONSTRAINT [PK_vendrGiftCardProperty] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrOrder]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrOrder](
	[id] [uniqueidentifier] NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[currencyId] [uniqueidentifier] NOT NULL,
	[taxClassId] [uniqueidentifier] NOT NULL,
	[languageIsoCode] [nvarchar](255) NOT NULL,
	[orderStatusId] [uniqueidentifier] NOT NULL,
	[orderStatusCode] [int] NOT NULL,
	[cartNumber] [nvarchar](255) NOT NULL,
	[orderNumber] [nvarchar](255) NULL,
	[customerReference] [nvarchar](255) NULL,
	[customerFirstName] [nvarchar](255) NULL,
	[customerLastName] [nvarchar](255) NULL,
	[customerEmail] [nvarchar](255) NULL,
	[createDate] [datetime] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[finalizedDate] [datetime] NULL,
	[paymentCountryId] [uniqueidentifier] NULL,
	[paymentRegionId] [uniqueidentifier] NULL,
	[paymentMethodId] [uniqueidentifier] NULL,
	[paymentTaxRate] [decimal](10, 8) NOT NULL,
	[paymentTotalPrice] [decimal](19, 4) NOT NULL,
	[paymentTotalPriceTax] [decimal](19, 4) NOT NULL,
	[shippingCountryId] [uniqueidentifier] NULL,
	[shippingRegionId] [uniqueidentifier] NULL,
	[shippingMethodId] [uniqueidentifier] NULL,
	[shippingTaxRate] [decimal](10, 8) NOT NULL,
	[shippingTotalPrice] [decimal](19, 4) NOT NULL,
	[shippingTotalPriceTax] [decimal](19, 4) NOT NULL,
	[transactionId] [nvarchar](255) NULL,
	[transactionFee] [decimal](19, 4) NULL,
	[paymentStatus] [int] NULL,
	[amountAuthorized] [decimal](19, 4) NULL,
	[taxRate] [decimal](10, 8) NOT NULL,
	[inconsistentPayment] [bit] NOT NULL,
	[copiedFromOrderId] [uniqueidentifier] NULL,
	[sortOrder] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
 CONSTRAINT [PK_vendrOrder] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrOrderAppliedDiscount]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrOrderAppliedDiscount](
	[id] [uniqueidentifier] NOT NULL,
	[orderId] [uniqueidentifier] NOT NULL,
	[orderLineId] [uniqueidentifier] NULL,
	[discountId] [uniqueidentifier] NOT NULL,
	[discountName] [nvarchar](255) NOT NULL,
	[type] [int] NOT NULL,
	[originalValue] [decimal](19, 4) NOT NULL,
	[originalTax] [decimal](19, 4) NOT NULL,
	[value] [decimal](19, 4) NOT NULL,
	[tax] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_vendrOrderAppliedDiscount] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrOrderAppliedDiscountCode]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrOrderAppliedDiscountCode](
	[id] [uniqueidentifier] NOT NULL,
	[orderId] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[isFulfilled] [bit] NOT NULL,
	[discountId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_vendrOrderAppliedDiscountCode] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrOrderAppliedGiftCard]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrOrderAppliedGiftCard](
	[id] [uniqueidentifier] NOT NULL,
	[orderId] [uniqueidentifier] NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[amount] [decimal](19, 4) NOT NULL,
	[giftCardId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_vendrOrderAppliedGiftCard] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrOrderLine]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrOrderLine](
	[id] [uniqueidentifier] NOT NULL,
	[orderId] [uniqueidentifier] NOT NULL,
	[parentOrderLineId] [uniqueidentifier] NULL,
	[taxClassId] [uniqueidentifier] NULL,
	[sku] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[productReference] [nvarchar](255) NOT NULL,
	[quantity] [decimal](18, 4) NOT NULL,
	[unitPriceBase] [decimal](19, 4) NULL,
	[unitPriceBaseTax] [decimal](19, 4) NULL,
	[unitPrice] [decimal](19, 4) NOT NULL,
	[unitPriceTax] [decimal](19, 4) NOT NULL,
	[taxRate] [decimal](10, 8) NOT NULL,
	[bundleId] [nvarchar](255) NULL,
	[copiedFromOrderLineId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_vendrOrderLine] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrOrderLineProperty]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrOrderLineProperty](
	[id] [uniqueidentifier] NOT NULL,
	[orderId] [uniqueidentifier] NOT NULL,
	[orderLineId] [uniqueidentifier] NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
	[isServerSideOnly] [bit] NOT NULL,
	[isReadOnly] [bit] NOT NULL,
 CONSTRAINT [PK_vendrOrderLineProperty] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrOrderProperty]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrOrderProperty](
	[id] [uniqueidentifier] NOT NULL,
	[orderId] [uniqueidentifier] NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[value] [nvarchar](max) NOT NULL,
	[isServerSideOnly] [bit] NOT NULL,
	[isReadOnly] [bit] NOT NULL,
 CONSTRAINT [PK_vendrOrderProperty] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrOrderStatus]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrOrderStatus](
	[id] [uniqueidentifier] NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[color] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
 CONSTRAINT [PK_vendrOrderStatus] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrPaymentMethod]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrPaymentMethod](
	[id] [uniqueidentifier] NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[sku] [nvarchar](255) NOT NULL,
	[taxClassId] [uniqueidentifier] NULL,
	[imageId] [nvarchar](255) NULL,
	[paymentProviderAlias] [nvarchar](255) NOT NULL,
	[canFetchPaymentStatuses] [bit] NOT NULL,
	[canCapturePayments] [bit] NOT NULL,
	[canRefundPayments] [bit] NOT NULL,
	[canCancelPayments] [bit] NOT NULL,
	[sortOrder] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
 CONSTRAINT [PK_vendrPaymentMethod] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrPaymentMethodAllowedCountryRegion]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrPaymentMethodAllowedCountryRegion](
	[id] [uniqueidentifier] NOT NULL,
	[paymentMethodId] [uniqueidentifier] NOT NULL,
	[countryId] [uniqueidentifier] NOT NULL,
	[regionId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_vendrPaymentMethodAllowedCountryRegion] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrPaymentMethodCountryRegionPrice]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrPaymentMethodCountryRegionPrice](
	[id] [uniqueidentifier] NOT NULL,
	[paymentMethodId] [uniqueidentifier] NOT NULL,
	[countryId] [uniqueidentifier] NULL,
	[regionId] [uniqueidentifier] NULL,
	[currencyId] [uniqueidentifier] NOT NULL,
	[price] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_vendrPaymentMethodCountryRegionPrice] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrPaymentMethodPaymentProviderSetting]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrPaymentMethodPaymentProviderSetting](
	[id] [uniqueidentifier] NOT NULL,
	[paymentMethodId] [uniqueidentifier] NOT NULL,
	[key] [nvarchar](255) NOT NULL,
	[value] [nvarchar](max) NULL,
 CONSTRAINT [PK_vendrPaymentMethodPaymentProviderSetting] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrRegion]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrRegion](
	[id] [uniqueidentifier] NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[countryId] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[defaultShippingMethodId] [uniqueidentifier] NULL,
	[defaultPaymentMethodId] [uniqueidentifier] NULL,
	[sortOrder] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
 CONSTRAINT [PK_vendrRegion] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrShippingMethod]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrShippingMethod](
	[id] [uniqueidentifier] NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[sku] [nvarchar](255) NOT NULL,
	[taxClassId] [uniqueidentifier] NULL,
	[imageId] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
 CONSTRAINT [PK_vendrShippingMethod] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrShippingMethodAllowedCountryRegion]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrShippingMethodAllowedCountryRegion](
	[id] [uniqueidentifier] NOT NULL,
	[shippingMethodId] [uniqueidentifier] NOT NULL,
	[countryId] [uniqueidentifier] NOT NULL,
	[regionId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_vendrShippingMethodAllowedCountryRegion] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrShippingMethodCountryRegionPrice]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrShippingMethodCountryRegionPrice](
	[id] [uniqueidentifier] NOT NULL,
	[shippingMethodId] [uniqueidentifier] NOT NULL,
	[countryId] [uniqueidentifier] NULL,
	[regionId] [uniqueidentifier] NULL,
	[currencyId] [uniqueidentifier] NOT NULL,
	[price] [decimal](19, 4) NOT NULL,
 CONSTRAINT [PK_vendrShippingMethodCountryRegionPrice] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrStock]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrStock](
	[productReference] [nvarchar](255) NOT NULL,
	[stock] [decimal](18, 6) NULL,
 CONSTRAINT [PK_vendrStock] PRIMARY KEY NONCLUSTERED 
(
	[productReference] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrStore]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrStore](
	[id] [uniqueidentifier] NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[defaultCountryId] [uniqueidentifier] NULL,
	[defaultTaxClassId] [uniqueidentifier] NULL,
	[defaultOrderStatusId] [uniqueidentifier] NULL,
	[errorOrderStatusId] [uniqueidentifier] NULL,
	[pricesIncludeTax] [bit] NOT NULL,
	[cookieTimeoutInMinutes] [int] NULL,
	[confirmationEmailTemplateId] [uniqueidentifier] NULL,
	[errorEmailTemplateId] [uniqueidentifier] NULL,
	[cartNumberTemplate] [nvarchar](255) NULL,
	[orderNumberTemplate] [nvarchar](255) NULL,
	[productPropertyAliases] [nvarchar](255) NULL,
	[productUniquenessPropertyAliases] [nvarchar](255) NULL,
	[shareStockFromStoreId] [uniqueidentifier] NULL,
	[giftCardCodeTemplate] [nvarchar](255) NULL,
	[giftCardCodeLength] [int] NOT NULL,
	[giftCardDaysValid] [int] NOT NULL,
	[orderEditorConfig] [nvarchar](255) NULL,
	[sortOrder] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
	[giftCardActivationMethod] [int] NOT NULL,
	[giftCardActivationOrderStatusId] [uniqueidentifier] NULL,
	[defaultGiftCardEmailTemplateId] [uniqueidentifier] NULL,
	[giftCardPropertyAliases] [nvarchar](255) NULL,
 CONSTRAINT [PK_vendrStore] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrStoreAllowedUser]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrStoreAllowedUser](
	[id] [uniqueidentifier] NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[userId] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_vendrStoreAllowedUser] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrStoreAllowedUserRole]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrStoreAllowedUserRole](
	[id] [uniqueidentifier] NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[role] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_vendrStoreAllowedUserRole] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrTaxClass]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrTaxClass](
	[id] [uniqueidentifier] NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[storeId] [uniqueidentifier] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[defaultTaxRate] [decimal](10, 8) NOT NULL,
	[sortOrder] [int] NOT NULL,
	[deletedTimestamp] [bigint] NOT NULL,
 CONSTRAINT [PK_vendrTaxClass] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vendrTaxClassCountryRegionTaxRate]    Script Date: 7/29/2020 10:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendrTaxClassCountryRegionTaxRate](
	[id] [uniqueidentifier] NOT NULL,
	[taxClassId] [uniqueidentifier] NOT NULL,
	[countryId] [uniqueidentifier] NOT NULL,
	[regionId] [uniqueidentifier] NULL,
	[taxRate] [decimal](10, 8) NOT NULL,
 CONSTRAINT [PK_vendrTaxClassCountryRegionTaxRate] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsContentType]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsContentType] ON [dbo].[cmsContentType]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsContentType_icon]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_cmsContentType_icon] ON [dbo].[cmsContentType]
(
	[icon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsDictionary_id]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsDictionary_id] ON [dbo].[cmsDictionary]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsDictionary_key]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_cmsDictionary_key] ON [dbo].[cmsDictionary]
(
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacro_UniqueId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacro_UniqueId] ON [dbo].[cmsMacro]
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMacroPropertyAlias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroPropertyAlias] ON [dbo].[cmsMacro]
(
	[macroAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMacroProperty_Alias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_Alias] ON [dbo].[cmsMacroProperty]
(
	[macro] ASC,
	[macroPropertyAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsMacroProperty_UniquePropertyId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsMacroProperty_UniquePropertyId] ON [dbo].[cmsMacroProperty]
(
	[uniquePropertyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsMember_LoginName]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_cmsMember_LoginName] ON [dbo].[cmsMember]
(
	[LoginName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsPropertyTypeAlias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_cmsPropertyTypeAlias] ON [dbo].[cmsPropertyType]
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeUniqueID]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeUniqueID] ON [dbo].[cmsPropertyType]
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsPropertyTypeGroupUniqueID]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsPropertyTypeGroupUniqueID] ON [dbo].[cmsPropertyTypeGroup]
(
	[uniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_cmsTags]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTags] ON [dbo].[cmsTags]
(
	[group] ASC,
	[tag] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTags_LanguageId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_cmsTags_LanguageId] ON [dbo].[cmsTags]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_cmsTemplate_nodeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_cmsTemplate_nodeId] ON [dbo].[cmsTemplate]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoAccess_nodeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccess_nodeId] ON [dbo].[umbracoAccess]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoAccessRule]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoAccessRule] ON [dbo].[umbracoAccessRule]
(
	[ruleValue] ASC,
	[ruleType] ASC,
	[accessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersion_NodeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersion_NodeId] ON [dbo].[umbracoContentVersion]
(
	[nodeId] ASC,
	[current] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_LanguageId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoContentVersionCultureVariation_LanguageId] ON [dbo].[umbracoContentVersionCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoContentVersionCultureVariation_VersionId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoContentVersionCultureVariation_VersionId] ON [dbo].[umbracoContentVersionCultureVariation]
(
	[versionId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocument_Published]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocument_Published] ON [dbo].[umbracoDocument]
(
	[published] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocumentCultureVariation_LanguageId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoDocumentCultureVariation_LanguageId] ON [dbo].[umbracoDocumentCultureVariation]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoDocumentCultureVariation_NodeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoDocumentCultureVariation_NodeId] ON [dbo].[umbracoDocumentCultureVariation]
(
	[nodeId] ASC,
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLanguage_fallbackLanguageId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLanguage_fallbackLanguageId] ON [dbo].[umbracoLanguage]
(
	[fallbackLanguageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoLanguage_languageISOCode]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoLanguage_languageISOCode] ON [dbo].[umbracoLanguage]
(
	[languageISOCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoLog]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoLog] ON [dbo].[umbracoLog]
(
	[NodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoMediaVersion]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoMediaVersion] ON [dbo].[umbracoMediaVersion]
(
	[id] ASC,
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_ObjectType]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ObjectType] ON [dbo].[umbracoNode]
(
	[nodeObjectType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_ParentId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_ParentId] ON [dbo].[umbracoNode]
(
	[parentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoNode_Path]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Path] ON [dbo].[umbracoNode]
(
	[path] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_Trashed]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoNode_Trashed] ON [dbo].[umbracoNode]
(
	[trashed] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoNode_UniqueId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoNode_UniqueId] ON [dbo].[umbracoNode]
(
	[uniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoPropertyData_LanguageId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_LanguageId] ON [dbo].[umbracoPropertyData]
(
	[languageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoPropertyData_PropertyTypeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_PropertyTypeId] ON [dbo].[umbracoPropertyData]
(
	[propertyTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoPropertyData_Segment]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoPropertyData_Segment] ON [dbo].[umbracoPropertyData]
(
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoPropertyData_VersionId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoPropertyData_VersionId] ON [dbo].[umbracoPropertyData]
(
	[versionId] ASC,
	[propertyTypeId] ASC,
	[languageId] ASC,
	[segment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRedirectUrl]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRedirectUrl] ON [dbo].[umbracoRedirectUrl]
(
	[urlHash] ASC,
	[contentKey] ASC,
	[culture] ASC,
	[createDateUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelation_parentChildType]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelation_parentChildType] ON [dbo].[umbracoRelation]
(
	[parentId] ASC,
	[childId] ASC,
	[relType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRelationType_alias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_alias] ON [dbo].[umbracoRelationType]
(
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoRelationType_name]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_name] ON [dbo].[umbracoRelationType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoRelationType_UniqueId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoRelationType_UniqueId] ON [dbo].[umbracoRelationType]
(
	[typeUniqueId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_computerName]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_computerName] ON [dbo].[umbracoServer]
(
	[computerName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoServer_isActive]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoServer_isActive] ON [dbo].[umbracoServer]
(
	[isActive] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUser_userLogin]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser_userLogin] ON [dbo].[umbracoUser]
(
	[userLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupAlias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupAlias] ON [dbo].[umbracoUserGroup]
(
	[userGroupAlias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_umbracoUserGroup_userGroupName]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserGroup_userGroupName] ON [dbo].[umbracoUserGroup]
(
	[userGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUser2NodePermission_nodeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUser2NodePermission_nodeId] ON [dbo].[umbracoUserGroup2NodePermission]
(
	[nodeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserLogin_lastValidatedUtc]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE NONCLUSTERED INDEX [IX_umbracoUserLogin_lastValidatedUtc] ON [dbo].[umbracoUserLogin]
(
	[lastValidatedUtc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_umbracoUserStartNode_startNodeType]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_umbracoUserStartNode_startNodeType] ON [dbo].[umbracoUserStartNode]
(
	[startNodeType] ASC,
	[startNode] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrCountry_code]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrCountry_code] ON [dbo].[vendrCountry]
(
	[storeId] ASC,
	[code] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrCurrency_code]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrCurrency_code] ON [dbo].[vendrCurrency]
(
	[storeId] ASC,
	[code] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_vendrCurrencyAllowedCountry_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrCurrencyAllowedCountry_compositeId] ON [dbo].[vendrCurrencyAllowedCountry]
(
	[currencyId] ASC,
	[countryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrDiscount_alias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrDiscount_alias] ON [dbo].[vendrDiscount]
(
	[storeId] ASC,
	[alias] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrDiscountCode_code]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrDiscountCode_code] ON [dbo].[vendrDiscountCode]
(
	[storeId] ASC,
	[code] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrEmailTemplate_alias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrEmailTemplate_alias] ON [dbo].[vendrEmailTemplate]
(
	[storeId] ASC,
	[alias] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrFrozenPrice_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrFrozenPrice_compositeId] ON [dbo].[vendrFrozenPrice]
(
	[orderId] ASC,
	[key] ASC,
	[countryId] ASC,
	[regionId] ASC,
	[currencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrGiftCard_code]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrGiftCard_code] ON [dbo].[vendrGiftCard]
(
	[code] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrGiftCardProperty_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrGiftCardProperty_compositeId] ON [dbo].[vendrGiftCardProperty]
(
	[giftCardId] ASC,
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_vendrOrderAppliedDiscount_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrOrderAppliedDiscount_compositeId] ON [dbo].[vendrOrderAppliedDiscount]
(
	[orderId] ASC,
	[orderLineId] ASC,
	[discountId] ASC,
	[type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrOrderAppliedDiscountCode_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrOrderAppliedDiscountCode_compositeId] ON [dbo].[vendrOrderAppliedDiscountCode]
(
	[orderId] ASC,
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrOrderAppliedGiftCard_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrOrderAppliedGiftCard_compositeId] ON [dbo].[vendrOrderAppliedGiftCard]
(
	[orderId] ASC,
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrOrderLineProperty_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrOrderLineProperty_compositeId] ON [dbo].[vendrOrderLineProperty]
(
	[orderId] ASC,
	[orderLineId] ASC,
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrOrderProperty_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrOrderProperty_compositeId] ON [dbo].[vendrOrderProperty]
(
	[orderId] ASC,
	[alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrOrderStatus_alias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrOrderStatus_alias] ON [dbo].[vendrOrderStatus]
(
	[storeId] ASC,
	[alias] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrPaymentMethod_alias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrPaymentMethod_alias] ON [dbo].[vendrPaymentMethod]
(
	[storeId] ASC,
	[alias] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrPaymentMethod_sku]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrPaymentMethod_sku] ON [dbo].[vendrPaymentMethod]
(
	[storeId] ASC,
	[sku] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_vendrPaymentMethodAllowedCountryRegion_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrPaymentMethodAllowedCountryRegion_compositeId] ON [dbo].[vendrPaymentMethodAllowedCountryRegion]
(
	[paymentMethodId] ASC,
	[countryId] ASC,
	[regionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_vendrPaymentMethodCountryRegionPrice_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrPaymentMethodCountryRegionPrice_compositeId] ON [dbo].[vendrPaymentMethodCountryRegionPrice]
(
	[paymentMethodId] ASC,
	[countryId] ASC,
	[regionId] ASC,
	[currencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrPaymentMethodPaymentProviderSetting_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrPaymentMethodPaymentProviderSetting_compositeId] ON [dbo].[vendrPaymentMethodPaymentProviderSetting]
(
	[paymentMethodId] ASC,
	[key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrRegion_code]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrRegion_code] ON [dbo].[vendrRegion]
(
	[storeId] ASC,
	[code] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrShippingMethod_alias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrShippingMethod_alias] ON [dbo].[vendrShippingMethod]
(
	[storeId] ASC,
	[alias] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrShippingMethod_sku]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrShippingMethod_sku] ON [dbo].[vendrShippingMethod]
(
	[storeId] ASC,
	[sku] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_vendrShippingMethodAllowedCountryRegion_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrShippingMethodAllowedCountryRegion_compositeId] ON [dbo].[vendrShippingMethodAllowedCountryRegion]
(
	[shippingMethodId] ASC,
	[countryId] ASC,
	[regionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_vendrShippingMethodCountryRegionPrice_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrShippingMethodCountryRegionPrice_compositeId] ON [dbo].[vendrShippingMethodCountryRegionPrice]
(
	[shippingMethodId] ASC,
	[countryId] ASC,
	[regionId] ASC,
	[currencyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrStore_alias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrStore_alias] ON [dbo].[vendrStore]
(
	[alias] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrStoreAllowedUser_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrStoreAllowedUser_compositeId] ON [dbo].[vendrStoreAllowedUser]
(
	[storeId] ASC,
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrStoreAllowedUserRole_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrStoreAllowedUserRole_compositeId] ON [dbo].[vendrStoreAllowedUserRole]
(
	[storeId] ASC,
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_vendrTaxClass_alias]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrTaxClass_alias] ON [dbo].[vendrTaxClass]
(
	[storeId] ASC,
	[alias] ASC,
	[deletedTimestamp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_vendrTaxClassCountryRegionTaxRate_compositeId]    Script Date: 7/29/2020 10:45:19 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_vendrTaxClassCountryRegionTaxRate_compositeId] ON [dbo].[vendrTaxClassCountryRegionTaxRate]
(
	[taxClassId] ASC,
	[countryId] ASC,
	[regionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_thumbnail]  DEFAULT ('folder.png') FOR [thumbnail]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isContainer]  DEFAULT ('0') FOR [isContainer]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_isElement]  DEFAULT ('0') FOR [isElement]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_allowAtRoot]  DEFAULT ('0') FOR [allowAtRoot]
GO
ALTER TABLE [dbo].[cmsContentType] ADD  CONSTRAINT [DF_cmsContentType_variations]  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] ADD  CONSTRAINT [df_cmsContentTypeAllowedContentType_sortOrder]  DEFAULT ('0') FOR [SortOrder]
GO
ALTER TABLE [dbo].[cmsDocumentType] ADD  CONSTRAINT [DF_cmsDocumentType_IsDefault]  DEFAULT ('0') FOR [IsDefault]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroUseInEditor]  DEFAULT ('0') FOR [macroUseInEditor]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroRefreshRate]  DEFAULT ('0') FOR [macroRefreshRate]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCacheByPage]  DEFAULT ('1') FOR [macroCacheByPage]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroCachePersonalized]  DEFAULT ('0') FOR [macroCachePersonalized]
GO
ALTER TABLE [dbo].[cmsMacro] ADD  CONSTRAINT [DF_cmsMacro_macroDontRender]  DEFAULT ('0') FOR [macroDontRender]
GO
ALTER TABLE [dbo].[cmsMacroProperty] ADD  CONSTRAINT [DF_cmsMacroProperty_macroPropertySortOrder]  DEFAULT ('0') FOR [macroPropertySortOrder]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Email]  DEFAULT ('''') FOR [Email]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_LoginName]  DEFAULT ('''') FOR [LoginName]
GO
ALTER TABLE [dbo].[cmsMember] ADD  CONSTRAINT [DF_cmsMember_Password]  DEFAULT ('''') FOR [Password]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_memberCanEdit]  DEFAULT ('0') FOR [memberCanEdit]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_viewOnProfile]  DEFAULT ('0') FOR [viewOnProfile]
GO
ALTER TABLE [dbo].[cmsMemberType] ADD  CONSTRAINT [DF_cmsMemberType_isSensitive]  DEFAULT ('0') FOR [isSensitive]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_variations]  DEFAULT ('1') FOR [variations]
GO
ALTER TABLE [dbo].[cmsPropertyType] ADD  CONSTRAINT [DF_cmsPropertyType_UniqueID]  DEFAULT (newid()) FOR [UniqueID]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] ADD  CONSTRAINT [DF_cmsPropertyTypeGroup_uniqueID]  DEFAULT (newid()) FOR [uniqueID]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccess] ADD  CONSTRAINT [DF_umbracoAccess_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoAccessRule] ADD  CONSTRAINT [DF_umbracoAccessRule_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoAudit] ADD  CONSTRAINT [DF_umbracoAudit_eventDateUtc]  DEFAULT (getdate()) FOR [eventDateUtc]
GO
ALTER TABLE [dbo].[umbracoCacheInstruction] ADD  CONSTRAINT [DF_umbracoCacheInstruction_instructionCount]  DEFAULT ('1') FOR [instructionCount]
GO
ALTER TABLE [dbo].[umbracoConsent] ADD  CONSTRAINT [DF_umbracoConsent_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoContentVersion] ADD  CONSTRAINT [DF_umbracoContentVersion_versionDate]  DEFAULT (getdate()) FOR [versionDate]
GO
ALTER TABLE [dbo].[umbracoExternalLogin] ADD  CONSTRAINT [DF_umbracoExternalLogin_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoKeyValue] ADD  CONSTRAINT [DF_umbracoKeyValue_updated]  DEFAULT (getdate()) FOR [updated]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_isDefaultVariantLang]  DEFAULT ('0') FOR [isDefaultVariantLang]
GO
ALTER TABLE [dbo].[umbracoLanguage] ADD  CONSTRAINT [DF_umbracoLanguage_mandatory]  DEFAULT ('0') FOR [mandatory]
GO
ALTER TABLE [dbo].[umbracoLog] ADD  CONSTRAINT [DF_umbracoLog_Datestamp]  DEFAULT (getdate()) FOR [Datestamp]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_uniqueId]  DEFAULT (newid()) FOR [uniqueId]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_trashed]  DEFAULT ('0') FOR [trashed]
GO
ALTER TABLE [dbo].[umbracoNode] ADD  CONSTRAINT [DF_umbracoNode_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoRelation] ADD  CONSTRAINT [DF_umbracoRelation_datetime]  DEFAULT (getdate()) FOR [datetime]
GO
ALTER TABLE [dbo].[umbracoServer] ADD  CONSTRAINT [DF_umbracoServer_registeredDate]  DEFAULT (getdate()) FOR [registeredDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userDisabled]  DEFAULT ('0') FOR [userDisabled]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_userNoConsole]  DEFAULT ('0') FOR [userNoConsole]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUser] ADD  CONSTRAINT [DF_umbracoUser_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[umbracoUserGroup] ADD  CONSTRAINT [DF_umbracoUserGroup_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[vendrCountry] ADD  CONSTRAINT [DF_vendrCountry_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[vendrCountry] ADD  CONSTRAINT [DF_vendrCountry_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrCurrency] ADD  CONSTRAINT [DF_vendrCurrency_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[vendrCurrency] ADD  CONSTRAINT [DF_vendrCurrency_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrCurrencyAllowedCountry] ADD  CONSTRAINT [DF_vendrCurrencyAllowedCountry_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrDiscount] ADD  CONSTRAINT [DF_vendrDiscount_blockFurtherDiscounts]  DEFAULT ('False') FOR [blockFurtherDiscounts]
GO
ALTER TABLE [dbo].[vendrDiscount] ADD  CONSTRAINT [DF_vendrDiscount_blockIfPreviousDiscounts]  DEFAULT ('False') FOR [blockIfPreviousDiscounts]
GO
ALTER TABLE [dbo].[vendrDiscount] ADD  CONSTRAINT [DF_vendrDiscount_isActive]  DEFAULT ('False') FOR [isActive]
GO
ALTER TABLE [dbo].[vendrDiscount] ADD  CONSTRAINT [DF_vendrDiscount_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[vendrDiscount] ADD  CONSTRAINT [DF_vendrDiscount_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrDiscountCode] ADD  CONSTRAINT [DF_vendrDiscountCode_usageCount]  DEFAULT ('0') FOR [usageCount]
GO
ALTER TABLE [dbo].[vendrDiscountCode] ADD  CONSTRAINT [DF_vendrDiscountCode_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrEmailTemplate] ADD  CONSTRAINT [DF_vendrEmailTemplate_sendToCustomer]  DEFAULT ('False') FOR [sendToCustomer]
GO
ALTER TABLE [dbo].[vendrEmailTemplate] ADD  CONSTRAINT [DF_vendrEmailTemplate_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[vendrEmailTemplate] ADD  CONSTRAINT [DF_vendrEmailTemplate_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrFrozenPrice] ADD  CONSTRAINT [DF_vendrFrozenPrice_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrFrozenPrice] ADD  CONSTRAINT [DF_vendrFrozenPrice_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[vendrGiftCard] ADD  CONSTRAINT [remainingAmount_default]  DEFAULT ((0)) FOR [remainingAmount]
GO
ALTER TABLE [dbo].[vendrGiftCard] ADD  CONSTRAINT [DF_vendrGiftCard_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[vendrGiftCard] ADD  CONSTRAINT [DF_vendrGiftCard_isActive]  DEFAULT ('False') FOR [isActive]
GO
ALTER TABLE [dbo].[vendrGiftCard] ADD  CONSTRAINT [DF_vendrGiftCard_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrGiftCardProperty] ADD  CONSTRAINT [DF_vendrGiftCardProperty_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrGiftCardProperty] ADD  CONSTRAINT [DF_vendrGiftCardProperty_isServerSideOnly]  DEFAULT ('False') FOR [isServerSideOnly]
GO
ALTER TABLE [dbo].[vendrGiftCardProperty] ADD  CONSTRAINT [DF_vendrGiftCardProperty_isReadOnly]  DEFAULT ('False') FOR [isReadOnly]
GO
ALTER TABLE [dbo].[vendrOrder] ADD  CONSTRAINT [DF_vendrOrder_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[vendrOrder] ADD  CONSTRAINT [DF_vendrOrder_updateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[vendrOrder] ADD  CONSTRAINT [DF_vendrOrder_paymentTaxRate]  DEFAULT ('0') FOR [paymentTaxRate]
GO
ALTER TABLE [dbo].[vendrOrder] ADD  CONSTRAINT [DF_vendrOrder_paymentTotalPrice]  DEFAULT ('0') FOR [paymentTotalPrice]
GO
ALTER TABLE [dbo].[vendrOrder] ADD  CONSTRAINT [DF_vendrOrder_paymentTotalPriceTax]  DEFAULT ('0') FOR [paymentTotalPriceTax]
GO
ALTER TABLE [dbo].[vendrOrder] ADD  CONSTRAINT [DF_vendrOrder_shippingTaxRate]  DEFAULT ('0') FOR [shippingTaxRate]
GO
ALTER TABLE [dbo].[vendrOrder] ADD  CONSTRAINT [DF_vendrOrder_shippingTotalPrice]  DEFAULT ('0') FOR [shippingTotalPrice]
GO
ALTER TABLE [dbo].[vendrOrder] ADD  CONSTRAINT [DF_vendrOrder_shippingTotalPriceTax]  DEFAULT ('0') FOR [shippingTotalPriceTax]
GO
ALTER TABLE [dbo].[vendrOrder] ADD  CONSTRAINT [DF_vendrOrder_inconsistentPayment]  DEFAULT ('False') FOR [inconsistentPayment]
GO
ALTER TABLE [dbo].[vendrOrder] ADD  CONSTRAINT [DF_vendrOrder_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[vendrOrder] ADD  CONSTRAINT [DF_vendrOrder_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscount] ADD  CONSTRAINT [DF_vendrOrderAppliedDiscount_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscountCode] ADD  CONSTRAINT [DF_vendrOrderAppliedDiscountCode_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscountCode] ADD  CONSTRAINT [DF_vendrOrderAppliedDiscountCode_isFulfilled]  DEFAULT ('False') FOR [isFulfilled]
GO
ALTER TABLE [dbo].[vendrOrderAppliedGiftCard] ADD  CONSTRAINT [DF_vendrOrderAppliedGiftCard_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrOrderLine] ADD  CONSTRAINT [DF__vendrOrderLine__quantity]  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[vendrOrderLine] ADD  CONSTRAINT [DF_vendrOrderLine_unitPriceBase]  DEFAULT ('0') FOR [unitPriceBase]
GO
ALTER TABLE [dbo].[vendrOrderLine] ADD  CONSTRAINT [DF_vendrOrderLine_unitPriceBaseTax]  DEFAULT ('0') FOR [unitPriceBaseTax]
GO
ALTER TABLE [dbo].[vendrOrderLine] ADD  CONSTRAINT [DF_vendrOrderLine_unitPrice]  DEFAULT ('0') FOR [unitPrice]
GO
ALTER TABLE [dbo].[vendrOrderLine] ADD  CONSTRAINT [DF_vendrOrderLine_unitPriceTax]  DEFAULT ('0') FOR [unitPriceTax]
GO
ALTER TABLE [dbo].[vendrOrderLineProperty] ADD  CONSTRAINT [DF_vendrOrderLineProperty_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrOrderLineProperty] ADD  CONSTRAINT [DF_vendrOrderLineProperty_isServerSideOnly]  DEFAULT ('False') FOR [isServerSideOnly]
GO
ALTER TABLE [dbo].[vendrOrderLineProperty] ADD  CONSTRAINT [DF_vendrOrderLineProperty_isReadOnly]  DEFAULT ('False') FOR [isReadOnly]
GO
ALTER TABLE [dbo].[vendrOrderProperty] ADD  CONSTRAINT [DF_vendrOrderProperty_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrOrderProperty] ADD  CONSTRAINT [DF_vendrOrderProperty_isServerSideOnly]  DEFAULT ('False') FOR [isServerSideOnly]
GO
ALTER TABLE [dbo].[vendrOrderProperty] ADD  CONSTRAINT [DF_vendrOrderProperty_isReadOnly]  DEFAULT ('False') FOR [isReadOnly]
GO
ALTER TABLE [dbo].[vendrOrderStatus] ADD  CONSTRAINT [DF_vendrOrderStatus_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[vendrOrderStatus] ADD  CONSTRAINT [DF_vendrOrderStatus_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrPaymentMethod] ADD  CONSTRAINT [DF_vendrPaymentMethod_canFetchPaymentStatuses]  DEFAULT ('False') FOR [canFetchPaymentStatuses]
GO
ALTER TABLE [dbo].[vendrPaymentMethod] ADD  CONSTRAINT [DF_vendrPaymentMethod_canCapturePayments]  DEFAULT ('False') FOR [canCapturePayments]
GO
ALTER TABLE [dbo].[vendrPaymentMethod] ADD  CONSTRAINT [DF_vendrPaymentMethod_canRefundPayments]  DEFAULT ('False') FOR [canRefundPayments]
GO
ALTER TABLE [dbo].[vendrPaymentMethod] ADD  CONSTRAINT [DF_vendrPaymentMethod_canCancelPayments]  DEFAULT ('False') FOR [canCancelPayments]
GO
ALTER TABLE [dbo].[vendrPaymentMethod] ADD  CONSTRAINT [DF_vendrPaymentMethod_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[vendrPaymentMethod] ADD  CONSTRAINT [DF_vendrPaymentMethod_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrPaymentMethodAllowedCountryRegion] ADD  CONSTRAINT [DF_vendrPaymentMethodAllowedCountryRegion_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrPaymentMethodCountryRegionPrice] ADD  CONSTRAINT [DF_vendrPaymentMethodCountryRegionPrice_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrPaymentMethodPaymentProviderSetting] ADD  CONSTRAINT [DF_vendrPaymentMethodPaymentProviderSetting_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrRegion] ADD  CONSTRAINT [DF_vendrRegion_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[vendrRegion] ADD  CONSTRAINT [DF_vendrRegion_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrShippingMethod] ADD  CONSTRAINT [DF_vendrShippingMethod_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[vendrShippingMethod] ADD  CONSTRAINT [DF_vendrShippingMethod_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrShippingMethodAllowedCountryRegion] ADD  CONSTRAINT [DF_vendrShippingMethodAllowedCountryRegion_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrShippingMethodCountryRegionPrice] ADD  CONSTRAINT [DF_vendrShippingMethodCountryRegionPrice_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrStore] ADD  CONSTRAINT [DF_vendrStore_pricesIncludeTax]  DEFAULT ('False') FOR [pricesIncludeTax]
GO
ALTER TABLE [dbo].[vendrStore] ADD  CONSTRAINT [DF_vendrStore_cartNumberTemplate]  DEFAULT ('CART-') FOR [cartNumberTemplate]
GO
ALTER TABLE [dbo].[vendrStore] ADD  CONSTRAINT [DF_vendrStore_orderNumberTemplate]  DEFAULT ('ORDER-') FOR [orderNumberTemplate]
GO
ALTER TABLE [dbo].[vendrStore] ADD  CONSTRAINT [DF_vendrStore_giftCardCodeLength]  DEFAULT ('0') FOR [giftCardCodeLength]
GO
ALTER TABLE [dbo].[vendrStore] ADD  CONSTRAINT [DF_vendrStore_giftCardDaysValid]  DEFAULT ('0') FOR [giftCardDaysValid]
GO
ALTER TABLE [dbo].[vendrStore] ADD  CONSTRAINT [DF_vendrStore_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[vendrStore] ADD  CONSTRAINT [DF_vendrStore_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrStoreAllowedUser] ADD  CONSTRAINT [DF_vendrStoreAllowedUser_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrStoreAllowedUserRole] ADD  CONSTRAINT [DF_vendrStoreAllowedUserRole_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[vendrTaxClass] ADD  CONSTRAINT [DF_vendrTaxClass_sortOrder]  DEFAULT ('0') FOR [sortOrder]
GO
ALTER TABLE [dbo].[vendrTaxClass] ADD  CONSTRAINT [DF_vendrTaxClass_deletedTimestamp]  DEFAULT ('0') FOR [deletedTimestamp]
GO
ALTER TABLE [dbo].[vendrTaxClassCountryRegionTaxRate] ADD  CONSTRAINT [DF_vendrTaxClassCountryRegionTaxRate_id]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[cmsContentNu]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[cmsContentNu] CHECK CONSTRAINT [FK_cmsContentNu_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType] CHECK CONSTRAINT [FK_cmsContentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child] FOREIGN KEY([childContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_child]
GO
ALTER TABLE [dbo].[cmsContentType2ContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent] FOREIGN KEY([parentContentTypeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsContentType2ContentType] CHECK CONSTRAINT [FK_cmsContentType2ContentType_umbracoNode_parent]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType] FOREIGN KEY([Id])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType]
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1] FOREIGN KEY([AllowedId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsContentTypeAllowedContentType] CHECK CONSTRAINT [FK_cmsContentTypeAllowedContentType_cmsContentType1]
GO
ALTER TABLE [dbo].[cmsDictionary]  WITH CHECK ADD  CONSTRAINT [FK_cmsDictionary_cmsDictionary_id] FOREIGN KEY([parent])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsDictionary] CHECK CONSTRAINT [FK_cmsDictionary_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId] FOREIGN KEY([templateNodeId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[cmsDocumentType]  WITH CHECK ADD  CONSTRAINT [FK_cmsDocumentType_umbracoNode_id] FOREIGN KEY([contentTypeNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsDocumentType] CHECK CONSTRAINT [FK_cmsDocumentType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id] FOREIGN KEY([UniqueId])
REFERENCES [dbo].[cmsDictionary] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_cmsDictionary_id]
GO
ALTER TABLE [dbo].[cmsLanguageText]  WITH CHECK ADD  CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsLanguageText] CHECK CONSTRAINT [FK_cmsLanguageText_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsMacroProperty]  WITH CHECK ADD  CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id] FOREIGN KEY([macro])
REFERENCES [dbo].[cmsMacro] ([id])
GO
ALTER TABLE [dbo].[cmsMacroProperty] CHECK CONSTRAINT [FK_cmsMacroProperty_cmsMacro_id]
GO
ALTER TABLE [dbo].[cmsMember]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember] CHECK CONSTRAINT [FK_cmsMember_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId] FOREIGN KEY([Member])
REFERENCES [dbo].[cmsMember] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_cmsMember_nodeId]
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id] FOREIGN KEY([MemberGroup])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMember2MemberGroup] CHECK CONSTRAINT [FK_cmsMember2MemberGroup_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId] FOREIGN KEY([NodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsMemberType]  WITH CHECK ADD  CONSTRAINT [FK_cmsMemberType_umbracoNode_id] FOREIGN KEY([NodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsMemberType] CHECK CONSTRAINT [FK_cmsMemberType_umbracoNode_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id] FOREIGN KEY([propertyTypeGroupId])
REFERENCES [dbo].[cmsPropertyTypeGroup] ([id])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_cmsPropertyTypeGroup_id]
GO
ALTER TABLE [dbo].[cmsPropertyType]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId] FOREIGN KEY([dataTypeId])
REFERENCES [dbo].[umbracoDataType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyType] CHECK CONSTRAINT [FK_cmsPropertyType_umbracoDataType_nodeId]
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup]  WITH CHECK ADD  CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId] FOREIGN KEY([contenttypeNodeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[cmsPropertyTypeGroup] CHECK CONSTRAINT [FK_cmsPropertyTypeGroup_cmsContentType_nodeId]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsContent] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsContent]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsPropertyType]
GO
ALTER TABLE [dbo].[cmsTagRelationship]  WITH CHECK ADD  CONSTRAINT [FK_cmsTagRelationship_cmsTags_id] FOREIGN KEY([tagId])
REFERENCES [dbo].[cmsTags] ([id])
GO
ALTER TABLE [dbo].[cmsTagRelationship] CHECK CONSTRAINT [FK_cmsTagRelationship_cmsTags_id]
GO
ALTER TABLE [dbo].[cmsTags]  WITH CHECK ADD  CONSTRAINT [FK_cmsTags_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[cmsTags] CHECK CONSTRAINT [FK_cmsTags_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[cmsTemplate]  WITH CHECK ADD  CONSTRAINT [FK_cmsTemplate_umbracoNode] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[cmsTemplate] CHECK CONSTRAINT [FK_cmsTemplate_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id1] FOREIGN KEY([loginNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id1]
GO
ALTER TABLE [dbo].[umbracoAccess]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccess_umbracoNode_id2] FOREIGN KEY([noAccessNodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoAccess] CHECK CONSTRAINT [FK_umbracoAccess_umbracoNode_id2]
GO
ALTER TABLE [dbo].[umbracoAccessRule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id] FOREIGN KEY([accessId])
REFERENCES [dbo].[umbracoAccess] ([id])
GO
ALTER TABLE [dbo].[umbracoAccessRule] CHECK CONSTRAINT [FK_umbracoAccessRule_umbracoAccess_id]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId] FOREIGN KEY([contentTypeId])
REFERENCES [dbo].[cmsContentType] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_cmsContentType_NodeId]
GO
ALTER TABLE [dbo].[umbracoContent]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContent_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoContent] CHECK CONSTRAINT [FK_umbracoContent_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentSchedule]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentSchedule] CHECK CONSTRAINT [FK_umbracoContentSchedule_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoContentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersion] CHECK CONSTRAINT [FK_umbracoContentVersion_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id] FOREIGN KEY([availableUserId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoContentVersionCultureVariation] CHECK CONSTRAINT [FK_umbracoContentVersionCultureVariation_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoDataType]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDataType_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDataType] CHECK CONSTRAINT [FK_umbracoDataType_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocument]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoContent] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocument] CHECK CONSTRAINT [FK_umbracoDocument_umbracoContent_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentCultureVariation] CHECK CONSTRAINT [FK_umbracoDocumentCultureVariation_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId] FOREIGN KEY([templateId])
REFERENCES [dbo].[cmsTemplate] ([nodeId])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_cmsTemplate_nodeId]
GO
ALTER TABLE [dbo].[umbracoDocumentVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoDocumentVersion] CHECK CONSTRAINT [FK_umbracoDocumentVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoDomain]  WITH CHECK ADD  CONSTRAINT [FK_umbracoDomain_umbracoNode_id] FOREIGN KEY([domainRootStructureID])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoDomain] CHECK CONSTRAINT [FK_umbracoDomain_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoLanguage]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id] FOREIGN KEY([fallbackLanguageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoLanguage] CHECK CONSTRAINT [FK_umbracoLanguage_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoLog]  WITH CHECK ADD  CONSTRAINT [FK_umbracoLog_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoLog] CHECK CONSTRAINT [FK_umbracoLog_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoMediaVersion]  WITH CHECK ADD  CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id] FOREIGN KEY([id])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoMediaVersion] CHECK CONSTRAINT [FK_umbracoMediaVersion_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoNode_id] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoNode_umbracoUser_id] FOREIGN KEY([nodeUser])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoNode] CHECK CONSTRAINT [FK_umbracoNode_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id] FOREIGN KEY([propertyTypeId])
REFERENCES [dbo].[cmsPropertyType] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_cmsPropertyType_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id] FOREIGN KEY([versionId])
REFERENCES [dbo].[umbracoContentVersion] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoContentVersion_id]
GO
ALTER TABLE [dbo].[umbracoPropertyData]  WITH CHECK ADD  CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id] FOREIGN KEY([languageId])
REFERENCES [dbo].[umbracoLanguage] ([id])
GO
ALTER TABLE [dbo].[umbracoPropertyData] CHECK CONSTRAINT [FK_umbracoPropertyData_umbracoLanguage_id]
GO
ALTER TABLE [dbo].[umbracoRedirectUrl]  WITH CHECK ADD  CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID] FOREIGN KEY([contentKey])
REFERENCES [dbo].[umbracoNode] ([uniqueId])
GO
ALTER TABLE [dbo].[umbracoRedirectUrl] CHECK CONSTRAINT [FK_umbracoRedirectUrl_umbracoNode_uniqueID]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode] FOREIGN KEY([parentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoNode1] FOREIGN KEY([childId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoNode1]
GO
ALTER TABLE [dbo].[umbracoRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id] FOREIGN KEY([relType])
REFERENCES [dbo].[umbracoRelationType] ([id])
GO
ALTER TABLE [dbo].[umbracoRelation] CHECK CONSTRAINT [FK_umbracoRelation_umbracoRelationType_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2NodeNotify] CHECK CONSTRAINT [FK_umbracoUser2NodeNotify_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUser2UserGroup] CHECK CONSTRAINT [FK_umbracoUser2UserGroup_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startContentId_umbracoNode_id] FOREIGN KEY([startContentId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startContentId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_startMediaId_umbracoNode_id] FOREIGN KEY([startMediaId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup] CHECK CONSTRAINT [FK_startMediaId_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2App]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2App] CHECK CONSTRAINT [FK_umbracoUserGroup2App_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id] FOREIGN KEY([nodeId])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id] FOREIGN KEY([userGroupId])
REFERENCES [dbo].[umbracoUserGroup] ([id])
GO
ALTER TABLE [dbo].[umbracoUserGroup2NodePermission] CHECK CONSTRAINT [FK_umbracoUserGroup2NodePermission_umbracoUserGroup_id]
GO
ALTER TABLE [dbo].[umbracoUserLogin]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserLogin] CHECK CONSTRAINT [FK_umbracoUserLogin_umbracoUser_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id] FOREIGN KEY([startNode])
REFERENCES [dbo].[umbracoNode] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoNode_id]
GO
ALTER TABLE [dbo].[umbracoUserStartNode]  WITH CHECK ADD  CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id] FOREIGN KEY([userId])
REFERENCES [dbo].[umbracoUser] ([id])
GO
ALTER TABLE [dbo].[umbracoUserStartNode] CHECK CONSTRAINT [FK_umbracoUserStartNode_umbracoUser_id]
GO
ALTER TABLE [dbo].[vendrCountry]  WITH CHECK ADD  CONSTRAINT [FK_vendrCountry_vendrCurrency] FOREIGN KEY([defaultCurrencyId])
REFERENCES [dbo].[vendrCurrency] ([id])
GO
ALTER TABLE [dbo].[vendrCountry] CHECK CONSTRAINT [FK_vendrCountry_vendrCurrency]
GO
ALTER TABLE [dbo].[vendrCountry]  WITH CHECK ADD  CONSTRAINT [FK_vendrCountry_vendrPaymentMethod] FOREIGN KEY([defaultPaymentMethodId])
REFERENCES [dbo].[vendrPaymentMethod] ([id])
GO
ALTER TABLE [dbo].[vendrCountry] CHECK CONSTRAINT [FK_vendrCountry_vendrPaymentMethod]
GO
ALTER TABLE [dbo].[vendrCountry]  WITH CHECK ADD  CONSTRAINT [FK_vendrCountry_vendrShippingMethod] FOREIGN KEY([defaultShippingMethodId])
REFERENCES [dbo].[vendrShippingMethod] ([id])
GO
ALTER TABLE [dbo].[vendrCountry] CHECK CONSTRAINT [FK_vendrCountry_vendrShippingMethod]
GO
ALTER TABLE [dbo].[vendrCountry]  WITH CHECK ADD  CONSTRAINT [FK_vendrCountry_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrCountry] CHECK CONSTRAINT [FK_vendrCountry_vendrStore]
GO
ALTER TABLE [dbo].[vendrCurrency]  WITH CHECK ADD  CONSTRAINT [FK_vendrCurrency_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrCurrency] CHECK CONSTRAINT [FK_vendrCurrency_vendrStore]
GO
ALTER TABLE [dbo].[vendrCurrencyAllowedCountry]  WITH CHECK ADD  CONSTRAINT [FK_vendrCurrencyAllowedCountry_vendrCountry] FOREIGN KEY([countryId])
REFERENCES [dbo].[vendrCountry] ([id])
GO
ALTER TABLE [dbo].[vendrCurrencyAllowedCountry] CHECK CONSTRAINT [FK_vendrCurrencyAllowedCountry_vendrCountry]
GO
ALTER TABLE [dbo].[vendrCurrencyAllowedCountry]  WITH CHECK ADD  CONSTRAINT [FK_vendrCurrencyAllowedCountry_vendrCurrency] FOREIGN KEY([currencyId])
REFERENCES [dbo].[vendrCurrency] ([id])
GO
ALTER TABLE [dbo].[vendrCurrencyAllowedCountry] CHECK CONSTRAINT [FK_vendrCurrencyAllowedCountry_vendrCurrency]
GO
ALTER TABLE [dbo].[vendrDiscount]  WITH CHECK ADD  CONSTRAINT [FK_vendrDiscount_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrDiscount] CHECK CONSTRAINT [FK_vendrDiscount_vendrStore]
GO
ALTER TABLE [dbo].[vendrDiscountCode]  WITH CHECK ADD  CONSTRAINT [FK_vendrDiscountCode_vendrDiscount] FOREIGN KEY([discountId])
REFERENCES [dbo].[vendrDiscount] ([id])
GO
ALTER TABLE [dbo].[vendrDiscountCode] CHECK CONSTRAINT [FK_vendrDiscountCode_vendrDiscount]
GO
ALTER TABLE [dbo].[vendrEmailTemplate]  WITH CHECK ADD  CONSTRAINT [FK_vendrEmailTemplate_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrEmailTemplate] CHECK CONSTRAINT [FK_vendrEmailTemplate_vendrStore]
GO
ALTER TABLE [dbo].[vendrFrozenPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrFrozenPrice_vendrCountry] FOREIGN KEY([countryId])
REFERENCES [dbo].[vendrCountry] ([id])
GO
ALTER TABLE [dbo].[vendrFrozenPrice] CHECK CONSTRAINT [FK_vendrFrozenPrice_vendrCountry]
GO
ALTER TABLE [dbo].[vendrFrozenPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrFrozenPrice_vendrCurrency] FOREIGN KEY([currencyId])
REFERENCES [dbo].[vendrCurrency] ([id])
GO
ALTER TABLE [dbo].[vendrFrozenPrice] CHECK CONSTRAINT [FK_vendrFrozenPrice_vendrCurrency]
GO
ALTER TABLE [dbo].[vendrFrozenPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrFrozenPrice_vendrOrder] FOREIGN KEY([orderId])
REFERENCES [dbo].[vendrOrder] ([id])
GO
ALTER TABLE [dbo].[vendrFrozenPrice] CHECK CONSTRAINT [FK_vendrFrozenPrice_vendrOrder]
GO
ALTER TABLE [dbo].[vendrFrozenPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrFrozenPrice_vendrRegion] FOREIGN KEY([regionId])
REFERENCES [dbo].[vendrRegion] ([id])
GO
ALTER TABLE [dbo].[vendrFrozenPrice] CHECK CONSTRAINT [FK_vendrFrozenPrice_vendrRegion]
GO
ALTER TABLE [dbo].[vendrGiftCard]  WITH CHECK ADD  CONSTRAINT [FK_vendrGiftCard_vendrCurrency] FOREIGN KEY([currencyId])
REFERENCES [dbo].[vendrCurrency] ([id])
GO
ALTER TABLE [dbo].[vendrGiftCard] CHECK CONSTRAINT [FK_vendrGiftCard_vendrCurrency]
GO
ALTER TABLE [dbo].[vendrGiftCard]  WITH CHECK ADD  CONSTRAINT [FK_vendrGiftCard_vendrOrder] FOREIGN KEY([orderId])
REFERENCES [dbo].[vendrOrder] ([id])
GO
ALTER TABLE [dbo].[vendrGiftCard] CHECK CONSTRAINT [FK_vendrGiftCard_vendrOrder]
GO
ALTER TABLE [dbo].[vendrGiftCard]  WITH CHECK ADD  CONSTRAINT [FK_vendrGiftCard_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrGiftCard] CHECK CONSTRAINT [FK_vendrGiftCard_vendrStore]
GO
ALTER TABLE [dbo].[vendrGiftCardProperty]  WITH CHECK ADD  CONSTRAINT [FK_vendrGiftCardProperty_vendrGiftCard] FOREIGN KEY([giftCardId])
REFERENCES [dbo].[vendrGiftCard] ([id])
GO
ALTER TABLE [dbo].[vendrGiftCardProperty] CHECK CONSTRAINT [FK_vendrGiftCardProperty_vendrGiftCard]
GO
ALTER TABLE [dbo].[vendrOrder]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrder_vendrCurrency] FOREIGN KEY([currencyId])
REFERENCES [dbo].[vendrCurrency] ([id])
GO
ALTER TABLE [dbo].[vendrOrder] CHECK CONSTRAINT [FK_vendrOrder_vendrCurrency]
GO
ALTER TABLE [dbo].[vendrOrder]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrder_vendrOrder_copiedFrom] FOREIGN KEY([copiedFromOrderId])
REFERENCES [dbo].[vendrOrder] ([id])
GO
ALTER TABLE [dbo].[vendrOrder] CHECK CONSTRAINT [FK_vendrOrder_vendrOrder_copiedFrom]
GO
ALTER TABLE [dbo].[vendrOrder]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrder_vendrOrderStatus] FOREIGN KEY([orderStatusId])
REFERENCES [dbo].[vendrOrderStatus] ([id])
GO
ALTER TABLE [dbo].[vendrOrder] CHECK CONSTRAINT [FK_vendrOrder_vendrOrderStatus]
GO
ALTER TABLE [dbo].[vendrOrder]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrder_vendrPaymentMethod] FOREIGN KEY([paymentMethodId])
REFERENCES [dbo].[vendrPaymentMethod] ([id])
GO
ALTER TABLE [dbo].[vendrOrder] CHECK CONSTRAINT [FK_vendrOrder_vendrPaymentMethod]
GO
ALTER TABLE [dbo].[vendrOrder]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrder_vendrShippingMethod] FOREIGN KEY([shippingMethodId])
REFERENCES [dbo].[vendrShippingMethod] ([id])
GO
ALTER TABLE [dbo].[vendrOrder] CHECK CONSTRAINT [FK_vendrOrder_vendrShippingMethod]
GO
ALTER TABLE [dbo].[vendrOrder]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrder_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrOrder] CHECK CONSTRAINT [FK_vendrOrder_vendrStore]
GO
ALTER TABLE [dbo].[vendrOrder]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrder_vendrTaxClass] FOREIGN KEY([taxClassId])
REFERENCES [dbo].[vendrTaxClass] ([id])
GO
ALTER TABLE [dbo].[vendrOrder] CHECK CONSTRAINT [FK_vendrOrder_vendrTaxClass]
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscount]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderAppliedDiscount_vendrDiscount] FOREIGN KEY([discountId])
REFERENCES [dbo].[vendrDiscount] ([id])
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscount] CHECK CONSTRAINT [FK_vendrOrderAppliedDiscount_vendrDiscount]
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscount]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderAppliedDiscount_vendrOrder] FOREIGN KEY([orderId])
REFERENCES [dbo].[vendrOrder] ([id])
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscount] CHECK CONSTRAINT [FK_vendrOrderAppliedDiscount_vendrOrder]
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscount]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderAppliedDiscount_vendrOrderLine] FOREIGN KEY([orderLineId])
REFERENCES [dbo].[vendrOrderLine] ([id])
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscount] CHECK CONSTRAINT [FK_vendrOrderAppliedDiscount_vendrOrderLine]
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscountCode]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderAppliedDiscountCode_vendrDiscount] FOREIGN KEY([discountId])
REFERENCES [dbo].[vendrDiscount] ([id])
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscountCode] CHECK CONSTRAINT [FK_vendrOrderAppliedDiscountCode_vendrDiscount]
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscountCode]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderAppliedDiscountCode_vendrOrder] FOREIGN KEY([orderId])
REFERENCES [dbo].[vendrOrder] ([id])
GO
ALTER TABLE [dbo].[vendrOrderAppliedDiscountCode] CHECK CONSTRAINT [FK_vendrOrderAppliedDiscountCode_vendrOrder]
GO
ALTER TABLE [dbo].[vendrOrderAppliedGiftCard]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderAppliedGiftCard_vendrGiftCard] FOREIGN KEY([giftCardId])
REFERENCES [dbo].[vendrGiftCard] ([id])
GO
ALTER TABLE [dbo].[vendrOrderAppliedGiftCard] CHECK CONSTRAINT [FK_vendrOrderAppliedGiftCard_vendrGiftCard]
GO
ALTER TABLE [dbo].[vendrOrderAppliedGiftCard]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderAppliedGiftCard_vendrOrder] FOREIGN KEY([orderId])
REFERENCES [dbo].[vendrOrder] ([id])
GO
ALTER TABLE [dbo].[vendrOrderAppliedGiftCard] CHECK CONSTRAINT [FK_vendrOrderAppliedGiftCard_vendrOrder]
GO
ALTER TABLE [dbo].[vendrOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderLine_vendrOrder] FOREIGN KEY([orderId])
REFERENCES [dbo].[vendrOrder] ([id])
GO
ALTER TABLE [dbo].[vendrOrderLine] CHECK CONSTRAINT [FK_vendrOrderLine_vendrOrder]
GO
ALTER TABLE [dbo].[vendrOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderLine_vendrOrderLine] FOREIGN KEY([parentOrderLineId])
REFERENCES [dbo].[vendrOrderLine] ([id])
GO
ALTER TABLE [dbo].[vendrOrderLine] CHECK CONSTRAINT [FK_vendrOrderLine_vendrOrderLine]
GO
ALTER TABLE [dbo].[vendrOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderLine_vendrOrderLine_copiedFrom] FOREIGN KEY([copiedFromOrderLineId])
REFERENCES [dbo].[vendrOrderLine] ([id])
GO
ALTER TABLE [dbo].[vendrOrderLine] CHECK CONSTRAINT [FK_vendrOrderLine_vendrOrderLine_copiedFrom]
GO
ALTER TABLE [dbo].[vendrOrderLine]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderLine_vendrTaxClass] FOREIGN KEY([taxClassId])
REFERENCES [dbo].[vendrTaxClass] ([id])
GO
ALTER TABLE [dbo].[vendrOrderLine] CHECK CONSTRAINT [FK_vendrOrderLine_vendrTaxClass]
GO
ALTER TABLE [dbo].[vendrOrderLineProperty]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderLineProperty_vendrOrder] FOREIGN KEY([orderId])
REFERENCES [dbo].[vendrOrder] ([id])
GO
ALTER TABLE [dbo].[vendrOrderLineProperty] CHECK CONSTRAINT [FK_vendrOrderLineProperty_vendrOrder]
GO
ALTER TABLE [dbo].[vendrOrderLineProperty]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderLineProperty_vendrOrderLine] FOREIGN KEY([orderLineId])
REFERENCES [dbo].[vendrOrderLine] ([id])
GO
ALTER TABLE [dbo].[vendrOrderLineProperty] CHECK CONSTRAINT [FK_vendrOrderLineProperty_vendrOrderLine]
GO
ALTER TABLE [dbo].[vendrOrderProperty]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderProperty_vendrOrder] FOREIGN KEY([orderId])
REFERENCES [dbo].[vendrOrder] ([id])
GO
ALTER TABLE [dbo].[vendrOrderProperty] CHECK CONSTRAINT [FK_vendrOrderProperty_vendrOrder]
GO
ALTER TABLE [dbo].[vendrOrderStatus]  WITH CHECK ADD  CONSTRAINT [FK_vendrOrderStatus_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrOrderStatus] CHECK CONSTRAINT [FK_vendrOrderStatus_vendrStore]
GO
ALTER TABLE [dbo].[vendrPaymentMethod]  WITH CHECK ADD  CONSTRAINT [FK_vendrPaymentMethod_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrPaymentMethod] CHECK CONSTRAINT [FK_vendrPaymentMethod_vendrStore]
GO
ALTER TABLE [dbo].[vendrPaymentMethod]  WITH CHECK ADD  CONSTRAINT [FK_vendrPaymentMethod_vendrTaxClass] FOREIGN KEY([taxClassId])
REFERENCES [dbo].[vendrTaxClass] ([id])
GO
ALTER TABLE [dbo].[vendrPaymentMethod] CHECK CONSTRAINT [FK_vendrPaymentMethod_vendrTaxClass]
GO
ALTER TABLE [dbo].[vendrPaymentMethodAllowedCountryRegion]  WITH CHECK ADD  CONSTRAINT [FK_vendrPaymentMethodAllowedCountryRegion_vendrCountry] FOREIGN KEY([countryId])
REFERENCES [dbo].[vendrCountry] ([id])
GO
ALTER TABLE [dbo].[vendrPaymentMethodAllowedCountryRegion] CHECK CONSTRAINT [FK_vendrPaymentMethodAllowedCountryRegion_vendrCountry]
GO
ALTER TABLE [dbo].[vendrPaymentMethodAllowedCountryRegion]  WITH CHECK ADD  CONSTRAINT [FK_vendrPaymentMethodAllowedCountryRegion_vendrPaymentMethod] FOREIGN KEY([paymentMethodId])
REFERENCES [dbo].[vendrPaymentMethod] ([id])
GO
ALTER TABLE [dbo].[vendrPaymentMethodAllowedCountryRegion] CHECK CONSTRAINT [FK_vendrPaymentMethodAllowedCountryRegion_vendrPaymentMethod]
GO
ALTER TABLE [dbo].[vendrPaymentMethodAllowedCountryRegion]  WITH CHECK ADD  CONSTRAINT [FK_vendrPaymentMethodAllowedCountryRegion_vendrRegion] FOREIGN KEY([regionId])
REFERENCES [dbo].[vendrRegion] ([id])
GO
ALTER TABLE [dbo].[vendrPaymentMethodAllowedCountryRegion] CHECK CONSTRAINT [FK_vendrPaymentMethodAllowedCountryRegion_vendrRegion]
GO
ALTER TABLE [dbo].[vendrPaymentMethodCountryRegionPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrPaymentMethodCountryRegionPrice_vendrCountry] FOREIGN KEY([countryId])
REFERENCES [dbo].[vendrCountry] ([id])
GO
ALTER TABLE [dbo].[vendrPaymentMethodCountryRegionPrice] CHECK CONSTRAINT [FK_vendrPaymentMethodCountryRegionPrice_vendrCountry]
GO
ALTER TABLE [dbo].[vendrPaymentMethodCountryRegionPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrPaymentMethodCountryRegionPrice_vendrCurrency] FOREIGN KEY([currencyId])
REFERENCES [dbo].[vendrCurrency] ([id])
GO
ALTER TABLE [dbo].[vendrPaymentMethodCountryRegionPrice] CHECK CONSTRAINT [FK_vendrPaymentMethodCountryRegionPrice_vendrCurrency]
GO
ALTER TABLE [dbo].[vendrPaymentMethodCountryRegionPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrPaymentMethodCountryRegionPrice_vendrPaymentMethod] FOREIGN KEY([paymentMethodId])
REFERENCES [dbo].[vendrPaymentMethod] ([id])
GO
ALTER TABLE [dbo].[vendrPaymentMethodCountryRegionPrice] CHECK CONSTRAINT [FK_vendrPaymentMethodCountryRegionPrice_vendrPaymentMethod]
GO
ALTER TABLE [dbo].[vendrPaymentMethodCountryRegionPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrPaymentMethodCountryRegionPrice_vendrRegion] FOREIGN KEY([regionId])
REFERENCES [dbo].[vendrRegion] ([id])
GO
ALTER TABLE [dbo].[vendrPaymentMethodCountryRegionPrice] CHECK CONSTRAINT [FK_vendrPaymentMethodCountryRegionPrice_vendrRegion]
GO
ALTER TABLE [dbo].[vendrPaymentMethodPaymentProviderSetting]  WITH CHECK ADD  CONSTRAINT [FK_vendrPaymentMethodPaymentProviderSetting_vendrPaymentMethod] FOREIGN KEY([paymentMethodId])
REFERENCES [dbo].[vendrPaymentMethod] ([id])
GO
ALTER TABLE [dbo].[vendrPaymentMethodPaymentProviderSetting] CHECK CONSTRAINT [FK_vendrPaymentMethodPaymentProviderSetting_vendrPaymentMethod]
GO
ALTER TABLE [dbo].[vendrRegion]  WITH CHECK ADD  CONSTRAINT [FK_vendrRegion_vendrCountry] FOREIGN KEY([countryId])
REFERENCES [dbo].[vendrCountry] ([id])
GO
ALTER TABLE [dbo].[vendrRegion] CHECK CONSTRAINT [FK_vendrRegion_vendrCountry]
GO
ALTER TABLE [dbo].[vendrRegion]  WITH CHECK ADD  CONSTRAINT [FK_vendrRegion_vendrPaymentMethod] FOREIGN KEY([defaultPaymentMethodId])
REFERENCES [dbo].[vendrPaymentMethod] ([id])
GO
ALTER TABLE [dbo].[vendrRegion] CHECK CONSTRAINT [FK_vendrRegion_vendrPaymentMethod]
GO
ALTER TABLE [dbo].[vendrRegion]  WITH CHECK ADD  CONSTRAINT [FK_vendrRegion_vendrShippingMethod] FOREIGN KEY([defaultShippingMethodId])
REFERENCES [dbo].[vendrShippingMethod] ([id])
GO
ALTER TABLE [dbo].[vendrRegion] CHECK CONSTRAINT [FK_vendrRegion_vendrShippingMethod]
GO
ALTER TABLE [dbo].[vendrRegion]  WITH CHECK ADD  CONSTRAINT [FK_vendrRegion_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrRegion] CHECK CONSTRAINT [FK_vendrRegion_vendrStore]
GO
ALTER TABLE [dbo].[vendrShippingMethod]  WITH CHECK ADD  CONSTRAINT [FK_vendrShippingMethod_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrShippingMethod] CHECK CONSTRAINT [FK_vendrShippingMethod_vendrStore]
GO
ALTER TABLE [dbo].[vendrShippingMethod]  WITH CHECK ADD  CONSTRAINT [FK_vendrShippingMethod_vendrTaxClass] FOREIGN KEY([taxClassId])
REFERENCES [dbo].[vendrTaxClass] ([id])
GO
ALTER TABLE [dbo].[vendrShippingMethod] CHECK CONSTRAINT [FK_vendrShippingMethod_vendrTaxClass]
GO
ALTER TABLE [dbo].[vendrShippingMethodAllowedCountryRegion]  WITH CHECK ADD  CONSTRAINT [FK_vendrShippingMethodAllowedCountryRegion_vendrCountry] FOREIGN KEY([countryId])
REFERENCES [dbo].[vendrCountry] ([id])
GO
ALTER TABLE [dbo].[vendrShippingMethodAllowedCountryRegion] CHECK CONSTRAINT [FK_vendrShippingMethodAllowedCountryRegion_vendrCountry]
GO
ALTER TABLE [dbo].[vendrShippingMethodAllowedCountryRegion]  WITH CHECK ADD  CONSTRAINT [FK_vendrShippingMethodAllowedCountryRegion_vendrRegion] FOREIGN KEY([regionId])
REFERENCES [dbo].[vendrRegion] ([id])
GO
ALTER TABLE [dbo].[vendrShippingMethodAllowedCountryRegion] CHECK CONSTRAINT [FK_vendrShippingMethodAllowedCountryRegion_vendrRegion]
GO
ALTER TABLE [dbo].[vendrShippingMethodAllowedCountryRegion]  WITH CHECK ADD  CONSTRAINT [FK_vendrShippingMethodAllowedCountryRegion_vendrShippingMethod] FOREIGN KEY([shippingMethodId])
REFERENCES [dbo].[vendrShippingMethod] ([id])
GO
ALTER TABLE [dbo].[vendrShippingMethodAllowedCountryRegion] CHECK CONSTRAINT [FK_vendrShippingMethodAllowedCountryRegion_vendrShippingMethod]
GO
ALTER TABLE [dbo].[vendrShippingMethodCountryRegionPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrShippingMethodCountryRegionPrice_vendrCountry] FOREIGN KEY([countryId])
REFERENCES [dbo].[vendrCountry] ([id])
GO
ALTER TABLE [dbo].[vendrShippingMethodCountryRegionPrice] CHECK CONSTRAINT [FK_vendrShippingMethodCountryRegionPrice_vendrCountry]
GO
ALTER TABLE [dbo].[vendrShippingMethodCountryRegionPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrShippingMethodCountryRegionPrice_vendrCurrency] FOREIGN KEY([currencyId])
REFERENCES [dbo].[vendrCurrency] ([id])
GO
ALTER TABLE [dbo].[vendrShippingMethodCountryRegionPrice] CHECK CONSTRAINT [FK_vendrShippingMethodCountryRegionPrice_vendrCurrency]
GO
ALTER TABLE [dbo].[vendrShippingMethodCountryRegionPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrShippingMethodCountryRegionPrice_vendrRegion] FOREIGN KEY([regionId])
REFERENCES [dbo].[vendrRegion] ([id])
GO
ALTER TABLE [dbo].[vendrShippingMethodCountryRegionPrice] CHECK CONSTRAINT [FK_vendrShippingMethodCountryRegionPrice_vendrRegion]
GO
ALTER TABLE [dbo].[vendrShippingMethodCountryRegionPrice]  WITH CHECK ADD  CONSTRAINT [FK_vendrShippingMethodCountryRegionPrice_vendrShippingMethod] FOREIGN KEY([shippingMethodId])
REFERENCES [dbo].[vendrShippingMethod] ([id])
GO
ALTER TABLE [dbo].[vendrShippingMethodCountryRegionPrice] CHECK CONSTRAINT [FK_vendrShippingMethodCountryRegionPrice_vendrShippingMethod]
GO
ALTER TABLE [dbo].[vendrStore]  WITH CHECK ADD  CONSTRAINT [FK_vendrStore_vendrCountry] FOREIGN KEY([defaultCountryId])
REFERENCES [dbo].[vendrCountry] ([id])
GO
ALTER TABLE [dbo].[vendrStore] CHECK CONSTRAINT [FK_vendrStore_vendrCountry]
GO
ALTER TABLE [dbo].[vendrStore]  WITH CHECK ADD  CONSTRAINT [FK_vendrStore_vendrEmailTemplate_confirmation] FOREIGN KEY([confirmationEmailTemplateId])
REFERENCES [dbo].[vendrEmailTemplate] ([id])
GO
ALTER TABLE [dbo].[vendrStore] CHECK CONSTRAINT [FK_vendrStore_vendrEmailTemplate_confirmation]
GO
ALTER TABLE [dbo].[vendrStore]  WITH CHECK ADD  CONSTRAINT [FK_vendrStore_vendrEmailTemplate_defaultGiftCardEmailTemplate] FOREIGN KEY([defaultGiftCardEmailTemplateId])
REFERENCES [dbo].[vendrEmailTemplate] ([id])
GO
ALTER TABLE [dbo].[vendrStore] CHECK CONSTRAINT [FK_vendrStore_vendrEmailTemplate_defaultGiftCardEmailTemplate]
GO
ALTER TABLE [dbo].[vendrStore]  WITH CHECK ADD  CONSTRAINT [FK_vendrStore_vendrEmailTemplate_error] FOREIGN KEY([errorEmailTemplateId])
REFERENCES [dbo].[vendrEmailTemplate] ([id])
GO
ALTER TABLE [dbo].[vendrStore] CHECK CONSTRAINT [FK_vendrStore_vendrEmailTemplate_error]
GO
ALTER TABLE [dbo].[vendrStore]  WITH CHECK ADD  CONSTRAINT [FK_vendrStore_vendrOrderStatus] FOREIGN KEY([defaultOrderStatusId])
REFERENCES [dbo].[vendrOrderStatus] ([id])
GO
ALTER TABLE [dbo].[vendrStore] CHECK CONSTRAINT [FK_vendrStore_vendrOrderStatus]
GO
ALTER TABLE [dbo].[vendrStore]  WITH CHECK ADD  CONSTRAINT [FK_vendrStore_vendrOrderStatus_giftCardActivationOrderStatus] FOREIGN KEY([giftCardActivationOrderStatusId])
REFERENCES [dbo].[vendrOrderStatus] ([id])
GO
ALTER TABLE [dbo].[vendrStore] CHECK CONSTRAINT [FK_vendrStore_vendrOrderStatus_giftCardActivationOrderStatus]
GO
ALTER TABLE [dbo].[vendrStore]  WITH CHECK ADD  CONSTRAINT [FK_vendrStore_vendrStore_stockSharing] FOREIGN KEY([shareStockFromStoreId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrStore] CHECK CONSTRAINT [FK_vendrStore_vendrStore_stockSharing]
GO
ALTER TABLE [dbo].[vendrStore]  WITH CHECK ADD  CONSTRAINT [FK_vendrStore_vendrTaxClass] FOREIGN KEY([defaultTaxClassId])
REFERENCES [dbo].[vendrTaxClass] ([id])
GO
ALTER TABLE [dbo].[vendrStore] CHECK CONSTRAINT [FK_vendrStore_vendrTaxClass]
GO
ALTER TABLE [dbo].[vendrStoreAllowedUser]  WITH CHECK ADD  CONSTRAINT [FK_vendrStoreAllowedUser_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrStoreAllowedUser] CHECK CONSTRAINT [FK_vendrStoreAllowedUser_vendrStore]
GO
ALTER TABLE [dbo].[vendrStoreAllowedUserRole]  WITH CHECK ADD  CONSTRAINT [FK_vendrStoreAllowedUserRole_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrStoreAllowedUserRole] CHECK CONSTRAINT [FK_vendrStoreAllowedUserRole_vendrStore]
GO
ALTER TABLE [dbo].[vendrTaxClass]  WITH CHECK ADD  CONSTRAINT [FK_vendrTaxClass_vendrStore] FOREIGN KEY([storeId])
REFERENCES [dbo].[vendrStore] ([id])
GO
ALTER TABLE [dbo].[vendrTaxClass] CHECK CONSTRAINT [FK_vendrTaxClass_vendrStore]
GO
ALTER TABLE [dbo].[vendrTaxClassCountryRegionTaxRate]  WITH CHECK ADD  CONSTRAINT [FK_vendrTaxClassCountryRegionTaxRate_vendrCountry] FOREIGN KEY([countryId])
REFERENCES [dbo].[vendrCountry] ([id])
GO
ALTER TABLE [dbo].[vendrTaxClassCountryRegionTaxRate] CHECK CONSTRAINT [FK_vendrTaxClassCountryRegionTaxRate_vendrCountry]
GO
ALTER TABLE [dbo].[vendrTaxClassCountryRegionTaxRate]  WITH CHECK ADD  CONSTRAINT [FK_vendrTaxClassCountryRegionTaxRate_vendrRegion] FOREIGN KEY([regionId])
REFERENCES [dbo].[vendrRegion] ([id])
GO
ALTER TABLE [dbo].[vendrTaxClassCountryRegionTaxRate] CHECK CONSTRAINT [FK_vendrTaxClassCountryRegionTaxRate_vendrRegion]
GO
ALTER TABLE [dbo].[vendrTaxClassCountryRegionTaxRate]  WITH CHECK ADD  CONSTRAINT [FK_vendrTaxClassCountryRegionTaxRate_vendrTaxClass] FOREIGN KEY([taxClassId])
REFERENCES [dbo].[vendrTaxClass] ([id])
GO
ALTER TABLE [dbo].[vendrTaxClassCountryRegionTaxRate] CHECK CONSTRAINT [FK_vendrTaxClassCountryRegionTaxRate_vendrTaxClass]
GO
USE [master]
GO
ALTER DATABASE [CleanShop] SET  READ_WRITE 
GO
