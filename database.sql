-- Seleccionar la base de datos
USE torneos_app;

-- TABLAS

-- Tabla de TORNEOS
CREATE TABLE torneos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

-- Tabla de EQUIPOS
CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ciudad VARCHAR(100) NOT NULL
);

-- Tabla de JUGADORES
CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    posicion VARCHAR(50),
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES equipos(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- Tabla de PARTIDOS
CREATE TABLE partidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    torneo_id INT NOT NULL,
    equipoA_id INT NOT NULL,
    equipoB_id INT NOT NULL,
    fecha DATETIME NOT NULL,
    resultado VARCHAR(20),
    FOREIGN KEY (torneo_id) REFERENCES torneos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (equipoA_id) REFERENCES equipos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (equipoB_id) REFERENCES equipos(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- DATOS DE PRUEBA

-- Insertar torneos
INSERT INTO torneos (nombre, fecha_inicio, fecha_fin) VALUES
('Copa Primavera', '2025-03-01', '2025-03-31'),
('Liga Municipal', '2025-04-10', '2025-06-20'),
('Torneo Relámpago', '2025-02-15', '2025-02-28');

-- Insertar equipos
INSERT INTO equipos (nombre, ciudad) VALUES
('Tigres FC', 'Madrid'),
('Leones Amarillos', 'Barcelona'),
('Rayo Norte', 'Valencia'),
('Águilas del Sur', 'Sevilla');

-- Insertar jugadores
INSERT INTO jugadores (nombre, posicion, equipo_id) VALUES
('Carlos Pérez', 'Delantero', 1),
('Manuel Ruiz', 'Portero', 1),
('Javier Torres', 'Centrocampista', 2),
('Dani Gómez', 'Defensa', 3),
('Iván López', 'Delantero', 4);

-- Insertar partidos
INSERT INTO partidos (torneo_id, equipoA_id, equipoB_id, fecha, resultado) VALUES
(1, 1, 2, '2025-03-05 18:00:00', '2-1'),
(1, 3, 4, '2025-03-07 20:00:00', '0-0'),
(2, 1, 3, '2025-04-15 17:30:00', '1-3'),
(2, 2, 4, '2025-04-20 19:00:00', '2-2'),
(3, 4, 1, '2025-02-18 16:00:00', '1-0');
