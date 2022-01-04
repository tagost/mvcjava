--
-- PostgreSQL database dump
--

-- Dumped from database version 11.14 (Debian 11.14-1.pgdg90+1)
-- Dumped by pg_dump version 11.14 (Debian 11.14-1.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ciudades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ciudades (
    id_ciudad integer NOT NULL,
    nombre_ciudad character varying
);


ALTER TABLE public.ciudades OWNER TO postgres;

--
-- Name: ciudades_id_ciudad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ciudades_id_ciudad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ciudades_id_ciudad_seq OWNER TO postgres;

--
-- Name: ciudades_id_ciudad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ciudades_id_ciudad_seq OWNED BY public.ciudades.id_ciudad;


--
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas (
    nombre_persona character varying,
    apellido_persona character varying,
    ci_persona integer,
    id_persona integer NOT NULL
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- Name: personas_id_persona_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personas_id_persona_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_id_persona_seq OWNER TO postgres;

--
-- Name: personas_id_persona_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personas_id_persona_seq OWNED BY public.personas.id_persona;


--
-- Name: ciudades id_ciudad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades ALTER COLUMN id_ciudad SET DEFAULT nextval('public.ciudades_id_ciudad_seq'::regclass);


--
-- Name: personas id_persona; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas ALTER COLUMN id_persona SET DEFAULT nextval('public.personas_id_persona_seq'::regclass);


--
-- Data for Name: ciudades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ciudades (id_ciudad, nombre_ciudad) FROM stdin;
2	san lorenzo
3	luque
4	ñemby
1	asuncion
5	capiata
\.


--
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas (nombre_persona, apellido_persona, ci_persona, id_persona) FROM stdin;
guillermos	sosa	456789	4
jorge	gonzaleza	852369	20
jorge	gonzalez	543211	18
cesar	flores	1111111	1
josefa	cabreras	523648	17
richard	sauceda	258632	2
juan	sosa	78451	22
huga	tulio	564322	19
bruno	barrientos	568214	23
\.


--
-- Name: ciudades_id_ciudad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ciudades_id_ciudad_seq', 5, true);


--
-- Name: personas_id_persona_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personas_id_persona_seq', 24, true);


--
-- Name: ciudades ciudades_id_ciudad_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ciudades
    ADD CONSTRAINT ciudades_id_ciudad_pk PRIMARY KEY (id_ciudad);


--
-- Name: personas personas_id_persona_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_id_persona_pk PRIMARY KEY (id_persona);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

