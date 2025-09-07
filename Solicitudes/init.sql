CREATE TABLE estado (
    id_estado CHAR(36) PRIMARY KEY,

    nombre VARCHAR(50) NOT NULL UNIQUE,

    descripcion VARCHAR(255)
);

CREATE TABLE tipo_prestamo (
    id_tipo_prestamo CHAR(36) PRIMARY KEY,

    nombre VARCHAR(100) NOT NULL UNIQUE,

    monto_minimo DECIMAL(12,2) NOT NULL CHECK (monto_minimo >= 0),

    monto_maximo DECIMAL(12,2) NOT NULL,

    tasa_interes DECIMAL(5,2) NOT NULL CHECK (tasa_interes > 0 AND tasa_interes <= 100),

    validacion_automatica BOOLEAN NOT NULL DEFAULT FALSE

);

CREATE TABLE solicitud (
    id_solicitud CHAR(36) PRIMARY KEY,
    
    documento_identidad VARCHAR(20) NOT NULL,
    
    monto DECIMAL(12,2) NOT NULL CHECK (monto > 0),
    
    plazo INT NOT NULL CHECK (plazo > 0),
    
    email VARCHAR(255) NOT NULL CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$'),
    
    id_estado CHAR(36) NOT NULL,
    
    id_tipo_prestamo CHAR(36) NOT NULL,
    
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    
    FOREIGN KEY (id_estado) REFERENCES estado(id_estado),
    FOREIGN KEY (id_tipo_prestamo) REFERENCES tipo_prestamo(id_tipo_prestamo)

    
);



INSERT INTO tipo_prestamo (id_tipo_prestamo, nombre, monto_minimo, monto_maximo, tasa_interes, validacion_automatica) VALUES
('6ba7b810-9dad-11d1-80b4-00c04fd430c8', 'PRESTAMO PERSONAL', 1000000, 50000000, 15.50, TRUE),
('7fa85f64-5717-4562-b3fc-2c963f66afa6', 'PRESTAMO HIPOTECARIO', 50000000, 500000000, 8.75, FALSE),
('16fd2706-8baf-433b-82eb-8c7fada847da', 'PRESTAMO VEHICULAR', 5000000, 200000000, 12.00, TRUE);


INSERT INTO estado (id_estado, nombre, descripcion) VALUES
('9a7b3300-1d8f-4b7c-bc0d-1a2f0c9a7e21', 'RECHAZADO', 'La solicitud fue evaluada y no cumple con los requisitos'),
('c1f2e110-3a4b-4d2c-8b2f-5f6a7c8d9e10', 'PENDIENTE_DE_REVISION', 'La solicitud está en proceso de revisión'),
('e5b6f720-6c8d-4e9a-9f2d-7b8c9d0e1f11', 'APROBADO', 'La solicitud cumple con los requisitos y fue aceptada'),
('a3c9d812-7f4e-4b1a-8e2f-9c1d2f3e4b5a', 'REVISION_MANUAL', 'La solicitud requiere revisión manual por parte del asesor');;
