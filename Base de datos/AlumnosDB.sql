USE [Alumnos]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Materias]') AND type in (N'U'))
ALTER TABLE [dbo].[Materias] DROP CONSTRAINT IF EXISTS [FK_Materias_Carrera_FkCarreraId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Carreras]') AND type in (N'U'))
ALTER TABLE [dbo].[Carreras] DROP CONSTRAINT IF EXISTS [FK_Carreras_Facultades_FkFacultadId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asignaturas]') AND type in (N'U'))
ALTER TABLE [dbo].[Asignaturas] DROP CONSTRAINT IF EXISTS [FK_Asignaturas_Notas_FkNotaId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asignaturas]') AND type in (N'U'))
ALTER TABLE [dbo].[Asignaturas] DROP CONSTRAINT IF EXISTS [FK_Asignaturas_Materias_FkMateriaId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Asignaturas]') AND type in (N'U'))
ALTER TABLE [dbo].[Asignaturas] DROP CONSTRAINT IF EXISTS [FK_Asignaturas_Alumnos_FkAlumnoId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alumnos]') AND type in (N'U'))
ALTER TABLE [dbo].[Alumnos] DROP CONSTRAINT IF EXISTS [FK_Alumnos_Carreras_FkCarreraId]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Alumnos]') AND type in (N'U'))
ALTER TABLE [dbo].[Alumnos] DROP CONSTRAINT IF EXISTS [FK_Alumnos_Alumnos]
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 25/11/2020 14:33:19 ******/
DROP TABLE IF EXISTS [dbo].[Notas]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 25/11/2020 14:33:19 ******/
DROP TABLE IF EXISTS [dbo].[Materias]
GO
/****** Object:  Table [dbo].[Facultades]    Script Date: 25/11/2020 14:33:19 ******/
DROP TABLE IF EXISTS [dbo].[Facultades]
GO
/****** Object:  Table [dbo].[Carreras]    Script Date: 25/11/2020 14:33:19 ******/
DROP TABLE IF EXISTS [dbo].[Carreras]
GO
/****** Object:  Table [dbo].[Asignaturas]    Script Date: 25/11/2020 14:33:19 ******/
DROP TABLE IF EXISTS [dbo].[Asignaturas]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 25/11/2020 14:33:19 ******/
DROP TABLE IF EXISTS [dbo].[Alumnos]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 25/11/2020 14:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[IdAlumno] [int] IDENTITY(1,1) NOT NULL,
	[FkCarreraId] [int] NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
	[Apellido] [nvarchar](50) NOT NULL,
	[Edad] [tinyint] NOT NULL,
	[DNI] [int] NOT NULL,
	[FkAsignaturaId] [int] NULL,
 CONSTRAINT [PK_Alumnos] PRIMARY KEY CLUSTERED 
(
	[IdAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Asignaturas]    Script Date: 25/11/2020 14:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Asignaturas](
	[IdAsignatura] [int] NOT NULL,
	[FkMateriaId] [int] NOT NULL,
	[FkNotaId] [int] NOT NULL,
	[FkAlumnoId] [int] NOT NULL,
	[Comision] [int] NOT NULL,
	[Horario] [int] NOT NULL,
 CONSTRAINT [PK_Asignaturas] PRIMARY KEY CLUSTERED 
(
	[IdAsignatura] ASC,
	[FkMateriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carreras]    Script Date: 25/11/2020 14:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carreras](
	[IdCarrera] [int] IDENTITY(1,1) NOT NULL,
	[FkFacultadId] [int] NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Titulo] [nvarchar](max) NOT NULL,
	[DuracionEstimadaAnios] [float] NOT NULL,
 CONSTRAINT [PK_Carreras] PRIMARY KEY CLUSTERED 
(
	[IdCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Facultades]    Script Date: 25/11/2020 14:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Facultades](
	[IdFacultad] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NULL,
	[Direccion] [nvarchar](max) NULL,
	[Telefono] [int] NULL,
	[DepartamentoAlumnos] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NULL,
	[Instagram] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[PaginaWeb] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[RecorridoVirtual] [nvarchar](max) NULL,
 CONSTRAINT [PK_Facultades] PRIMARY KEY CLUSTERED 
(
	[IdFacultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 25/11/2020 14:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[MateriaId] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](max) NOT NULL,
	[Codigo] [nchar](10) NULL,
	[Categoria] [nvarchar](max) NULL,
	[Horas] [smallint] NULL,
	[Correlativas] [nvarchar](50) NULL,
	[FkCarreraId] [int] NOT NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[MateriaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notas]    Script Date: 25/11/2020 14:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notas](
	[IdNotas] [int] IDENTITY(1,1) NOT NULL,
	[PrimerParcial] [float] NOT NULL,
	[PrimerRecuperatorio] [float] NOT NULL,
	[SegundoParcial] [float] NOT NULL,
	[SegundoRecuperatorio] [float] NOT NULL,
	[Final] [float] NOT NULL,
 CONSTRAINT [PK_Notas] PRIMARY KEY CLUSTERED 
(
	[IdNotas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumnos] ON 

INSERT [dbo].[Alumnos] ([IdAlumno], [FkCarreraId], [Nombre], [Apellido], [Edad], [DNI], [FkAsignaturaId]) VALUES (1, 1, N'Patricio', N'Cordoba', 28, 37035790, NULL)
SET IDENTITY_INSERT [dbo].[Alumnos] OFF
GO
INSERT [dbo].[Asignaturas] ([IdAsignatura], [FkMateriaId], [FkNotaId], [FkAlumnoId], [Comision], [Horario]) VALUES (1, 1, 1, 1, 100, 12)
GO
SET IDENTITY_INSERT [dbo].[Carreras] ON 

INSERT [dbo].[Carreras] ([IdCarrera], [FkFacultadId], [Nombre], [Titulo], [DuracionEstimadaAnios]) VALUES (1, 10, N'Ingenieria en Informatica', N'Ingeniero en Informatica', 6)
SET IDENTITY_INSERT [dbo].[Carreras] OFF
GO
SET IDENTITY_INSERT [dbo].[Facultades] ON 

INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (1, N'Agronomía', N'Av. San Martín 4453 - CABA - (cp:C1417DSE)', 45248000, NULL, N'https://www.facebook.com/facultaddeagronomia.uba', N'https://www.instagram.com/fauba_oficial/', N'https://twitter.com/fauba_oficial', N'http://www.agro.uba.ar/', N'siav@mail.agro.uba', N'http://www.uba.ar/recorridos/agronomia/agronomia_entrada.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (2, N'Arquitectura, Diseño y Urbanismo', N'Ciudad Universitaria. Nuñez -  Pabellón III - CABA - (cp:1428)', 52859200, NULL, N'https://www.facebook.com/faducomunica/', N'https://www.instagram.com/faducomunica/', N'https://twitter.com/faducomunica', N'http://www.fadu.uba.ar/', N'webmaster@fadu.uba.ar', N'http://www.uba.ar/recorridos/fadu/fadu_fachada.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (3, N'Ciencias Económicas', N'Av. Córdoba 2122. - CABA - (cp:C1120AAQ)', 52857000, N'consultas@fce.uba.ar', N'https://www.facebook.com/economicas.uba', N'https://www.instagram.com/fceuba/', N'https://twitter.com/ubaeconomicas', N'http://www.econ.uba.ar/', NULL, N'http://www.uba.ar/recorridos/economicas/economicas_fachada.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (4, N'Ciencias Exactas y Naturales', N'Ciudad Universitaria. Nuñez - Pabellón II - CABA - (cp:1428)', 45763300, N'comunicacion@de.fcen.uba.ar', N'https://www.facebook.com/UBAExactas', N'https://www.instagram.com/exactas_uba/', N'https://twitter.com/exactas_uba', N'http://www.exactas.uba.ar/', NULL, N'http://www.uba.ar/recorridos/exactas/exactas_fachada.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (5, N'Ciencias Sociales', N'Marcelo T. de Alvear 2230. - CABA -  (cp:C1122AAJ)', 52871500, N'estudiantesgrado@sociales.uba.ar', N'https://www.facebook.com/ubasocialesoficial/', N'https://www.instagram.com/socialesuba/?hl=en', N'https://twitter.com/ubasociales?', N'http://www.sociales.uba.ar/', NULL, N'http://www.uba.ar/recorridos/sociales_constitucion/sociales_fachada.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (6, N'Ciencias Veterinarias', N'Chorroarín 280.  - CABA - (C1427CWO)', 45248400, N'alumnos@fvet.uba.ar', N'https://www.facebook.com/FvetUBA', N'https://www.instagram.com/veterinariasuba/?hl=en', NULL, N'http://www.fvet.uba.ar/', NULL, N'http://www.uba.ar/recorridos/veterinaria/veterinaria_entrada.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (7, N'Derecho', N'Av. Pte. Figueroa Alcorta 2263 - CABA (C1425CKB)', 48095600, N'estudiantiles@derecho.uba.ar', N'https://www.facebook.com/DerechoUBA', N'https://www.instagram.com/fduba/', N'https://twitter.com/DerechoUBA', N'http://www.derecho.uba.ar/', NULL, N'http://www.uba.ar/recorridos/derecho/derecho_fachada.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (8, N'Farmacia y Bioquímica', N'Junín 954/6 - CABA (C1113AAD)', 52875001, N'alumnos@ffyb.uba.ar', N'https://www.facebook.com/FacultaddeFarmaciayBioquimicaUBA', N'https://www.instagram.com/ffybuba_oficial/', N'https://twitter.com/FFyB_UBA', N'http://www.ffyb.uba.ar/', NULL, N'http://www.uba.ar/recorridos/farmacia/farmacia_fachada.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (9, N'Filosofía y Letras', N'Púan 480 - CABA - (C1406CQJ)', 44320606, N'alumnos@filo.uba.ar', N'https://www.facebook.com/filosofiayletrasuba', N'https://www.instagram.com/filo.uba/', N'https://twitter.com/filo_uba', N'http://www.filo.uba.ar/', NULL, N'http://www.uba.ar/recorridos/filosofia/filosofia_puan_fachada.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (10, N'Ingeniería', N'Av. Paseo Colón 850 CABA (C1063ACV)', 43430893, N'comuniv@fi.uba.ar', N'https://www.facebook.com/ingenieriauba', N'https://www.instagram.com/ingenieriauba/', N'https://twitter.com/ingenieriauba', N'http://www.ingenieria.uba.ar/', NULL, N'http://www.uba.ar/recorridos/ingenieria_paseo_colon/ingenieria_columnas.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (11, N'Medicina', N'Paraguay 2155 - CABA (C1121ABG)', 59509500, N'diralumnos@fmed.uba.ar', N'https://www.facebook.com/Medicina-UBA-155385487867667', NULL, N'https://twitter.com/UBAMedicina', N'http://www.fmed.uba.ar/', NULL, N'http://www.uba.ar/recorridos/medicina/medicina_fachada.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (12, N'Odontología', N'Marcelo T de Alvear 2142 - CABA (C1122AAH)', 52876000, NULL, N'https://www.facebook.com/OdontoUBA', N'https://www.instagram.com/odontouba/?hl=es-la', N'https://twitter.com/odontoUBA', N'http://www.odontologia.uba.ar/', N'info@odontologia.uba.ar', N'http://www.uba.ar/recorridos/odontologia/odontologia_fachada.html')
INSERT [dbo].[Facultades] ([IdFacultad], [Nombre], [Direccion], [Telefono], [DepartamentoAlumnos], [Facebook], [Instagram], [Twitter], [PaginaWeb], [Email], [RecorridoVirtual]) VALUES (13, N'Psicología', N'Hipólito Yrigoyen 3242 - CABA(C1207ABQ)', 49316900, N'diralu@psi.uba.ar', N'https://www.facebook.com/uba.psi/', N'https://www.instagram.com/uba.psicologia/', N'https://twitter.com/UBAPsicologia/', N'http://www.psi.uba.ar/', NULL, N'http://www.uba.ar/recorridos/psicologia_yrigoyen/psicologia_fachada.html')
SET IDENTITY_INSERT [dbo].[Facultades] OFF
GO
SET IDENTITY_INSERT [dbo].[Materias] ON 

INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (1, N'Análisis Matemático II A', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (2, N'Física I A', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (4, N'Algoritmos y Programación I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (5, N'Álgebra II A', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (6, N'Física II A', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (7, N'Química', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (8, N'Algoritmos y Programación II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (9, N'Física III D', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (10, N'Laboratorio', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (11, N'Estructura del Computador', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (12, N'Algoritmos y Programación III', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (13, N'Análisis Numérico I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (14, N'Probabilidad y Estadística B', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (15, N'Análisis Matemático III A', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (16, N'Organización de Computadoras', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (17, N'Organización de Datos', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (18, N'Taller de Programación I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (19, N'Estructura de las Organizaciones', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (20, N'Modelos y Optimización I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (21, N'Sistemas Operativos', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (22, N'Análisis de la Información', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (23, N'Técnicas de Diseño', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (24, N'Base de Datos', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (25, N'Introducción a los Sistemas Distribuidos', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (26, N'Taller de Programación II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (27, N'Información en las Organizaciones', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (29, N'Administración y Control de Proyectos Informáticos I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (30, N'Taller de Desarrollo de Proyectos I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (31, N'Administración y Control de Proyectos Informáticos II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (32, N'Taller de Desarrollo de Proyectos II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (33, N'Calidad en Desarrollo de Sistemas', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (34, N'Legislación y Ejercicio Profesional de la Ingeniería en Informática', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (35, N'Tesis', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (36, N'Trabajo Profesional', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (37, N'Análisis de Circuitos', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (38, N'Técnicas de Programación Concurrente I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (39, N'Señales y Sistemas', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (40, N'Sistemas Distribuidos I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (41, N'Legislación y Ejercicio Profesional de la Ingeniería en Informática', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (42, N'Taller de Programación III', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (43, N'Estática y Resistencia de Materiales B', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (44, N'Manufactura Integrada por Computadora (CIM) I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (45, N'Sistemas Automáticos de Diagnóstico y Detección Fallas I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (46, N'Materiales Industriales I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (47, N'Manufactura Integrada por Computadora (CIM) II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (48, N'Sistemas de Soporte para Celdas Producción Flexible', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (49, N'Matemática Discreta', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (50, N'Ecuaciones Diferenciales Ordinarias', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (51, N'Análisis Funcional', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (52, N'Mecánica Racional', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (53, N'Circuitos Electrónicos I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (54, N'Laboratorio de Microcomputadoras', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (55, N'Sistemas Digitales', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (56, N'Teoría de Control I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (57, N'Circuitos de Pulsos', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (58, N'Teoría de la Información y Codificación', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (59, N'Arquitecturas Paralelas', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (60, N'Robótica', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (61, N'Técnica Digital Avanzada', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (62, N'Procesamiento del Habla', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (63, N'Procesamiento de Imágenes', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (64, N'Sistemas Biológicos', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (65, N'Simulación de Sistemas de Control', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (66, N'Redes Neuronales', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (67, N'Criptografía y Seguridad Informática', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (68, N'Sistemas Gráficos', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (69, N'Señales y Sistemas', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (70, N'Procesos Estocásticos', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (71, N'Fundamentos Matemáticos de la Visión en Robótica', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (72, N'Modelos y Optimización II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (73, N'Estructura Económica Argentina', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (74, N'Modelos y Optimización III', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (75, N'Análisis y Resolución de Problemas', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (76, N'Circuitos de Información en la Empresa', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (77, N'Recursos Humanos', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (78, N'Ingeniería Económica', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (79, N'Lenguajes Formales', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (80, N'Lenguajes de Programación', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (81, N'Simulación', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (82, N'Teoría de Algoritmos I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (83, N'Teoría de Algoritmos II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (84, N'Teoría de Lenguaje', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (85, N'Análisis Numérico II A', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (86, N'Introducción a los Sistemas Inteligentes', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (87, N'Técnicas de Producción de Software I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (88, N'Técnicas de Producción de Software II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (89, N'Técnicas de Producción de Software III', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (90, N'Taller de Desarrollo de Proyectos III', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (91, N'Organización de la Implantación y el Mantenimiento', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (92, N'Modelos de Proceso de Desarrollo', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (93, N'Evaluación de Proyectos y Manejo de Riesgos', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (94, N'Técnicas de Programación Concurrente II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (95, N'Sistemas Distribuidos II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (96, N'Sistemas Multimediales', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (97, N'Sistemas Automáticos de Diagnóstico y Detección Fallas II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (98, N'Sistemas de Programación no convencional de Robots', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (99, N'Seminario de Ingeniería en Informática I', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (100, N'Seminario de Ingeniería en Informática II', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (101, N'Arquitectura de Software', NULL, NULL, NULL, NULL, 1)
GO
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (102, N'Idioma Inglés', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (103, N'Idioma Alemán', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (104, N'Idioma Francés', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (105, N'Idioma Italiano', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Materias] ([MateriaId], [Nombre], [Codigo], [Categoria], [Horas], [Correlativas], [FkCarreraId]) VALUES (106, N'Idioma Portugués', NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Materias] OFF
GO
SET IDENTITY_INSERT [dbo].[Notas] ON 

INSERT [dbo].[Notas] ([IdNotas], [PrimerParcial], [PrimerRecuperatorio], [SegundoParcial], [SegundoRecuperatorio], [Final]) VALUES (1, 1, 1, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Notas] OFF
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD  CONSTRAINT [FK_Alumnos_Alumnos] FOREIGN KEY([IdAlumno])
REFERENCES [dbo].[Alumnos] ([IdAlumno])
GO
ALTER TABLE [dbo].[Alumnos] CHECK CONSTRAINT [FK_Alumnos_Alumnos]
GO
ALTER TABLE [dbo].[Alumnos]  WITH CHECK ADD  CONSTRAINT [FK_Alumnos_Carreras_FkCarreraId] FOREIGN KEY([FkCarreraId])
REFERENCES [dbo].[Carreras] ([IdCarrera])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Alumnos] CHECK CONSTRAINT [FK_Alumnos_Carreras_FkCarreraId]
GO
ALTER TABLE [dbo].[Asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_Asignaturas_Alumnos_FkAlumnoId] FOREIGN KEY([FkAlumnoId])
REFERENCES [dbo].[Alumnos] ([IdAlumno])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Asignaturas] CHECK CONSTRAINT [FK_Asignaturas_Alumnos_FkAlumnoId]
GO
ALTER TABLE [dbo].[Asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_Asignaturas_Materias_FkMateriaId] FOREIGN KEY([FkMateriaId])
REFERENCES [dbo].[Materias] ([MateriaId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Asignaturas] CHECK CONSTRAINT [FK_Asignaturas_Materias_FkMateriaId]
GO
ALTER TABLE [dbo].[Asignaturas]  WITH CHECK ADD  CONSTRAINT [FK_Asignaturas_Notas_FkNotaId] FOREIGN KEY([FkNotaId])
REFERENCES [dbo].[Notas] ([IdNotas])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Asignaturas] CHECK CONSTRAINT [FK_Asignaturas_Notas_FkNotaId]
GO
ALTER TABLE [dbo].[Carreras]  WITH CHECK ADD  CONSTRAINT [FK_Carreras_Facultades_FkFacultadId] FOREIGN KEY([FkFacultadId])
REFERENCES [dbo].[Facultades] ([IdFacultad])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Carreras] CHECK CONSTRAINT [FK_Carreras_Facultades_FkFacultadId]
GO
ALTER TABLE [dbo].[Materias]  WITH CHECK ADD  CONSTRAINT [FK_Materias_Carrera_FkCarreraId] FOREIGN KEY([FkCarreraId])
REFERENCES [dbo].[Carreras] ([IdCarrera])
GO
ALTER TABLE [dbo].[Materias] CHECK CONSTRAINT [FK_Materias_Carrera_FkCarreraId]
GO
