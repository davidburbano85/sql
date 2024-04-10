create procedure pr_insertarProducto
    (
        @idEmpresa int,
        @tipoProducto varchar(50),
        @disponibilidad int,
        @precioCompra bigint,
        @precioVenta bigint,
        @fechaCompra dateTime,
        @proveedor varchar(20)
    )
-- as begin end go 
--son las instrucciones que engloban el procedimiento
    as begin

    --aqui vamos a dar la tabla a llenar y las columnas
    insert into Stock
        (
        idEmpresa,
        tipoProducto,
        disponibilidad,
        precioCompra,
        precioVenta,
        fechaCompra,
        proveedor
        )
    --aqui iran los valores
    values
        (
            @idEmpresa,
            @tipoProducto,
            @disponibilidad,
            @precioCompra ,
            @precioVenta ,
            GETDATE(),
            @proveedor
        )
    end
    go

create procedure pr_eliminarProducto
    (
        @id int
    )
    as
    begin
        delete from Stock where id=@id
    end
    go

create procedure pr_obtenerProductoBuscador
    (
        @tipoProducto varchar(50)
    )
    as
    begin
        select *
        from Stock
        where tipoProducto like '%' + @tipoProducto + '%'

    end 
    go

create procedure pr_obtenerProductos
    as begin
        select *
        from Stock
    end
    go

create procedure pr_actualizarProductos
    @id int,
    @idEmpresa int,
    @tipoProducto varchar(50),
    @disponibilidad int,
    @precioCompra bigint,
    @precioVenta bigint,
    @fechaCompra dateTime,
    @proveedor varchar(20)
    as begin
    update Stock set 
        idEmpresa=@idEmpresa,
        tipoProducto=@tipoProducto,
        disponibilidad=@disponibilidad,
        precioCompra=@precioCompra,
        precioVenta=@precioVenta,
        fechaCompra=@fechaCompra,
        proveedor=@proveedor
    where id=@id
    end
    go
