DROP DATABASE IF EXISTS dbGamarraMarket;

//* Deshabilitar el modo seguro de actualizaciones de MySQL */
SET SQL_SAFE_UPDATES = 0;

/* Crear base de datos dbGamarraMarket */
CREATE DATABASE dbGamarraMarket;

/* Poner en uso la base de datos dbGamarraMarket */
USE dbGamarraMarket;

/* Crear la tabla CLIENTE */
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(20) NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    celular VARCHAR(15),
    fecha_nacimiento DATE,
    activo TINYINT(1) DEFAULT 1,
    CONSTRAINT unique_documento UNIQUE (tipo_documento, numero_documento)
);

/* Insertar 1 registro en la tabla CLIENTE */
INSERT INTO cliente
(tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento)
VALUES
('DNI', '77889955', 'Alberto', 'Solano Pariona', 'alberto.pariona@gmail.com', '998456323', STR_TO_DATE('10/02/1970', '%d/%m/%Y'));

/* Insertar varios registros en la tabla CLIENTE */
INSERT INTO cliente
(tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento)
VALUES
('CNE', '457812330', 'Alicia', 'García Campos', 'alicia.garcia@gmail.com', '998459872', STR_TO_DATE('20/03/1980', '%d/%m/%Y')),
('DNI', '15487922', 'Juana', 'Ávila Chumpitaz', 'juana.avila@gmail.com', '923568741', STR_TO_DATE('06/06/1986', '%d/%m/%Y'));

/* Listar registros de tabla CLIENTE */
SELECT * FROM cliente;

/* Cambiar los apellidos de Alicia García Campos por Méndez Vera así como también su email alicia.mendez@gmail.com */
UPDATE cliente 
SET apellidos = 'Méndez Vera',
    email = 'alicia.mendez@gmail.com'
WHERE nombres = 'Alicia' AND apellidos = 'García Campos';

/* Listar registros de la tabla CLIENTE */
SELECT * FROM cliente;

/* Establecer como inactivo al cliente cuyo DNI es 15487922 */
UPDATE cliente
SET activo = 0
WHERE tipo_documento = 'DNI' 
AND numero_documento = '15487922';

/* Listar registros de la tabla CLIENTE */
SELECT * FROM cliente;


/* Eliminar los datos de Juana Ávila Chumpitaz */
DELETE FROM cliente 
WHERE nombres = 'Juana' 
AND apellidos = 'Ávila Chumpitaz';

/* Listar registros de la tabla PERSONA */
SELECT * FROM cliente;


/* Eliminar todos los registros de la tabla PERSONA */
DELETE FROM cliente;

/* Listar registros de la tabla PERSONA */
SELECT * FROM cliente;











/* Deshabilitar el modo seguro */
SET SQL_SAFE_UPDATES = 0;

/* Crear y usar la base de datos */
CREATE DATABASE IF NOT EXISTS dbGamarraMarket;
USE dbGamarraMarket;

/* Tabla CLIENTE */
CREATE TABLE IF NOT EXISTS cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(20) NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    celular VARCHAR(15),
    fecha_nacimiento DATE,
    activo TINYINT(1) DEFAULT 1,
    CONSTRAINT unique_documento UNIQUE (tipo_documento, numero_documento)
);

/*  Tabla VENDEDOR  */
CREATE TABLE IF NOT EXISTS vendedor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo_documento VARCHAR(20) NOT NULL,
    numero_documento VARCHAR(20) NOT NULL,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    salario DECIMAL(10,2),
    celular VARCHAR(15),
    email VARCHAR(100),
    activo TINYINT(1) DEFAULT 1
);

/*  Tabla PRENDA  */
CREATE TABLE IF NOT EXISTS prenda (
    id INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(100) NOT NULL,
    marca VARCHAR(50) NOT NULL,
    cantidad INT NOT NULL,
    talla VARCHAR(10) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    activo TINYINT(1) DEFAULT 1
);

/*  Tabla VENTA  */
CREATE TABLE IF NOT EXISTS venta (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha_hora DATETIME NOT NULL,
    cliente_id INT NOT NULL,
    vendedor_id INT NOT NULL,
    activo TINYINT(1) DEFAULT 1
);

/*  Tabla VENTA_DETALLE  */
CREATE TABLE IF NOT EXISTS venta_detalle (
    id INT PRIMARY KEY AUTO_INCREMENT,
    venta_id INT NOT NULL,
    prenda_id INT NOT NULL,
    cantidad INT NOT NULL
);

/* Insertar datos en CLIENTE */
/* Insertar registros en la tabla CLIENTE */
INSERT INTO cliente 
(tipo_documento, numero_documento, nombres, apellidos, email, celular, fecha_nacimiento, activo)
VALUES
('DNI', '77889955', 'Alberto', 'Solano Pariona', 'alberto.pariona@empresa.com', '998456103', '1970-02-10', 1),
('DNI', '45781233', 'Alicia', 'García Campos', NULL, NULL, '1980-03-20', 1),
('CNE', '315487922', 'Juana', 'Ávila Chumpitaz', 'juana.avila@gmail.com', '923568741', '1986-06-06', 1),
('CNE', '122116633', 'Ana', 'Enriquez Flores', 'ana.enriquez@empresa.com', NULL, '1970-02-10', 1),
('CNE', '088741589', 'Claudia', 'Perales Ortiz', 'claudia.perales@yahoo.com', '997845263', '1981-07-25', 1),
('DNI', '45122587', 'Mario', 'Barrios Martínez', 'mario.barrios@outlook.com', '986525871', '1987-10-10', 1),
('CNE', '175258564', 'Brunela', 'Tarazona Guerra', 'brunela.tarazona@gmail.com', '995236741', '1990-06-06', 1),
('DNI', '47142536', 'Alejandro', 'Jimenez Huapaya', NULL, '941525365', '1989-06-01', 1),
('DNI', '15352585', 'Claudia', 'Marquez Litano', 'claudia.marquez@gmail.com', '985814723', '1991-10-01', 1),
('CNE', '465772587', 'Mario', 'Rodríguez Mayo', 'mario.rodriguez@outlook.com', '912662587', '1987-11-10', 1),
('CNE', '837952514', 'Luisa', 'Guerra Ibarra', 'luisa.guerra@yahoo.com', '974422136', '1988-12-21', 1),
('DNI', '74142585', 'Pedro Alberto', 'Candela Valenzuela', 'pedro.candela@gmail.com', '94148525', '1995-06-30', 1),
('DNI', '53298147', 'Angel Manuel', 'Rojas Ávila', 'angel.rojas@outlook.com', NULL, '1975-03-02', 1),
('DNI', '11453265', 'Hilario Fabián', 'Ávila Huapaya', NULL, '985514326', '2000-05-02', 1),
('CNE', '757472186', 'Octavio', 'Marquez Osorio', 'octavio.marquez@yahoo.es', '966223141', '2000-09-22', 1),
('CNE', '558693219', 'Manolo E.', 'Vasquez Saravia', 'manolo.vasquez@outlook.es', '966223141', '2000-09-22', 1),
('DNI', '41552567', 'Genoveva', 'Ortiz Quispe', 'genoveva.ortiz@outlook.es', '92564137', '2003-04-12', 1),
('DNI', '49985471', 'Oscar César', 'Quiroz Zavala', NULL, '988223145', '2004-10-12', 1),
('DNI', '44992217', 'Verónica', 'Romero Vargas', 'veronica.romero@yahoo.com', NULL, '2002-08-25', 1),
('DNI', '00253641', 'Eliseo', 'Prada Ortiz', 'eliseo.prada@yahoo.com', NULL, '2004-09-15', 1);

/* Insertar datos en VENDEDOR */
INSERT INTO vendedor (tipo_documento, numero_documento, nombres, apellidos, salario, celular, email, activo) VALUES
('DNI', '85471236', 'Enrique', 'Pérez Manco', 1500.00, '96521873', 'enrique.perez@outlook.com', 1),
('DNI', '47259136', 'Sofía', 'Ávila Solis', 1350.00, NULL, NULL, 1),
('DNI', '61542280', 'Marcela', 'Napaico Cama', 1600.00, '965874357', 'marcela.napaico@gmail.com', 1),
('CNE', '742536140', 'Carmelo', 'Rodríguez Chauca', 1550.00, NULL, 'carmelo.rodriguez@yahoo.com', 1);

/* Insertar datos en PRENDA */
INSERT INTO prenda (descripcion, marca, cantidad, talla, precio, activo) VALUES
('Pantalon Jeans', 'Levis', 60, '28', 65.80, 1),
('Camisa manga corta', 'Adams', 75, '16', 55.00, 1),
('Polo sport', 'Australia', 100, '16', 40.00, 1),
('Camisa manga larga', 'Newport', 150, '16', 42.50, 1),
('Pijama para caballero', 'Adams', 180, '28', 79.50, 1),
('Corbata', 'Maxwell', 85, '16', 14.50, 1),
('Pijama para dama', 'Adams', 170, '24', 55.50, 1),
('Pantalon Jeans', 'Australia', 200, '28', 68.50, 1),
('Camisa Sport', 'John Holden', 85, '16', 88.50, 1),
('Shorts Jeans', 'Pepe Jeans', 185, '28', 77.20, 1);

/* Insertar datos en VENTA */
INSERT INTO venta (fecha_hora, cliente_id, vendedor_id, activo) VALUES
('2023-05-01 19:04:08', 4, 1, 1),
('2023-05-01 19:04:08', 6, 3, 1),
('2023-05-01 19:04:08', 10, 1, 1),
('2023-05-01 19:04:08', 18, 4, 1);

/* Insertar datos en VENTA_DETALLE */
INSERT INTO venta_detalle (venta_id, prenda_id, cantidad) VALUES
(1, 6, 3), (1, 3, 5), (1, 2, 7),
(2, 2, 3), (3, 7, 4), (3, 10, 6),
(3, 2, 6), (3, 5, 7), (4, 2, 4),
(4, 5, 3);

/* Actualizaciones solicitadas */

-- Actualizar celular de Mario Rodríguez Mayo
UPDATE cliente 
SET celular = '922881101'
WHERE nombres = 'Mario' AND apellidos = 'Rodríguez Mayo';

-- Actualizar celular de cliente con DNI 53298147
UPDATE cliente 
SET celular = '977226604'
WHERE tipo_documento = 'DNI' AND numero_documento = '53298147';

-- Eliminar lógicamente clientes específicos
UPDATE cliente 
SET activo = 0
WHERE tipo_documento = 'DNI' 
AND numero_documento IN ('11453265', '74142585', '49985471');

-- Limpiar celulares de clientes específicos
UPDATE cliente 
SET celular = NULL
WHERE tipo_documento = 'DNI' 
AND numero_documento IN ('87952514', '55869321', '74142585');

-- Reactivar y actualizar correo de Oscar César
UPDATE cliente 
SET activo = 1,
    email = 'oscar.quiroz@yahoo.es'
WHERE nombres = 'Oscar César' AND apellidos = 'Quiroz Zavala';

-- Actualizar precio del polo sport
UPDATE prenda 
SET precio = 45.00
WHERE descripcion = 'Polo sport' AND marca = 'Australia';

-- Cambiar nombre de Corbata
UPDATE prenda 
SET descripcion = 'Corbata Michi elegante'
WHERE descripcion = 'Corbata';

-- Eliminar físicamente prendas específicas
DELETE FROM prenda 
WHERE descripcion IN ('Camisa manga corta', 'Camisa Sport');

-- Eliminar vendedora específica
DELETE FROM vendedor 
WHERE nombres = 'Marcela' AND apellidos = 'Napaico Cama';

-- Eliminar clientes específicos
DELETE FROM cliente 
WHERE tipo_documento = 'DNI' 
AND numero_documento IN ('47142536', '77889955');

-- Eliminar clientes nacidos en 1980
DELETE FROM cliente 
WHERE YEAR(fecha_nacimiento) = 1980;



/* Mostrar todos los registros de la tabla CLIENTE */
SELECT * FROM cliente;

/* Mostrar todos los registros de la tabla VENDEDOR */
SELECT * FROM vendedor;

/* Mostrar todos los registros de la tabla PRENDA */
SELECT * FROM prenda;

/* Mostrar todos los registros de la tabla VENTA */
SELECT * FROM venta;

/* Mostrar todos los registros de la tabla VENTA_DETALLE */
SELECT * FROM venta_detalle;
