
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/16/2022 10:29:02
-- Generated from EDMX file: F:\CursoNET\ProyectoMVC\ProyectoMVC\Models\ModeloTienda.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [proyectomvc];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PedidoCliente]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pedidos] DROP CONSTRAINT [FK_PedidoCliente];
GO
IF OBJECT_ID(N'[dbo].[FK_ProductoProductoComprado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductosComprados] DROP CONSTRAINT [FK_ProductoProductoComprado];
GO
IF OBJECT_ID(N'[dbo].[FK_PedidoProductoComprado]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ProductosComprados] DROP CONSTRAINT [FK_PedidoProductoComprado];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Productos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Productos];
GO
IF OBJECT_ID(N'[dbo].[Clientes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clientes];
GO
IF OBJECT_ID(N'[dbo].[Pedidos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pedidos];
GO
IF OBJECT_ID(N'[dbo].[ProductosComprados]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ProductosComprados];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Cantidad] int  NOT NULL,
    [Precio] int  NOT NULL
);
GO

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Direccion] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Pedidos'
CREATE TABLE [dbo].[Pedidos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cliente_Id] int  NOT NULL
);
GO

-- Creating table 'ProductosComprados'
CREATE TABLE [dbo].[ProductosComprados] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Cantidad] nvarchar(max)  NOT NULL,
    [ProductoId] int  NOT NULL,
    [PedidoId] int  NOT NULL
);
GO

-- Creating table 'SinStocks'
CREATE TABLE [dbo].[SinStocks] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Producto_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [PK_Pedidos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ProductosComprados'
ALTER TABLE [dbo].[ProductosComprados]
ADD CONSTRAINT [PK_ProductosComprados]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SinStocks'
ALTER TABLE [dbo].[SinStocks]
ADD CONSTRAINT [PK_SinStocks]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Cliente_Id] in table 'Pedidos'
ALTER TABLE [dbo].[Pedidos]
ADD CONSTRAINT [FK_PedidoCliente]
    FOREIGN KEY ([Cliente_Id])
    REFERENCES [dbo].[Clientes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoCliente'
CREATE INDEX [IX_FK_PedidoCliente]
ON [dbo].[Pedidos]
    ([Cliente_Id]);
GO

-- Creating foreign key on [ProductoId] in table 'ProductosComprados'
ALTER TABLE [dbo].[ProductosComprados]
ADD CONSTRAINT [FK_ProductoProductoComprado]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoProductoComprado'
CREATE INDEX [IX_FK_ProductoProductoComprado]
ON [dbo].[ProductosComprados]
    ([ProductoId]);
GO

-- Creating foreign key on [PedidoId] in table 'ProductosComprados'
ALTER TABLE [dbo].[ProductosComprados]
ADD CONSTRAINT [FK_PedidoProductoComprado]
    FOREIGN KEY ([PedidoId])
    REFERENCES [dbo].[Pedidos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PedidoProductoComprado'
CREATE INDEX [IX_FK_PedidoProductoComprado]
ON [dbo].[ProductosComprados]
    ([PedidoId]);
GO

-- Creating foreign key on [Producto_Id] in table 'SinStocks'
ALTER TABLE [dbo].[SinStocks]
ADD CONSTRAINT [FK_ProductoSinStock]
    FOREIGN KEY ([Producto_Id])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoSinStock'
CREATE INDEX [IX_FK_ProductoSinStock]
ON [dbo].[SinStocks]
    ([Producto_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------