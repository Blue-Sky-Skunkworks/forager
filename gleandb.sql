--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: fruit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE fruit (
    id integer NOT NULL,
    fruit_type text NOT NULL,
    common_name text NOT NULL
);


ALTER TABLE fruit OWNER TO postgres;

--
-- Name: fruit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE fruit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fruit_id_seq OWNER TO postgres;

--
-- Name: fruit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE fruit_id_seq OWNED BY fruit.id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE person (
    id integer NOT NULL,
    name text NOT NULL,
    cell_phone text,
    home_phone text,
    address text
);


ALTER TABLE person OWNER TO postgres;

--
-- Name: person_fruit; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE person_fruit (
    id integer NOT NULL,
    fruit_id integer NOT NULL,
    person_id integer NOT NULL,
    want_fruit boolean,
    has_fruit boolean,
    want_amount integer,
    has_amount integer,
    has_condition text,
    want_condition text
);


ALTER TABLE person_fruit OWNER TO postgres;

--
-- Name: person_fruit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE person_fruit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_fruit_id_seq OWNER TO postgres;

--
-- Name: person_fruit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE person_fruit_id_seq OWNED BY person_fruit.id;


--
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE person_id_seq OWNER TO postgres;

--
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY fruit ALTER COLUMN id SET DEFAULT nextval('fruit_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person_fruit ALTER COLUMN id SET DEFAULT nextval('person_fruit_id_seq'::regclass);


--
-- Data for Name: fruit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY fruit (id, fruit_type, common_name) FROM stdin;
\.


--
-- Name: fruit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('fruit_id_seq', 1, false);


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY person (id, name, cell_phone, home_phone, address) FROM stdin;
\.


--
-- Data for Name: person_fruit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY person_fruit (id, fruit_id, person_id, want_fruit, has_fruit, want_amount, has_amount, has_condition, want_condition) FROM stdin;
\.


--
-- Name: person_fruit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('person_fruit_id_seq', 1, false);


--
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('person_id_seq', 1, false);


--
-- Name: fruit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY fruit
    ADD CONSTRAINT fruit_pkey PRIMARY KEY (id);


--
-- Name: person_fruit_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY person_fruit
    ADD CONSTRAINT person_fruit_pkey PRIMARY KEY (id);


--
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- Name: person_fruit_fruit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person_fruit
    ADD CONSTRAINT person_fruit_fruit_id_fkey FOREIGN KEY (fruit_id) REFERENCES fruit(id);


--
-- Name: person_fruit_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY person_fruit
    ADD CONSTRAINT person_fruit_person_id_fkey FOREIGN KEY (person_id) REFERENCES person(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

