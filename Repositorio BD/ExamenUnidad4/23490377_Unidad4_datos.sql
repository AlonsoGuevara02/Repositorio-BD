--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: campus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.campus (idcampus, nombrecampus, direccioncampus) FROM stdin;
\.


--
-- Data for Name: carreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carreras (idcarrera, nombrecarrera, titulootorgado) FROM stdin;
1	Ingeniería en Sistemas	Ingeniero en Sistemas
2	Matemáticas Aplicadas	Licenciado en Matemáticas
3	Psicología	Licenciado en Psicología
4	Administración de Empresas	Licenciado en Administración
5	Diseño Gráfico	Licenciado en Diseño
6	Ingeniería en Sistemas	Ingeniero en Sistemas
7	Matemáticas Aplicadas	Licenciado en Matemáticas
8	Psicología	Licenciado en Psicología
9	Administración de Empresas	Licenciado en Administración
10	Diseño Gráfico	Licenciado en Diseño
\.


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (iddepartamento, nombredepartamento, edificio) FROM stdin;
1	Ingenieria de Sistemas	Edificio A
2	Ciencias Basicas	Edificio B
3	Humanidades	Edificio C
4	Administración	Edificio D
5	Diseño Gráfico	Edificio E
6	Ingenieria de Sistemas	Edificio A
7	Ciencias Basicas	Edificio B
8	Humanidades	Edificio C
9	Administración	Edificio D
10	Diseño Gráfico	Edificio E
\.


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (idcurso, nombrecurso, descripcion, creditos, semestre, iddepartamento, idcampus) FROM stdin;
6	Bases de Datos	Diseño y uso de bases de datos	3	4	1	\N
8	Psicología General	Conceptos básicos de la psicologia	3	2	3	\N
9	Administración 1	Fundamentos de administración	3	1	4	\N
10	Diseño Digital	Herramientas de diseño gráfico digital	4	3	5	\N
7	Calculo diferencial	Introducción al calculo	4	1	2	\N
\.


--
-- Data for Name: profesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profesores (idprofesor, nombre, apellido, titulo, iddepartamento, email) FROM stdin;
1	Carlos	Ramirez	Ing. en Ciencias Computacionales	1	carlosramirez@gmail.com
2	Elena	Torres	Mtra. en Matematicas	2	elenatorres@gmail.com
3	Jorge	Hernandez	Dr. en Psicologia	3	jorgehernandez@gmail.com
4	Marta	Rios	Mtra. en Administracion	4	martarios@gmail.com
5	Tomas	Perez	Lic. en Diseño Grafico	5	tomasperez@gmail.com
\.


--
-- Data for Name: cursosprofesores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursosprofesores (idcursoprofesor, idcurso, idprofesor) FROM stdin;
6	6	1
7	7	2
8	8	3
9	9	4
10	10	5
\.


--
-- Data for Name: estudiantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantes (idestudiante, nombre, apellido, fechanacimiento, direccion, email, idcarrera) FROM stdin;
13	Damian	Lugo	2005-07-26	Calle 1	damianlugo1@gmail.com	1
14	Luis	Alonso	2004-01-02	Calle 2	luisalonso@gmail.com	2
15	Donovan	Hernandez	1998-06-20	Calle 3	donovanhernandez@gmail.com	3
16	Emanuel	Padilla	2003-09-08	Calle 4	emanuelpadilla@gmail.com	4
17	Clara	Martinez	2005-12-05	Calle 5	claramartinez@gmail.com	5
18	Erick	Hidekio	2005-11-02	Calle 6	erickhidekio@gmail.com	5
\.


--
-- Data for Name: estudiantescarreras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.estudiantescarreras (idestudiantecarrera, idestudiante, idcarrera) FROM stdin;
6	13	1
7	14	2
8	15	1
9	16	3
10	17	4
\.


--
-- Data for Name: inscripciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscripciones (idinscripcion, idestudiante, idcurso, fechainscripcion, calificacion) FROM stdin;
16	13	6	2025-05-19	90
17	14	7	2025-05-20	85
18	15	8	2025-05-21	92
19	16	9	2025-05-22	88
20	17	10	2025-05-23	95
\.


--
-- Data for Name: programasestudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programasestudio (idprograma, nombreprograma, descripcionprograma) FROM stdin;
1	Programa de Sistemas	Programa enfocado en ingenieria y tecnologias de la informacion
2	Programa de Ciencias	Programa que integra diversas ciencias basicas.
3	Programa de Psicología	Formacion en el campo psicologico.
4	Programa de Administración	Carrera profesional en gestion y administracion.
5	Programa de Diseño	Carrera en diseño visual y digital.
\.


--
-- Data for Name: programascursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programascursos (idprogramacurso, idprograma, idcurso) FROM stdin;
1	1	6
2	2	7
3	3	8
4	4	9
5	5	10
\.


--
-- Name: campus_idcampus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.campus_idcampus_seq', 1, false);


--
-- Name: carreras_idcarrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_idcarrera_seq', 10, true);


--
-- Name: cursos_idcurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_idcurso_seq', 11, true);


--
-- Name: cursosprofesores_idcursoprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursosprofesores_idcursoprofesor_seq', 10, true);


--
-- Name: departamentos_iddepartamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_iddepartamento_seq', 10, true);


--
-- Name: estudiantes_idestudiante_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantes_idestudiante_seq', 18, true);


--
-- Name: estudiantescarreras_idestudiantecarrera_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.estudiantescarreras_idestudiantecarrera_seq', 10, true);


--
-- Name: inscripciones_idinscripcion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscripciones_idinscripcion_seq', 20, true);


--
-- Name: profesores_idprofesor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profesores_idprofesor_seq', 5, true);


--
-- Name: programascursos_idprogramacurso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programascursos_idprogramacurso_seq', 5, true);


--
-- Name: programasestudio_idprograma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programasestudio_idprograma_seq', 5, true);


--
-- PostgreSQL database dump complete
--

