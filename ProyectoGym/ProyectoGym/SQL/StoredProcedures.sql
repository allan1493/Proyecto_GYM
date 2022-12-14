create procedure insertarCliente @codigo varchar(50), @nombre nvarchar(50), @apellido nvarchar(50), @telefono varchar(8)
as 
begin
Insert into Clientes(codigo,nombre,apellido,telefono) values (@codigo,@nombre,@apellido,@telefono)
end

exec insertarCliente 'SA', 'Admin', '','88779966'
select * from Clientes

create procedure insertarDirecciones @codigo varchar(50), @provincia int, @canton int, @distrito int, @comentarios nvarchar(250)
as 
begin
Insert into Direcciones(codigo_cliente,codigo_provincia,codigo_canton,codigo_distrito,Comentarios) values (@codigo,@provincia,@canton,@distrito, @comentarios)
end

select * from Direcciones
exec insertarDirecciones 'roberto@uh.ac.cr','1','101','10101','prueba'

create procedure selectClientes
as
begin
Select * from Clientes
end

exec selectClientes
select * from MAE_USUARIOS

create procedure selectProvincia
as
begin
Select * from Provincia
end

create procedure selectCanton @codigo int
as
begin
Select * from Canton where codigo_provincia = @codigo
end

create procedure selectDistrito @codigo int
as
begin
Select * from Distrito where codigo_Canton = @codigo
end

exec selectDistrito 101

create procedure insertarUsuario @usuario varchar(50), @contrasena nvarchar(50)
as
begin
insert into MAE_USUARIOS(usuario,contrasena) values (@usuario,@contrasena);
end

exec insertarUsuario 'marlon@uh.ac.cr','hhdnsskl'
select * from MAE_USUARIOS

create procedure selectLogin @usuario varchar(50), @contrasena nvarchar(50)
as
begin
select * from MAE_USUARIOS where usuario = @usuario and contrasena = @contrasena;
end

select * from MAE_USUARIOS
exec selectLogin 'sa', 'Gym123'

create procedure selectClientes
as
begin
select Clientes.codigo, Clientes.nombre, Clientes.apellido, Clientes.telefono, Provincia.nombre as provincia, Canton.nombre as canton, Distrito.Nombre as distrito, Direcciones.Comentarios from Clientes
join Direcciones
on Direcciones.codigo_cliente = Clientes.codigo
join Provincia
on Provincia.codigo = Direcciones.codigo_provincia
join Canton
on Canton.codigo = Direcciones.codigo_canton
join Distrito 
on Distrito.codigo = Direcciones.codigo_distrito
end

exec selectClientes


create procedure selectClienteEspecifico @codigo varchar(50)
as
select * from Clientes where codigo = @codigo;

exec selectClienteEspecifico 'majoFon2301@gmail.com'

create procedure actualizarCliente @codigo varchar(50), @codigoNuevo varchar(50) ,@nombre nvarchar(50), @apellido nvarchar(50), @telefono varchar(8)
as 
Update Clientes set codigo = @codigoNuevo, nombre = @nombre, apellido = @apellido, telefono = @telefono
where codigo = @codigo

create procedure actualizarDirecciones @cliente varchar(50), @nuevo varchar(50), @provincia int,@canton int,@distrito int,@comentarios nvarchar(250)
as
update Direcciones set codigo_cliente = @nuevo, codigo_provincia = @provincia, codigo_canton = @canton, codigo_distrito = @distrito, Comentarios = @comentarios
where codigo_cliente = @cliente
end

create procedure eliminarDireccion @cliente varchar(50)
as
delete from Direcciones
where codigo_cliente = @cliente

create procedure actualizarUsuario @usuario varchar(50), @nuevo varchar(50)
as
update MAE_USUARIOS set usuario = @nuevo
where usuario = @usuario

create procedure eliminarUsuario @usuario varchar(50)
as
delete from MAE_USUARIOS
where usuario = @usuario

create procedure eliminarCliente @cliente varchar(50)
as
delete from Clientes
where codigo = @cliente

create procedure insertProducto @codigo varchar(50), @nombre varchar(100), @precio float
as
insert into Producto(Codigo,nombre,precio) values (@codigo,@nombre,@precio)

create procedure selectProducto
as
select * from Producto

create procedure selectDetProducto @codigo varchar(50)
as
select * from Producto
where Codigo = @codigo

exec selectDetProducto 'AG12'

create procedure actualizarProducto @codigo varchar(50), @nombre varchar(50), @precio float
as
update Producto set nombre = @nombre, precio = @precio
where Codigo = @codigo

exec actualizarProducto 'UTN22','Toalla','2000'


create procedure eliminarProducto @codigo varchar(50)
as
delete from Producto
where Codigo = @codigo

create procedure insertMae_Factura @Cliente varchar(50), @Total float, @IV float
as
begin
declare @fecha datetime
set @fecha = GETDATE()
insert into MAE_FACTURA (Fecha,Codigo_Cliente,Total,IVTotal) values (@fecha,@Cliente,@Total,@IV)
end

create procedure inserDet_Factura @factura int, @producto varchar(50), @cantidad int, @precio float, @iv float
as
insert into DET_FACTURA (nFactura,Codigo_Producto,Cantidad,Precio_Unitario,IV) values (@factura,@producto,@cantidad,@precio,@iv)

create procedure selectUsuario @usuario varchar(50)
as
select * from MAE_FACTURA where Codigo_Cliente = @usuario

create procedure facturaCliente @cliente varchar(50)
as
select MAE_FACTURA.nFactura as Numero_Factura, Fecha, Producto.nombre, Cantidad, Precio_Unitario, IV, (Cantidad * Precio_Unitario) + IV as Total  from MAE_FACTURA
join DET_FACTURA
on MAE_FACTURA.nFactura = DET_FACTURA.nFactura
join Producto
on DET_FACTURA.Codigo_Producto = Producto.Codigo
where Codigo_Cliente = @cliente

create procedure total_factura @cliente varchar(50)
as
select SUM(IVTOTAL) as IVA, SUM(Total) as TOTAL from MAE_FACTURA
where Codigo_Cliente = @cliente

exec facturaCliente'alfpi14@gmail.com'

create procedure select

exec facturaCliente 'roberto@uh.ac.cr'


create procedure verInfoUsuarios
as
select MAE_USUARIOS.usuario, Clientes.nombre, Clientes.apellido, Clientes.telefono, Provincia.nombre, Canton.nombre, Distrito.Nombre, Direcciones.Comentarios from MAE_USUARIOS
join Clientes
on MAE_USUARIOS.usuario = Clientes.codigo
join Direcciones
on Clientes.codigo = Direcciones.codigo_cliente
join Provincia
on Direcciones.codigo_provincia = Provincia.codigo
join Canton
on Direcciones.codigo_canton = Canton.codigo
join Distrito
on Direcciones.codigo_distrito = Distrito.codigo

select * from MAE_FACTURA
exec verInfoUsuarios
select * from Clientes
delete from Clientes where codigo = 'roberto@uh.ac.cr'

exec actualizarUsuario 'allan@soul.com', 'ichigo@soul.com'
