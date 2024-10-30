--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

-- Started on 2024-10-30 14:23:42

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
-- TOC entry 216 (class 1259 OID 16400)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    status_login boolean NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- TOC entry 4810 (class 0 OID 0)
-- Dependencies: 215
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- TOC entry 218 (class 1259 OID 16407)
-- Name: drivers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drivers (
    driver_id integer NOT NULL,
    name character varying(100) NOT NULL,
    total_orders integer DEFAULT 0
);


ALTER TABLE public.drivers OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16406)
-- Name: drivers_driver_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drivers_driver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.drivers_driver_id_seq OWNER TO postgres;

--
-- TOC entry 4811 (class 0 OID 0)
-- Dependencies: 217
-- Name: drivers_driver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drivers_driver_id_seq OWNED BY public.drivers.driver_id;


--
-- TOC entry 220 (class 1259 OID 16415)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    driver_id integer,
    order_date timestamp without time zone NOT NULL,
    region character varying(100) NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16414)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 4812 (class 0 OID 0)
-- Dependencies: 219
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 4644 (class 2604 OID 16403)
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- TOC entry 4645 (class 2604 OID 16410)
-- Name: drivers driver_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers ALTER COLUMN driver_id SET DEFAULT nextval('public.drivers_driver_id_seq'::regclass);


--
-- TOC entry 4647 (class 2604 OID 16418)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 4800 (class 0 OID 16400)
-- Dependencies: 216
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, name, email, status_login) FROM stdin;
1	Budi	budi@example.com	t
2	Ani	ani@example.com	f
3	Citra	citra@example.com	t
4	Dedi	dedi@example.com	t
5	Eka	eka@example.com	f
\.


--
-- TOC entry 4802 (class 0 OID 16407)
-- Dependencies: 218
-- Data for Name: drivers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.drivers (driver_id, name, total_orders) FROM stdin;
1	Fikri	30
2	Gina	45
3	Hendri	50
4	Indra	20
5	Joko	60
\.


--
-- TOC entry 4804 (class 0 OID 16415)
-- Dependencies: 220
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, driver_id, order_date, region) FROM stdin;
1	1	1	2024-10-01 08:30:00	Jakarta Barat
2	2	2	2024-10-01 09:15:00	Jakarta Pusat
3	3	3	2024-10-01 15:00:00	Jakarta Timur
4	4	1	2024-10-02 11:45:00	Jakarta Barat
5	1	5	2024-10-02 20:00:00	Jakarta Selatan
6	3	4	2024-10-03 18:30:00	Jakarta Timur
7	5	3	2024-10-03 13:00:00	Jakarta Pusat
8	2	2	2024-10-04 09:45:00	Jakarta Barat
9	3	5	2024-10-04 12:00:00	Jakarta Selatan
10	4	1	2024-10-05 21:30:00	Jakarta Barat
11	1	4	2024-11-01 08:30:00	Jakarta Timur
12	5	2	2024-11-02 10:30:00	Jakarta Pusat
13	2	3	2024-11-02 15:45:00	Jakarta Barat
14	3	1	2024-11-03 20:00:00	Jakarta Selatan
15	4	5	2024-11-04 17:30:00	Jakarta Selatan
16	1	2	2024-11-05 08:15:00	Jakarta Timur
17	5	4	2024-11-05 14:00:00	Jakarta Barat
18	2	3	2024-11-06 09:00:00	Jakarta Pusat
19	3	5	2024-11-06 16:30:00	Jakarta Timur
20	4	2	2024-11-07 11:45:00	Jakarta Barat
\.


--
-- TOC entry 4813 (class 0 OID 0)
-- Dependencies: 215
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 5, true);


--
-- TOC entry 4814 (class 0 OID 0)
-- Dependencies: 217
-- Name: drivers_driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drivers_driver_id_seq', 5, true);


--
-- TOC entry 4815 (class 0 OID 0)
-- Dependencies: 219
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 20, true);


--
-- TOC entry 4649 (class 2606 OID 16405)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4651 (class 2606 OID 16413)
-- Name: drivers drivers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drivers
    ADD CONSTRAINT drivers_pkey PRIMARY KEY (driver_id);


--
-- TOC entry 4653 (class 2606 OID 16420)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4654 (class 2606 OID 16421)
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 4655 (class 2606 OID 16426)
-- Name: orders orders_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.drivers(driver_id);


-- Completed on 2024-10-30 14:23:42

--
-- PostgreSQL database dump complete
--

