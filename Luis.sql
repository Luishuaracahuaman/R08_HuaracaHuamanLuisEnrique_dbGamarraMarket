/* Crear base de datos dbGamarraMarket */
CREATE DATABASE dbGamarraMarket
default character SET utf8;

/* Poner en uso la base de datos dbGamarraMarket */
USE dbGamarraMarket;

/* Crear la tabla CLIENTE */
CREATE TABLE CLIENTE(
    id int auto_increment primary key,
    tipo_documento char(3),
    numero_documento char(9),
    nombres varchar(60),
    apellidos varchar(90),
    email varchar(80),
    celular char(9),
    fecha_nacimiento date,
    activo bool
);

-- Insertar datos en la tabla CLIENTE
INSERT INTO CLIENTE (id, tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo) VALUES
(1, 'DNI', '45678912', 'Juan Carlos', 'Pérez Gómez', 'juan.perez@gmail.com', '987654321', '1990-05-15', true),
(2, 'DNI', '42198765', 'María Elena', 'García Torres', 'maria.garcia@hotmail.com', '987123456', '1988-08-22', true),
(3, 'DNI', '43567891', 'Pedro José', 'López Mendoza', 'pedro.lopez@gmail.com', '978456123', '1995-03-10', true),
(4, 'CEX', 'CE123456', 'Ana María', 'Rodríguez Silva', 'ana.rodriguez@gmail.com', '945678912', '1992-11-28', true),
(5, 'DNI', '41234567', 'Carlos Alberto', 'Torres Vega', 'carlos.torres@hotmail.com', '956789123', '1987-07-14', true);

/* Crear la tabla VENDEDOR */
CREATE TABLE VENDEDOR(
id int auto_increment primary key,
tipo_documento char(3),
numero_documento char(15),
nombres varchar(60),
apellidos varchar(90),
salario decimal(8, 2),
celular char(9),
email varchar(80),
activo bool
);


-- Insertar datos en la tabla VENDEDOR
INSERT INTO VENDEDOR (id, tipo_documento, numero_documento, nombres, apellidos, salario, celular, email, activo) VALUES
(1, 'DNI', '40123456', 'Luis Miguel', 'Sánchez Díaz', 2500.00, '912345678', 'luis.sanchez@gamarramarket.com', true),
(2, 'DNI', '41234567', 'Rosa María', 'Flores Campos', 2300.00, '923456789', 'rosa.flores@gamarramarket.com', true),
(3, 'DNI', '42345678', 'Jorge Luis', 'Vargas Ruiz', 2400.00, '934567890', 'jorge.vargas@gamarramarket.com', true);


/* Crear la tabla PRENDA */
CREATE TABLE PRENDA(
id int auto_increment primary key,
descripcion varchar(90),
marca varchar(60),
cantidad int,
talla varchar(10),
precio decimal(8, 2),
activo bool
);

-- Insertar datos en la tabla PRENDA
INSERT INTO PRENDA (id, descripcion, marca, cantidad, talla, precio, activo) VALUES
(1, 'Pantalón Jean Clásico', 'Levis', 50, '32', 89.90, true),
(2, 'Camisa Manga Larga', 'Newport', 30, 'M', 59.90, true),
(3, 'Polo Cuello Redondo', 'Adidas', 45, 'L', 45.90, true),
(4, 'Vestido Casual', 'Zara', 25, 'S', 79.90, true),
(5, 'Casaca Deportiva', 'Nike', 20, 'XL', 129.90, true),
(6, 'Falda Plisada', 'H&M', 35, 'M', 69.90, true);


/* Crear la tabla VENTA */
CREATE TABLE VENTA(
id int auto_increment primary key,
fecha_hora timestamp,
activo bool,
cliente_id int,
vendedor_id int,
foreign key (cliente_id) references CLIENTE(id),
foreign key (vendedor_id) references VENDEDOR(id)
);

-- Insertar datos en la tabla VENTA
INSERT INTO VENTA (id, fecha_hora, activo, cliente_id, vendedor_id) VALUES
(1, '2024-01-15 10:30:00', true, 1, 1),
(2, '2024-01-15 11:45:00', true, 2, 1),
(3, '2024-01-16 09:15:00', true, 3, 2),
(4, '2024-01-16 14:20:00', true, 4, 3),
(5, '2024-01-17 16:30:00', true, 5, 2);


/* Crear la tabla VENTA DETALLE */

CREATE TABLE VENTA_DETALLE(
id int auto_increment primary key,
cantidad int,
venta_id int,
prenda_id int,
foreign key (venta_id) references VENTA(id),
foreign key (prenda_id) references PRENDA(id)
);


/* Insertar datos a la tabla VENTA DETALLE */
INSERT INTO VENTA_DETALLE (cantidad, venta_id, prenda_id) 
VALUES (2, 1, 1);

/*SELECION DE TABLAS*/

-- tabla cliente
SELECT * FROM CLIENTE;

-- tabla prenda
SELECT * FROM PRENDA;

-- tabla vendedor
SELECT * FROM VENDEDOR;

-- tabla venta
SELECT * FROM VENTA;

-- tabla venta detalle
SELECT * FROM VENTA_DETALLE;