USE MercaditoDB
GO
-- Insert rows into table 'TableName'
INSERT INTO dbo.Categoria
( -- columns to insert data into
 [idCategoria], [nombre]
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
INSERT INTO dbo.Producto
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
-- Insert rows into table 'TableName'
INSERT INTO dbo.Inventario
( -- columns to insert data into
 [idProducto], [cantidad], [precio]
)
VALUES
( -- first row: values for the columns in the list above
 1, 25, 6.00
),
( -- second row: values for the columns in the list above
 2, 41, 2.00
)
-- add more rows here
GO
INSERT INTO dbo.Proveedor
( -- columns to insert data into
 [idProveedor], [nombre], [telefono]
)
VALUES
( -- first row: values for the columns in the list above
 1, 'CocaCola', 87105226
),
( -- second row: values for the columns in the list above
 2, 'Friitos', 78963200
)
-- add more rows here
GO
INSERT INTO dbo.Credito
( -- columns to insert data into
 [idCredito], [idCliente], [idVenta], [estado]
)
VALUES
( -- first row: values for the columns in the list above
 1, 1, 1, 'NA'
),
( -- second row: values for the columns in the list above
 2, 2, 2, 'Saldado'
)
-- add more rows here
GO
INSERT INTO dbo.Abono
( -- columns to insert data into
 [idAbono], [fecha], [idCredito], [monto]
)
VALUES
( -- first row: values for the columns in the list above
 1, '2020-11-24', 1, 50.00
),
( -- second row: values for the columns in the list above
 2, '2020-11-29', 2, 25.00
)
-- add more rows here
GO
INSERT INTO dbo.Venta
( -- columns to insert data into
 [idVenta], [idCliente], [fecha]
)
VALUES
( -- first row: values for the columns in the list above
 1, 1, '2020-12-1'
),
( -- second row: values for the columns in the list above
 2, 2, '2020-11-03'
)
-- add more rows here
GO
INSERT INTO dbo.DetalleVenta
( -- columns to insert data into
 [idDetalle], [idVenta], [idProducto], [cantidad]
)
VALUES
( -- first row: values for the columns in the list above
 1, 1, 1, 2
),
( -- second row: values for the columns in the list above
 2, 2, 2, 5
)
-- add more rows here
GO
INSERT INTO dbo.OrdenProducto
( -- columns to insert data into
 [idOrden], [idProducto], [cantidad], [precio], [precioSugerido]
)
VALUES
( -- first row: values for the columns in the list above
 1, 1, 40, 6.00, 5.00
),
( -- second row: values for the columns in the list above
 2, 2, 60, 3.00, 3.00
)
-- add more rows here
GO
INSERT INTO dbo.OrdenProveedor
( -- columns to insert data into
 [idOrden], [idProveedor], [fechaOrden], [fechaEntrega], [estado]
)
VALUES
( -- first row: values for the columns in the list above
 1, 1, '2020-11-05', '2020-12-15', 'Pendiente'
),
( -- second row: values for the columns in the list above
 2, 2, '2020-10-09', '2020-11-20', 'Pendiente'
)
-- add more rows here
GO
INSERT INTO dbo.Cliente
( -- columns to insert data into
 [idCliente], [nombre], [limiteCredito]
)
VALUES
( -- first row: values for the columns in the list above
 1, 'Roberto Gomez', 500.00
),
( -- second row: values for the columns in the list above
 2, 'Selma Martinez', 350.00
)
-- add more rows here
GO
SELECT * from dbo.Producto
GO
SELECT * from dbo.Inventario
GO
SELECT * from dbo.Categoria
GO
SELECT * from dbo.Proveedor
GO
SELECT * from dbo.Venta
GO
SELECT * from dbo.DetalleVenta
GO
SELECT * from dbo.Credito
GO
SELECT * from dbo.OrdenProducto
GO
SELECT * from dbo.OrdenProveedor
GO
SELECT * from dbo.Cliente
GO

-- Delete rows from table 'TableName'
