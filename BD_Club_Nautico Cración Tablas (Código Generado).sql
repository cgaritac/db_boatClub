USE [master]
GO
/****** Object:  Database [Club_Nautico]    Script Date: 25/7/2018 15:22:48 ******/
CREATE DATABASE [Club_Nautico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Club_Nautico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Club_Nautico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Club_Nautico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Club_Nautico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Club_Nautico] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Club_Nautico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Club_Nautico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Club_Nautico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Club_Nautico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Club_Nautico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Club_Nautico] SET ARITHABORT OFF 
GO
ALTER DATABASE [Club_Nautico] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Club_Nautico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Club_Nautico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Club_Nautico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Club_Nautico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Club_Nautico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Club_Nautico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Club_Nautico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Club_Nautico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Club_Nautico] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Club_Nautico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Club_Nautico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Club_Nautico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Club_Nautico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Club_Nautico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Club_Nautico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Club_Nautico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Club_Nautico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Club_Nautico] SET  MULTI_USER 
GO
ALTER DATABASE [Club_Nautico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Club_Nautico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Club_Nautico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Club_Nautico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Club_Nautico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Club_Nautico] SET QUERY_STORE = OFF
GO
USE [Club_Nautico]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Club_Nautico]
GO
/****** Object:  Table [dbo].[Socios]    Script Date: 25/7/2018 15:22:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Socios](
	[IdSocio] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[email] [varchar](50) NULL,
	[Teléfono] [int] NOT NULL,
 CONSTRAINT [PK_Socios] PRIMARY KEY CLUSTERED 
(
	[IdSocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Barco]    Script Date: 25/7/2018 15:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barco](
	[IdBarco] [int] NOT NULL,
	[Matricula] [varchar](20) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Namarre] [int] NOT NULL,
	[Cuota] [int] NOT NULL,
	[Tipo] [varchar](20) NULL,
	[Año] [int] NULL,
	[Eslora] [int] NOT NULL,
 CONSTRAINT [PK_Barco] PRIMARY KEY CLUSTERED 
(
	[IdBarco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rutas]    Script Date: 25/7/2018 15:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rutas](
	[IdRuta] [int] NOT NULL,
	[Destino] [varchar](100) NOT NULL,
	[fsalida] [date] NOT NULL,
	[fregreso] [date] NOT NULL,
 CONSTRAINT [PK_Rutas] PRIMARY KEY CLUSTERED 
(
	[IdRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Soc_Bar]    Script Date: 25/7/2018 15:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Soc_Bar](
	[IdSocio] [int] NOT NULL,
	[IdBarco] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rut_Soc]    Script Date: 25/7/2018 15:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rut_Soc](
	[IdSocio] [int] NOT NULL,
	[IdRuta] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Salidas]    Script Date: 25/7/2018 15:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create view [dbo].[Salidas]
 as
 Select b.Namarre as Número_de_amarre, b.Nombre as Nombre_del_barco, r.destino as Destino, r.fsalida as Fecha_de_salida
 From Barco as b
 Join Soc_Bar as sb on b.IdBarco=sb.IdBarco
 join Socios as s on s.IdSocio=sb.IdSocio
 join Rut_Soc as rs on rs.IdSocio=s.IdSocio
 join Rutas as r on r.IdRuta=rs.IdRuta

GO
/****** Object:  View [dbo].[Llegadas]    Script Date: 25/7/2018 15:22:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 Create view [dbo].[Llegadas]
 as
 Select s.Nombre as Nombre_del_socio, b.Matricula as Matrícula_del_barco, r.destino as Destino, r.fregreso as Fecha_de_regreso
 From Barco as b
 Join Soc_Bar as sb on b.IdBarco=sb.IdBarco
 join Socios as s on s.IdSocio=sb.IdSocio
 join Rut_Soc as rs on rs.IdSocio=s.IdSocio
 join Rutas as r on r.IdRuta=rs.IdRuta
GO
ALTER TABLE [dbo].[Rut_Soc]  WITH CHECK ADD  CONSTRAINT [FK_Rutas_Rut_Soc] FOREIGN KEY([IdRuta])
REFERENCES [dbo].[Rutas] ([IdRuta])
GO
ALTER TABLE [dbo].[Rut_Soc] CHECK CONSTRAINT [FK_Rutas_Rut_Soc]
GO
ALTER TABLE [dbo].[Rut_Soc]  WITH CHECK ADD  CONSTRAINT [FK_Socios_Rut_Soc] FOREIGN KEY([IdSocio])
REFERENCES [dbo].[Socios] ([IdSocio])
GO
ALTER TABLE [dbo].[Rut_Soc] CHECK CONSTRAINT [FK_Socios_Rut_Soc]
GO
ALTER TABLE [dbo].[Soc_Bar]  WITH CHECK ADD  CONSTRAINT [FK_Barco_Soc_Bar] FOREIGN KEY([IdBarco])
REFERENCES [dbo].[Barco] ([IdBarco])
GO
ALTER TABLE [dbo].[Soc_Bar] CHECK CONSTRAINT [FK_Barco_Soc_Bar]
GO
ALTER TABLE [dbo].[Soc_Bar]  WITH CHECK ADD  CONSTRAINT [FK_Socios_Soc_Bar] FOREIGN KEY([IdSocio])
REFERENCES [dbo].[Socios] ([IdSocio])
GO
ALTER TABLE [dbo].[Soc_Bar] CHECK CONSTRAINT [FK_Socios_Soc_Bar]
GO
USE [master]
GO
ALTER DATABASE [Club_Nautico] SET  READ_WRITE 
GO
