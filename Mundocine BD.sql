
CREATE DATABASE Mundocine;

USE Mundocine;

CREATE TABLE Cliente(
CodCliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nombres VARCHAR(40) NOT NULL,
ApePaterno VARCHAR(20) NOT NULL,
ApeMaterno VARCHAR(20) NOT NULL,
DNI VARCHAR(8) NOT NULL UNIQUE KEY,
FechaNacimiento DATE NOT NULL,
Usuario VARCHAR(20) NOT NULL,
Correo VARCHAR(100) NOT NULL UNIQUE KEY,
Contraseña VARCHAR(100) NOT NULL
);

CREATE TABLE contacto(
CodContacto INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nombre VARCHAR(50) NOT NULL,
Correo VARCHAR(100) NOT NULL,
Telefono VARCHAR(50) NOT NULL,
Mensaje VARCHAR(1000) NOT NULL
);

CREATE TABLE Sugerencias(
CodSugerencia INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nombre VARCHAR(50) NOT NULL,
Correo VARCHAR(100) NOT NULL,
Asunto VARCHAR(50) NOT NULL,
Contenido VARCHAR(1000) NOT NULL
);

CREATE TABLE Pelicula(
CodPelicula INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nombre VARCHAR(100) NOT NULL,
Género VARCHAR(50) NOT NULL,
FechaEstreno DATE NOT NULL
);

CREATE TABLE Horario(
CodHorario INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
CodPelicula INT NOT NULL,
Fecha DATE NOT NULL,
Hora TIME NOT NULL,
FOREIGN KEY (CodPelicula) REFERENCES Pelicula(CodPelicula)
);

CREATE TABLE Categoria(
CodCategoria INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nombre VARCHAR(20) NOT NULL
);

CREATE TABLE Snacks(
CodSnacks INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
CodCategoria INT NOT NULL,
Descripcion VARCHAR(30) NOT NULL,
Precio DECIMAL(10,2),
FechaVencimiento DATE NOT NULL,
FOREIGN KEY (CodCategoria) REFERENCES Categoria(CodCategoria)
);

CREATE TABLE Locales(
CodLocal INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
Nombre VARCHAR(50) NOT NULL,
Direccion VARCHAR(100) NOT NULL
);

CREATE TABLE Entrada(
CodEntrada INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
CodCliente INT NOT NULL,
CodLocal INT NOT NULL,
Fecha DATE NOT NULL,
Hora TIME NOT NULL,
FOREIGN KEY (CodCliente) REFERENCES Cliente(CodCliente),
FOREIGN KEY (CodLocal) REFERENCES Locales(CodLocal)
);

CREATE TABLE DetalleEntrada(
CodEntrada INT NOT NULL,
CodPelicula INT NOT NULL,
Cantidad INT NOT NULL,
PRIMARY KEY(CodEntrada, CodPelicula),
FOREIGN KEY (CodEntrada) REFERENCES Entrada(CodEntrada),
FOREIGN KEY (CodPelicula) REFERENCES Pelicula(CodPelicula)
);

CREATE TABLE Compra(
CodCompra INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
CodCliente INT NOT NULL,
CodLocal INT NOT NULL,
Fecha DATE NOT NULL,
Hora time NOT NULL,
Total decimal(5,2) NOT NULL,
FOREIGN KEY (CodCliente) REFERENCES Cliente(CodCliente),
FOREIGN KEY (CodLocal) REFERENCES Locales(CodLocal)
);

CREATE TABLE DetalleCompra(
CodCompra INT NOT NULL,
CodSnacks INT NOT NULL,
Cantidad INT NOT NULL,
FOREIGN KEY (CodCompra) REFERENCES Compra(CodCompra),
FOREIGN KEY (CodSnacks) REFERENCES Snacks(CodSnacks)
);
ALTER TABLE snacks DROP foreign key snacks_ibfk_1;
ALTER TABLE detallecompra DROP foreign key detallecompra_ibfk_1;
ALTER TABLE detallecompra DROP foreign key detallecompra_ibfk_2;
DROP TABLE snacks;
DROP TABLE detallecompra;


CREATE TABLE ItemDulceria(
CodItem INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
CodCategoria INT NOT NULL,
Nombre varchar(50) NOT NULL,
Descripcion VARCHAR(70) NOT NULL,
Precio DECIMAL(4,2) NOT NULL,
Stock INT NOT NULL,
FOREIGN KEY (CodCategoria) REFERENCES Categoria(CodCategoria)
);

CREATE TABLE DetalleCompra(
CodDetalleCompra INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
CodCompra INT NOT NULL,
CodItemDulceria INT NOT NULL,
Cantidad INT NOT NULL,
Subtotal decimal(5,2),
FOREIGN KEY (CodCompra) REFERENCES Compra(CodCompra),
FOREIGN KEY (CodItemDulceria) REFERENCES ItemDulceria(CodItem)
);

CREATE TABLE Reclamos(
CodReclamo INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
NombreCli VARCHAR(100) NOT NULL,
CorreoReclamo VARCHAR(100) NOT NULL,
dniReclamo VARCHAR(100) NOT NULL,
fechaReclamo DATE NOT NULL,
AsuntoReclamo VARCHAR(50) NOT NULL,
ContenidoReclamo VARCHAR(1000) NOT NULL,
CodLocal int not null,
foreign key (CodLocal) References Locales(CodLocal)
);
CREATE TABLE Area
(
    CodArea int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Descripcion varchar(100) NOT NULL,
    estado varchar(10) DEFAULT 'activo' NOT NULL,
    INDEX (estado)
);


CREATE TABLE Empleado
(
    CodEmpleado int PRIMARY KEY AUTO_INCREMENT NOT NULL,
    CodLocal int NOT NULL,
    CodArea int NOT NULL,
    Nombre varchar(30) NOT NULL,
    Apellidos varchar(30) NOT NULL,
    FechaNacimiento date NOT NULL,
    DNI varchar(15) NOT NULL UNIQUE,
    Sexo varchar(10) NOT NULL,
    Celular varchar(15) NOT NULL UNIQUE,
    Salario decimal(10,2) NOT NULL,
    Correo varchar(100) NOT NULL UNIQUE,
    Clave varchar(50) NOT NULL,
    estado varchar(10) DEFAULT 'activo' NOT NULL,
    FOREIGN KEY (CodLocal) REFERENCES Locales(CodLocal),
    FOREIGN KEY (CodArea) REFERENCES Area(CodArea),
    INDEX (estado)
);

