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
	[id] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[nombre] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Producto](
	[id] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[nombre] [varchar](50) NOT NULL,
	[idCategoria] [int] NOT NULL,

	CONSTRAINT PK_idCategoria FOREIGN KEY (idCategoria) REFERENCES Categoria(id)

) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Cliente](
	[id] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[nombre] [varchar](50) NULL,
	[limiteCredito] [float] NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Venta](
	[id] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[idCliente] [int] NOT NULL,
	[fecha] [date] NOT NULL
) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Credito](
	[id] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[idCliente] [int] NOT NULL,
	[idVenta] [int] NOT NULL,
	[estado] [varchar](50) NULL,

	CONSTRAINT fk_idCliente FOREIGN KEY (idCliente) REFERENCES Cliente(id),
	CONSTRAINT fk_idVenta FOREIGN KEY (idVenta) REFERENCES Venta(id)

) ON [PRIMARY]
GO
CREATE TABLE [dbo].[Abono](
	[id] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[fecha] [date] NOT NULL,
	[idCredito] [int] NOT NULL,
	[monto] [float] NOT NULL
	CONSTRAINT fk_idCredito2 FOREIGN KEY (idCredito) REFERENCES Credito(id)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 12/1/2020 2:32:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[id] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[cantidad] [int] NULL

	CONSTRAINT fk_idVenta2 FOREIGN KEY (idVenta) REFERENCES Venta(id),
	CONSTRAINT fk_idProducto2 FOREIGN KEY (idProducto) REFERENCES Producto(id)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventario]    Script Date: 12/1/2020 2:32:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventario](
	[id] [int] NOT NULL IDENTITY(1,1),
	[idProducto] [int],
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
	

	CONSTRAINT fk_idProducto FOREIGN KEY (idProducto) REFERENCES Producto(id)
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenProducto]    Script Date: 12/1/2020 2:32:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenProducto](
	[id] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[idProducto] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio] [float] NOT NULL,
	[precioSugerido] [float] NOT NULL,
 
 	CONSTRAINT fk_idProducto3 FOREIGN KEY (idProducto) REFERENCES Producto(id)

	) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrdenProveedor]    Script Date: 12/1/2020 2:32:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[id] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[nombre] [varchar](50) NOT NULL,
	[telefono] [int] NOT NULL,

) ON [PRIMARY]
GO
CREATE TABLE [dbo].[OrdenProveedor](
	[id] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
	[idProveedor] [int] NOT NULL,
	[fechaOrden] [date] NOT NULL,
	[fechaEntrega] [date] NOT NULL,
	[estado] [varchar](50) NOT NULL,

 	CONSTRAINT PK_OrdenProveedor FOREIGN KEY (idProveedor) REFERENCES Proveedor(id)


) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 12/1/2020 2:32:24 AM ******/


