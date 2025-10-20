--
-- PostgreSQL database dump
--

\restrict govC21C66vrLPmdQoGYwBtjecozBKvrJPZn9LvhhBWW2RdvFak4I1RT0IEuy1po

-- Dumped from database version 14.19 (Homebrew)
-- Dumped by pg_dump version 14.19 (Homebrew)

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
-- Name: films; Type: TABLE; Schema: public; Owner: melvin
--

CREATE TABLE public.films (
    title character varying(255) NOT NULL,
    year integer NOT NULL,
    genre character varying(100) NOT NULL,
    director character varying(255) NOT NULL,
    duration integer NOT NULL,
    CONSTRAINT director_name CHECK (((length((director)::text) >= 3) AND (POSITION((' '::text) IN (director)) > 0))),
    CONSTRAINT year_made CHECK (((year >= 1900) AND (year <= 2100)))
);


ALTER TABLE public.films OWNER TO melvin;

--
-- Data for Name: films; Type: TABLE DATA; Schema: public; Owner: melvin
--

COPY public.films (title, year, genre, director, duration) FROM stdin;
Die Hard	1988	action	John McTiernan	132
Casablanca	1942	drama	Michael Curtiz	102
The Conversation	1974	thriller	Francis Ford Coppola	113
1984	1956	scifi	Michael Anderson	90
Tinker Tailor Soldier Spy	2011	espionage	Tomas Alfredson	127
The Birdcage	1996	comedy	Mike Nichols	118
\.


--
-- PostgreSQL database dump complete
--

\unrestrict govC21C66vrLPmdQoGYwBtjecozBKvrJPZn9LvhhBWW2RdvFak4I1RT0IEuy1po

