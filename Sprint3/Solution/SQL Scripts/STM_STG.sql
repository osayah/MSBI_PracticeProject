USE [master]
GO
/****** Object:  Database [STM_STG]    Script Date: 25/07/2014 7:46:59 PM ******/
CREATE DATABASE [STM_STG]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'STM_STG', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\STM_STG.mdf' , SIZE = 41568256KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'STM_STG_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\STM_STG_log.ldf' , SIZE = 4211392KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [STM_STG] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [STM_STG].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [STM_STG] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [STM_STG] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [STM_STG] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [STM_STG] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [STM_STG] SET ARITHABORT OFF 
GO
ALTER DATABASE [STM_STG] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [STM_STG] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [STM_STG] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [STM_STG] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [STM_STG] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [STM_STG] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [STM_STG] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [STM_STG] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [STM_STG] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [STM_STG] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [STM_STG] SET  DISABLE_BROKER 
GO
ALTER DATABASE [STM_STG] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [STM_STG] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [STM_STG] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [STM_STG] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [STM_STG] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [STM_STG] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [STM_STG] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [STM_STG] SET RECOVERY FULL 
GO
ALTER DATABASE [STM_STG] SET  MULTI_USER 
GO
ALTER DATABASE [STM_STG] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [STM_STG] SET DB_CHAINING OFF 
GO
ALTER DATABASE [STM_STG] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [STM_STG] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'STM_STG', N'ON'
GO
USE [STM_STG]
GO
/****** Object:  Table [dbo].[CleanBus]    Script Date: 25/07/2014 7:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CleanBus](
	[ExecutionGUID] [uniqueidentifier] NULL,
	[route_long_name] [varchar](50) NULL,
	[route_type] [varchar](50) NULL,
	[route_url] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[BusLineCode] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CleanDate]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CleanDate](
	[ExecutionGUID] [uniqueidentifier] NULL,
	[service_id] [varchar](50) NULL,
	[exception_type] [varchar](50) NULL,
	[date] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CleanFare]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CleanFare](
	[Hash] [binary](8000) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[fare_id] [varchar](50) NULL,
	[currency_type] [varchar](50) NULL,
	[transfer_duration] [int] NULL,
	[FarePrice] [smallmoney] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CleanStop]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CleanStop](
	[StopID] [varchar](50) NULL,
	[StopCode] [varchar](50) NULL,
	[StopName] [varchar](150) NULL,
	[StopURL] [varchar](150) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[PostalCode] [varchar](150) NULL,
	[District] [varchar](150) NULL,
	[City] [varchar](150) NULL,
	[WheelchairBoarding_bool] [bit] NULL,
	[ExecutionGUID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CleanStopTime]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CleanStopTime](
	[ExecutionGUID] [uniqueidentifier] NULL,
	[service_id] [varchar](50) NULL,
	[trip_id] [varchar](50) NULL,
	[stop_id] [varchar](50) NULL,
	[stop_code] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[date] [datetime] NULL,
	[StopSequence] [int] NULL,
	[DepartureTime] [time](0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConformBus]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConformBus](
	[ExecutionGUID] [uniqueidentifier] NULL,
	[route_long_name] [varchar](50) NULL,
	[route_url] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[BusLineCode] [int] NULL,
	[BusLineOrientation] [varchar](50) NULL,
	[BusLineDirection] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConformDate]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConformDate](
	[ExecutionGUID] [uniqueidentifier] NULL,
	[service_id] [varchar](50) NULL,
	[exception_type] [varchar](50) NULL,
	[date] [datetime] NULL,
	[IsWeekDay] [bit] NULL,
	[IsWeekEnd] [bit] NULL,
	[IsHoliday] [bit] NULL,
	[DimDateID] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConformFare]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConformFare](
	[ExecutionGUID] [uniqueidentifier] NULL,
	[fare_id] [varchar](50) NULL,
	[currency_type] [varchar](50) NULL,
	[transfer_duration] [int] NULL,
	[FarePrice] [smallmoney] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConformStop]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConformStop](
	[StopID] [varchar](50) NULL,
	[StopCode] [varchar](50) NULL,
	[StopName] [varchar](150) NULL,
	[StopURL] [varchar](150) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[PostalCode] [varchar](7) NULL,
	[District] [varchar](150) NULL,
	[City] [varchar](150) NULL,
	[WheelchairBoarding_bool] [bit] NULL,
	[ExecutionGUID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConformStopTime]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConformStopTime](
	[ExecutionGUID] [uniqueidentifier] NULL,
	[service_id] [varchar](50) NULL,
	[trip_id] [varchar](50) NULL,
	[stop_id] [varchar](50) NULL,
	[stop_code] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[date] [datetime] NULL,
	[StopSequence] [int] NULL,
	[DepartureTime] [time](0) NULL,
	[BusLineCode] [int] NULL,
	[BusLineDirection] [varchar](50) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadBus]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadBus](
	[route_short_name] [varchar](50) NULL,
	[route_long_name] [varchar](50) NULL,
	[route_type] [varchar](50) NULL,
	[route_url] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[Hash]  AS (hashbytes('SHA1',(((isnull([route_short_name],'')+isnull([route_long_name],''))+isnull([route_type],''))+isnull([route_url],''))+isnull([trip_headsign],'')))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadCurrentBus]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadCurrentBus](
	[route_short_name] [varchar](50) NULL,
	[route_long_name] [varchar](50) NULL,
	[route_type] [varchar](50) NULL,
	[route_url] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[Hash]  AS (hashbytes('SHA1',(((isnull([route_short_name],'')+isnull([route_long_name],''))+isnull([route_type],''))+isnull([route_url],''))+isnull([trip_headsign],'')))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadCurrentDate]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadCurrentDate](
	[service_id] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[exception_type] [varchar](50) NULL,
	[Hash]  AS (hashbytes('SHA1',(isnull([service_id],'')+isnull([date],''))+isnull([exception_type],''))),
	[ExecutionGUID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadCurrentFare]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadCurrentFare](
	[fare_id] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[currency_type] [varchar](50) NULL,
	[transfer_duration] [varchar](50) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[Hash]  AS (hashbytes('SHA1',((isnull([fare_id],'')+isnull([price],''))+isnull([currency_type],''))+isnull([transfer_duration],'')))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadCurrentStop]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadCurrentStop](
	[StopID] [varchar](50) NULL,
	[StopCode] [varchar](50) NULL,
	[StopName] [varchar](150) NULL,
	[StopURL] [varchar](150) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[PostalCode] [varchar](150) NULL,
	[District] [varchar](150) NULL,
	[City] [varchar](150) NULL,
	[WheelchairBoarding] [varchar](50) NULL,
	[Hash]  AS (hashbytes('SHA1',((((((((isnull([StopID],'')+isnull([StopCode],''))+isnull([StopName],''))+isnull([StopURL],''))+isnull([Latitude],''))+isnull([Longitude],''))+isnull([PostalCode],''))+isnull([District],''))+isnull([City],''))+isnull([WheelchairBoarding],''))),
	[ExecutionGUID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadCurrentStopTime]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadCurrentStopTime](
	[trip_id] [varchar](50) NULL,
	[arrival_time] [varchar](50) NULL,
	[stop_id] [varchar](50) NULL,
	[stop_sequence] [varchar](50) NULL,
	[stop_code] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[service_id] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[Hash]  AS (hashbytes('SHA1',((((((isnull([trip_id],'')+isnull([arrival_time],''))+isnull([stop_id],''))+isnull([stop_sequence],''))+isnull([stop_code],''))+isnull([trip_headsign],''))+isnull([service_id],''))+isnull([date],'')))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadDate]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadDate](
	[service_id] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[exception_type] [varchar](50) NULL,
	[Hash]  AS (hashbytes('SHA1',(isnull([service_id],'')+isnull([date],''))+isnull([exception_type],''))),
	[ExecutionGUID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadFare]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadFare](
	[fare_id] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[currency_type] [varchar](50) NULL,
	[transfer_duration] [varchar](50) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[Hash]  AS (hashbytes('SHA1',((isnull([fare_id],'')+isnull([price],''))+isnull([currency_type],''))+isnull([transfer_duration],'')))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadPreviousBus]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadPreviousBus](
	[route_short_name] [varchar](50) NULL,
	[route_long_name] [varchar](50) NULL,
	[route_type] [varchar](50) NULL,
	[route_url] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[Hash]  AS (hashbytes('SHA1',(((isnull([route_short_name],'')+isnull([route_long_name],''))+isnull([route_type],''))+isnull([route_url],''))+isnull([trip_headsign],'')))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadPreviousDate]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadPreviousDate](
	[service_id] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[exception_type] [varchar](50) NULL,
	[Hash]  AS (hashbytes('SHA1',(isnull([service_id],'')+isnull([date],''))+isnull([exception_type],''))),
	[ExecutionGUID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadPreviousFare]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadPreviousFare](
	[fare_id] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[currency_type] [varchar](50) NULL,
	[transfer_duration] [varchar](50) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[Hash]  AS (hashbytes('SHA1',((isnull([fare_id],'')+isnull([price],''))+isnull([currency_type],''))+isnull([transfer_duration],'')))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadPreviousStop]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadPreviousStop](
	[StopID] [varchar](50) NULL,
	[StopCode] [varchar](50) NULL,
	[StopName] [varchar](150) NULL,
	[StopURL] [varchar](150) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[PostalCode] [varchar](150) NULL,
	[District] [varchar](150) NULL,
	[City] [varchar](150) NULL,
	[WheelchairBoarding] [varchar](50) NULL,
	[Hash]  AS (hashbytes('SHA1',((((((((isnull([StopID],'')+isnull([StopCode],''))+isnull([StopName],''))+isnull([StopURL],''))+isnull([Latitude],''))+isnull([Longitude],''))+isnull([PostalCode],''))+isnull([District],''))+isnull([City],''))+isnull([WheelchairBoarding],''))),
	[ExecutionGUID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadPreviousStopTime]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadPreviousStopTime](
	[trip_id] [varchar](50) NULL,
	[arrival_time] [varchar](50) NULL,
	[stop_id] [varchar](50) NULL,
	[stop_sequence] [varchar](50) NULL,
	[stop_code] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[service_id] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[Hash]  AS (hashbytes('SHA1',((((((isnull([trip_id],'')+isnull([arrival_time],''))+isnull([stop_id],''))+isnull([stop_sequence],''))+isnull([stop_code],''))+isnull([trip_headsign],''))+isnull([service_id],''))+isnull([date],'')))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadStop]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadStop](
	[StopID] [varchar](50) NULL,
	[StopCode] [varchar](50) NULL,
	[StopName] [varchar](150) NULL,
	[StopURL] [varchar](150) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[PostalCode] [varchar](150) NULL,
	[District] [varchar](150) NULL,
	[City] [varchar](150) NULL,
	[WheelchairBoarding] [varchar](50) NULL,
	[Hash]  AS (hashbytes('SHA1',((((((((isnull([StopID],'')+isnull([StopCode],''))+isnull([StopName],''))+isnull([StopURL],''))+isnull([Latitude],''))+isnull([Longitude],''))+isnull([PostalCode],''))+isnull([District],''))+isnull([City],''))+isnull([WheelchairBoarding],''))),
	[ExecutionGUID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LoadStopTime]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LoadStopTime](
	[trip_id] [varchar](50) NULL,
	[arrival_time] [varchar](50) NULL,
	[stop_id] [varchar](50) NULL,
	[stop_sequence] [varchar](50) NULL,
	[stop_code] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[service_id] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[Hash]  AS (hashbytes('SHA1',((((((isnull([trip_id],'')+isnull([arrival_time],''))+isnull([stop_id],''))+isnull([stop_sequence],''))+isnull([stop_code],''))+isnull([trip_headsign],''))+isnull([service_id],''))+isnull([date],'')))
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectCleanBus]    Script Date: 25/07/2014 7:47:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectCleanBus](
	[Hash] [binary](8000) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[route_short_name] [varchar](50) NULL,
	[route_long_name] [varchar](50) NULL,
	[route_type] [varchar](50) NULL,
	[route_url] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectCleanDate]    Script Date: 25/07/2014 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectCleanDate](
	[Hash] [binary](8000) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[service_id] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[exception_type] [varchar](50) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectCleanFare]    Script Date: 25/07/2014 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectCleanFare](
	[Hash] [binary](8000) NULL,
	[ExecutionGUID] [uniqueidentifier] NULL,
	[fare_id] [varchar](50) NULL,
	[price] [varchar](50) NULL,
	[currency_type] [varchar](50) NULL,
	[transfer_duration] [varchar](50) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectCleanStop]    Script Date: 25/07/2014 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectCleanStop](
	[StopID] [varchar](50) NULL,
	[StopCode] [varchar](50) NULL,
	[StopName] [varchar](150) NULL,
	[StopURL] [varchar](150) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[PostalCode] [varchar](150) NULL,
	[District] [varchar](150) NULL,
	[City] [varchar](150) NULL,
	[WheelchairBoarding] [varchar](50) NULL,
	[Hash] [binary](8000) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL,
	[ExecutionGUID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectCleanStopTime]    Script Date: 25/07/2014 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectCleanStopTime](
	[ExecutionGUID] [uniqueidentifier] NULL,
	[service_id] [varchar](50) NULL,
	[date] [varchar](50) NULL,
	[trip_id] [varchar](50) NULL,
	[arrival_time] [varchar](50) NULL,
	[stop_id] [varchar](50) NULL,
	[stop_sequence] [varchar](50) NULL,
	[stop_code] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectConformBus]    Script Date: 25/07/2014 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectConformBus](
	[ExecutionGUID] [uniqueidentifier] NULL,
	[route_long_name] [varchar](50) NULL,
	[route_type] [varchar](50) NULL,
	[route_url] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[BusLineCode] [int] NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectConformDate]    Script Date: 25/07/2014 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectConformDate](
	[ExecutionGUID] [uniqueidentifier] NULL,
	[service_id] [varchar](50) NULL,
	[exception_type] [varchar](50) NULL,
	[date] [datetime] NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectConformStop]    Script Date: 25/07/2014 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectConformStop](
	[StopID] [varchar](50) NULL,
	[StopCode] [varchar](50) NULL,
	[StopName] [varchar](150) NULL,
	[StopURL] [varchar](150) NULL,
	[Latitude] [varchar](50) NULL,
	[Longitude] [varchar](50) NULL,
	[PostalCode] [varchar](150) NULL,
	[District] [varchar](150) NULL,
	[City] [varchar](150) NULL,
	[WheelchairBoarding_bool] [bit] NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL,
	[ExecutionGUID] [uniqueidentifier] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RejectConformStopTime]    Script Date: 25/07/2014 7:47:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RejectConformStopTime](
	[ExecutionGUID] [uniqueidentifier] NULL,
	[service_id] [varchar](50) NULL,
	[trip_id] [varchar](50) NULL,
	[stop_id] [varchar](50) NULL,
	[stop_code] [varchar](50) NULL,
	[trip_headsign] [varchar](50) NULL,
	[date] [datetime] NULL,
	[StopSequence] [int] NULL,
	[DepartureTime] [time](0) NULL,
	[ErrorCode] [int] NULL,
	[ErrorColumn] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [STM_STG] SET  READ_WRITE 
GO
