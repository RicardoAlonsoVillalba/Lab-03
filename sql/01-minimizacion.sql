-- 8.1 Diseñar una estructura mínima
-- Creación de la tabla con los datos estrictamente necesarios
CREATE TABLE clientes_soporte ( 
    id BIGINT PRIMARY KEY, 
    nombre VARCHAR(120) NOT NULL,
    correo VARCHAR(150) NOT NULL, 
    telefono VARCHAR(20) 
);

-- Carga de información a partir de la tabla principal
INSERT INTO clientes_soporte ( id, nombre, correo, telefono)
SELECT id, nombre, correo, telefono FROM clientes;

-- Consulta de verificación
SELECT * FROM clientes_soporte;
