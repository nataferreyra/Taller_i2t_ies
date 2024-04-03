CREATE DATABASE IF NOT EXISTS DBTaller;
USE DBTaller;

CREATE TABLE IF NOT EXISTS Usuario (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    mail VARCHAR(50) NOT NULL UNIQUE,
    contrasenia VARCHAR(30) NOT NULL,
    fecha_baja DATETIME
);

CREATE TABLE IF NOT EXISTS Competencia (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    estado SMALLINT NOT NULL,
    fecha_baja DATETIME,
    fecha_inicio DATETIME NOT NULL,
    fecha_creacion DATETIME NOT NULL,
    id_usuario INTEGER NOT NULL,
    CONSTRAINT fk1_Competencia_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
);

CREATE TABLE IF NOT EXISTS Participante (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    colores VARCHAR(100),
    trofeos VARCHAR(500),
    fecha_baja DATETIME
);

CREATE TABLE IF NOT EXISTS Partido(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_local INTEGER NOT NULL,
    id_visitante INTEGER NOT NULL,
    id_competencia INTEGER NOT NULL,
    goles_local INTEGER NOT NULL DEFAULT 0,
    goles_visitante INTEGER NOT NULL DEFAULT 0,
    fecha_realizacion DATETIME NOT NULL,
    fecha_baja DATETIME,
    CONSTRAINT fk1_Partido_ParticipanteLocal FOREIGN KEY (id_local) REFERENCES Participante(id),
    CONSTRAINT fk2_Partido_ParticipanteVisitante FOREIGN KEY (id_visitante) REFERENCES Participante(id),
    CONSTRAINT fk3_Competencia_Partido FOREIGN KEY (id_competencia) REFERENCES Competencia(id),
    CONSTRAINT check_id_local_distinct_id_visitante CHECK (id_local <> id_visitante)
);

CREATE TABLE IF NOT EXISTS Clasificacion(
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    id_competidor INTEGER NOT NULL,
    id_competencia INTEGER NOT NULL,
    nro_ganados INTEGER NOT NULL DEFAULT 0,
    nro_empatados INTEGER NOT NULL DEFAULT 0,
    nro_perdidos INTEGER NOT NULL DEFAULT 0,
    fecha_baja DATETIME,
    CONSTRAINT fk1_Clasificacion_participante FOREIGN KEY (id_competidor) REFERENCES Participante(id),
    CONSTRAINT fk1_Clasificacion_competencia FOREIGN KEY (id_competencia) REFERENCES Competencia(id)
);

-- Datos para la tabla Usuario
INSERT INTO Usuario (nombre, apellido, mail, contrasenia) VALUES
('Juan', 'Perez', 'juan.perez@mail.com', 'juan123'),
('Maria', 'Gomez', 'maria.gomez@mail.com', 'maria123'),
('Carlos', 'Rodriguez', 'carlos.rodriguez@mail.com', 'carlos123'),
('Ana', 'Lopez', 'ana.lopez@mail.com', 'ana123'),
('Pedro', 'Gonzalez', 'pedro.gonzalez@mail.com', 'pedro123'),
('Laura', 'Martinez', 'laura.martinez@mail.com', 'laura123'),
('Jose', 'Hernandez', 'jose.hernandez@mail.com', 'jose123'),
('Carmen', 'Torres', 'carmen.torres@mail.com', 'carmen123'),
('Manuel', 'Ramirez', 'manuel.ramirez@mail.com', 'manuel123'),
('Sofia', 'Morales', 'sofia.morales@mail.com', 'sofia123');

-- Datos para la tabla Competencia
INSERT INTO Competencia (nombre, estado, fecha_inicio, fecha_creacion, id_usuario) VALUES
('Competencia 1', 1, '2024-01-01', '2024-01-01', 1),
('Competencia 2', 1, '2024-02-01', '2024-01-15', 2),
('Competencia 3', 1, '2024-03-01', '2024-02-15', 3),
('Competencia 4', 1, '2024-04-01', '2024-03-15', 4),
('Competencia 5', 1, '2024-05-01', '2024-04-15', 5),
('Competencia 6', 1, '2024-06-01', '2024-05-15', 6),
('Competencia 7', 1, '2024-07-01', '2024-06-15', 7),
('Competencia 8', 1, '2024-08-01', '2024-07-15', 8),
('Competencia 9', 1, '2024-09-01', '2024-08-15', 9),
('Competencia 10', 1, '2024-10-01', '2024-09-15', 10);

-- Datos para la tabla Participante
INSERT INTO Participante (nombre, colores, trofeos) VALUES
('Participante 1', 'Rojo y blanco', 'Trofeo 1, Trofeo 2'),
('Participante 2', 'Azul y blanco', 'Trofeo 3'),
('Participante 3', 'Verde y blanco', 'Trofeo 4, Trofeo 5, Trofeo 6'),
('Participante 4', 'Amarillo y negro', 'Trofeo 7'),
('Participante 5', 'Negro y blanco', 'Trofeo 8, Trofeo 9'),
('Participante 6', 'Azul y amarillo', 'Trofeo 10'),
('Participante 7', 'Rojo y negro', 'Trofeo 11, Trofeo 12'),
('Participante 8', 'Verde y amarillo', 'Trofeo 13'),
('Participante 9', 'Azul y rojo', 'Trofeo 14, Trofeo 15, Trofeo 16'),
('Participante 10', 'Amarillo y blanco', 'Trofeo 17');

-- Datos para la tabla Partido
INSERT INTO Partido (id_local, id_visitante, id_competencia, goles_local, goles_visitante, fecha_realizacion) VALUES
(1, 2, 1, 3, 1, '2024-01-01 15:00:00'),
(3, 4, 2, 2, 2, '2024-02-01 15:00:00'),
(5, 6, 3, 1, 0, '2024-03-01 15:00:00'),
(7, 8, 4, 0, 3, '2024-04-01 15:00:00'),
(9, 10, 5, 2, 1, '2024-05-01 15:00:00'),
(1, 3, 6, 1, 1, '2024-06-01 15:00:00'),
(2, 4, 7, 0, 0, '2024-07-01 15:00:00'),
(5, 7, 8, 3, 2, '2024-08-01 15:00:00'),
(6, 8, 9, 2, 3, '2024-09-01 15:00:00'),
(9, 1, 10, 1, 2, '2024-10-01 15:00:00');

-- Datos para la tabla Clasificacion
INSERT INTO Clasificacion (id_competidor, id_competencia, nro_ganados, nro_empatados, nro_perdidos) VALUES
(1, 1, 3, 2, 1),
(2, 2, 2, 3, 1),
(3, 3, 1, 4, 1),
(4, 4, 0, 5, 1),
(5, 5, 3, 1, 2),
(6, 6, 2, 2, 2),
(7, 7, 1, 3, 2),
(8, 8, 0, 4, 2),
(9, 9, 3, 0, 3),
(10, 10, 2, 1, 3);
