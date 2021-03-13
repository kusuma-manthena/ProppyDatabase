USE [master]
GO
/****** Object:  Database [proppyapp]    Script Date: 13-03-2021 18:23:02 ******/
CREATE DATABASE [proppyapp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proppyapp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\proppyapp.mdf' , SIZE = 3136KB , MAXSIZE = 1048576KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'proppyapp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\proppyapp_log.ldf' , SIZE = 6912KB , MAXSIZE = 4194304KB , FILEGROWTH = 10%)
GO
ALTER DATABASE [proppyapp] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proppyapp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proppyapp] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [proppyapp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proppyapp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proppyapp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proppyapp] SET ARITHABORT OFF 
GO
ALTER DATABASE [proppyapp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proppyapp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proppyapp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proppyapp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proppyapp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proppyapp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proppyapp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proppyapp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proppyapp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proppyapp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [proppyapp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proppyapp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proppyapp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proppyapp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proppyapp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proppyapp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proppyapp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proppyapp] SET RECOVERY FULL 
GO
ALTER DATABASE [proppyapp] SET  MULTI_USER 
GO
ALTER DATABASE [proppyapp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proppyapp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proppyapp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proppyapp] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [proppyapp]
GO
/****** Object:  User [proppyappuser]    Script Date: 13-03-2021 18:23:03 ******/
CREATE USER [proppyappuser] FOR LOGIN [proppyappuser] WITH DEFAULT_SCHEMA=[proppyappuser]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [proppyappuser]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [proppyappuser]
GO
ALTER ROLE [db_datareader] ADD MEMBER [proppyappuser]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [proppyappuser]
GO
/****** Object:  Schema [proppyappuser]    Script Date: 13-03-2021 18:23:03 ******/
CREATE SCHEMA [proppyappuser]
GO
/****** Object:  Table [proppyappuser].[tbl_Area]    Script Date: 13-03-2021 18:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proppyappuser].[tbl_Area](
	[Code] [varchar](2) NOT NULL,
	[Name] [varchar](max) NOT NULL,
	[StateCode] [varchar](2) NOT NULL,
	[CountryCode] [varchar](2) NOT NULL,
	[Enabled] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Area] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [proppyappuser].[tbl_BedRoomTypes]    Script Date: 13-03-2021 18:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proppyappuser].[tbl_BedRoomTypes](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Bedrooms] [nvarchar](4) NOT NULL,
	[value] [nchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_BedRoomTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proppyappuser].[tbl_Countries]    Script Date: 13-03-2021 18:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proppyappuser].[tbl_Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[ISOCode] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[Flag] [varchar](50) NULL,
	[Status] [int] NULL,
 CONSTRAINT [PK_tbl_Countries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proppyappuser].[tbl_GlobalValues]    Script Date: 13-03-2021 18:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proppyappuser].[tbl_GlobalValues](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GVName] [varchar](5000) NULL,
	[GVValue] [varchar](5000) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proppyappuser].[tbl_Marketplace]    Script Date: 13-03-2021 18:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proppyappuser].[tbl_Marketplace](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[ContactPerson] [varchar](50) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Type] [varchar](20) NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Currency] [varchar](3) NOT NULL,
	[DefaultImage] [varchar](150) NOT NULL,
	[TypeCode] [nvarchar](50) NOT NULL,
	[CountryCode] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[Area] [varchar](50) NOT NULL,
	[BuiltUp] [int] NOT NULL,
	[Bedroom] [int] NOT NULL,
	[Bathroom] [int] NOT NULL,
	[LandType] [varchar](20) NOT NULL,
	[Furnished] [varchar](20) NOT NULL,
	[Longitude] [decimal](12, 9) NOT NULL,
	[Latitude] [decimal](12, 9) NOT NULL,
	[SaleType] [varchar](50) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[Status] [int] NOT NULL,
	[StatusPaid] [int] NOT NULL,
 CONSTRAINT [PK_tbl_Marketplace_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [proppyappuser].[tbl_Marketplace_Images]    Script Date: 13-03-2021 18:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proppyappuser].[tbl_Marketplace_Images](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[PropertyID] [bigint] NOT NULL,
	[ImageURL] [varchar](max) NOT NULL,
	[SeqNo] [int] NOT NULL,
	[PublicId] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_Marketplace_Images] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [proppyappuser].[tbl_PropertySaleType]    Script Date: 13-03-2021 18:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proppyappuser].[tbl_PropertySaleType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SaleType] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_PropertySaleType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proppyappuser].[tbl_PropertyType]    Script Date: 13-03-2021 18:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proppyappuser].[tbl_PropertyType](
	[Code] [varchar](2) NOT NULL,
	[Name] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_PropertyType_1] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [proppyappuser].[tbl_States]    Script Date: 13-03-2021 18:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proppyappuser].[tbl_States](
	[Code] [varchar](2) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CountryCode] [varchar](2) NOT NULL,
	[Enabled] [int] NOT NULL,
 CONSTRAINT [PK_tbl_States] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proppyappuser].[tbl_TypeOfPropertyPricing]    Script Date: 13-03-2021 18:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proppyappuser].[tbl_TypeOfPropertyPricing](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Price] [nvarchar](5) NOT NULL,
	[value] [bigint] NOT NULL,
	[Type] [int] NOT NULL,
 CONSTRAINT [PK_tbl_TypeOfPropertyPricing] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [proppyappuser].[tbl_UserRegistration]    Script Date: 13-03-2021 18:23:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [proppyappuser].[tbl_UserRegistration](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[MobileNo] [varchar](50) NOT NULL,
	[Email_Address] [varchar](5000) NOT NULL,
	[FirstName] [varchar](500) NOT NULL,
	[LastName] [varchar](500) NOT NULL,
	[Password] [binary](500) NOT NULL,
	[Status] [int] NULL,
	[MemberCode] [varchar](500) NULL,
	[ReferralCode] [varchar](500) NULL,
	[Gender] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[Occupation] [varchar](500) NULL,
	[Industry] [varchar](500) NULL,
	[Address] [varchar](500) NULL,
	[City] [varchar](500) NULL,
	[State] [varchar](500) NULL,
	[PostCode] [varchar](500) NULL,
	[CountryCode] [varchar](500) NULL,
	[StripeCustomerID] [varchar](500) NULL,
	[CreatedAt] [datetime] NULL,
 CONSTRAINT [PK_tbl_UserRegistration] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_BedRoomTypes] ON 
GO
INSERT [proppyappuser].[tbl_BedRoomTypes] ([Id], [Bedrooms], [value]) VALUES (2, N'1+', N'1         ')
GO
INSERT [proppyappuser].[tbl_BedRoomTypes] ([Id], [Bedrooms], [value]) VALUES (3, N'2+', N'2         ')
GO
INSERT [proppyappuser].[tbl_BedRoomTypes] ([Id], [Bedrooms], [value]) VALUES (4, N'3+', N'3         ')
GO
INSERT [proppyappuser].[tbl_BedRoomTypes] ([Id], [Bedrooms], [value]) VALUES (5, N'4+', N'4         ')
GO
INSERT [proppyappuser].[tbl_BedRoomTypes] ([Id], [Bedrooms], [value]) VALUES (6, N'5+', N'5         ')
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_BedRoomTypes] OFF
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_Countries] ON 
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (1, N'+93', N'AF ', N'Afghanistan', N'assets/flags/AFG.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (2, N'+355', N'AL ', N'Albania', N'assets/flags/ALB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (3, N'+213', N'DZ ', N'Algeria', N'assets/flags/DZA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (4, N'+1-684', N'AS ', N'American Samoa', N'assets/flags/ASM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (5, N'+376', N'AD ', N'Andorra', N'assets/flags/AND.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (6, N'+244', N'AO ', N'Angola', N'assets/flags/AGO.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (7, N'+1-264', N'AI ', N'Anguilla', N'assets/flags/AIA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (8, N'+672', N'AQ ', N'Antarctica', N'assets/flags/ATA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (9, N'+1-268', N'AG ', N'Antigua and Barbuda', N'assets/flags/ATG.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (10, N'+54', N'AR ', N'Argentina', N'assets/flags/ARG.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (11, N'+374', N'AM ', N'Armenia', N'assets/flags/ARM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (12, N'+297', N'AW ', N'Aruba', N'assets/flags/ABW.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (13, N'+61', N'AU ', N'Australia', N'assets/flags/AUS.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (14, N'+43', N'AT ', N'Austria', N'assets/flags/AUT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (15, N'+994', N'AZ ', N'Azerbaijan', N'assets/flags/AZE.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (16, N'+1-242', N'BS ', N'Bahamas', N'assets/flags/BHS.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (17, N'+973', N'BH ', N'Bahrain', N'assets/flags/BHR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (18, N'+880', N'BD ', N'Bangladesh', N'assets/flags/BGD.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (19, N'+1-246', N'BB ', N'Barbados', N'assets/flags/BRB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (20, N'+375', N'BY ', N'Belarus', N'assets/flags/BLR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (21, N'+32', N'BE ', N'Belgium', N'assets/flags/BEL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (22, N'+501', N'BZ ', N'Belize', N'assets/flags/BLZ.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (23, N'+229', N'BJ ', N'Benin', N'assets/flags/BEN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (24, N'+1-441', N'BM ', N'Bermuda', N'assets/flags/BMU.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (25, N'+975', N'BT ', N'Bhutan', N'assets/flags/BTN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (26, N'+591', N'BO ', N'Bolivia', N'assets/flags/BOL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (27, N'+387', N'BA ', N'Bosnia and Herzegovina', N'assets/flags/BIH.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (28, N'+267', N'BW ', N'Botswana', N'assets/flags/BWA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (29, N'+55', N'BR ', N'Brazil', N'assets/flags/BRA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (30, N'+246', N'IO ', N'British Indian Ocean Territory', N'assets/flags/IOT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (31, N'+1-284', N'VG ', N'British Virgin Islands', N'assets/flags/VGB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (32, N'+673', N'BN ', N'Brunei', N'assets/flags/BRN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (33, N'+359', N'BG ', N'Bulgaria', N'assets/flags/BGR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (34, N'+226', N'BF ', N'Burkina Faso', N'assets/flags/BFA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (35, N'+257', N'BI ', N'Burundi', N'assets/flags/BDI.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (36, N'+855', N'KH ', N'Cambodia', N'assets/flags/KHM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (37, N'+237', N'CM ', N'Cameroon', N'assets/flags/CMR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (38, N'+1', N'CA ', N'Canada', N'assets/flags/CAN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (39, N'+238', N'CV ', N'Cape Verde', N'assets/flags/CPV.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (40, N'+1-345', N'KY ', N'Cayman Islands', N'assets/flags/CYM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (41, N'+236', N'CF ', N'Central African Republic', N'assets/flags/CAF.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (42, N'+235', N'TD ', N'Chad', N'assets/flags/TCD.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (43, N'+56', N'CL ', N'Chile', N'assets/flags/CHL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (44, N'+86', N'CN ', N'China', N'assets/flags/CHN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (45, N'+61', N'CX ', N'Christmas Island', N'assets/flags/CXR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (46, N'+61', N'CC ', N'Cocos Islands', N'assets/flags/CCK.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (47, N'+57', N'CO ', N'Colombia', N'assets/flags/COL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (48, N'+269', N'KM ', N'Comoros', N'assets/flags/COM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (49, N'+682', N'CK ', N'Cook Islands', N'assets/flags/COK.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (50, N'+506', N'CR ', N'Costa Rica', N'assets/flags/CRI.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (51, N'+385', N'HR ', N'Croatia', N'assets/flags/HRV.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (52, N'+53', N'CU ', N'Cuba', N'assets/flags/CUB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (53, N'+599', N'CW ', N'Curacao', N'assets/flags/CUW.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (54, N'+357', N'CY ', N'Cyprus', N'assets/flags/CYP.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (55, N'+420', N'CZ ', N'Czech Republic', N'assets/flags/CZE.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (56, N'+243', N'CD ', N'Democratic Republic of the Congo', N'assets/flags/COD.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (57, N'+45', N'DK ', N'Denmark', N'assets/flags/DNK.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (58, N'+253', N'DJ ', N'Djibouti', N'assets/flags/DJI.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (59, N'+1-767', N'DM ', N'Dominica', N'assets/flags/DMA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (60, N'+1-809, 1-829, 1-849', N'DO ', N'Dominican Republic', N'assets/flags/DOM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (61, N'+670', N'TL ', N'East Timor', N'assets/flags/TLS.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (62, N'+593', N'EC ', N'Ecuador', N'assets/flags/ECU.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (63, N'+20', N'EG ', N'Egypt', N'assets/flags/EGY.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (64, N'+503', N'SV ', N'El Salvador', N'assets/flags/SLV.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (65, N'+240', N'GQ ', N'Equatorial Guinea', N'assets/flags/GNQ.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (66, N'+291', N'ER ', N'Eritrea', N'assets/flags/ERI.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (67, N'+372', N'EE ', N'Estonia', N'assets/flags/EST.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (68, N'+251', N'ET ', N'Ethiopia', N'assets/flags/ETH.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (69, N'+500', N'FK ', N'Falkland Islands', N'assets/flags/FLK.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (70, N'+298', N'FO ', N'Faroe Islands', N'assets/flags/FRO.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (71, N'+679', N'FJ ', N'Fiji', N'assets/flags/FJI.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (72, N'+358', N'FI ', N'Finland', N'assets/flags/FIN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (73, N'+33', N'FR ', N'France', N'assets/flags/FRA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (74, N'+689', N'PF ', N'French Polynesia', N'assets/flags/PYF.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (75, N'+241', N'GA ', N'Gabon', N'assets/flags/GAB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (76, N'+220', N'GM ', N'Gambia', N'assets/flags/GMB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (77, N'+995', N'GE ', N'Georgia', N'assets/flags/GEO.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (78, N'+49', N'DE ', N'Germany', N'assets/flags/DEU.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (79, N'+233', N'GH ', N'Ghana', N'assets/flags/GHA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (80, N'+350', N'GI ', N'Gibraltar', N'assets/flags/GIB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (81, N'+30', N'GR ', N'Greece', N'assets/flags/GRC.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (82, N'+299', N'GL ', N'Greenland', N'assets/flags/GRL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (83, N'+1-473', N'GD ', N'Grenada', N'assets/flags/GRD.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (84, N'+1-671', N'GU ', N'Guam', N'assets/flags/GUM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (85, N'+502', N'GT ', N'Guatemala', N'assets/flags/GTM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (86, N'+44-1481', N'GG ', N'Guernsey', N'assets/flags/GGY.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (87, N'+224', N'GN ', N'Guinea', N'assets/flags/GIN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (88, N'+245', N'GW ', N'Guinea-Bissau', N'assets/flags/GNB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (89, N'+592', N'GY ', N'Guyana', N'assets/flags/GUY.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (90, N'+509', N'HT ', N'Haiti', N'assets/flags/HTI.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (91, N'+504', N'HN ', N'Honduras', N'assets/flags/HND.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (92, N'+852', N'HK ', N'Hong Kong', N'assets/flags/HKG.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (93, N'+36', N'HU ', N'Hungary', N'assets/flags/HUN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (94, N'+354', N'IS ', N'Iceland', N'assets/flags/ISL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (95, N'+91', N'IN', N'India', N'assets/flags/ind.svg', 1)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (96, N'+62', N'ID ', N'Indonesia', N'assets/flags/IDN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (97, N'+98', N'IR ', N'Iran', N'assets/flags/IRN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (98, N'+964', N'IQ ', N'Iraq', N'assets/flags/IRQ.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (99, N'+353', N'IE ', N'Ireland', N'assets/flags/IRL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (100, N'+44-1624', N'IM ', N'Isle of Man', N'assets/flags/IMN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (101, N'+972', N'IL ', N'Israel', N'assets/flags/ISR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (102, N'+39', N'IT ', N'Italy', N'assets/flags/ITA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (103, N'+225', N'CI ', N'Ivory Coast', N'assets/flags/CIV.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (104, N'+1-876', N'JM ', N'Jamaica', N'assets/flags/JAM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (105, N'+81', N'JP ', N'Japan', N'assets/flags/JPN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (106, N'+44-1534', N'JE ', N'Jersey', N'assets/flags/JEY.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (107, N'+962', N'JO ', N'Jordan', N'assets/flags/JOR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (108, N'+7', N'KZ ', N'Kazakhstan', N'assets/flags/KAZ.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (109, N'+254', N'KE ', N'Kenya', N'assets/flags/KEN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (110, N'+686', N'KI ', N'Kiribati', N'assets/flags/KIR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (111, N'+383', N'XK ', N'Kosovo', N'assets/flags/XKX.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (112, N'+965', N'KW ', N'Kuwait', N'assets/flags/KWT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (113, N'+996', N'KG ', N'Kyrgyzstan', N'assets/flags/KGZ.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (114, N'+856', N'LA ', N'Laos', N'assets/flags/LAO.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (115, N'+371', N'LV ', N'Latvia', N'assets/flags/LVA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (116, N'+961', N'LB ', N'Lebanon', N'assets/flags/LBN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (117, N'+266', N'LS ', N'Lesotho', N'assets/flags/LSO.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (118, N'+231', N'LR ', N'Liberia', N'assets/flags/LBR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (119, N'+218', N'LY ', N'Libya', N'assets/flags/LBY.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (120, N'+423', N'LI ', N'Liechtenstein', N'assets/flags/LIE.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (121, N'+370', N'LT ', N'Lithuania', N'assets/flags/LTU.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (122, N'+352', N'LU ', N'Luxembourg', N'assets/flags/LUX.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (123, N'+853', N'MO ', N'Macau', N'assets/flags/MAC.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (124, N'+389', N'MK ', N'Macedonia', N'assets/flags/MKD.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (125, N'+261', N'MG ', N'Madagascar', N'assets/flags/MDG.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (126, N'+265', N'MW ', N'Malawi', N'assets/flags/MWI.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (127, N'+60', N'MY', N'Malaysia', N'assets/flags/mys.svg', 1)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (128, N'+960', N'MV ', N'Maldives', N'assets/flags/MDV.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (129, N'+223', N'ML ', N'Mali', N'assets/flags/MLI.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (130, N'+356', N'MT ', N'Malta', N'assets/flags/MLT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (131, N'+692', N'MH ', N'Marshall Islands', N'assets/flags/MHL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (132, N'+222', N'MR ', N'Mauritania', N'assets/flags/MRT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (133, N'+230', N'MU ', N'Mauritius', N'assets/flags/MUS.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (134, N'+262', N'YT ', N'Mayotte', N'assets/flags/MYT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (135, N'+52', N'MX ', N'Mexico', N'assets/flags/MEX.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (136, N'+691', N'FM ', N'Micronesia', N'assets/flags/FSM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (137, N'+373', N'MD ', N'Moldova', N'assets/flags/MDA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (138, N'+377', N'MC ', N'Monaco', N'assets/flags/MCO.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (139, N'+976', N'MN ', N'Mongolia', N'assets/flags/MNG.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (140, N'+382', N'ME ', N'Montenegro', N'assets/flags/MNE.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (141, N'+1-664', N'MS ', N'Montserrat', N'assets/flags/MSR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (142, N'+212', N'MA ', N'Morocco', N'assets/flags/MAR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (143, N'+258', N'MZ ', N'Mozambique', N'assets/flags/MOZ.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (144, N'+95', N'MM ', N'Myanmar', N'assets/flags/MMR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (145, N'+264', N'NA ', N'Namibia', N'assets/flags/NAM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (146, N'+674', N'NR ', N'Nauru', N'assets/flags/NRU.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (147, N'+977', N'NP ', N'Nepal', N'assets/flags/NPL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (148, N'+31', N'NL ', N'Netherlands', N'assets/flags/NLD.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (149, N'+599', N'AN ', N'Netherlands Antilles', N'assets/flags/ANT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (150, N'+687', N'NC ', N'New Caledonia', N'assets/flags/NCL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (151, N'+64', N'NZ ', N'New Zealand', N'assets/flags/NZL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (152, N'+505', N'NI ', N'Nicaragua', N'assets/flags/NIC.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (153, N'+227', N'NE ', N'Niger', N'assets/flags/NER.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (154, N'+234', N'NG ', N'Nigeria', N'assets/flags/NGA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (155, N'+683', N'NU ', N'Niue', N'assets/flags/NIU.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (156, N'+850', N'KP ', N'North Korea', N'assets/flags/PRK.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (157, N'+1-670', N'MP ', N'Northern Mariana Islands', N'assets/flags/MNP.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (158, N'+47', N'NO ', N'Norway', N'assets/flags/NOR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (159, N'+968', N'OM ', N'Oman', N'assets/flags/OMN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (160, N'+92', N'PK ', N'Pakistan', N'assets/flags/PAK.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (161, N'+680', N'PW ', N'Palau', N'assets/flags/PLW.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (162, N'+970', N'PS ', N'Palestine', N'assets/flags/PSE.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (163, N'+507', N'PA ', N'Panama', N'assets/flags/PAN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (164, N'+675', N'PG ', N'Papua New Guinea', N'assets/flags/PNG.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (165, N'+595', N'PY ', N'Paraguay', N'assets/flags/PRY.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (166, N'+51', N'PE ', N'Peru', N'assets/flags/PER.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (167, N'+63', N'PH ', N'Philippines', N'assets/flags/PHL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (168, N'+64', N'PN ', N'Pitcairn', N'assets/flags/PCN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (169, N'+48', N'PL ', N'Poland', N'assets/flags/POL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (170, N'+351', N'PT ', N'Portugal', N'assets/flags/PRT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (171, N'+1-787, 1-939', N'PR ', N'Puerto Rico', N'assets/flags/PRI.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (172, N'+974', N'QA ', N'Qatar', N'assets/flags/QAT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (173, N'+242', N'CG ', N'Republic of the Congo', N'assets/flags/COG.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (174, N'+262', N'RE ', N'Reunion', N'assets/flags/REU.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (175, N'+40', N'RO ', N'Romania', N'assets/flags/ROU.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (176, N'+7', N'RU ', N'Russia', N'assets/flags/RUS.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (177, N'+250', N'RW ', N'Rwanda', N'assets/flags/RWA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (178, N'+590', N'BL ', N'Saint Barthelemy', N'assets/flags/BLM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (179, N'+290', N'SH ', N'Saint Helena', N'assets/flags/SHN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (180, N'+1-869', N'KN ', N'Saint Kitts and Nevis', N'assets/flags/KNA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (181, N'+1-758', N'LC ', N'Saint Lucia', N'assets/flags/LCA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (182, N'+590', N'MF ', N'Saint Martin', N'assets/flags/MAF.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (183, N'+508', N'PM ', N'Saint Pierre and Miquelon', N'assets/flags/SPM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (184, N'+1-784', N'VC ', N'Saint Vincent and the Grenadines', N'assets/flags/VCT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (185, N'+685', N'WS ', N'Samoa', N'assets/flags/WSM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (186, N'+378', N'SM ', N'San Marino', N'assets/flags/SMR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (187, N'+239', N'ST ', N'Sao Tome and Principe', N'assets/flags/STP.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (188, N'+966', N'SA ', N'Saudi Arabia', N'assets/flags/SAU.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (189, N'+221', N'SN ', N'Senegal', N'assets/flags/SEN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (190, N'+381', N'RS ', N'Serbia', N'assets/flags/SRB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (191, N'+248', N'SC ', N'Seychelles', N'assets/flags/SYC.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (192, N'+232', N'SL ', N'Sierra Leone', N'assets/flags/SLE.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (193, N'+65', N'SG ', N'Singapore', N'assets/flags/SGP.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (194, N'+1-721', N'SX ', N'Sint Maarten', N'assets/flags/SXM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (195, N'+421', N'SK ', N'Slovakia', N'assets/flags/SVK.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (196, N'+386', N'SI ', N'Slovenia', N'assets/flags/SVN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (197, N'+677', N'SB ', N'Solomon Islands', N'assets/flags/SLB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (198, N'+252', N'SO ', N'Somalia', N'assets/flags/SOM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (199, N'+27', N'ZA ', N'South Africa', N'assets/flags/ZAF.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (200, N'+82', N'KR ', N'South Korea', N'assets/flags/KOR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (201, N'+211', N'SS ', N'South Sudan', N'assets/flags/SSD.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (202, N'+34', N'ES ', N'Spain', N'assets/flags/ESP.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (203, N'+94', N'LK ', N'Sri Lanka', N'assets/flags/LKA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (204, N'+249', N'SD ', N'Sudan', N'assets/flags/SDN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (205, N'+597', N'SR ', N'Suriname', N'assets/flags/SUR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (206, N'+47', N'SJ ', N'Svalbard and Jan Mayen', N'assets/flags/SJM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (207, N'+268', N'SZ ', N'Swaziland', N'assets/flags/SWZ.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (208, N'+46', N'SE ', N'Sweden', N'assets/flags/SWE.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (209, N'+41', N'CH ', N'Switzerland', N'assets/flags/CHE.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (210, N'+963', N'SY ', N'Syria', N'assets/flags/SYR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (211, N'+886', N'TW ', N'Taiwan', N'assets/flags/TWN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (212, N'+992', N'TJ ', N'Tajikistan', N'assets/flags/TJK.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (213, N'+255', N'TZ ', N'Tanzania', N'assets/flags/TZA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (214, N'+66', N'TH ', N'Thailand', N'assets/flags/THA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (215, N'+228', N'TG ', N'Togo', N'assets/flags/TGO.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (216, N'+690', N'TK ', N'Tokelau', N'assets/flags/TKL.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (217, N'+676', N'TO ', N'Tonga', N'assets/flags/TON.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (218, N'+1-868', N'TT ', N'Trinidad and Tobago', N'assets/flags/TTO.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (219, N'+216', N'TN ', N'Tunisia', N'assets/flags/TUN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (220, N'+90', N'TR ', N'Turkey', N'assets/flags/TUR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (221, N'+993', N'TM ', N'Turkmenistan', N'assets/flags/TKM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (222, N'+1-649', N'TC ', N'Turks and Caicos Islands', N'assets/flags/TCA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (223, N'+688', N'TV ', N'Tuvalu', N'assets/flags/TUV.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (224, N'+1-340', N'VI ', N'U.S. Virgin Islands', N'assets/flags/VIR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (225, N'+256', N'UG ', N'Uganda', N'assets/flags/UGA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (226, N'+380', N'UA ', N'Ukraine', N'assets/flags/UKR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (227, N'+971', N'AE ', N'United Arab Emirates', N'assets/flags/ARE.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (228, N'+44', N'GB ', N'United Kingdom', N'assets/flags/GBR.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (229, N'+1', N'US ', N'United States', N'assets/flags/USA.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (230, N'+598', N'UY ', N'Uruguay', N'assets/flags/URY.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (231, N'+998', N'UZ ', N'Uzbekistan', N'assets/flags/UZB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (232, N'+678', N'VU ', N'Vanuatu', N'assets/flags/VUT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (233, N'+379', N'VA ', N'Vatican', N'assets/flags/VAT.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (234, N'+58', N'VE ', N'Venezuela', N'assets/flags/VEN.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (235, N'+84', N'VN ', N'Vietnam', N'assets/flags/VNM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (236, N'+681', N'WF ', N'Wallis and Futuna', N'assets/flags/WLF.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (237, N'+212', N'EH ', N'Western Sahara', N'assets/flags/ESH.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (238, N'+967', N'YE ', N'Yemen', N'assets/flags/YEM.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (239, N'+260', N'ZM ', N'Zambia', N'assets/flags/ZMB.svg', 0)
GO
INSERT [proppyappuser].[tbl_Countries] ([Id], [Code], [ISOCode], [Name], [Flag], [Status]) VALUES (240, N'+263', N'ZW ', N'Zimbabwe', N'assets/flags/ZWE.svg', 0)
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_Countries] OFF
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_GlobalValues] ON 
GO
INSERT [proppyappuser].[tbl_GlobalValues] ([Id], [GVName], [GVValue], [CreatedOn]) VALUES (1, N'Const_Documents_Path', N'D:\Ionic', CAST(N'2021-03-10T14:23:16.773' AS DateTime))
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_GlobalValues] OFF
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_Marketplace] ON 
GO
INSERT [proppyappuser].[tbl_Marketplace] ([Id], [Name], [ContactPerson], [Description], [Type], [Price], [Currency], [DefaultImage], [TypeCode], [CountryCode], [State], [Area], [BuiltUp], [Bedroom], [Bathroom], [LandType], [Furnished], [Longitude], [Latitude], [SaleType], [CreatedAt], [CreatedBy], [Status], [StatusPaid]) VALUES (1, N'test', N'1234567890', N'quiet and good location', N'1', CAST(200000 AS Decimal(18, 0)), N'USD', N'no img', N'2S', N'CN', N'HE', N'TA', 5000, 3, 4, N'1', N'0', CAST(102.275403094 AS Decimal(12, 9)), CAST(4.540149381 AS Decimal(12, 9)), N'1', CAST(N'2021-02-22T10:06:23.210' AS DateTime), N'Surendra', 1, 1)
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_Marketplace] OFF
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_PropertySaleType] ON 
GO
INSERT [proppyappuser].[tbl_PropertySaleType] ([id], [SaleType]) VALUES (5, N'Subsale')
GO
INSERT [proppyappuser].[tbl_PropertySaleType] ([id], [SaleType]) VALUES (6, N'Auction')
GO
INSERT [proppyappuser].[tbl_PropertySaleType] ([id], [SaleType]) VALUES (7, N'
New Launch
')
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_PropertySaleType] OFF
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'1T', N'1-sty Terrace/Link House')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'2S', N'Double Storey Superlink Homes')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'2T', N'2-sty Terrace/Link House')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'3D', N'3 Storey Semi Detached Homes')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'3S', N'3 Storey Superlink Homes')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'3T', N'3-sty Terrace/Link House')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'4T', N'2 &amp; 3 Sty Terrace/Link House')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'5T', N'1.5-sty Terrace/Link House')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'6T', N'2.5-sty Terrace/Link House')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'7T', N'3.5-sty Terrace/Link House')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'8T', N'4.5-sty Terrace/Link House')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'9T', N'4-sty Terrace/Link House')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'A', N'Apartment/Flat')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'AA', N'All Agricultural')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'AC', N'All Commercial')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'AI', N'All Industrial')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'AP', N'Apartment')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'B', N'Semi-D/Bungalow')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'BC', N'Business Centre')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'BG', N'Bungalow')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'BL', N'Bungalow Land')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'C', N'Commercial Land')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'CB', N'Commercial Bungalow')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'CD', N'Commercial Semi-D')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'CF', N'Cluster Factory')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'CH', N'Cluster House')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'CO', N'Condominium')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'DS', N'Designer Suites')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'E', N'Condo/Serviced Residence')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'F', N'Factory/Warehouse')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'FD', N'Detached Factory')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'FK', N'Link Factory')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'FL', N'Flat')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'FS', N'Semi-D Factory')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'FT', N'Factory')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'G', N'Agricultural Land')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'H', N'Hotel/Resort')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'I', N'Industrial Land')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'LI', N'Light Industrial')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'LS', N'Luxury Suites')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'OF', N'Office')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'R', N'Residential Land')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'RO', N'Retail Office')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'RS', N'Retail Space')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'S', N'Shop/Office/Retail Space')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'SD', N'Semi-detached House')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'SF', N'Sofo')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'SH', N'Shop')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'SO', N'Shop Office')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'SR', N'Serviced Residence')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'SS', N'Soho')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'ST', N'Suites')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'SV', N'Sovo')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'T', N'Terrace/Link/Townhouse')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'TH', N'Townhouse')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'V', N'Villa')
GO
INSERT [proppyappuser].[tbl_PropertyType] ([Code], [Name]) VALUES (N'WH', N'Warehouse')
GO
INSERT [proppyappuser].[tbl_States] ([Code], [Name], [CountryCode], [Enabled]) VALUES (N'HE', N'Hebei', N'CN', 1)
GO
INSERT [proppyappuser].[tbl_States] ([Code], [Name], [CountryCode], [Enabled]) VALUES (N'SA', N'Sabah', N'MY', 1)
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ON 
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (21, N'100K', 100000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (22, N'200K', 200000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (23, N'300K', 300000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (24, N'400K', 400000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (25, N'500K', 500000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (26, N'600K', 600000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (27, N'700K', 700000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (28, N'800K', 800000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (29, N'900K', 900000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (30, N'1M', 1000000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (31, N'2M', 2000000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (32, N'3M', 3000000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (33, N'4M', 4000000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (34, N'5M', 5000000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (35, N'6M', 6000000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (36, N'7M', 7000000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (37, N'8M', 8000000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (38, N'9M', 9000000, 0)
GO
INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] ([ID], [Price], [value], [Type]) VALUES (39, N'10M', 10000000, 0)
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_TypeOfPropertyPricing] OFF
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_UserRegistration] ON 
GO
INSERT [proppyappuser].[tbl_UserRegistration] ([ID], [MobileNo], [Email_Address], [FirstName], [LastName], [Password], [Status], [MemberCode], [ReferralCode], [Gender], [DOB], [Occupation], [Industry], [Address], [City], [State], [PostCode], [CountryCode], [StripeCustomerID], [CreatedAt]) VALUES (1, N'9515945912', N'kusuma@gmail.com', N'kusuma', N'M', 0xBA3253876AED6BC22D4A6FF53D8406C6AD864195ED144AB5C87621B6C233B548BAEAE6956DF346EC8C17F5EA10F35EE3CBC514797ED7DDD3145464E2A0BAB41300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-10T10:21:48.650' AS DateTime))
GO
INSERT [proppyappuser].[tbl_UserRegistration] ([ID], [MobileNo], [Email_Address], [FirstName], [LastName], [Password], [Status], [MemberCode], [ReferralCode], [Gender], [DOB], [Occupation], [Industry], [Address], [City], [State], [PostCode], [CountryCode], [StripeCustomerID], [CreatedAt]) VALUES (2, N'9705433222', N'kusu@gmail.com', N'K', N'M', 0xBA3253876AED6BC22D4A6FF53D8406C6AD864195ED144AB5C87621B6C233B548BAEAE6956DF346EC8C17F5EA10F35EE3CBC514797ED7DDD3145464E2A0BAB41300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-10T10:23:26.920' AS DateTime))
GO
INSERT [proppyappuser].[tbl_UserRegistration] ([ID], [MobileNo], [Email_Address], [FirstName], [LastName], [Password], [Status], [MemberCode], [ReferralCode], [Gender], [DOB], [Occupation], [Industry], [Address], [City], [State], [PostCode], [CountryCode], [StripeCustomerID], [CreatedAt]) VALUES (3, N'9705433222', N'kusum@gmail.com', N'Kusuma', N'm', 0xBA3253876AED6BC22D4A6FF53D8406C6AD864195ED144AB5C87621B6C233B548BAEAE6956DF346EC8C17F5EA10F35EE3CBC514797ED7DDD3145464E2A0BAB41300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-10T12:59:44.913' AS DateTime))
GO
INSERT [proppyappuser].[tbl_UserRegistration] ([ID], [MobileNo], [Email_Address], [FirstName], [LastName], [Password], [Status], [MemberCode], [ReferralCode], [Gender], [DOB], [Occupation], [Industry], [Address], [City], [State], [PostCode], [CountryCode], [StripeCustomerID], [CreatedAt]) VALUES (4, N'107113527', N'sashe@gmail.com', N'sashe', N'm', 0xBA3253876AED6BC22D4A6FF53D8406C6AD864195ED144AB5C87621B6C233B548BAEAE6956DF346EC8C17F5EA10F35EE3CBC514797ED7DDD3145464E2A0BAB41300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-03-10T15:19:02.380' AS DateTime))
GO
SET IDENTITY_INSERT [proppyappuser].[tbl_UserRegistration] OFF
GO
ALTER TABLE [proppyappuser].[tbl_GlobalValues] ADD  CONSTRAINT [DF_tbl_GlobalValues_CreatedOn]  DEFAULT (getdate()) FOR [CreatedOn]
GO
ALTER TABLE [proppyappuser].[tbl_UserRegistration] ADD  CONSTRAINT [DF_tbl_UserRegistration_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [proppyappuser].[tbl_UserRegistration] ADD  CONSTRAINT [DF_tbl_UserRegistration_CreatedAt]  DEFAULT (getdate()) FOR [CreatedAt]
GO
/****** Object:  StoredProcedure [dbo].[sp_NewUserRegistration]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_NewUserRegistration](@MobileNo VARCHAR(500),  @Email_Address VARCHAR(500), @FirstName varchar(500), @LastName varchar(500),
                                                @Password varchar(500) ,  @id int output)
As 
 BEGIN
 SET @id= 0
 if exists (select * from proppyappuser.tbl_UserRegistration where ISNULL(Email_Address,'')=@Email_Address)
	 begin
		Return @id
	 end
else if exists (select * from proppyappuser.tbl_UserRegistration where ISNULL(MobileNo,'')=@MobileNo)
	begin
		set @id=-1
		Return @id
	end
else
INSERT INTO proppyappuser.tbl_UserRegistration  
                        (MobileNo,Email_Address,FirstName,LastName, Password )  
				VALUES     ( @MobileNo,@Email_Address,@FirstName,@LastName,HASHBYTES('SHA2_512', @Password))  
        SET @id=SCOPE_IDENTITY()
      RETURN  @id
  
 END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_AddMarketPlace]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [proppyappuser].[SP_AddMarketPlace] (@Name varchar(150), @ContactPerson varchar(50), @Description nvarchar(max),@Type varchar(20),@Price decimal,@Currency varchar(3),@DefaultImage varchar(150),@TypeCode varchar(10),@CountryCode varchar(50), @State varchar(50),@Area varchar(50),@BuiltUp int,@Bedroom int,@Bathroom int,@LandType varchar(20),@Furnished varchar(20),@Longitude decimal,@Latitude decimal,@SaleType varchar(50),@CreatedAt datetime,@CreatedBy varchar(50),@Status int,@StatusPaid int)
AS
BEGIN
 insert into proppyappuser.tbl_Marketplace(Name,Contactperson,Description,Type,Price,Currency,DefaultImage,TypeCode,CountryCode,State,Area,BuiltUp,Bedroom,Bathroom,LandType,Furnished,Longitude,Latitude,SaleType,CreatedAt,CreatedBy,Status,StatusPaid) values(@Name,@ContactPerson,@Description,@Type,@Price,@Currency,@DefaultImage,@TypeCode,@CountryCode,@State,@Area,@BuiltUp,@Bedroom,@Bathroom,@LandType,@Furnished,@Longitude,@Latitude,@SaleType,@CreatedAt,@CreatedBy,@Status,@StatusPaid)
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_AddMarketPlaceImage]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [proppyappuser].[SP_AddMarketPlaceImage] (@PropertyID bigint,@ImageURL varchar(250),@SeqNo int,@PublicId varchar(32))
AS
BEGIN
	insert into proppyappuser.tbl_Marketplace_Images(PropertyID,ImageURL,SeqNo,PublicId) values(@PropertyID,@ImageURL,@SeqNo,@PublicId)
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_AddPropertyType]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [proppyappuser].[SP_AddPropertyType] (@Code varchar(2),@Name varchar(max))
AS
BEGIN
	insert into proppyappuser.tbl_PropertyType(Code,Name) values(@Code,@Name)
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_DeleteMarketPlace]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [proppyappuser].[SP_DeleteMarketPlace] (@id bigint)
AS
BEGIN
 
 Delete from proppyappuser.tbl_MarketPlace where id=@Id

END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_DeleteMarketPlaceImage]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [proppyappuser].[SP_DeleteMarketPlaceImage] (@id bigint)
AS
BEGIN
	Delete from proppyappuser.tbl_Marketplace_Images where ID=@Id
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_GetAreas]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [proppyappuser].[SP_GetAreas] (@CountryCode varchar(2)='',@StateCode varchar(2)='')
AS
BEGIN
if(LEN(@CountryCode)>0)
	select * from proppyappuser.tbl_Area where CountryCode=@CountryCode;
else if(LEN(@StateCode)>0)
	select * from proppyappuser.tbl_Area where StateCode=@StateCode;
else
	select * from proppyappuser.tbl_Area;
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_GetBedRoomTypes]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [proppyappuser].[SP_GetBedRoomTypes]
AS
BEGIN
	SELECT * from proppyappuser.tbl_BedRoomTypes;
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_GetCountries]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [proppyappuser].[SP_GetCountries] 
AS
BEGIN
	select * from tbl_Countries where isnull(status,0)=1
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_GetMarketPlace]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [proppyappuser].[SP_GetMarketPlace] (@Id bigint = 0)
AS
BEGIN
 if(@Id<>0)
	select * from proppyappuser.tbl_Marketplace where id=@Id
	else 
	select * from proppyappuser.tbl_Marketplace
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_GetMarketPlaceFilter]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [proppyappuser].[SP_GetMarketPlaceFilter] (@Queryfilter nvarchar(1000),@longitude varchar(50), @latitude varchar(50),@PageNumber int, @PageLimit int)
AS
DECLARE @SQL_QUERY NVARCHAR (MAX)
DECLARE @PARAMS NVARCHAR (1000)

SET @SQL_QUERY = N'DECLARE @s geography
	SET @s = geography:: STGeomFromText(''POINT('' + STR(@long,15,7) + '' '' + STR(@lat,15,7) + '')'' , 4326); 

     SELECT *,
	 geography::STGeomFromText (''POINT('' + STR (Longitude, 15,7 ) + '' '' + Str(Latitude ,15, 7) + '')'' , 4326) As A,
    geography::STGeomFromText (''POINT('' + STR (Longitude, 15,7 ) + '' '' + Str(Latitude ,15, 7) + '')'' , 4326). ToString() As B,        
    @s.STDistance( geography::STGeomFromText (''POINT('' + STR(Longitude ,15, 7) + '' '' + Str(Latitude ,15, 7) + '')'' , 4326))/1000 as distance  
     FROM tbl_Marketplace '+ @Queryfilter+' OFFSET (@PageNo-1)*@PageLmt ROWS
FETCH NEXT @PageLmt ROWS ONLY'
	 SET @PARAMS = '@long varchar(50), @lat varchar(50),@PageNo int, @PageLmt int'
	 EXECUTE sp_executesql @SQL_QUERY,@PARAMS,@long=@longitude,@lat=@latitude,@PageNo=@PageNumber,@PageLmt=@PageLimit

GO
/****** Object:  StoredProcedure [proppyappuser].[SP_GetMarketPlaceImage]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [proppyappuser].[SP_GetMarketPlaceImage] (@PropertyId bigint)
AS
BEGIN
	if(@PropertyId<>0)
	select * from proppyappuser.tbl_Marketplace_Images where PropertyId=@PropertyId
	else 
	select * from proppyappuser.tbl_Marketplace_Images
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_GetPropertyPricing]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [proppyappuser].[SP_GetPropertyPricing] (@Type int=0)
AS
BEGIN
	if(@Type>0)
		select * from proppyappuser.tbl_TypeOfPropertyPricing where Type=0 Or Type=@Type;
	else
		select * from proppyappuser.tbl_TypeOfPropertyPricing;
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_GetPropertySaleType]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [proppyappuser].[SP_GetPropertySaleType]
AS
BEGIN
	select * from proppyappuser.tbl_propertysaletype
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_GetPropertyType]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [proppyappuser].[SP_GetPropertyType](@Code varchar(2) = '' )
AS
BEGIN
	if(@Code<>'')
		select * from tbl_PropertyType where Code=@Code
	else
		select * from tbl_PropertyType
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_GetStates]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [proppyappuser].[SP_GetStates] (@CountryCode varchar(2)='')
AS
BEGIN
	if(LEN(@CountryCode)>0)
	select * from proppyappuser.tbl_States where CountryCode=@CountryCode;
	else
	select * from proppyappuser.tbl_States;
END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_UpdateMarketPlace]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [proppyappuser].[SP_UpdateMarketPlace] (@ID bigint,@Name varchar(150), @ContactPerson varchar(50), @Description nvarchar(max),@Type varchar(20),@Price decimal,@Currency varchar(3),@DefaultImage varchar(150),@TypeCode varchar(10),@CountryCode varchar(50), @State varchar(50),@Area varchar(50),@BuiltUp int,@Bedroom int,@Bathroom int,@LandType varchar(20),@Furnished varchar(20),@Longitude decimal,@Latitude decimal,@SaleType varchar(50),@CreatedAt datetime,@CreatedBy varchar(50),@Status int,@StatusPaid int)
AS
BEGIN
 
 update proppyappuser.tbl_MarketPlace set Name=@Name,Contactperson=@Contactperson,Description=@Description,Type=@Type,Price=@Price,Currency=@Currency,DefaultImage=@DefaultImage,TypeCode=@TypeCode,CountryCode=@CountryCode,State=@State,Area=@Area,BuiltUp=@BuiltUp,Bedroom=@Bedroom,Bathroom=@Bathroom,LandType=@LandType,Furnished=@Furnished,Longitude=@Longitude,Latitude=@Latitude,SaleType=@SaleType,CreatedAt=@CreatedAt,CreatedBy=@CreatedBy,Status=@Status,StatusPaid=@StatusPaid where id=@Id

END
GO
/****** Object:  StoredProcedure [proppyappuser].[SP_UpdateMarketPlaceImage]    Script Date: 13-03-2021 18:23:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [proppyappuser].[SP_UpdateMarketPlaceImage] (@ID bigint,@PropertyID bigint,@ImageURL varchar(250),@SeqNo int,@PublicId varchar(32))
AS
BEGIN
	update proppyappuser.tbl_Marketplace_Images set PropertyID=@PropertyID,ImageURL=@ImageURL,SeqNo=@SeqNo,PublicId=@PublicId where ID=@ID
END
GO
USE [master]
GO
ALTER DATABASE [proppyapp] SET  READ_WRITE 
GO
