USE master
GO
IF EXISTS (
  SELECT name
    FROM sys.databases
    WHERE name = N'MercaditoDB'
)
DROP DATABASE MercaditoDB	
GO
CREATE DATABASE MercaditoDB
GO
USE MercaditoDB
GO

CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] NOT NULL PRIMARY KEY,
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] NOT NULL PRIMARY KEY,
	[nombre] [varchar](50) NOT NULL,
	[idCategoria] [int] NOT NULL,

	CONSTRAINT PK_idCategoria FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)

) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] NOT NULL PRIMARY KEY,
	[nombre] [varchar](50) NULL,
	[limiteCredito] [float] NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] NOT NULL PRIMARY KEY,
	[idCliente] [int] NOT NULL,
	[fecha] [date] NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Credito](
	[idCredito] [int] NOT NULL PRIMARY KEY,
	[idCliente] [int] NOT NULL,
	[idVenta] [int] NOT NULL,
	[estado] [varchar](50) NULL,

	CONSTRAINT fk_idCredito FOREIGN KEY (idCredito) REFERENCES Credito(idCredito),
	CONSTRAINT fk_idCliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
	CONSTRAINT fk_idVenta FOREIGN KEY (idVenta) REFERENCES Venta(idVenta)

) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Abono](
	[idAbono] [int] NOT NULL PRIMARY KEY,
	[fecha] [date] NOT NULL,
	[idCredito] [int] NOT NULL,
	[monto] [float] NOT NULL
	CONSTRAINT fk_idCredito2 FOREIGN KEY (idCredito) REFERENCES Credito(idCredito)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 12/1/2020 2:32:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idDetalle] [int] NOT NULL PRIMARY KEY,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL

	CONSTRAINT fk_idVenta2 FOREIGN KEY (idVenta) REFERENCES Venta(idVenta),
	CONSTRAINT fk_idProducto2 FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 12/1/2020 2:32:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[idProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL

	CONSTRAINT fk_idProducto FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenProducto]    Script Date: 12/1/2020 2:32:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenProducto](
	[idOrden] [int] NOT NULL PRIMARY KEY,
	[idProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[precioSugerido] [float] NOT NULL,
 
 	CONSTRAINT fk_idProducto3 FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)

	) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenProveedor]    Script Date: 12/1/2020 2:32:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[idProveedor] [int] NOT NULL PRIMARY KEY,
	[nombre] [varchar](50) NOT NULL,
	[telefono] [int] NOT NULL,

) ON [PRIMARY]
GO
CREATE TABLE [dbo].[OrdenProveedor](
	[idOrden] [int] NOT NULL PRIMARY KEY,
	[idProveedor] [int] NOT NULL,
	[fechaOrden] [date] NOT NULL,
	[fechaEntrega] [date] NOT NULL,
	[estado] [varchar](50) NOT NULL,

 	CONSTRAINT PK_OrdenProveedor FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor)


) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 12/1/2020 2:32:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Proveedor]    Script Date: 12/1/2020 2:32:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Venta]    Script Date: 12/1/2020 2:32:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

