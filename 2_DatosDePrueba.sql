SET NOCOUNT ON;
SET QUOTED_IDENTIFIER ON;
SET ANSI_NULLS ON;
GO

USE Workly;
GO

INSERT INTO dbo.Pais (Nombre, Codigo_ISO, Codigo_Telefono)
SELECT N'Argentina', 'ar', N'+54'
WHERE NOT EXISTS (SELECT 1 FROM dbo.Pais WHERE Nombre = N'Argentina');

INSERT INTO dbo.Provincia (IDPais, Nombre)
SELECT p.ID, x.Nombre
FROM (VALUES
    (N'Buenos Aires'), (N'Catamarca'), (N'Chaco'), (N'Chubut'), (N'Ciudad Autónoma de Buenos Aires'),
    (N'Córdoba'), (N'Corrientes'), (N'Entre Ríos'), (N'Formosa'), (N'Jujuy'), (N'La Pampa'),
    (N'La Rioja'), (N'Mendoza'), (N'Misiones'), (N'Neuquén'), (N'Río Negro'), (N'Salta'),
    (N'San Juan'), (N'San Luis'), (N'Santa Cruz'), (N'Santa Fe'), (N'Santiago del Estero'),
    (N'Tierra del Fuego'), (N'Tucumán')
) AS x (Nombre)
JOIN dbo.Pais AS p ON p.Nombre = N'Argentina'
WHERE NOT EXISTS (SELECT 1 FROM dbo.Provincia AS pr WHERE pr.IDPais = p.ID AND pr.Nombre = x.Nombre);

INSERT INTO dbo.Sector (Nombre, Orden)
SELECT x.Nombre, x.Orden
FROM (VALUES
    (N'Habilidades generales', 1),
    (N'Tecnología y sistemas', 2),
    (N'Datos y análisis', 3),
    (N'Administración y finanzas', 4),
    (N'Ventas y atención al cliente', 5),
    (N'Marketing y comunicación', 6),
    (N'Diseño', 7),
    (N'Logística y operaciones', 8),
    (N'Gastronomía y hotelería', 9),
    (N'Salud', 10),
    (N'Educación', 11),
    (N'Construcción y oficios', 12),
    (N'Recursos humanos', 13)
) AS x (Nombre, Orden)
WHERE NOT EXISTS (SELECT 1 FROM dbo.Sector AS s WHERE s.Nombre = x.Nombre);

DECLARE @Catalogo TABLE (Sector NVARCHAR(60), Nombre NVARCHAR(60));
INSERT INTO @Catalogo (Sector, Nombre) VALUES
    (N'Habilidades generales', N'Comunicación'),
    (N'Habilidades generales', N'Trabajo en equipo'),
    (N'Habilidades generales', N'Liderazgo'),
    (N'Habilidades generales', N'Organización'),
    (N'Habilidades generales', N'Resolución de problemas'),
    (N'Habilidades generales', N'Gestión de proyectos'),
    (N'Habilidades generales', N'Gestión del tiempo'),
    (N'Habilidades generales', N'Adaptabilidad'),
    (N'Habilidades generales', N'Pensamiento crítico'),
    (N'Habilidades generales', N'Atención al detalle'),
    (N'Tecnología y sistemas', N'Programación'),
    (N'Tecnología y sistemas', N'HTML'),
    (N'Tecnología y sistemas', N'CSS'),
    (N'Tecnología y sistemas', N'JavaScript'),
    (N'Tecnología y sistemas', N'TypeScript'),
    (N'Tecnología y sistemas', N'React'),
    (N'Tecnología y sistemas', N'C#'),
    (N'Tecnología y sistemas', N'.NET'),
    (N'Tecnología y sistemas', N'Java'),
    (N'Tecnología y sistemas', N'Python'),
    (N'Tecnología y sistemas', N'SQL'),
    (N'Tecnología y sistemas', N'Git'),
    (N'Tecnología y sistemas', N'Soporte técnico'),
    (N'Tecnología y sistemas', N'Redes informáticas'),
    (N'Tecnología y sistemas', N'Ciberseguridad'),
    (N'Tecnología y sistemas', N'Testing de software'),
    (N'Datos y análisis', N'Análisis de datos'),
    (N'Datos y análisis', N'Power BI'),
    (N'Datos y análisis', N'Tableau'),
    (N'Datos y análisis', N'Estadística'),
    (N'Datos y análisis', N'Machine learning'),
    (N'Datos y análisis', N'Excel avanzado'),
    (N'Administración y finanzas', N'Administración'),
    (N'Administración y finanzas', N'Contabilidad'),
    (N'Administración y finanzas', N'Excel'),
    (N'Administración y finanzas', N'Microsoft Office'),
    (N'Administración y finanzas', N'Google Workspace'),
    (N'Administración y finanzas', N'Facturación'),
    (N'Administración y finanzas', N'Liquidación de sueldos'),
    (N'Administración y finanzas', N'Tesorería'),
    (N'Administración y finanzas', N'Impuestos'),
    (N'Administración y finanzas', N'Cuentas a pagar y cobrar'),
    (N'Ventas y atención al cliente', N'Ventas'),
    (N'Ventas y atención al cliente', N'Atención al cliente'),
    (N'Ventas y atención al cliente', N'Negociación'),
    (N'Ventas y atención al cliente', N'Venta telefónica'),
    (N'Ventas y atención al cliente', N'Caja'),
    (N'Ventas y atención al cliente', N'Postventa'),
    (N'Ventas y atención al cliente', N'Manejo de CRM'),
    (N'Marketing y comunicación', N'Marketing digital'),
    (N'Marketing y comunicación', N'Redes sociales'),
    (N'Marketing y comunicación', N'Redacción'),
    (N'Marketing y comunicación', N'SEO'),
    (N'Marketing y comunicación', N'Publicidad'),
    (N'Marketing y comunicación', N'Comunicación institucional'),
    (N'Marketing y comunicación', N'Fotografía'),
    (N'Diseño', N'Diseño gráfico'),
    (N'Diseño', N'Figma'),
    (N'Diseño', N'Photoshop'),
    (N'Diseño', N'Illustrator'),
    (N'Diseño', N'Diseño UX/UI'),
    (N'Diseño', N'Edición de video'),
    (N'Logística y operaciones', N'Logística'),
    (N'Logística y operaciones', N'Manejo de stock'),
    (N'Logística y operaciones', N'Depósito'),
    (N'Logística y operaciones', N'Compras'),
    (N'Logística y operaciones', N'Comercio exterior'),
    (N'Logística y operaciones', N'Manejo de autoelevador'),
    (N'Logística y operaciones', N'Distribución'),
    (N'Gastronomía y hotelería', N'Cocina'),
    (N'Gastronomía y hotelería', N'Atención en salón'),
    (N'Gastronomía y hotelería', N'Barista'),
    (N'Gastronomía y hotelería', N'Pastelería'),
    (N'Gastronomía y hotelería', N'Manipulación de alimentos'),
    (N'Gastronomía y hotelería', N'Recepción hotelera'),
    (N'Gastronomía y hotelería', N'Housekeeping'),
    (N'Salud', N'Enfermería'),
    (N'Salud', N'Primeros auxilios'),
    (N'Salud', N'Cuidado de adultos mayores'),
    (N'Salud', N'Atención en farmacia'),
    (N'Salud', N'Administración de turnos médicos'),
    (N'Educación', N'Docencia'),
    (N'Educación', N'Clases particulares'),
    (N'Educación', N'Planificación educativa'),
    (N'Educación', N'Acompañamiento terapéutico'),
    (N'Educación', N'Cuidado de niños'),
    (N'Construcción y oficios', N'Electricidad'),
    (N'Construcción y oficios', N'Plomería'),
    (N'Construcción y oficios', N'Albañilería'),
    (N'Construcción y oficios', N'Carpintería'),
    (N'Construcción y oficios', N'Pintura'),
    (N'Construcción y oficios', N'Soldadura'),
    (N'Construcción y oficios', N'Mecánica'),
    (N'Construcción y oficios', N'Lectura de planos'),
    (N'Recursos humanos', N'Recursos humanos'),
    (N'Recursos humanos', N'Selección de personal'),
    (N'Recursos humanos', N'Capacitación'),
    (N'Recursos humanos', N'Relaciones laborales'),
    (N'Recursos humanos', N'Administración de personal');

UPDATE h SET IDSector = s.ID
FROM dbo.Habilidad AS h
JOIN @Catalogo AS c ON c.Nombre = h.Nombre
JOIN dbo.Sector AS s ON s.Nombre = c.Sector
WHERE h.IDSector IS NULL OR h.IDSector <> s.ID;

INSERT INTO dbo.Habilidad (Nombre, IDSector)
SELECT c.Nombre, s.ID
FROM @Catalogo AS c
JOIN dbo.Sector AS s ON s.Nombre = c.Sector
WHERE NOT EXISTS (SELECT 1 FROM dbo.Habilidad AS h WHERE h.Nombre = c.Nombre);

DELETE h FROM dbo.Habilidad AS h
WHERE h.IDSector IS NULL AND NOT EXISTS (SELECT 1 FROM dbo.UsuarioHabilidad AS uh WHERE uh.IDHabilidad = h.ID);

INSERT INTO dbo.Idioma (Nombre)
SELECT x.Nombre
FROM (VALUES
    (N'Español'), (N'Inglés'), (N'Portugués'), (N'Francés'), (N'Italiano'), (N'Alemán'),
    (N'Chino mandarín'), (N'Japonés'), (N'Lengua de señas argentina')
) AS x (Nombre)
WHERE NOT EXISTS (SELECT 1 FROM dbo.Idioma AS i WHERE i.Nombre = x.Nombre);
GO

IF NOT EXISTS (SELECT 1 FROM dbo.Usuario WHERE Email = N'50291929@est.ort.edu.ar')
BEGIN
    INSERT INTO dbo.Usuario (Nombre, Apellido, Email, [Contraseña], Tipo, Es_Moderador)
    VALUES (N'Teo', N'Moreno', N'50291929@est.ort.edu.ar',
            N'PBKDF2$600000$5PeX0WMGc2StUFT8LB6ytQ==$bp2ZHrIULGDmEzGP+cwo8mLhDEHzqmbNUIJe8GM19lE=',
            N'Persona', 1);
    INSERT INTO dbo.Perfil (IDUsuario) VALUES (SCOPE_IDENTITY());
END
ELSE
    UPDATE dbo.Usuario SET Es_Moderador = 1 WHERE Email = N'50291929@est.ort.edu.ar';
GO

SELECT t.name AS Tabla, SUM(p.rows) AS Filas
FROM sys.tables AS t
JOIN sys.partitions AS p ON p.object_id = t.object_id AND p.index_id IN (0, 1)
GROUP BY t.name
ORDER BY t.name;
GO
