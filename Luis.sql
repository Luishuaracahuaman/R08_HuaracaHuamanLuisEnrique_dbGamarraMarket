-- Eliminar base de datos
DROP DATABASE Record;

-- Crear base de datos

CREATE DATABASE Record; 

-- Usar base de datos

USE Record;

-- Crear tabla Consulta

CREATE TABLE Queries (
    identifier INT AUTO_INCREMENT PRIMARY KEY , 
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    cellphone CHAR(9) NOT NULL,
    message VARCHAR(200),
    date_hour DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Insercción de datos en la tabla Consultas

INSERT INTO Queries (name, email, cellphone, message) VALUES
('Luis', 'luis.huaraca.h@vallegrande.edu.pe', '912345123', 'Quisiera saber más sobre sus servicios'),
('Kassandra', 'kassandra@gmai.com', '987654321', '¿Cuándo es la próxima promoción?'),
('Alejandra', 'jennifer.cubillas.c@vallegrande.edu.pe','913441396', 'Estoy interesado en comprar un producto'),
('María', 'amaria.sulca.h@vallegrande.edu.pe', '945678321', '¿Tienen servicio de entrega a domicilio?');





-- Crear tabla Calendario

CREATE TABLE calendar(
identifier int auto_increment,
nombre varchar(100),
dia date,
primary key (identifier)
);

-- Insercción de datos en la tabla calendario

INSERT INTO calendar (nombre, dia) Values
('Día del Periodismo',(str_to_date('01/10/2024','%d/%m/%Y'))),
('Día del Combate de Angamos',(str_to_date('08/10/2024','%d/%m/%Y'))),
('Descubrimiento de América',(str_to_date('12/10/2024','%d/%m/%Y'))),
('Día Mundial de la Alimentación',(str_to_date('16/10/2024','%d/%m/%Y'))),
('Día Internacional para la Erradicación de la Pobreza',(str_to_date('17/10/2024','%d/%m/%Y'))),
('Día Nacional de Ahorro de Energía ',(str_to_date('21/10/2024','%d/%m/%Y'))),
('Día de la Canción Criolla', (str_to_date('31/10/2024','%d/%m/%Y'))),
('Semana Nacional Forestal',(str_to_date('01/11/2024','%d/%m/%Y'))),
('Semana de la Vida Animal',(str_to_date('04/11/2024','%d/%m/%Y'))),
('Día de la Declaración Universal de los Derechos del Niño',(str_to_date('20/11/2024','%d/%m/%Y'))),
('Navidad ',(str_to_date('25/12/2024','%d/%m/%Y')));

-- Consultar los datos registrados en la tabla Calendario

SELECT * FROM calendar;

-- Consultar los datos registrados en la tabla Consultas

SELECT * FROM Queries;

-- Consultar los eventos que coincidan con una fecha específica

SELECT nombre,DATE_FORMAT(dia,'%d/%m/%Y') AS dia FROM calendar where dia = '2024-10-16';

-- Tablas

Show tables;
