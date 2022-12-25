-- SQL Manager 2010 for SQL Server 3.5.0.4
-- ---------------------------------------
-- Host      : (local)
-- Database  : METADATA
-- Version   : Microsoft SQL Server  9.00.1399.06


--
-- Dropping table Data_Flow : 
--
create database METADATA
go
use METADATA
IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[Data_Flow]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[Data_Flow]
GO

--
-- Dropping table DDS : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DDS]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[DDS]
GO

--
-- Dropping table DDS_MOLAP : 
--

IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DDS_MOLAP]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
  DROP TABLE [dbo].[DDS_MOLAP]
GO

--
-- Definition for table Data_Flow : 
--

CREATE TABLE [dbo].[Data_Flow] (
  [ID] int IDENTITY(1, 1) NOT NULL,
  [TenBang] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [LSET] datetime NULL,
  [CET] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table DDS : 
--

CREATE TABLE [dbo].[DDS] (
  [ID] int IDENTITY(1, 1) NOT NULL,
  [TenBang] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgayCapNhat] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table DDS_MOLAP : 
--

CREATE TABLE [dbo].[DDS_MOLAP] (
  [ID] int IDENTITY(1, 1) NOT NULL,
  [TenBang] nvarchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
  [NgayCapNhat] datetime NULL
)
ON [PRIMARY]
GO

--
-- Data for table dbo.Data_Flow  (LIMIT 0,500)
--

SET IDENTITY_INSERT [dbo].[Data_Flow] ON
GO

INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [LSET])
VALUES 
  (1, N'CaseDetails_Canada', '20110517 22:11:11.660')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [LSET])
VALUES 
  (2, N'CasesReport_Ontario', '20110517 22:11:11.660')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [LSET])
VALUES 
  (3, N'OngoingOutbreaks_Ontario', '20110517 22:11:11.660')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [LSET])
VALUES 
  (4, N'PHUGroups', '20110517 22:11:11.660')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [LSET])
VALUES 
  (5, N'PublicHealthUnit_Ontario', '20110517 22:11:11.660')
GO
INSERT INTO [dbo].[Data_Flow] ([ID], [TenBang], [LSET])
VALUES 
  (6, N'VaccinesByAge_Ontario', '20110517 22:11:11.660')
GO


SET IDENTITY_INSERT [dbo].[Data_Flow] OFF
GO

----
---- Data for table dbo.DDS  (LIMIT 0,500)
----

--SET IDENTITY_INSERT [dbo].[DDS] ON
--GO

--INSERT INTO [dbo].[DDS] ([ID], [TenBang], [NgayCapNhat])
--VALUES 
--  (1, N'KhachHang', '20110517 22:11:38.983')
--GO

--INSERT INTO [dbo].[DDS] ([ID], [TenBang], [NgayCapNhat])
--VALUES 
--  (2, N'SanPham', '20110517 22:11:40.917')
--GO

--INSERT INTO [dbo].[DDS] ([ID], [TenBang], [NgayCapNhat])
--VALUES 
--  (3, N'CuaHang', '20110517 22:11:39.903')
--GO

--INSERT INTO [dbo].[DDS] ([ID], [TenBang], [NgayCapNhat])
--VALUES 
--  (4, N'Ngay', '20110517 22:11:41.010')
--GO

--SET IDENTITY_INSERT [dbo].[DDS] OFF
--GO

----
---- Data for table dbo.DDS_MOLAP  (LIMIT 0,500)
----

--SET IDENTITY_INSERT [dbo].[DDS_MOLAP] ON
--GO

--INSERT INTO [dbo].[DDS_MOLAP] ([ID], [TenBang], [NgayCapNhat])
--VALUES 
--  (1, N'dim_KhachHang', '20110517 22:11:37.423')
--GO

--INSERT INTO [dbo].[DDS_MOLAP] ([ID], [TenBang], [NgayCapNhat])
--VALUES 
--  (2, N'dim_CuaHang', '20110517 22:11:35.743')
--GO

--INSERT INTO [dbo].[DDS_MOLAP] ([ID], [TenBang], [NgayCapNhat])
--VALUES 
--  (3, N'dim_SanPham', '20110517 22:11:36.143')
--GO

--INSERT INTO [dbo].[DDS_MOLAP] ([ID], [TenBang], [NgayCapNhat])
--VALUES 
--  (4, N'dim_ThoiGian', '20110517 22:11:35.383')
--GO

--SET IDENTITY_INSERT [dbo].[DDS_MOLAP] OFF
--GO

--
-- Definition for indices : 
--

ALTER TABLE [dbo].[Data_Flow]
ADD CONSTRAINT [PK_Data_Flow] 
PRIMARY KEY CLUSTERED ([ID])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[DDS]
ADD CONSTRAINT [PK_DDS] 
PRIMARY KEY CLUSTERED ([ID])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

ALTER TABLE [dbo].[DDS_MOLAP]
ADD CONSTRAINT [PK_DDS_MOLAP] 
PRIMARY KEY CLUSTERED ([ID])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO

