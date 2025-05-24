CREATE TABLE Estudiantes (
    IDEstudiante SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    FechaNacimiento DATE NOT NULL,
    Direccion TEXT NOT NULL,
    Ciudad VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Cursos (
    IDCurso SERIAL PRIMARY KEY,
    NombreCurso VARCHAR(100) UNIQUE NOT NULL,
    Descripcion TEXT,
    Creditos INT CHECK (Creditos > 0),
    Semestre INT NOT NULL CHECK (Semestre > 0),
    IDDepartamento INT REFERENCES Departamentos(IDDepartamento)
);

CREATE TABLE Inscripciones (
    IDInscripcion SERIAL PRIMARY KEY,
    IDEstudiante INT NOT NULL REFERENCES Estudiantes(IDEstudiante),
    IDCurso INT NOT NULL REFERENCES Cursos(IDCurso),
    FechaInscripcion DATE NOT NULL,
    Calificacion INT NOT NULL CHECK (Calificacion >= 0 AND Calificacion <= 100)
);

CREATE TABLE Profesores (
    IDProfesor SERIAL PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Titulo VARCHAR(100),
    IDDepartamento INT REFERENCES Departamentos(IDDepartamento)
);

CREATE TABLE Departamentos (
    IDDepartamento SERIAL PRIMARY KEY,
    NombreDepartamento VARCHAR(70) NOT NULL,
    Edificio VARCHAR(50)
);

CREATE TABLE Aulas (
    IDAula SERIAL PRIMARY KEY,
    NombreAula VARCHAR(50) NOT NULL,
    Capacidad INT NOT NULL CHECK (Capacidad > 0),
    Ubicacion VARCHAR(100) NOT NULL
);

CREATE TABLE Horarios (
    IDHorario SERIAL PRIMARY KEY,
    IDCurso INT NOT NULL REFERENCES Cursos(IDCurso),
    IDAula INT NOT NULL REFERENCES Aulas(IDAula),
    FechaInicio DATE NOT NULL,
    FechaFin DATE NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL
);

CREATE TABLE CursosProfesores (
    IDCursoProfesor SERIAL PRIMARY KEY,
    IDCurso INT NOT NULL REFERENCES Cursos(IDCurso),
    IDProfesor INT NOT NULL REFERENCES Profesores(IDProfesor)
);

CREATE TABLE ProgramasEstudio (
    IDPrograma SERIAL PRIMARY KEY,
    NombrePrograma VARCHAR(100) NOT NULL,
    DescripcionPrograma TEXT
);

CREATE TABLE ProgramasCursos (
    IDProgramaCurso SERIAL PRIMARY KEY,
    IDPrograma INT NOT NULL REFERENCES ProgramasEstudio(IDPrograma),
    IDCurso INT NOT NULL REFERENCES Cursos(IDCurso)
);

CREATE TABLE Campus (
    IDCampus SERIAL PRIMARY KEY,
    NombreCampus VARCHAR(100) NOT NULL,
    DireccionCampus TEXT NOT NULL
);

CREATE TABLE Carreras (
    IDCarrera SERIAL PRIMARY KEY,
    NombreCarrera VARCHAR(100) NOT NULL,
    TituloOtorgado VARCHAR(100) NOT NULL
);

CREATE TABLE EstudiantesCarreras (
    IDEstudianteCarrera SERIAL PRIMARY KEY,
    IDEstudiante INT NOT NULL REFERENCES Estudiantes(IDEstudiante),
    IDCarrera INT NOT NULL REFERENCES Carreras(IDCarrera)
);



-- Agregar columna IDCarrera a Estudiantes y establecerla como clave foránea
ALTER TABLE Estudiantes
ADD COLUMN IDCarrera INT,
ADD CONSTRAINT FkEstudiantesCarrera FOREIGN KEY (IDCarrera) REFERENCES Carreras(IDCarrera);

-- Agregar columna IDCampus a Cursos y establecerla como clave foránea
ALTER TABLE Cursos
ADD COLUMN IDCampus INT,
ADD CONSTRAINT FkCursosCampus FOREIGN KEY (IDCampus) REFERENCES Campus(IDCampus);

-- Agregar columna Email a Profesores
ALTER TABLE Profesores
ADD COLUMN Email VARCHAR(150) UNIQUE NOT NULL;

-- Eliminar columna Ciudad de Estudiantes
ALTER TABLE Estudiantes
DROP COLUMN Ciudad;

-- Eliminar tabla Aulas
DROP TABLE Horarios;
DROP TABLE Aulas;

SELECT*FROM Estudiantes
SELECT*FROM Cursos

INSERT INTO Estudiantes (Nombre, Apellido, FechaNacimiento, Direccion, Email, IDCarrera) VALUES
('Damian', 'Lugo', '2005-07-26', 'Calle 1', 'damianlugo1@gmail.com',1),
('Luis', 'Alonso', '2004-01-02', 'Calle 2', 'luisalonso@gmail.com',2),
('Donovan', 'Hernandez', '1998-06-20', 'Calle 3', 'donovanhernandez@gmail.com',3),
('Emanuel', 'Padilla', '2003-09-08', 'Calle 4', 'emanuelpadilla@gmail.com',4),
('Clara', 'Martinez', '2005-12-05', 'Calle 5', 'claramartinez@gmail.com',5),
('Erick', 'Hidekio', '2005-11-02', 'Calle 6', 'erickhidekio@gmail.com',5);


INSERT INTO Cursos (NombreCurso, Descripcion, Creditos, Semestre, IDDepartamento) VALUES
('Bases de Datos', 'Diseño y uso de bases de datos', 3, 4, 1),
('Calculo 1', 'Introducción al calculo', 4, 1, 2),
('Psicología General', 'Conceptos básicos de la psicologia', 3, 2, 3),
('Administración 1', 'Fundamentos de administración', 3, 1, 4),
('Diseño Digital', 'Herramientas de diseño gráfico digital', 4, 3, 5);


INSERT INTO Inscripciones (IDEstudiante, IDCurso, FechaInscripcion, Calificacion) VALUES
(13, 6, '2025-05-19', 90),
(14, 7, '2025-05-20', 85),
(15, 8, '2025-05-21', 92),
(16, 9, '2025-05-22', 88),
(17, 10, '2025-05-23', 95);


INSERT INTO Profesores (Nombre, Apellido, Titulo, IDDepartamento,Email) VALUES
('Carlos', 'Ramirez', 'Ing. en Ciencias Computacionales', 1,'carlosramirez@gmail.com'),
('Elena', 'Torres', 'Mtra. en Matematicas', 2,'elenatorres@gmail.com'),
('Jorge', 'Hernandez', 'Dr. en Psicologia', 3,'jorgehernandez@gmail.com'),
('Marta', 'Rios', 'Mtra. en Administracion', 4,'martarios@gmail.com'),
('Tomas', 'Perez', 'Lic. en Diseño Grafico', 5,'tomasperez@gmail.com');


INSERT INTO Departamentos (NombreDepartamento, Edificio) VALUES
('Ingenieria de Sistemas', 'Edificio A'),
('Ciencias Basicas', 'Edificio B'),
('Humanidades', 'Edificio C'),
('Administración', 'Edificio D'),
('Diseño Gráfico', 'Edificio E');


INSERT INTO CursosProfesores (IDCurso, IDProfesor) VALUES
(6, 1),
(7, 2),
(8, 3),
(9, 4),
(10, 5);


INSERT INTO ProgramasEstudio (NombrePrograma, DescripcionPrograma) VALUES
('Programa de Sistemas', 'Programa enfocado en ingenieria y tecnologias de la informacion'),
('Programa de Ciencias', 'Programa que integra diversas ciencias basicas.'),
('Programa de Psicología', 'Formacion en el campo psicologico.'),
('Programa de Administración', 'Carrera profesional en gestion y administracion.'),
('Programa de Diseño', 'Carrera en diseño visual y digital.');

INSERT INTO ProgramasCursos (IDPrograma, IDCurso) VALUES
(1, 6),
(2, 7),
(3, 8),
(4, 9),
(5, 10);



INSERT INTO Carreras (NombreCarrera, TituloOtorgado) VALUES
('Ingeniería en Sistemas', 'Ingeniero en Sistemas'),
('Matemáticas Aplicadas', 'Licenciado en Matemáticas'),
('Psicología', 'Licenciado en Psicología'),
('Administración de Empresas', 'Licenciado en Administración'),
('Diseño Gráfico', 'Licenciado en Diseño');

INSERT INTO EstudiantesCarreras (IDEstudiante, IDCarrera) VALUES
(13, 1),
(14, 2),
(15, 1),
(16, 3),
(17, 4);

SELECT * FROM Inscripciones; 
UPDATE Estudiantes
SET Email = 'damianlugo@gmail.com'
WHERE IDEstudiante = 1;

UPDATE Cursos 
SET NombreCurso = 'Calculo diferencial'
WHERE NombreCurso = 'Calculo 1';

DELETE FROM Estudiantes
WHERE IDEstudiante = 6;

--Formular y ejecutar consultas para obtener información específica de la base de datos.
--Mis propios querys 
--Obtener nombres completos de los estudiantes inscritos en el curso "Bases de Datos"
SELECT e.Nombre, e.Apellido
FROM Estudiantes e
INNER JOIN Inscripciones i ON e.IDEstudiante = i.IDEstudiante
INNER JOIN Cursos c ON i.IDCurso = c.IDCurso
WHERE c.NombreCurso = 'Bases de Datos';

-- Mostrar los cursos y el nombre del departamento al que pertenecen
SELECT c.NombreCurso, d.NombreDepartamento
FROM Cursos c
INNER JOIN Departamentos d ON c.IDDepartamento = d.IDDepartamento;



-- Muestra todos los nombres y apellidos de los estudiantes:
SELECT Nombre, Apellido
FROM Estudiantes;
-- Cláusula WHERE: Encuentra todos los cursos que tienen 3 créditos.
SELECT NombreCurso
FROM Cursos
WHERE Creditos = 3;

--INNER JOIN: Obtén una lista que muestre el nombre del estudiante y el nombre del curso en el que está inscrito.
SELECT e.Nombre, c.NombreCurso
FROM Inscripciones i
INNER JOIN Estudiantes e ON i.IDEstudiante = e.IDEstudiante
INNER JOIN Cursos c ON i.IDCurso = c.IDCurso;

--LEFT JOIN: Muestra todos los estudiantes y, si están inscritos en algún curso, el nombre del curso.
--Si un estudiante no está inscrito en ningún curso, el campo del nombre del curso debe mostrar un valor 
--que lo indique (ej: NULL).
SELECT e.Nombre, c.NombreCurso
FROM Estudiantes e
LEFT JOIN Inscripciones i ON e.IDEstudiante = i.IDEstudiante
LEFT JOIN Cursos c ON i.IDCurso = c.IDCurso;

--RIGHT JOIN: Lista todos los cursos y, si tienen estudiantes inscritos, el nombre de los estudiantes. 
--Muestra todos los cursos, incluso si no tienen estudiantes inscritos actualmente.
SELECT c.NombreCurso, e.Nombre
FROM Cursos c
RIGHT JOIN Inscripciones i ON c.IDCurso = i.IDCurso
RIGHT JOIN Estudiantes e ON i.IDEstudiante = e.IDEstudiante;

--GROUP BY y COUNT: Calcula cuántos estudiantes están inscritos en cada curso. 
--Muestra el nombre del curso y la cantidad de estudiantes.
SELECT c.NombreCurso, COUNT(i.IDEstudiante) AS CantidadEstudiantes
FROM Cursos c
LEFT JOIN Inscripciones i ON c.IDCurso = i.IDCurso
GROUP BY c.NombreCurso;

--BETWEEN: Encuentra todos los estudiantes que nacieron entre el 1 de enero de 1995 y el 31 de diciembre de 1998.
SELECT Nombre, Apellido, FechaNacimiento
FROM Estudiantes
WHERE FechaNacimiento BETWEEN '1995-01-01' AND '1998-12-31';

--ORDER BY: Muestra todos los cursos ordenados alfabéticamente por su nombre.
SELECT NombreCurso
FROM Cursos
ORDER BY NombreCurso ASC;

--CTE: Crea una tabla de expresión común que liste el número de inscripciones por estudiante. 
--Luego, consulta esta CTE para encontrar los 3 estudiantes con más inscripciones, 
--mostrando el nombre del estudiante y el número de inscripciones.
WITH InscripcionesPorEstudiante AS (
    SELECT e.IDEstudiante, e.Nombre, COUNT(i.IDInscripcion) AS TotalInscripciones
    FROM Estudiantes e
    LEFT JOIN Inscripciones i ON e.IDEstudiante = i.IDEstudiante
    GROUP BY e.IDEstudiante, e.Nombre
)
SELECT Nombre, TotalInscripciones
FROM InscripcionesPorEstudiante
ORDER BY TotalInscripciones DESC
LIMIT 3;

--Consulta Compleja 1: Para cada departamento, muestra el nombre del departamento y el 
--nombre del curso con la mayor cantidad de estudiantes inscritos.
WITH ConteoInscripciones AS (
    SELECT c.IDCurso, c.NombreCurso, d.NombreDepartamento, COUNT(i.IDEstudiante) AS TotalEstudiantes
    FROM Cursos c
    INNER JOIN Departamentos d ON c.IDDepartamento = d.IDDepartamento
    LEFT JOIN Inscripciones i ON c.IDCurso = i.IDCurso
    GROUP BY c.IDCurso, c.NombreCurso, d.NombreDepartamento
),
Maximos AS (
    SELECT NombreDepartamento, MAX(TotalEstudiantes) AS MaxEstudiantes
    FROM ConteoInscripciones
    GROUP BY NombreDepartamento
)
SELECT ci.NombreDepartamento, ci.NombreCurso, ci.TotalEstudiantes
FROM ConteoInscripciones ci
INNER JOIN Maximos m ON ci.NombreDepartamento = m.NombreDepartamento AND ci.TotalEstudiantes = m.MaxEstudiantes;

--Consulta Compleja 2: Encuentra a los profesores que imparten más de dos cursos, 
--mostrando su nombre, apellido y la cantidad de cursos que imparten.
SELECT p.Nombre, p.Apellido, c.CantidadCursos
FROM Profesores p
INNER JOIN (
    SELECT IDProfesor, COUNT(*) AS CantidadCursos
    FROM CursosProfesores
    GROUP BY IDProfesor
) c ON p.IDProfesor = c.IDProfesor
WHERE c.CantidadCursos > 2;

--Consulta Compleja 3: Lista los nombres de los programas de estudio y, para cada programa, 
--el nombre del curso con el promedio de calificación más alto.
WITH Promedios AS (
    SELECT pe.IDPrograma, pe.NombrePrograma, c.IDCurso, c.NombreCurso, AVG(i.Calificacion) AS Promedio
    FROM ProgramasEstudio pe
    INNER JOIN ProgramasCursos pc ON pe.IDPrograma = pc.IDPrograma
    INNER JOIN Cursos c ON pc.IDCurso = c.IDCurso
    LEFT JOIN Inscripciones i ON c.IDCurso = i.IDCurso
    GROUP BY pe.IDPrograma, pe.NombrePrograma, c.IDCurso, c.NombreCurso
),
Maximos AS (
    SELECT IDPrograma, MAX(Promedio) AS MaxPromedio
    FROM Promedios
    GROUP BY IDPrograma
)
SELECT p.NombrePrograma, p.NombreCurso, p.Promedio
FROM Promedios p
INNER JOIN Maximos m ON p.IDPrograma = m.IDPrograma AND p.Promedio = m.MaxPromedio;