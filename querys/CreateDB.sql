USE master
GO
IF EXISTS (
  SELECT name
    FROM sys.databases
    WHERE name = 'MercaditoDB'
)
DROP DATABASE MercaditoDB	
GO
--Create new database 'produccion'
CREATE DATABASE MercaditoDB
GO
/****** Object:  Table [dbo].[Abono]    Script Date: 11/30/2020 8:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abono](
	[idAbono] [int] NULL,
	[fecha] [date] NULL,
	[idCredito] [int] NULL,
	[monto] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 11/30/2020 8:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoría] [int] NULL,
	[nombre] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 11/30/2020 8:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NULL,
	[nombre] [varchar](50) NULL,
	[limiteCredito] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Credito]    Script Date: 11/30/2020 8:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credito](
	[idCredito] [int] NOT NULL,
	[idCliente] [int] NULL,
	[idVenta] [int] NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_Credito] PRIMARY KEY CLUSTERED 
(
	[idCredito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 11/30/2020 8:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idDetalle] [int] NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 11/30/2020 8:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[id] [int] NOT NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [float] NULL,
 CONSTRAINT [PK_Inventario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenProducto]    Script Date: 11/30/2020 8:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenProducto](
	[idOrden] [int] NOT NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL,
	[precio] [float] NULL,
	[precioSugerido] [float] NULL,
 CONSTRAINT [PK_OrdenProducto] PRIMARY KEY CLUSTERED 
(
	[idOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenProveedor]    Script Date: 11/30/2020 8:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenProveedor](
	[idOrden] [int] NOT NULL,
	[idProveedor] [int] NULL,
	[fechaOrden] [date] NULL,
	[fechaEntrega] [date] NULL,
	[estado] [varchar](50) NULL,
 CONSTRAINT [PK_OrdenProveedor] PRIMARY KEY CLUSTERED 
(
	[idOrden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 11/30/2020 8:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[idCategoria] [int] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 11/30/2020 8:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[idProveedor] [int] NOT NULL,
	[nombre] [varchar](50) NULL,
	[telefono] [int] NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[idProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 11/30/2020 8:41:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] NULL,
	[idCliente] [int] NULL,
	[fecha] [date] NULL
) ON [PRIMARY]
GO

-- Insert rows into table 'TableName'
INSERT INTO Categoria
( -- columns to insert data into
 [idCategoría], [nombre]
)
VALUES
( -- first row: values for the columns in the list above
 1, 'Snacks'
),
( -- second row: values for the columns in the list above
 2, 'bebidas'
)
-- add more rows here
GO
INSERT INTO Producto
( -- columns to insert data into
 [idProducto], [nombre], [idCategoria]
)
VALUES
( -- first row: values for the columns in the list above
 1, 'Doritos', 1
),
( -- second row: values for the columns in the list above
 2, 'Cacahuates', 2
)
-- add more rows here
GO
SELECT * from Producto
go