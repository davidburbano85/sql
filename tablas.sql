create table Consumo(
	id int identity(1,1) primary key,
	IdEmpresa int not null,
	idMesa int not null,
	idProducto int not null,
	cantidad int,
	atencionMesero bit,
	fechaDeVenta datetime
	constraint fk_empresa_consumo foreign key (idEmpresa)references Empresa(id),
	constraint fk_mesa_consumo foreign key (idEmpresa)references Mesas(id),
	constraint fk_producto_consumo foreign key (idEmpresa)references ProductosCarta(id),
)

create table ProductosCarta(
    id int identity (1,1) primary key,
	idEmpresa int not null,
	idStock int not null,
	nombreProducto varchar(20),
	tipoProducto varchar(20), -- comida o bebida
	unidad varchar(20),
	constraint fk_empresa_carta foreign key(idEmpresa) references Empresa(id),
	constraint fk_stock_carta foreign key(idStock) references Stock(id)
)
create table Stock(
	id int identity (1,1) primary key,
	idEmpresa int not null,
	tipoProducto varchar(20),
	disponibilidad int, 
	precioCompra bigint,
	precioVenta bigint,
	fechaCompra datetime,
	proveedor varchar(20)
	constraint fk_empresa_stock foreign key(idEmpresa) references Empresa(id)
)

create table Usuarios(
	id int identity(1,1) primary key,
	IdEmpresa int not null,
	contraseña varchar(max),
	nombre varchar(50),
	tipoUsuario varchar(50)--administrador o mesero
	constraint fk_empresa_usua foreign key(idEmpresa)references Empresa(id)
)
create table Canciones(
	id int identity(1,1) primary key,
	idEmpresa int not null,
	idMesa int not null,
	linkCopiado varchar(max),
	nombreCancion varchar(max),
	constraint fk_empresa1 foreign key(idEmpresa) references Empresa(id),
	constraint fk_Mesa foreign key(idMesa) references Mesas(id)
)
create table Mesas(
id int identity(1,1) primary key,
idEmpresa int not null,
numeroMesa int,
sillas int,
estado varchar(20),
fechaInicio datetime,
fechaFinalizacion datetime,
constraint fk_empresa foreign key (idEmpresa) references Empresa(id),
)
create table Empresa(
id int identity(1,1) primary key,
nombreEstablecimiento varchar(20),
tipoEstablecimiento varchar(20),
numeroMesas int,
fechaSuscripcion dateTime,
fechaVencimiento dateTime ,
suscripcion varchar(20)

)