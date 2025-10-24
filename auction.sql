--
-- PostgreSQL database dump
--

\restrict y9wGGOA4OIF8oAhhQHEovEC8dM2hPytl3QqOOh0orOB9L5gLnh2u415gKdqpgzy

-- Dumped from database version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.10 (Ubuntu 16.10-0ubuntu0.24.04.1)

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
-- Name: bidders; Type: TABLE; Schema: public; Owner: mshieh
--

CREATE TABLE public.bidders (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.bidders OWNER TO mshieh;

--
-- Name: bidders_id_seq; Type: SEQUENCE; Schema: public; Owner: mshieh
--

CREATE SEQUENCE public.bidders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bidders_id_seq OWNER TO mshieh;

--
-- Name: bidders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mshieh
--

ALTER SEQUENCE public.bidders_id_seq OWNED BY public.bidders.id;


--
-- Name: bids; Type: TABLE; Schema: public; Owner: mshieh
--

CREATE TABLE public.bids (
    id integer NOT NULL,
    bidder_id integer NOT NULL,
    item_id integer NOT NULL,
    amount numeric(6,2) NOT NULL
);


ALTER TABLE public.bids OWNER TO mshieh;

--
-- Name: bids_id_seq; Type: SEQUENCE; Schema: public; Owner: mshieh
--

CREATE SEQUENCE public.bids_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bids_id_seq OWNER TO mshieh;

--
-- Name: bids_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mshieh
--

ALTER SEQUENCE public.bids_id_seq OWNED BY public.bids.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: mshieh
--

CREATE TABLE public.items (
    id integer NOT NULL,
    name text NOT NULL,
    initial_price numeric(6,2) NOT NULL,
    sales_price numeric(6,2)
);


ALTER TABLE public.items OWNER TO mshieh;

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: mshieh
--

CREATE SEQUENCE public.items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.items_id_seq OWNER TO mshieh;

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mshieh
--

ALTER SEQUENCE public.items_id_seq OWNED BY public.items.id;


--
-- Name: bidders id; Type: DEFAULT; Schema: public; Owner: mshieh
--

ALTER TABLE ONLY public.bidders ALTER COLUMN id SET DEFAULT nextval('public.bidders_id_seq'::regclass);


--
-- Name: bids id; Type: DEFAULT; Schema: public; Owner: mshieh
--

ALTER TABLE ONLY public.bids ALTER COLUMN id SET DEFAULT nextval('public.bids_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: mshieh
--

ALTER TABLE ONLY public.items ALTER COLUMN id SET DEFAULT nextval('public.items_id_seq'::regclass);


--
-- Data for Name: bidders; Type: TABLE DATA; Schema: public; Owner: mshieh
--

COPY public.bidders (id, name) FROM stdin;
\.


--
-- Data for Name: bids; Type: TABLE DATA; Schema: public; Owner: mshieh
--

COPY public.bids (id, bidder_id, item_id, amount) FROM stdin;
\.


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: mshieh
--

COPY public.items (id, name, initial_price, sales_price) FROM stdin;
\.


--
-- Name: bidders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mshieh
--

SELECT pg_catalog.setval('public.bidders_id_seq', 1, false);


--
-- Name: bids_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mshieh
--

SELECT pg_catalog.setval('public.bids_id_seq', 1, false);


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mshieh
--

SELECT pg_catalog.setval('public.items_id_seq', 1, false);


--
-- Name: bidders bidders_pkey; Type: CONSTRAINT; Schema: public; Owner: mshieh
--

ALTER TABLE ONLY public.bidders
    ADD CONSTRAINT bidders_pkey PRIMARY KEY (id);


--
-- Name: bids bids_pkey; Type: CONSTRAINT; Schema: public; Owner: mshieh
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: mshieh
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: bids_bidder_id_item_id_idx; Type: INDEX; Schema: public; Owner: mshieh
--

CREATE INDEX bids_bidder_id_item_id_idx ON public.bids USING btree (bidder_id, item_id);


--
-- Name: bids bids_bidder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mshieh
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_bidder_id_fkey FOREIGN KEY (bidder_id) REFERENCES public.bidders(id);


--
-- Name: bids bids_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mshieh
--

ALTER TABLE ONLY public.bids
    ADD CONSTRAINT bids_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.items(id);


--
-- PostgreSQL database dump complete
--

\unrestrict y9wGGOA4OIF8oAhhQHEovEC8dM2hPytl3QqOOh0orOB9L5gLnh2u415gKdqpgzy

