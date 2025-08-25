
CREATE TABLE rol (

    id_rol CHAR(36) PRIMARY KEY,

    nombre VARCHAR(50) NOT NULL UNIQUE,

    descripcion VARCHAR(255)

);

CREATE TABLE usuario(

    id_usuario CHAR(36) PRIMARY KEY,

    nombres VARCHAR(100) NOT NULL,

    apellidos VARCHAR(100) NOT NULL,

    email VARCHAR(255) NOT NULL UNIQUE CHECK(email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),

    documento_identidad VARCHAR(20) NOT NULL UNIQUE,

    telefono VARCHAR(20) CHECK (telefono REGEXP '^[0-9+ -]+$'),

    direccion VARCHAR(255) NOT NULL,

    salario_base DECIMAL(10,2) NOT NULL CHECK (salario_base >= 0 AND salario_base <= 15000000),

    rol_id CHAR(36) NOT NULL,

    contrasena VARCHAR(255) NOT NULL,

    fecha_nacimiento DATE NOT NULL,

    FOREIGN KEY (rol_id) REFERENCES rol(id_rol)

);


INSERT INTO rol (id_rol, nombre, descripcion) VALUES
('d6f378a4-8b1e-4f2a-9c3d-123456789abc', 'ADMINISTRADOR', 'Acceso total'),
('a1b2c3d4-e5f6-7890-abcd-ef1234567890', 'ASESOR', 'Acceso parcial'),
('f47ac10b-58cc-4372-a567-0e02b2c3d479', 'SOLICITANTE', 'Acceso básico'),
('6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'INVITADO', 'Lectura en algunas secciones');