USE [master]
GO
/****** Object:  Database [ExamSignSystem]    Script Date: 2016/12/20 17:00:18 ******/
CREATE DATABASE [ExamSignSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ExamSignSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ExamSignSystem.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ExamSignSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ExamSignSystem_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ExamSignSystem] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ExamSignSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ExamSignSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ExamSignSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ExamSignSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ExamSignSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ExamSignSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [ExamSignSystem] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ExamSignSystem] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ExamSignSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ExamSignSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ExamSignSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ExamSignSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ExamSignSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ExamSignSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ExamSignSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ExamSignSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ExamSignSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ExamSignSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ExamSignSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ExamSignSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ExamSignSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ExamSignSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ExamSignSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ExamSignSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ExamSignSystem] SET RECOVERY FULL 
GO
ALTER DATABASE [ExamSignSystem] SET  MULTI_USER 
GO
ALTER DATABASE [ExamSignSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ExamSignSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ExamSignSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ExamSignSystem] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ExamSignSystem', N'ON'
GO
USE [ExamSignSystem]
GO
/****** Object:  StoredProcedure [dbo].[sp_paged_data]    Script Date: 2016/12/20 17:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
 create procedure [dbo].[sp_paged_data]
(
    @sqlTable nvarchar(200),              ----待查询表名
    @sqlColumns nvarchar(500) ,    ----待显示字段
    @sqlWhere nvarchar(1000) ,  ----查询条件,不需where 
    @sqlSort nvarchar(500) ,        ----排序字段，不需order by 
    @pageIndex int,                       ----当前页
    @pageSize int,                        ----每页显示的记录数
    @rowTotal int = 1 output	  ----返回总记录数
)
as
begin
    set nocount on;
    -- 获取记录总数
    declare @sqlcount nvarchar(1000)  ;
    set @sqlcount = N' select @rowTotal=count(*) from '+@sqlTable +' where 1=1 ' +@sqlWhere;
    exec sp_executesql @sqlcount,N'@rowTotal int out ',@rowTotal out ;
    -- 返回数据查询
    declare @sqldata nvarchar(1000) ;
    if( @pageIndex =0)
    begin
		set @sqldata=' select top '+cast(@pageSize as varchar(10))+' '+@sqlColumns + ' from '+@sqlTable +' where 1=1 '+ @sqlWhere+' order by ' +@sqlSort;
    end
    else
    begin
		set @sqldata=' select '+ @sqlColumns + ' from (select *,Row_number() over(order by '+ @sqlSort +' ) as RN from '+ @sqlTable +' where 1=1 '+ @sqlWhere+') as TR where RN>'+ cast(@pageSize*@pageIndex as varchar(20))+' and RN<'+ cast((@pageSize*(@pageIndex+1)+1) as varchar(20));
    end
    exec sp_executesql @sqldata ;
end

GO
/****** Object:  Table [dbo].[tb_Admin]    Script Date: 2016/12/20 17:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Admin](
	[adminID] [int] IDENTITY(1,1) NOT NULL,
	[adminAccount] [varchar](50) NOT NULL,
	[adminPwd] [varchar](50) NOT NULL,
	[adminEmail] [varchar](50) NULL,
 CONSTRAINT [PK_TB_ADMIN] PRIMARY KEY CLUSTERED 
(
	[adminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Grade]    Script Date: 2016/12/20 17:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Grade](
	[gradeID] [int] NOT NULL,
	[gradeSno] [varchar](20) NULL,
	[gradeSubject] [varchar](50) NULL,
	[gradeTime] [datetime] NULL,
	[gradeScore] [int] NULL,
 CONSTRAINT [PK_TB_GRADE] PRIMARY KEY CLUSTERED 
(
	[gradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Message]    Script Date: 2016/12/20 17:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Message](
	[msgID] [int] IDENTITY(1,1) NOT NULL,
	[msgTitle] [varchar](100) NULL,
	[msgLookTotal] [varchar](10) NULL,
	[msgTime] [datetime] NULL,
	[msgContents] [varchar](500) NULL,
 CONSTRAINT [PK_TB_MESSAGE] PRIMARY KEY CLUSTERED 
(
	[msgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Sign]    Script Date: 2016/12/20 17:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Sign](
	[signID] [int] IDENTITY(1,1) NOT NULL,
	[stuNo] [varchar](20) NULL,
	[subjectID] [int] NULL,
 CONSTRAINT [PK_tb_Sign] PRIMARY KEY NONCLUSTERED 
(
	[signID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AK_KEY_1_TB_SIGN] UNIQUE CLUSTERED 
(
	[signID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Student]    Script Date: 2016/12/20 17:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Student](
	[stuName] [varchar](20) NULL,
	[stuNo] [varchar](20) NOT NULL,
	[stuPwd] [varchar](100) NULL,
	[stuSex] [varchar](2) NULL,
	[stuClass] [varchar](40) NULL,
	[stuMajor] [varchar](20) NULL,
	[stuAddress] [varchar](50) NULL,
	[stuMobile] [varchar](20) NULL,
	[stuEmail] [varchar](20) NULL,
	[stuPolitical] [varchar](20) NULL,
 CONSTRAINT [PK_TB_STUDENT] PRIMARY KEY CLUSTERED 
(
	[stuNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_Subject]    Script Date: 2016/12/20 17:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_Subject](
	[subjectID] [int] IDENTITY(1,1) NOT NULL,
	[subjectName] [varchar](50) NULL,
	[subjectExamTime] [date] NULL,
	[subjectExamAddress] [varchar](20) NULL,
	[subjectSignStartTime] [date] NULL,
	[subjectSignEndTime] [date] NULL,
 CONSTRAINT [PK_TB_SUBJECT] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ViewSignInfo]    Script Date: 2016/12/20 17:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[ViewSignInfo](stuName,stuNo,stuPwd,stuClass,stuMajor,stuMobile)
as
 
select stuName,stuNo,stuPwd,stuClass,stuMajor,stuMobile from tb_Student;
GO
/****** Object:  View [dbo].[ViewSubject]    Script Date: 2016/12/20 17:00:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create view [dbo].[ViewSubject](subjectID,subjectName,subjectExamTime,subjectExamAddress,subjectSignStartTime,subjectSignEndTime)
as
 
select * from tb_Subject where subjectSignEndTime>GETDATE();
GO
ALTER TABLE [dbo].[tb_Sign]  WITH CHECK ADD  CONSTRAINT [FK_TB_SIGN_REFERENCE_TB_STUDE] FOREIGN KEY([stuNo])
REFERENCES [dbo].[tb_Student] ([stuNo])
GO
ALTER TABLE [dbo].[tb_Sign] CHECK CONSTRAINT [FK_TB_SIGN_REFERENCE_TB_STUDE]
GO
ALTER TABLE [dbo].[tb_Sign]  WITH CHECK ADD  CONSTRAINT [FK_TB_SIGN_REFERENCE_TB_SUBJE] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tb_Subject] ([subjectID])
GO
ALTER TABLE [dbo].[tb_Sign] CHECK CONSTRAINT [FK_TB_SIGN_REFERENCE_TB_SUBJE]
GO
USE [master]
GO
ALTER DATABASE [ExamSignSystem] SET  READ_WRITE 
GO
