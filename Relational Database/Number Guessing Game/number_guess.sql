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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES ('user_1679309634731', 1, 327);
INSERT INTO public.players VALUES ('user_1679309637357', 2, 23);
INSERT INTO public.players VALUES ('user_1679309637358', 5, 227);
INSERT INTO public.players VALUES ('user_1679309719003', 2, 355);
INSERT INTO public.players VALUES ('user_1679309719004', 5, 199);
INSERT INTO public.players VALUES ('user_1679309783956', 2, 45);
INSERT INTO public.players VALUES ('user_1679309783957', 5, 280);
INSERT INTO public.players VALUES ('user_1679309797405', 2, 635);
INSERT INTO public.players VALUES ('user_1679309797406', 5, 196);
INSERT INTO public.players VALUES ('Sergio', 2, 8);
INSERT INTO public.players VALUES ('user_1679309847042', 2, 701);
INSERT INTO public.players VALUES ('user_1679309847043', 5, 12);
INSERT INTO public.players VALUES ('user_1679309868742', 2, 42);
INSERT INTO public.players VALUES ('user_1679309868743', 5, 109);
INSERT INTO public.players VALUES ('user_1679309875021', 2, 35);
INSERT INTO public.players VALUES ('user_1679309875022', 5, 104);
INSERT INTO public.players VALUES ('user_1679309596847', 2, 229);
INSERT INTO public.players VALUES ('user_1679309596848', 5, 269);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

