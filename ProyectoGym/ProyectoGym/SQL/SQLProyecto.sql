create database GIMNASIO

create table Clientes(
codigo varchar(50) not null,
nombre nvarchar(50),
apellido nvarchar(50),
telefono varchar(8)
constraint pk_cliente primary key(codigo)

)

create table MAE_USUARIOS(
usuario varchar(50),
contrasena varchar(50)
constraint pk_MaeUsuario primary key(usuario),

)

select * from Clientes

Create table MAE_FACTURA
(
	nFactura int identity(1000,1),
	Fecha datetime, 
	Codigo_Cliente Varchar (50),
	Total int,
	IVTotal int,
	constraint pk_MaeFactura primary key(nFactura),
	CONSTRAINT fk_CodigoCliente FOREIGN KEY (Codigo_Cliente) REFERENCES Clientes (codigo),
)

Create table Producto 
(
	Codigo Varchar (50) Primary Key not null,
	nombre varchar (100) not null,
	precio float,
)

Create table DET_FACTURA
(
	codigo int identity(1,1),
	nFactura int,
	Codigo_Producto Varchar (50) not null,
	Cantidad int,
	Precio_Unitario float,
	IV float,
	constraint pk_DetFactura primary key(codigo),
	CONSTRAINT fk_NFactura FOREIGN KEY (NFactura) REFERENCES MAE_Factura (NFactura),
	CONSTRAINT fk_CodigoProducto FOREIGN KEY (Codigo_Producto) REFERENCES Producto (Codigo),
)





Create table Provincia
(
	codigo int,
	nombre varchar (100) not null,
	constraint pk_provincia primary key(codigo)
)

Create table Canton 
(
	codigo int,
	nombre varchar (100) not null,
	codigo_provincia int,
	constraint pk_Canton primary key(codigo),
	CONSTRAINT fk_Provincia FOREIGN KEY (codigo_provincia) REFERENCES Provincia (codigo)
)

Create table Distrito 
(
	codigo int,
	Nombre varchar (100) not null,
	codigo_Canton int,
	constraint pk_Distrito primary key(codigo),
	CONSTRAINT fk_Canton FOREIGN KEY (codigo_Canton) REFERENCES Canton (codigo)
)

Create table Direcciones 
(
	 CODIGO int identity(1,1),
	 codigo_cliente varchar (50),
	 codigo_provincia int,
	 codigo_canton int,
	 codigo_distrito int,
	 Comentarios nvarchar (250),
	 constraint pk_Direcciones primary key(CODIGO),
	 CONSTRAINT fk_CodigoClientes FOREIGN KEY (codigo_cliente) REFERENCES Clientes (codigo),
	 CONSTRAINT fk_CodigoProvincia FOREIGN KEY (codigo_provincia) REFERENCES provincia (codigo),
	 CONSTRAINT fk_CodigoCanton FOREIGN KEY (codigo_canton) REFERENCES Canton (codigo),
	 CONSTRAINT fk_CodigoDistricto FOREIGN KEY (codigo_distrito) REFERENCES Distrito (codigo),
)

insert into Provincia values (1, 'San Jose'),(2, 'Alajuela'),(3, 'Cartago'),(4, 'Heredia'),(5, 'Guanacaste'),(6, 'Puntarenas'),(7, 'Limon')

insert into Canton values (101,'San José',1)
insert into Canton values (102,'Escazú',1)
insert into Canton values (103, 'Desamparados',1)
insert into Canton values (104, 'Puriscal',1)
insert into Canton values (105, 'Tarrazú',1)
insert into Canton values (106, 'Aserrí',1)
insert into Canton values (107, 'Mora',1)
insert into Canton values (108, 'Goicoechea',1)
insert into Canton values (109, 'Santa Ana',1)
insert into Canton values (110, 'Alajuelita',1)
insert into Canton values (111, 'Vásquez de Coronado',1)
insert into Canton values (112, 'Acosta',1)
insert into Canton values (113, 'Tibás',1)
insert into Canton values (114, 'Moravia',1)
insert into Canton values (115, 'Montes de Oca',1)
insert into Canton values (116, 'Turrubares',1)
insert into Canton values (117, 'Dota',1)
insert into Canton values (118, 'Currridabat',1)
insert into Canton values (119, 'Pérez Zeledón',1)
insert into Canton values (120, 'León Cortés',1)

insert into Canton values (201, 'Alajuela',2)
insert into Canton values (202,'San Ramon',2)
insert into Canton values (203, 'Grecia',2)
insert into Canton values (204, 'San Mateo',2)
insert into Canton values (205, 'Atenas',2)
insert into Canton values (206, 'Naranjo',2)
insert into Canton values (207, 'Palmares',2)
insert into Canton values (208, 'Poás',2)
insert into Canton values (209, 'Orotina',2)
insert into Canton values (210, 'San Carlos',2)
insert into Canton values (211, 'Alfaro Ruíz',2)
insert into Canton values (212, 'Valverde',2)
insert into Canton values (213, 'Upala',2)
insert into Canton values (214, 'Los Chiles',2)
insert into Canton values (215, 'Guatuso',2)

insert into Canton values (301, 'Cartago',3)
insert into Canton values (302, 'Paraíso',3)
insert into Canton values (303, 'La Unión',3)
insert into Canton values (304, 'Jiménez',3)
insert into Canton values (305, 'Turrialba',3)
insert into Canton values (306, 'Alvarado',3)
insert into Canton values (307, 'Oreamuno',3)
insert into Canton values (308, 'El Guarco',3)

insert into Canton values (401, 'Heredia',4)
insert into Canton values (402, 'Barva',4)
insert into Canton values (403, 'Santo Domingo',4)
insert into Canton values (404, 'Santa Bárbara',4)
insert into Canton values (405, 'San Rafael',4)
insert into Canton values (406, 'San Isidro',4)
insert into Canton values (407, 'Belén',4)
insert into Canton values (408, 'Flores',4)
insert into Canton values (409, 'San Pablo',4)
insert into Canton values (410, 'Sarapiquí',4)

insert into Canton values (501, 'Liberia',5)
insert into Canton values (502, 'Nicoya',5)
insert into Canton values (503, 'Santa Cruz',5)
insert into Canton values (504, 'Bagaces',5)
insert into Canton values (505, 'Carrillo',5)
insert into Canton values (506, 'Cañas',5)
insert into Canton values (507, 'Abangares',5)
insert into Canton values (508, 'Tilarán',5)
insert into Canton values (509, 'Nandayure',5)
insert into Canton values (510, 'La Cruz',5)
insert into Canton values (511, 'Hojancha',5)

insert into Canton values (601, 'Puntarenas',6)
insert into Canton values (602, 'Esparza',6)
insert into Canton values (603, 'Buenos Aires',6)
insert into Canton values (604, 'Montes de Oro',6)
insert into Canton values (605, 'Osa',6)
insert into Canton values (606, 'Aguirre',6)
insert into Canton values (607, 'Golfito',6)
insert into Canton values (608, 'Coto Brus',6)
insert into Canton values (609, 'Parrita',6)
insert into Canton values (610, 'Corredores',6)
insert into Canton values (611, 'Garabito',6)

insert into Canton values (701, 'Limón',7)
insert into Canton values (702, 'Pococí',7)
insert into Canton values (703, 'Siquirres',7)
insert into Canton values (704, 'Talamanca',7)
insert into Canton values (705, 'Matina',7)
insert into Canton values (706, 'Guácimo',7)

select * from Canton

insert into Distrito values (10101,	'Carmen',101)
insert into Distrito values (10102,	'Merced',101)
insert into Distrito values (10103,	'Hospital',101)
insert into Distrito values (10104,	'Catedral',101)
insert into Distrito values (10105,	'Zapote',101)
insert into Distrito values (10106,	'San Francisco de Dos Ríos',101)
insert into Distrito values (10107,	'Uruca',101)
insert into Distrito values (10108,	'Mata Redonda',101)
insert into Distrito values (10109,	'Pavas',101)
insert into Distrito values (10110,	'Hatillo',101)
insert into Distrito values (10111,	'San Sebastián',101)

insert into Distrito values (10201,	'Escazú',102)
insert into Distrito values (10202,	'San Antonio',102)
insert into Distrito values (10203,	'San Rafael',102)

insert into Distrito values (10301,	'Desamparados',103)
insert into Distrito values (10302,	'San Miguel',103)
insert into Distrito values (10303,	'San Juan de Dios',103)
insert into Distrito values (10304,	'San Rafael Arriba',103)
insert into Distrito values (10305,	'San Antonio',103)
insert into Distrito values (10306,	'Frailes',103)
insert into Distrito values (10307,	'Patarra',103)
insert into Distrito values (10308,	'San Cristobal',103)
insert into Distrito values (10309,	'Rosario',103)
insert into Distrito values (10310,	'Damas',103)
insert into Distrito values (10311,	'San Rafael Abajo',103)
insert into Distrito values (10312,	'Gravilias',103)
insert into Distrito values (10313,	'Los Guido',103)

insert into Distrito values (10401,'Santiago',104)
insert into Distrito values (10402,'Mercedes Sur',104)
insert into Distrito values (10403,'Barbacoas',104)
insert into Distrito values (10404,'Grifo Alto',104)
insert into Distrito values (10405,'San Rafael',104)
insert into Distrito values (10406,'Candelarita',104)
insert into Distrito values (10407,'Desamparaditos',104)
insert into Distrito values (10408,'San Antonio',104)
insert into Distrito values (10409,'Chires',104)

insert into Distrito values (10501,	'San Marcos',105)
insert into Distrito values (10502,	'San Lorenzo',105)
insert into Distrito values (10503,	'San Carlos',105)

insert into Distrito values (10601,	'Aserrí',106)
insert into Distrito values (10602,	'Tarbaca',106)
insert into Distrito values (10603,	'Vuelta de Jorco',106)
insert into Distrito values (10604,	'San Gabriel',106)
insert into Distrito values (10605,	'Legua',106)
insert into Distrito values (10606,	'Monterrey',106)
insert into Distrito values (10607,	'Salitrillos',106)

insert into Distrito values (10701,	'Colón',105)
insert into Distrito values (10702,	'Guayabo',105)
insert into Distrito values (10703,	'Tabarcia',105)
insert into Distrito values (10704,	'Piedras Negras',105)
insert into Distrito values (10705,	'Picagres',105)
insert into Distrito values (10706,	'Jaris',105)
insert into Distrito values (10707,	'Quitirrisí',105)

insert into Distrito values (10801,	'Guadalupe',108)
insert into Distrito values (10802,	'San Francisco',108)
insert into Distrito values (10803,	'Calle Blancos',108)
insert into Distrito values (10804,	'Mata de Plátano',108)
insert into Distrito values (10805,	'Ipis',108)
insert into Distrito values (10806,	'Rancho Redondo',108)
insert into Distrito values (10807,	'Purral',108)

insert into Distrito values (10901,	'Santa Ana',109)
insert into Distrito values (10902,	'Salitral',109)
insert into Distrito values (10903,	'Pozos',109)
insert into Distrito values (10904,	'Uruca',109)
insert into Distrito values (10905,	'Piedades',109)
insert into Distrito values (10906,	'Brasil',109)

insert into Distrito values (11001,	'Alajuelita',110)
insert into Distrito values (11002,	'San Josecito',110)
insert into Distrito values (11003,	'San Antonio',110)
insert into Distrito values (11004,	'Concepción',110)
insert into Distrito values (11005,	'San Felipe',110)

insert into Distrito values (11101,	'San Isidro',111)
insert into Distrito values (11102,	'San Rafael',111)
insert into Distrito values (11103,	'Dulce Nombre de Jesús',111)
insert into Distrito values (11104,	'Patalillo',111)
insert into Distrito values (11105,	'Cascajal',111)

insert into Distrito values (11201,	'San Ignacio',112)
insert into Distrito values (11202,	'Guaitil',112)
insert into Distrito values (11203,	'Palmichal',112)
insert into Distrito values (11204,	'Cangrejal',112)
insert into Distrito values (11205,	'Sabanillas',112)

insert into Distrito values (11301,	'San Juan',113)
insert into Distrito values (11302,	'Cinco Esquinas',113)
insert into Distrito values (11303,	'Anselmo Llorente',113)
insert into Distrito values (11304,	'León XIII',113)
insert into Distrito values (11305,	'Colima',113)

insert into Distrito values (11401,	'San Vicente',114)
insert into Distrito values (11402,	'San Jerónimo',114)
insert into Distrito values (11403,	'La Trinidad',114)

insert into Distrito values (11501,	'San Pedro',115)
insert into Distrito values (11502,	'Sabanilla',115)
insert into Distrito values (11503,	'Mercedes',115)
insert into Distrito values (11504,	'San Rafael',115)

insert into Distrito values (11601,	'San Pablo',116)
insert into Distrito values (11602,	'San Pedro',116)
insert into Distrito values (11603,	'San Juan de Mata',116)
insert into Distrito values (11604,	'San Luis',116)
insert into Distrito values (11605,	'Carara',116)

insert into Distrito values (11701,	'Santa María',117)
insert into Distrito values (11702,	'Jardín',117)
insert into Distrito values (11703,	'Copey',117)

insert into Distrito values (11801,	'Curridabat',118)
insert into Distrito values (11802,	'Granadilla',118)
insert into Distrito values (11803,	'Sánchez',118)
insert into Distrito values (11804,	'Tirrases',118)

insert into Distrito values (11901,	'San Isidro de El General',119)
insert into Distrito values (11902,	'El General',119)
insert into Distrito values (11903,	'Daniel Flores',119)
insert into Distrito values (11904,	'Rivas',119)
insert into Distrito values (11905,	'San Pedro',119)
insert into Distrito values (11906,	'Platanares',119)
insert into Distrito values (11907,	'Pejibaye',119)
insert into Distrito values (11908,	'Cajón',119)
insert into Distrito values (11909,	'Barú',119)
insert into Distrito values (11910,	'Río Nuevo',119)
insert into Distrito values (11911,	'Paramo',119)
insert into Distrito values (11912,	'La  Amistad',119)

insert into Distrito values (12001,	'San Pablo',120)
insert into Distrito values (12002,	'San Andrés',120)
insert into Distrito values (12003,	'Llano Bonito',120)
insert into Distrito values (12004,	'San Isidro',120)
insert into Distrito values (12005,	'Santa Cruz',120)
insert into Distrito values (12006,	'San Antonio',120)

insert into Distrito values (20101,	'Alajuela',201)
insert into Distrito values (20102,	'San José',201)
insert into Distrito values (20103,	'Carrizal',201)
insert into Distrito values (20104,	'San Antonio',201)
insert into Distrito values (20105,	'Guácima',201)
insert into Distrito values (20106,	'San Isidro',201)
insert into Distrito values (20107,	'Sabanilla',201)
insert into Distrito values (20108,	'San Rafael',201)
insert into Distrito values (20109,	'Río Segundo',201)
insert into Distrito values (20110,	'Desamparados',201)
insert into Distrito values (20111,	'Turrucares',201)
insert into Distrito values (20112,	'Tambor',201)
insert into Distrito values (20113,	'Garita',201)
insert into Distrito values (20114,	'Sarapiquí',201)

insert into Distrito values (20201,	'San Ramón',202)
insert into Distrito values (20202,	'Santiago',202)
insert into Distrito values (20203,	'San Juan',202)
insert into Distrito values (20204,	'Piedades Norte',202)
insert into Distrito values (20205,	'Piedades Sur',202)
insert into Distrito values (20206,	'San Rafael',202)
insert into Distrito values (20207,	'San Isidro',202)
insert into Distrito values (20208,	'Ángeles',202)
insert into Distrito values (20209,	'Alfaro',202)
insert into Distrito values (20210,	'Volio',202)
insert into Distrito values (20211,	'Concepción',202)
insert into Distrito values (20212,	'Zapotal',202)
insert into Distrito values (20213,	'Peñas Blancas',202)
insert into Distrito values (20214,	'San Lorenzo',202)

insert into Distrito values (20301,	'Grecia',203)
insert into Distrito values (20302,	'San Isidro',203)
insert into Distrito values (20303,	'San José',203)
insert into Distrito values (20304,	'San Roque',203)
insert into Distrito values (20305,	'Tacares',203)
insert into Distrito values (20307,	'Puente de Piedra',203)
insert into Distrito values (20308,	'Bolivar',203)

insert into Distrito values (20401,	'San Mateo',204)
insert into Distrito values (20402,	'Desmonte',204)
insert into Distrito values (20403,	'Jesús María',204)
insert into Distrito values (20404,	'Labrador',204)

insert into Distrito values (20501,	'Atenas',205)
insert into Distrito values (20502,	'Jesús',205)
insert into Distrito values (20503,	'Mercedes',205)
insert into Distrito values (20504,	'San Isidro',205)
insert into Distrito values (20505,	'Concepción',205)
insert into Distrito values (20506,	'San José',205)
insert into Distrito values (20507,	'Santa Eulalia',205)
insert into Distrito values (20508,	'Escobal',205)

insert into Distrito values (20601,	'Naranjo',206)
insert into Distrito values (20602,	'San Miguel',206)
insert into Distrito values (20603,	'San José',206)
insert into Distrito values (20604,	'Cirrí Sur',206)
insert into Distrito values (20605,	'San Jerónimo',206)
insert into Distrito values (20606,	'San Juan',206)
insert into Distrito values (20607,	'El Rosario',206)
insert into Distrito values (20608,	'Palmitos',206)

insert into Distrito values (20701,	'Palmares',207)
insert into Distrito values (20702,	'Zaragoza',207)
insert into Distrito values (20703,	'Buenos Aires',207)
insert into Distrito values (20704,	'Santiago',207)
insert into Distrito values (20705,	'Candelaria',207)
insert into Distrito values (20706,	'Esquipulas',207)
insert into Distrito values (20707,	'La Granja',207)

insert into Distrito values (20801,	'San Pedro',208)
insert into Distrito values (20802,	'San Juan',208)
insert into Distrito values (20803,	'San Rafael',208)
insert into Distrito values (20804,	'Carrillos',208)
insert into Distrito values (20805,	'Sabana Redonda',208)

insert into Distrito values (20901,	'Orotina',209)
insert into Distrito values (20902,	'El Mastate',209)
insert into Distrito values (20903,	'Hacienda Vieja',209)
insert into Distrito values (20904,	'Coyolar',209)
insert into Distrito values (20905,	'La Ceiba',209)

insert into Distrito values (21001,	'Quesada',210)
insert into Distrito values (21002,	'Florencia',210)
insert into Distrito values (21003,	'Buenavista',210)
insert into Distrito values (21004,	'Aguas Zarcas',210)
insert into Distrito values (21005,	'Venecia',210)
insert into Distrito values (21006,	'Pital',210)
insert into Distrito values (21007,	'La Fortuna',210)
insert into Distrito values (21008,	'La Tigra',210)
insert into Distrito values (21009,	'La Palmera',210)
insert into Distrito values (21010,	'Venado',210)
insert into Distrito values (21011,	'Cutris',210)
insert into Distrito values (21012,	'Monterrey',210)
insert into Distrito values (21013,	'Pocosol',210)

insert into Distrito values (21101,	'Zarcero',211)
insert into Distrito values (21102,	'Laguna',211)
insert into Distrito values (21103,	'Tapesco',211)
insert into Distrito values (21104,	'Guadalupe',211)
insert into Distrito values (21105,	'Palmira',211)
insert into Distrito values (21106,	'Zapote',211)
insert into Distrito values (21107,	'Brisas',211)

insert into Distrito values (21201,	'Sarchí Norte',212)
insert into Distrito values (21202,	'Sarchí Sur',212)
insert into Distrito values (21203,	'Toro Amarillo',212)
insert into Distrito values (21204,	'San Pedro',212)
insert into Distrito values (21205,	'Rodríguez',212)

insert into Distrito values (21301,	'Upala',213)
insert into Distrito values (21302,	'Aguas Claras',213)
insert into Distrito values (21303,	'San José O Pizote',213)
insert into Distrito values (21304,	'Bijagua',213)
insert into Distrito values (21305,	'Delicias',213)
insert into Distrito values (21306,	'Dos Ríos',213)
insert into Distrito values (21307,	'Yolillal',213)
insert into Distrito values (21308,	'Canalete',213)

insert into Distrito values (21401,	'Los Chiles',214)
insert into Distrito values (21402,	'Caño Negro',214)
insert into Distrito values (21403,	'El Amparo',214)
insert into Distrito values (21404,	'San Jorge',214)

insert into Distrito values (21501,	'San Rafael',215)
insert into Distrito values (21502,	'Buenavista',215)
insert into Distrito values (21503,	'Cote',215)
insert into Distrito values (21504,	'Katira',215)

insert into Distrito values (30101,	'Oriental',301)
insert into Distrito values (30102,	'Occidental',301)
insert into Distrito values (30103,	'Carmen',301)
insert into Distrito values (30104,	'San Nicolás',301)
insert into Distrito values (30105,	'Aguacaliente o San Francisco',301)
insert into Distrito values (30106,	'Guadalupe o Arenilla',301)
insert into Distrito values (30107,	'Corralillo',301)
insert into Distrito values (30108,	'Tierra Blanca',301)
insert into Distrito values (30109,	'Dulce Nombre',301)
insert into Distrito values (30110,	'Llano Grande',301)
insert into Distrito values (30111,	'Quebradilla',301)

insert into Distrito values (30201,	'Paraíso',302)
insert into Distrito values (30202,	'Santiago',302)
insert into Distrito values (30203,	'Orosi',302)
insert into Distrito values (30204,	'Cachí',302)
insert into Distrito values (30205,	'Llanos de Santa Lucía',302)
insert into Distrito values (30206,	'Birrisito',302)

insert into Distrito values (30301,	'Tres Ríos',303)
insert into Distrito values (30302,	'San Diego',303)
insert into Distrito values (30303,	'San Juan',303)
insert into Distrito values (30304,	'San Rafael',303)
insert into Distrito values (30305,	'Concepción',303)
insert into Distrito values (30306,	'Dulce Nombre',303)
insert into Distrito values (30307,	'San Ramón',303)
insert into Distrito values (30308,	'Río Azul',303)

insert into Distrito values (30401,	'Juan Viñas',304)
insert into Distrito values (30402,	'Tucurrique',304)
insert into Distrito values (30403,	'Pejibaye',304)

insert into Distrito values (30501,	'Turrialba',305)
insert into Distrito values (30502,	'La Suiza',305)
insert into Distrito values (30503,	'Peralta',305)
insert into Distrito values (30504,	'Santa Cruz',305)
insert into Distrito values (30505,	'Santa Teresita',305)
insert into Distrito values (30506,	'Pavones',305)
insert into Distrito values (30507,	'Tuis',305)
insert into Distrito values (30508,	'Tayutic',305)
insert into Distrito values (30509,	'Santa Rosa',305)
insert into Distrito values (30510,	'Tres Equis',305)
insert into Distrito values (30511,	'La Isabel',305)
insert into Distrito values (30512,	'Chirripó',305)

insert into Distrito values (30601,	'Pacayas',306)
insert into Distrito values (30602,	'Cervantes',306)
insert into Distrito values (30603,	'Capellades',306)

insert into Distrito values (30701,	'San Rafael',307)
insert into Distrito values (30702,	'Cot',307)
insert into Distrito values (30703,	'Potrero Cerrado',307)
insert into Distrito values (30704,	'Cipreses',307)
insert into Distrito values (30705,	'Santa Rosa',307)

insert into Distrito values (30801,	'El Tejar',308)
insert into Distrito values (30802,	'San Isidro',308)
insert into Distrito values (30803,	'Tobosi',308)
insert into Distrito values (30804,	'Patio de Agua',308)

insert into Distrito values (40101,	'Heredia',401)
insert into Distrito values (40102,	'Mercedes',401)
insert into Distrito values (40103,	'San Francisco',401)
insert into Distrito values (40104,	'Ulloa',401)
insert into Distrito values (40105,	'Varablanca',401)

insert into Distrito values (40201,	'Barva',402)
insert into Distrito values (40202,	'San Pedro',402)
insert into Distrito values (40203,	'San Pablo',402)
insert into Distrito values (40204,	'San Roque',402)
insert into Distrito values (40205,	'Santa Lucía',402)
insert into Distrito values (40206,	'San José de la Montaña',402)

insert into Distrito values (40301,	'Santo Domingo',403)
insert into Distrito values (40302,	'San Vicente',403)
insert into Distrito values (40303,	'San Miguel',403)
insert into Distrito values (40304,	'Paracito',403)
insert into Distrito values (40305,	'Santo Tomás',403)
insert into Distrito values (40306,	'Santa Rosa',403)
insert into Distrito values (40307,	'Tures',403)
insert into Distrito values (40308,	'Pará',403)

insert into Distrito values (40401,	'Santa Bárbara',404)
insert into Distrito values (40402,	'San Pedro',404)
insert into Distrito values (40403,	'San Juan',404)
insert into Distrito values (40404,	'Jesús',404)
insert into Distrito values (40405,	'Santo Domingo',404)
insert into Distrito values (40406,	'Purabá',404)

insert into Distrito values (40501,	'San Rafael',405)
insert into Distrito values (40502,	'San Josecito',405)
insert into Distrito values (40503,	'Santiago',405)
insert into Distrito values (40504,	'Ángeles',405)
insert into Distrito values (40505,	'Concepción',405)

insert into Distrito values (40601,	'San Isidro',406)
insert into Distrito values (40602,	'San José',406)
insert into Distrito values (40603,	'Concepción',406)
insert into Distrito values (40604,	'San Francisco',406)

insert into Distrito values (40701,	'San Antonio',407)
insert into Distrito values (40702,	'La Ribera',407)
insert into Distrito values (40703,	'La Asunción',407)

insert into Distrito values (40801,	'San Joaquín',408)
insert into Distrito values (40802,	'Barrantes',408)
insert into Distrito values (40803,	'Llorente',408)

insert into Distrito values (40901,	'San Pablo',409)
insert into Distrito values (40902,	'Rincón de Sabanilla',409)

insert into Distrito values (41001,	'Puerto Viejo',410)
insert into Distrito values (41002,	'La Virgen',410)
insert into Distrito values (41003,	'Las Horquetas',410)
insert into Distrito values (41004,	'Llanuras del Gaspar',410)
insert into Distrito values (41005,	'Cureña',410)

insert into Distrito values (50101,	'Liberia',501)
insert into Distrito values (50102,	'Cañas Dulces',501)
insert into Distrito values (50103,	'Mayorga',501)
insert into Distrito values (50104,	'Nacascolo',501)
insert into Distrito values (50105,	'Curubandé',501)

insert into Distrito values (50201,	'Nicoya',502)
insert into Distrito values (50202,	'Mansión',502)
insert into Distrito values (50203,	'San Antonio',502)
insert into Distrito values (50204,	'Quebrada Honda',502)
insert into Distrito values (50205,	'Sámara',502)
insert into Distrito values (50206,	'Nosara',502)
insert into Distrito values (50207,	'Belén de Nosarita',502)

insert into Distrito values (50301,	'Santa Cruz',503)
insert into Distrito values (50302,	'Bolsón',503)
insert into Distrito values (50303,	'Veintisiete de Abril',503)
insert into Distrito values (50304,	'Tempate',503)
insert into Distrito values (50305,	'Cartagena',503)
insert into Distrito values (50306,	'Cuajiniquil',503)
insert into Distrito values (50307,	'Diriá',503)
insert into Distrito values (50308,	'Cabo Velas',503)
insert into Distrito values (50309,	'Tamarindo',503)

insert into Distrito values (50401,	'Bagaces',504)
insert into Distrito values (50402,	'La Fortuna',504)
insert into Distrito values (50403,	'Mogote',504)
insert into Distrito values (50404,	'Río Naranjo',504)

insert into Distrito values (50501,	'Filadelfia',505)
insert into Distrito values (50502,	'Palmira',505)
insert into Distrito values (50503,	'Sardinal',505)
insert into Distrito values (50504,	'Belén',505)

insert into Distrito values (50601,	'Cañas',506)
insert into Distrito values (50602,	'Palmira',506)
insert into Distrito values (50603,	'San Miguel',506)
insert into Distrito values (50604,	'Bebedero',506)
insert into Distrito values (50605,	'Porozal',506)

insert into Distrito values (50701,'Las Juntas',507)
insert into Distrito values (50702,'Sierra',507)
insert into Distrito values (50703,'San Juan',507)
insert into Distrito values (50704,'Colorado',507)

insert into Distrito values (50801,	'Tilarán',508)
insert into Distrito values (50802,	'Quebrada Grande',508)
insert into Distrito values (50803,	'Tronadora',508)
insert into Distrito values (50804,	'Santa Rosa',508)
insert into Distrito values (50805,	'Líbano',508)
insert into Distrito values (50806,	'Tierras Morenas',508)
insert into Distrito values (50807,	'Arenal',508)
insert into Distrito values (50808,	'Cabeceras',508)

insert into Distrito values (50901,	'Carmona',509)
insert into Distrito values (50902,	'Santa Rita',509)
insert into Distrito values (50903,	'Zapotal',509)
insert into Distrito values (50904,	'San Pablo',509)
insert into Distrito values (50905,	'Porvenir',509)
insert into Distrito values (50906,	'Bejuco',509)

insert into Distrito values (51001,	'La Cruz',510)
insert into Distrito values (51002,	'Santa Cecilia',510)
insert into Distrito values (51003,	'La Garita',510)
insert into Distrito values (51004,	'Santa Elena',510)

insert into Distrito values (51101,	'Hojancha',511)
insert into Distrito values (51102,	'Monte Romo',511)
insert into Distrito values (51103,	'Puerto Carrillo',511)
insert into Distrito values (51104,	'Huacas',511)
insert into Distrito values (51105,	'Matambú',511)

insert into Distrito values (60101,	'Puntarenas',601)
insert into Distrito values (60102,	'Pitahaya',601)
insert into Distrito values (60103,	'Chomes',601)
insert into Distrito values (60104,	'Lepanto',601)
insert into Distrito values (60105,	'Paquera',601)
insert into Distrito values (60106,	'Manzanillo',601)
insert into Distrito values (60107,	'Guacimal',601)
insert into Distrito values (60108,	'Barranca',601)
insert into Distrito values (60110,	'Isla del Coco',601)
insert into Distrito values (60111,	'Cóbano',601)
insert into Distrito values (60112,	'Chacarita',601)
insert into Distrito values (60113,	'Chira',601)
insert into Distrito values (60114,	'Acapulco',601)
insert into Distrito values (60115,	'El Roble',601)
insert into Distrito values (60116,	'Arancibia',601)

insert into Distrito values (60201,	'Espíritu Santo',602)
insert into Distrito values (60202,	'San Juan Grande',602)
insert into Distrito values (60203,	'Macacona',602)
insert into Distrito values (60204,	'San Rafael',602)
insert into Distrito values (60205,	'San Jerónimo',602)
insert into Distrito values (60206,	'Caldera',602)

insert into Distrito values (60301,	'Buenos Aires',603)
insert into Distrito values (60302,	'Volcán',603)
insert into Distrito values (60303,	'Potrero Grande',603)
insert into Distrito values (60304,	'Boruca',603)
insert into Distrito values (60305,	'Pilas',603)
insert into Distrito values (60306,	'Colinas',603)
insert into Distrito values (60307,	'Chánguena',603)
insert into Distrito values (60308,	'Biolley',603)
insert into Distrito values (60309,	'Brunka',603)

insert into Distrito values (60401,	'Miramar',604)
insert into Distrito values (60402,	'La Unión',604)
insert into Distrito values (60403,	'San Isidro',604)

insert into Distrito values (60501,	'Puerto Cortés',605)
insert into Distrito values (60502,	'Palmar',605)
insert into Distrito values (60503,	'Sierpe',605)
insert into Distrito values (60504,	'Bahía Ballena',605)
insert into Distrito values (60505,	'Piedras Blancas',605)
insert into Distrito values (60506,	'Bahía Drake',605)

insert into Distrito values (60601,	'Quepos',606)
insert into Distrito values (60602,	'Savegre',606)
insert into Distrito values (60603,	'Naranjito',606)

insert into Distrito values (60701,	'Golfito',607)
insert into Distrito values (60702,	'Puerto Jiménez',607)
insert into Distrito values (60703,	'Guaycará',607)
insert into Distrito values (60704,	'Pavón',607)

insert into Distrito values (60801,	'San Vito',608)
insert into Distrito values (60802,	'Sabalito',608)
insert into Distrito values (60803,	'Aguabuena',608)
insert into Distrito values (60804,	'Limoncito',608)
insert into Distrito values (60805,	'Pittier',608)
insert into Distrito values (60806,	'Gutiérrez Braun',608)

insert into Distrito values (60901,	'Parrita',609)

insert into Distrito values (61001,	'Corredor',610)
insert into Distrito values (61002,	'La Cuesta',610)
insert into Distrito values (61003,	'Canoas',610)
insert into Distrito values (61004,	'Laurel',610)

insert into Distrito values (61101,	'Jacó',611)
insert into Distrito values (61102,	'Tárcoles',611)
insert into Distrito values (61103,	'Lagunillas',611)

insert into Distrito values (70101,	'Limón',701)
insert into Distrito values (70102,	'Valle La Estrella',701)
insert into Distrito values (70103,	'Río Blanco',701)
insert into Distrito values (70104,	'Matama',701)

insert into Distrito values (70201,	'Guápiles',702)
insert into Distrito values (70202,	'Jiménez',702)
insert into Distrito values (70203,	'Rita',702)
insert into Distrito values (70204,	'Roxana',702)
insert into Distrito values (70205,	'Cariari',702)
insert into Distrito values (70206,	'Colorado',702)
insert into Distrito values (70207,	'La Colonia',702)

insert into Distrito values (70301,	'Siquirres',703)
insert into Distrito values (70302,	'Pacuarito',703)
insert into Distrito values (70303,	'Florida',703)
insert into Distrito values (70304,	'Germania',703)
insert into Distrito values (70305,	'El Cairo',703)
insert into Distrito values (70306,	'Alegría',703)
insert into Distrito values (70307,	'Reventazón',703)

insert into Distrito values (70401,	'Bratsi',704)
insert into Distrito values (70402,	'Sixaola',704)
insert into Distrito values (70403,	'Cahuita',704)
insert into Distrito values (70404,	'Telire',704)

insert into Distrito values (70501,	'Matina',705)
insert into Distrito values (70502,	'Batán',705)
insert into Distrito values (70503,	'Carrandí',705)

insert into Distrito values (70601,	'Guácimo',706)
insert into Distrito values (70602,	'Mercedes',706)
insert into Distrito values (70603,	'Pocora',706)
insert into Distrito values (70604,	'Río Jiménez',706)
insert into Distrito values (70605,	'Duacarí',706)

select * from Distrito