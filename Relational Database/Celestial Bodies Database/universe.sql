--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    age_in_millions_of_years numeric,
    galaxy_image character varying(40),
    type_of_galaxy_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    radius integer,
    density integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    mass numeric,
    age_in_millions_of_years numeric,
    is_flat boolean,
    description text,
    has_life boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    size numeric,
    mass numeric,
    temperature integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: type_of_galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.type_of_galaxy (
    type_of_galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text
);


ALTER TABLE public.type_of_galaxy OWNER TO freecodecamp;

--
-- Name: types_of_galaxy_type_of_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.types_of_galaxy_type_of_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_of_galaxy_type_of_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: types_of_galaxy_type_of_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.types_of_galaxy_type_of_galaxy_id_seq OWNED BY public.type_of_galaxy.type_of_galaxy_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: type_of_galaxy type_of_galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_galaxy ALTER COLUMN type_of_galaxy_id SET DEFAULT nextval('public.types_of_galaxy_type_of_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.61, 'milky_way.jpg', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.01, 'andromeda.jpg', 1);
INSERT INTO public.galaxy VALUES (4, 'GR 8', NULL, 'gr_8.jpg', 4);
INSERT INTO public.galaxy VALUES (5, 'M110', NULL, 'm110.jpg', 2);
INSERT INTO public.galaxy VALUES (6, 'NGC 3109', NULL, 'ngc_3109.jpg', 1);
INSERT INTO public.galaxy VALUES (3, 'M33', NULL, 'm33.jpg', 1);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1730, 3, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 12, 2, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 7, 2, 4);
INSERT INTO public.moon VALUES (4, 'Io', 300, 4, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 300, 4, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 300, 4, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 300, 4, 5);
INSERT INTO public.moon VALUES (8, 'Leda', 300, 4, 5);
INSERT INTO public.moon VALUES (9, 'Mneme', 300, 4, 5);
INSERT INTO public.moon VALUES (10, 'Ananke', 300, 4, 5);
INSERT INTO public.moon VALUES (11, 'Paaliaq', 180, 3, 6);
INSERT INTO public.moon VALUES (12, 'Titan', 180, 3, 6);
INSERT INTO public.moon VALUES (13, 'Rhea', 180, 3, 6);
INSERT INTO public.moon VALUES (14, 'Dione', 180, 3, 6);
INSERT INTO public.moon VALUES (15, 'Mimas', 180, 3, 6);
INSERT INTO public.moon VALUES (16, 'Atlas', 180, 3, 6);
INSERT INTO public.moon VALUES (17, 'Pandora', 180, 3, 6);
INSERT INTO public.moon VALUES (18, 'Janus', 180, 3, 6);
INSERT INTO public.moon VALUES (19, 'Phoebe', 180, 3, 6);
INSERT INTO public.moon VALUES (20, 'Albiorix', 180, 3, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 0.055, 4503, false, 'Information about Mercury', false, 6);
INSERT INTO public.planet VALUES (2, 'Venus', 0.815, 4503, false, 'Information about Venus', false, 6);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 4543, true, 'Information about Earth', true, 6);
INSERT INTO public.planet VALUES (4, 'Mars', 0.107, 4603, false, 'Information about Mars', false, 6);
INSERT INTO public.planet VALUES (5, 'Jupiter', 317.8, 4603, false, 'Information about Jupiter', false, 6);
INSERT INTO public.planet VALUES (6, 'Saturn', 95.16, 4503, false, 'Information about Saturn', false, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, 4503, false, 'Information about Uranus', false, 6);
INSERT INTO public.planet VALUES (8, 'Neptune', 17.15, 4503, false, 'Information about Neptune', false, 6);
INSERT INTO public.planet VALUES (9, 'TOI-1452b', 4.8, NULL, false, 'Description about TOI-1452B', false, 3);
INSERT INTO public.planet VALUES (10, 'WASP-39b', 0.28, NULL, false, 'Information about WASP-39b', false, 4);
INSERT INTO public.planet VALUES (11, 'WASP-103b', 1.49, NULL, false, 'Information about WASP-103b', false, 4);
INSERT INTO public.planet VALUES (12, '51 Pegasi b', 150, NULL, false, 'Information about 51 Pegasi b', false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Mirach', 2, 86, 3.5, 3800);
INSERT INTO public.star VALUES (2, 'KY Cygni', 1, 1.033, NULL, 3550);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 1.021, 16.5, 3600);
INSERT INTO public.star VALUES (4, 'Nembus', 2, 27, NULL, 4375);
INSERT INTO public.star VALUES (5, 'Alpheratz', 2, 5, NULL, 13000);
INSERT INTO public.star VALUES (6, 'Sun', 1, 1, 1.985, 5772);


--
-- Data for Name: type_of_galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.type_of_galaxy VALUES (1, 'Spiral', NULL);
INSERT INTO public.type_of_galaxy VALUES (2, 'Elliptical', NULL);
INSERT INTO public.type_of_galaxy VALUES (3, 'Peculiar', NULL);
INSERT INTO public.type_of_galaxy VALUES (4, 'Irregular', NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: types_of_galaxy_type_of_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.types_of_galaxy_type_of_galaxy_id_seq', 4, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (star_id);


--
-- Name: type_of_galaxy type_of_galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_galaxy
    ADD CONSTRAINT type_of_galaxy_unique UNIQUE (type_of_galaxy_id);


--
-- Name: type_of_galaxy types_of_galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.type_of_galaxy
    ADD CONSTRAINT types_of_galaxy_pkey PRIMARY KEY (type_of_galaxy_id);


--
-- Name: galaxy galaxy_type_of_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_type_of_galaxy_id_fkey FOREIGN KEY (type_of_galaxy_id) REFERENCES public.type_of_galaxy(type_of_galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

