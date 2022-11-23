create database Examen2

use Examen2
create table Cajeros(
Codigo int identity(1,1),
Nombre nvarchar(255) not null,
Apellidos nvarchar(255) not null,
constraint pk_email primary key(Codigo)
)

create table Productos(
Codigo int identity(1,1),
Nombre nvarchar(100) not null,
Precio float default 0,
constraint pk_codigoPr primary key(Codigo)
)

create table Maquinas_Registradoras(
Codigo int identity(1000,5),
Piso int,
constraint pk_codigoMaq primary key (Codigo)
)

create table Venta(
Codigo_venta int identity(1000,1),
Codigo_Cajero int,
Codigo_Maquina int,
Codigo_Producto int,
Fecha date,
constraint pk_idCita primary key (Codigo_venta),
constraint fk_idCajero foreign key (Codigo_Cajero) references Cajeros(Codigo),
constraint fk_idProducto foreign key (Codigo_Producto) references Productos(Codigo),
constraint fk_idMaquina foreign key (Codigo_Maquina) references Maquinas_Registradoras(Codigo)
)

insert into Cajeros (Nombre, Apellidos) values ('Allan', 'Picado Fonseca'),('Maria', 'Quiros Coto')
insert into Productos(Nombre,Precio) values ('Lapiz',200), ('Pizarra',5000), ('Cuaderno', 2000)
insert into Maquinas_Registradoras(Piso) values (1),(2)

update Cajeros 
set Nombre = 'Roberto'
where Codigo = 1

update Productos
set Precio = 500
where Codigo = 1

Select * from Cajeros
Select * from Maquinas_Registradoras
Select * from Productos
insert into Venta(Codigo_Cajero,Codigo_Maquina,Codigo_Producto, Fecha) values (1,1000,1,GETDATE())

Select Cajeros.Nombre as NombreCajero, Productos.Nombre as NombreProducto, Productos.Precio, Maquinas_Registradoras.Piso from Cajeros
join Venta
on Cajeros.Codigo = Venta.Codigo_Cajero
join Productos
on Productos.Codigo = Venta.Codigo_Producto
join Maquinas_Registradoras
on Maquinas_Registradoras.Codigo = Venta.Codigo_Maquina

select * from Venta
delete from Venta
