-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS ejercicio_2_9;

-- Crear la base de datos
CREATE DATABASE ejercicio_2_9;

-- Seleccionar la base de datos
USE ejercicio_2_9;

-- Crear la tabla usuario
CREATE TABLE usuario (
                         usuario VARCHAR(40) PRIMARY KEY,
                         contrasena VARCHAR(64) NOT NULL
);
-- Crear la tabla cliente
CREATE TABLE cliente (
                         cliente_id INT PRIMARY KEY NOT NULL,
                         nombre_completo VARCHAR(100) NOT NULL,
                         direccion VARCHAR(255) NOT NULL,
                         telefono VARCHAR(15) NOT NULL,
                         fecha_nacimiento DATE NOT NULL
);
INSERT INTO usuario (usuario, contrasena) VALUES ('user', '1234');
INSERT INTO usuario (usuario, contrasena) VALUES ('admin', '9999');

INSERT INTO cliente (cliente_id, nombre_completo, direccion, telefono, fecha_nacimiento) VALUES ('1', 'Pepe', 'calle Nueva', '234', '2022-12-20');
INSERT INTO cliente (cliente_id, nombre_completo, direccion, telefono, fecha_nacimiento) VALUES ('1', 'Juan', 'calle Nueva', '345', '2023-12-11');
INSERT INTO cliente (cliente_id, nombre_completo, direccion, telefono, fecha_nacimiento) VALUES ('1', 'Pepe', 'calle Nueva', '234', '2023-12-21');
