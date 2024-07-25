ALTER TABLE Compra MODIFY COLUMN Hora time;
ALTER TABLE Compra ADD COLUMN Total decimal(5,2);

insert into categoria(Nombre) values ("Bebida");
insert into categoria(Nombre) values ("Canchita");
insert into categoria(Nombre) values ("Golosina");

insert into itemdulceria(CodCategoria,Nombre,Descripcion,Precio,Stock) values (2,'cancha grande','cancha tamaño grande',17.00,20);
insert into itemdulceria(CodCategoria,Nombre,Descripcion,Precio,Stock) values (2,'cancha mediana','cancha tamaño mediano',15.00,10);
insert into itemdulceria(CodCategoria,Nombre,Descripcion,Precio,Stock) values (2,'cancha gigante','cancha tamaño gigante',25.00,0);
insert into itemdulceria(CodCategoria,Nombre,Descripcion,Precio,Stock) values (3,'snicker','snack de chocolate',7.50,5);
insert into itemdulceria(CodCategoria,Nombre,Descripcion,Precio,Stock) values (1,'gaseosa','gaseosa Grande de 32 oz',15.00,3);

INSERT INTO Locales (Nombre, Direccion) VALUES 
('MundoCine Plaza Norte', 'Av. Alfredo Mendiola 1400, San Martín de Porres 15311'),
('MundoCine Mega Plaza', 'Av. Alfredo Mendiola 3698, San Martín de Porres 15311'),
('MundoCine Real Plaza', 'Av. Angamos Este 2681, San Borja 15036'),
('MundoCine Mall Aventura', 'Av. Nicolás Ayllón, Santa Anita 15008'),
('MundoCine Plaza Lima Sur', 'Av Paseo de la República 355, Chorrillos 15064'),
('MundoCine Jockey Plaza', 'Av. Javier Prado Este 4200, Santiago de Surco 15023');

INSERT INTO Reclamos (NombreCli, CorreoReclamo, dniReclamo, fechaReclamo, AsuntoReclamo, ContenidoReclamo, CodLocal) 
VALUES ('Juan Pérez', 'juan.perez@example.com', '12345678', '2024-07-10', 'Problema con el sonido', 'El sonido de la película estaba muy bajo.', 1);

INSERT INTO Reclamos (NombreCli, CorreoReclamo, dniReclamo, fechaReclamo, AsuntoReclamo, ContenidoReclamo, CodLocal) 
VALUES ('María López', 'maria.lopez@example.com', '87654321', '2024-07-09', 'Asiento roto', 'El asiento estaba roto y no me pude sentar cómodamente.', 2);

INSERT INTO Reclamos (NombreCli, CorreoReclamo, dniReclamo, fechaReclamo, AsuntoReclamo, ContenidoReclamo, CodLocal) 
VALUES ('Carlos García', 'carlos.garcia@example.com', '11223344', '2024-07-08', 'Personal grosero', 'El personal en la taquilla fue muy grosero.', 3);

INSERT INTO Reclamos (NombreCli, CorreoReclamo, dniReclamo, fechaReclamo, AsuntoReclamo, ContenidoReclamo, CodLocal) 
VALUES ('Ana Martínez', 'ana.martinez@example.com', '44332211', '2024-07-07', 'Falta de limpieza', 'La sala de cine estaba muy sucia.', 1);

INSERT INTO Reclamos (NombreCli, CorreoReclamo, dniReclamo, fechaReclamo, AsuntoReclamo, ContenidoReclamo, CodLocal) 
VALUES ('Luis Fernández', 'luis.fernandez@example.com', '99887766', '2024-07-06', 'Retraso en la película', 'La película comenzó con 30 minutos de retraso.', 2);

SELECT * FROM mundocine.itemdulceria;
SELECT * FROM mundocine.categoria;
