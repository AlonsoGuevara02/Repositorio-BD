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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: campus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.campus (
    idcampus integer NOT NULL,
    nombrecampus character varying(100) NOT NULL,
    direccioncampus text NOT NULL
);


ALTER TABLE public.campus OWNER TO postgres;

--
-- Name: campus_idcampus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.campus_idcampus_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.campus_idcampus_seq OWNER TO postgres;

--
-- Name: campus_idcampus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.campus_idcampus_seq OWNED BY public.campus.idcampus;


--
-- Name: carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras (
    idcarrera integer NOT NULL,
    nombrecarrera character varying(100) NOT NULL,
    titulootorgado character varying(100) NOT NULL
);


ALTER TABLE public.carreras OWNER TO postgres;

--
-- Name: carreras_idcarrera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_idcarrera_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.carreras_idcarrera_seq OWNER TO postgres;

--
-- Name: carreras_idcarrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_idcarrera_seq OWNED BY public.carreras.idcarrera;


--
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    idcurso integer NOT NULL,
    nombrecurso character varying(100) NOT NULL,
    descripcion text,
    creditos integer,
    semestre integer NOT NULL,
    iddepartamento integer,
    idcampus integer,
    CONSTRAINT cursos_creditos_check CHECK ((creditos > 0)),
    CONSTRAINT cursos_semestre_check CHECK ((semestre > 0))
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- Name: cursos_idcurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_idcurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_idcurso_seq OWNER TO postgres;

--
-- Name: cursos_idcurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_idcurso_seq OWNED BY public.cursos.idcurso;


--
-- Name: cursosprofesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursosprofesores (
    idcursoprofesor integer NOT NULL,
    idcurso integer NOT NULL,
    idprofesor integer NOT NULL
);


ALTER TABLE public.cursosprofesores OWNER TO postgres;

--
-- Name: cursosprofesores_idcursoprofesor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursosprofesores_idcursoprofesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursosprofesores_idcursoprofesor_seq OWNER TO postgres;

--
-- Name: cursosprofesores_idcursoprofesor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursosprofesores_idcursoprofesor_seq OWNED BY public.cursosprofesores.idcursoprofesor;


--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    iddepartamento integer NOT NULL,
    nombredepartamento character varying(70) NOT NULL,
    edificio character varying(50)
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- Name: departamentos_iddepartamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_iddepartamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.departamentos_iddepartamento_seq OWNER TO postgres;

--
-- Name: departamentos_iddepartamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_iddepartamento_seq OWNED BY public.departamentos.iddepartamento;


--
-- Name: estudiantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantes (
    idestudiante integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    fechanacimiento date NOT NULL,
    direccion text NOT NULL,
    email character varying(100) NOT NULL,
    idcarrera integer
);


ALTER TABLE public.estudiantes OWNER TO postgres;

--
-- Name: estudiantes_idestudiante_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantes_idestudiante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiantes_idestudiante_seq OWNER TO postgres;

--
-- Name: estudiantes_idestudiante_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantes_idestudiante_seq OWNED BY public.estudiantes.idestudiante;


--
-- Name: estudiantescarreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estudiantescarreras (
    idestudiantecarrera integer NOT NULL,
    idestudiante integer NOT NULL,
    idcarrera integer NOT NULL
);


ALTER TABLE public.estudiantescarreras OWNER TO postgres;

--
-- Name: estudiantescarreras_idestudiantecarrera_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.estudiantescarreras_idestudiantecarrera_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.estudiantescarreras_idestudiantecarrera_seq OWNER TO postgres;

--
-- Name: estudiantescarreras_idestudiantecarrera_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.estudiantescarreras_idestudiantecarrera_seq OWNED BY public.estudiantescarreras.idestudiantecarrera;


--
-- Name: inscripciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscripciones (
    idinscripcion integer NOT NULL,
    idestudiante integer NOT NULL,
    idcurso integer NOT NULL,
    fechainscripcion date NOT NULL,
    calificacion integer NOT NULL,
    CONSTRAINT inscripciones_calificacion_check CHECK (((calificacion >= 0) AND (calificacion <= 100)))
);


ALTER TABLE public.inscripciones OWNER TO postgres;

--
-- Name: inscripciones_idinscripcion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscripciones_idinscripcion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.inscripciones_idinscripcion_seq OWNER TO postgres;

--
-- Name: inscripciones_idinscripcion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.inscripciones_idinscripcion_seq OWNED BY public.inscripciones.idinscripcion;


--
-- Name: profesores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profesores (
    idprofesor integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    titulo character varying(100),
    iddepartamento integer,
    email character varying(150) NOT NULL
);


ALTER TABLE public.profesores OWNER TO postgres;

--
-- Name: profesores_idprofesor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.profesores_idprofesor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.profesores_idprofesor_seq OWNER TO postgres;

--
-- Name: profesores_idprofesor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.profesores_idprofesor_seq OWNED BY public.profesores.idprofesor;


--
-- Name: programascursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programascursos (
    idprogramacurso integer NOT NULL,
    idprograma integer NOT NULL,
    idcurso integer NOT NULL
);


ALTER TABLE public.programascursos OWNER TO postgres;

--
-- Name: programascursos_idprogramacurso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programascursos_idprogramacurso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programascursos_idprogramacurso_seq OWNER TO postgres;

--
-- Name: programascursos_idprogramacurso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programascursos_idprogramacurso_seq OWNED BY public.programascursos.idprogramacurso;


--
-- Name: programasestudio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programasestudio (
    idprograma integer NOT NULL,
    nombreprograma character varying(100) NOT NULL,
    descripcionprograma text
);


ALTER TABLE public.programasestudio OWNER TO postgres;

--
-- Name: programasestudio_idprograma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programasestudio_idprograma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.programasestudio_idprograma_seq OWNER TO postgres;

--
-- Name: programasestudio_idprograma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.programasestudio_idprograma_seq OWNED BY public.programasestudio.idprograma;


--
-- Name: campus idcampus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus ALTER COLUMN idcampus SET DEFAULT nextval('public.campus_idcampus_seq'::regclass);


--
-- Name: carreras idcarrera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras ALTER COLUMN idcarrera SET DEFAULT nextval('public.carreras_idcarrera_seq'::regclass);


--
-- Name: cursos idcurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN idcurso SET DEFAULT nextval('public.cursos_idcurso_seq'::regclass);


--
-- Name: cursosprofesores idcursoprofesor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursosprofesores ALTER COLUMN idcursoprofesor SET DEFAULT nextval('public.cursosprofesores_idcursoprofesor_seq'::regclass);


--
-- Name: departamentos iddepartamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN iddepartamento SET DEFAULT nextval('public.departamentos_iddepartamento_seq'::regclass);


--
-- Name: estudiantes idestudiante; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes ALTER COLUMN idestudiante SET DEFAULT nextval('public.estudiantes_idestudiante_seq'::regclass);


--
-- Name: estudiantescarreras idestudiantecarrera; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantescarreras ALTER COLUMN idestudiantecarrera SET DEFAULT nextval('public.estudiantescarreras_idestudiantecarrera_seq'::regclass);


--
-- Name: inscripciones idinscripcion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones ALTER COLUMN idinscripcion SET DEFAULT nextval('public.inscripciones_idinscripcion_seq'::regclass);


--
-- Name: profesores idprofesor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores ALTER COLUMN idprofesor SET DEFAULT nextval('public.profesores_idprofesor_seq'::regclass);


--
-- Name: programascursos idprogramacurso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programascursos ALTER COLUMN idprogramacurso SET DEFAULT nextval('public.programascursos_idprogramacurso_seq'::regclass);


--
-- Name: programasestudio idprograma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programasestudio ALTER COLUMN idprograma SET DEFAULT nextval('public.programasestudio_idprograma_seq'::regclass);


--
-- Name: campus campus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.campus
    ADD CONSTRAINT campus_pkey PRIMARY KEY (idcampus);


--
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras
    ADD CONSTRAINT carreras_pkey PRIMARY KEY (idcarrera);


--
-- Name: cursos cursos_nombrecurso_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_nombrecurso_key UNIQUE (nombrecurso);


--
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (idcurso);


--
-- Name: cursosprofesores cursosprofesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursosprofesores
    ADD CONSTRAINT cursosprofesores_pkey PRIMARY KEY (idcursoprofesor);


--
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (iddepartamento);


--
-- Name: estudiantes estudiantes_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_email_key UNIQUE (email);


--
-- Name: estudiantes estudiantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT estudiantes_pkey PRIMARY KEY (idestudiante);


--
-- Name: estudiantescarreras estudiantescarreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantescarreras
    ADD CONSTRAINT estudiantescarreras_pkey PRIMARY KEY (idestudiantecarrera);


--
-- Name: inscripciones inscripciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_pkey PRIMARY KEY (idinscripcion);


--
-- Name: profesores profesores_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_email_key UNIQUE (email);


--
-- Name: profesores profesores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_pkey PRIMARY KEY (idprofesor);


--
-- Name: programascursos programascursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programascursos
    ADD CONSTRAINT programascursos_pkey PRIMARY KEY (idprogramacurso);


--
-- Name: programasestudio programasestudio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programasestudio
    ADD CONSTRAINT programasestudio_pkey PRIMARY KEY (idprograma);


--
-- Name: cursos cursos_iddepartamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_iddepartamento_fkey FOREIGN KEY (iddepartamento) REFERENCES public.departamentos(iddepartamento);


--
-- Name: cursosprofesores cursosprofesores_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursosprofesores
    ADD CONSTRAINT cursosprofesores_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.cursos(idcurso);


--
-- Name: cursosprofesores cursosprofesores_idprofesor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursosprofesores
    ADD CONSTRAINT cursosprofesores_idprofesor_fkey FOREIGN KEY (idprofesor) REFERENCES public.profesores(idprofesor);


--
-- Name: estudiantescarreras estudiantescarreras_idcarrera_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantescarreras
    ADD CONSTRAINT estudiantescarreras_idcarrera_fkey FOREIGN KEY (idcarrera) REFERENCES public.carreras(idcarrera);


--
-- Name: estudiantescarreras estudiantescarreras_idestudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantescarreras
    ADD CONSTRAINT estudiantescarreras_idestudiante_fkey FOREIGN KEY (idestudiante) REFERENCES public.estudiantes(idestudiante);


--
-- Name: cursos fkcursoscampus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT fkcursoscampus FOREIGN KEY (idcampus) REFERENCES public.campus(idcampus);


--
-- Name: estudiantes fkestudiantescarrera; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estudiantes
    ADD CONSTRAINT fkestudiantescarrera FOREIGN KEY (idcarrera) REFERENCES public.carreras(idcarrera);


--
-- Name: inscripciones inscripciones_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.cursos(idcurso);


--
-- Name: inscripciones inscripciones_idestudiante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscripciones
    ADD CONSTRAINT inscripciones_idestudiante_fkey FOREIGN KEY (idestudiante) REFERENCES public.estudiantes(idestudiante);


--
-- Name: profesores profesores_iddepartamento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profesores
    ADD CONSTRAINT profesores_iddepartamento_fkey FOREIGN KEY (iddepartamento) REFERENCES public.departamentos(iddepartamento);


--
-- Name: programascursos programascursos_idcurso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programascursos
    ADD CONSTRAINT programascursos_idcurso_fkey FOREIGN KEY (idcurso) REFERENCES public.cursos(idcurso);


--
-- Name: programascursos programascursos_idprograma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programascursos
    ADD CONSTRAINT programascursos_idprograma_fkey FOREIGN KEY (idprograma) REFERENCES public.programasestudio(idprograma);


--
-- PostgreSQL database dump complete
--

