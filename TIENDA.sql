--
-- PostgreSQL database dump
--

\restrict DV5ceTEGZI4XuSwxpHqAxdt8Pcv0beITjW9CduIXffi2Sj8KSOi3S36Y92Vhtvr

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

-- Started on 2025-08-20 13:34:23

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
-- TOC entry 218 (class 1259 OID 16873)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    category_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text,
    parent_category_id integer
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16853)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id integer NOT NULL,
    contact_name character varying(30) NOT NULL,
    company_name character varying(40),
    contact_email character varying(128) NOT NULL,
    address character varying(120),
    city character varying(30),
    country character varying(30)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16843)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    employee_id integer NOT NULL,
    last_name character varying(40) NOT NULL,
    first_name character varying(20) NOT NULL,
    birth_date date,
    hire_date date,
    address character varying(128),
    city character varying(30),
    country character varying(30),
    reports_to integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16885)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    product_name character varying(40) NOT NULL,
    category_id integer NOT NULL,
    quantity_per_unit integer,
    unit_price numeric(10,2),
    units_in_stock integer,
    discontinued boolean
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16858)
-- Name: purchase; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase (
    purchase_id integer NOT NULL,
    customer_id integer NOT NULL,
    employee_id integer NOT NULL,
    total_price numeric(10,2) NOT NULL,
    purchase_date timestamp without time zone,
    shipped_date timestamp without time zone,
    ship_address character varying(60),
    ship_city character varying(15),
    ship_country character varying(15)
);


ALTER TABLE public.purchase OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16895)
-- Name: purchase_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_item (
    purchase_id integer NOT NULL,
    product_id integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL
);


ALTER TABLE public.purchase_item OWNER TO postgres;

--
-- TOC entry 4872 (class 0 OID 16873)
-- Dependencies: 218
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (category_id, name, description, parent_category_id) FROM stdin;
1	Alimentos	Productos alimenticios en general	\N
2	Bebidas	Jugos, gaseosas y líquidos	\N
3	Snacks	Comida rápida y  dulces	\N
4	Lácteos	Productos derivados de la leche	\N
5	Frutas y Verduras	Frutas frescas y vegetales	\N
\.


--
-- TOC entry 4870 (class 0 OID 16853)
-- Dependencies: 216
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, contact_name, company_name, contact_email, address, city, country) FROM stdin;
1	Libardo Quiñonez	Alimentos S.A	lbarquinonez@gmail.com	Calle 25	Popayan	Colombia
2	Lucero Ruiz	Verduras Frescas 	luruiz@gmail.com	Calle 26	Cali	Colombia
3	Erika Quiñonez	Frutales Frescas	ekquinonez@gmail.com	calle 27	Medellín	Colombia
4	Angela Muñoz	suministros	amunozv@gmail.com	Calle 28	Cartagena	Colombia
5	Camilo Díaz	exportadora	cdiaz@gmail.com	Calle 19	Bogotá	Colombia
\.


--
-- TOC entry 4869 (class 0 OID 16843)
-- Dependencies: 215
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.employee (employee_id, last_name, first_name, birth_date, hire_date, address, city, country, reports_to) FROM stdin;
1	Quiñonez	Andres	1995-03-12	2016-07-01	Calle 25	Ppopayan	Colombia	\N
2	Ruiz	Carlos	1992-07-25	2019-09-15	Carrera 6	Cali	Colombia	1
3	Muñoz	Angela	2000-02-10	2022-01-20	Calle 26	Pereira	Colombia	1
\.


--
-- TOC entry 4873 (class 0 OID 16885)
-- Dependencies: 219
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, product_name, category_id, quantity_per_unit, unit_price, units_in_stock, discontinued) FROM stdin;
1	Arroz Premium	1	20	4.50	100	f
2	Pan Integral	1	10	3.00	50	t
3	Jugo de Naranja	2	12	5.00	200	f
4	Papas Fritas	3	15	2.50	150	f
5	Queso Fresco	4	5	6.00	80	f
6	Manzana Roja	5	25	4.00	120	f
7	Tomate Maduro	5	30	2.00	90	t
8	Lechuga 	5	40	1.50	70	t
9	Plátano Maduro	5	20	3.80	60	t
\.


--
-- TOC entry 4871 (class 0 OID 16858)
-- Dependencies: 217
-- Data for Name: purchase; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase (purchase_id, customer_id, employee_id, total_price, purchase_date, shipped_date, ship_address, ship_city, ship_country) FROM stdin;
1	1	2	50.00	2024-01-10 10:00:00	2024-01-11 09:00:00	Calle 25	Popayan	Colombia
2	2	3	75.00	2024-02-15 14:00:00	2024-02-16 10:00:00	Calle 26	Cali	Colombia
3	3	2	35.00	2024-03-01 09:30:00	2024-03-02 08:00:00	Calle 27	Medellín	Colombia
4	4	1	120.00	2024-04-05 16:00:00	2024-04-06 12:00:00	Calle 28	Cartagena	Colombia
\.


--
-- TOC entry 4874 (class 0 OID 16895)
-- Dependencies: 220
-- Data for Name: purchase_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchase_item (purchase_id, product_id, unit_price, quantity) FROM stdin;
1	1	4.50	5
1	2	3.00	3
2	3	5.00	10
2	6	4.00	5
3	4	2.50	8
3	7	2.00	5
4	5	6.00	10
4	8	1.50	20
4	9	3.80	8
\.


--
-- TOC entry 4714 (class 2606 OID 16879)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (category_id);


--
-- TOC entry 4710 (class 2606 OID 16857)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 4708 (class 2606 OID 16847)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (employee_id);


--
-- TOC entry 4716 (class 2606 OID 16889)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4718 (class 2606 OID 16899)
-- Name: purchase_item purchase_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_item
    ADD CONSTRAINT purchase_item_pkey PRIMARY KEY (purchase_id, product_id);


--
-- TOC entry 4712 (class 2606 OID 16862)
-- Name: purchase purchase_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_pkey PRIMARY KEY (purchase_id);


--
-- TOC entry 4722 (class 2606 OID 16880)
-- Name: category category_parent_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_parent_category_id_fkey FOREIGN KEY (parent_category_id) REFERENCES public.category(category_id);


--
-- TOC entry 4719 (class 2606 OID 16848)
-- Name: employee employee_reports_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_reports_to_fkey FOREIGN KEY (reports_to) REFERENCES public.employee(employee_id);


--
-- TOC entry 4723 (class 2606 OID 16890)
-- Name: product product_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(category_id);


--
-- TOC entry 4720 (class 2606 OID 16863)
-- Name: purchase purchase_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(customer_id);


--
-- TOC entry 4721 (class 2606 OID 16868)
-- Name: purchase purchase_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase
    ADD CONSTRAINT purchase_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(employee_id);


--
-- TOC entry 4724 (class 2606 OID 16905)
-- Name: purchase_item purchase_item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_item
    ADD CONSTRAINT purchase_item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 4725 (class 2606 OID 16900)
-- Name: purchase_item purchase_item_purchase_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_item
    ADD CONSTRAINT purchase_item_purchase_id_fkey FOREIGN KEY (purchase_id) REFERENCES public.purchase(purchase_id);


-- Completed on 2025-08-20 13:34:23

--
-- PostgreSQL database dump complete
--

\unrestrict DV5ceTEGZI4XuSwxpHqAxdt8Pcv0beITjW9CduIXffi2Sj8KSOi3S36Y92Vhtvr

