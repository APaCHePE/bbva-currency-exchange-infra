--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13 (Debian 15.13-1.pgdg120+1)
-- Dumped by pg_dump version 15.13

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_logs (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid,
    action character varying(100) NOT NULL,
    details text,
    "timestamp" timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    username character varying(20)
);


ALTER TABLE public.audit_logs OWNER TO postgres;

--
-- Name: COLUMN audit_logs.username; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.audit_logs.username IS 'Nombre de usuario';


--
-- Name: exchange_rates; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.exchange_rates (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    from_currency character varying(10) NOT NULL,
    to_currency character varying(10) NOT NULL,
    rate numeric(10,4) NOT NULL,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.exchange_rates OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_roles (
    user_id uuid NOT NULL,
    role_id uuid NOT NULL
);


ALTER TABLE public.user_roles OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_logs (id, user_id, action, details, "timestamp", username) FROM stdin;
c7a8e19a-f5ca-4734-a16b-d0c551fa5beb	85842ec0-2829-4b09-8367-0c467b1efd88	CONSULT_EXCHANGE_RATE	Consulted exchange rate from USD to PEN with rate 3.9800 (ID: 42a734e1-484f-49c0-b4cb-ce47749ce051)	2025-05-16 06:51:55.837139	admin
a0105e31-4063-4757-b225-05ee323a2766	85842ec0-2829-4b09-8367-0c467b1efd88	UPDATE_EXCHANGE_RATE	Updated exchange rate from USD to PEN to rate 3.98 (ID: 42a734e1-484f-49c0-b4cb-ce47749ce051)	2025-05-16 06:53:06.936861	admin
0c95b204-5684-44e5-9a41-38f6ff5502d2	85842ec0-2829-4b09-8367-0c467b1efd88	CONSULT_EXCHANGE_RATE	Consulted exchange rate from USD to PEN with rate 3.9800 (ID: 42a734e1-484f-49c0-b4cb-ce47749ce051)	2025-05-16 08:57:30.815096	admin
f399a5a5-7107-451f-bfc5-b247e0df7606	85842ec0-2829-4b09-8367-0c467b1efd88	CONVERT_CURRENCY	Converted 100 USD to 398.0000 PEN using rate 3.9800	2025-05-16 09:00:36.521096	admin
de5e14ae-b828-4ff8-91b4-f3001e6103f8	85842ec0-2829-4b09-8367-0c467b1efd88	CONVERT_CURRENCY	Converted 120 EUR to 492.0000 PEN using rate 4.1000	2025-05-16 09:45:45.400065	admin
978ecbb9-84f9-4681-b9ba-ff009535f9bd	85842ec0-2829-4b09-8367-0c467b1efd88	CREATE_EXCHANGE_RATE	Created exchange rate from AUD to BRL at rate 1.000001 (ID: d5461e2c-fcd9-4d7a-9248-ce2e6c06bf70)	2025-05-16 11:37:10.490458	admin
6eaddc91-7760-4aa9-b73d-61c64243b324	85842ec0-2829-4b09-8367-0c467b1efd88	CREATE_EXCHANGE_RATE	Created exchange rate from AUD to BRL at rate 1.9832 (ID: 7a9d3955-26f3-43f9-bf25-d9b213431af4)	2025-05-16 11:37:27.072722	admin
35134793-fdb8-4104-a1b4-e83cd553e35b	85842ec0-2829-4b09-8367-0c467b1efd88	UPDATE_EXCHANGE_RATE	Updated exchange rate from JPY to USD to rate 0.0175 (ID: 7f4a435f-2e04-47e7-869c-845a816cfb47)	2025-05-16 11:44:45.999858	admin
742845c9-37ec-4ed8-bafa-f7d40812e701	85842ec0-2829-4b09-8367-0c467b1efd88	UPDATE_EXCHANGE_RATE	Updated exchange rate from EUR to PEN to rate 4.100001 (ID: 8463d1c3-cb21-42f0-a3ee-05e3b763aa77)	2025-05-16 11:47:01.152151	admin
e6319b1d-bf63-419a-9341-45abc6c62a24	85842ec0-2829-4b09-8367-0c467b1efd88	CONVERT_CURRENCY	Converted 1 CAD to 0.7400 USD using rate 0.7400	2025-05-16 12:24:46.643631	admin
d14023c0-8027-4af0-a3fd-901c5f03947f	85842ec0-2829-4b09-8367-0c467b1efd88	CONVERT_CURRENCY	Converted 10 CAD to 7.4000 USD using rate 0.7400	2025-05-16 12:25:11.825458	admin
aab28255-67a5-4107-8143-bc56663e6a11	85842ec0-2829-4b09-8367-0c467b1efd88	CONVERT_CURRENCY	Converted 1 GBP to 1.2500 USD using rate 1.2500	2025-05-16 12:27:06.679757	admin
26c2adad-fe86-45ee-893f-9fa39a3162be	85842ec0-2829-4b09-8367-0c467b1efd88	CONVERT_CURRENCY	Converted 1 GBP to 1.2500 USD using rate 1.2500	2025-05-16 12:28:48.420235	admin
8a3de2f5-cf17-4a59-95ff-5a7d0045573d	85842ec0-2829-4b09-8367-0c467b1efd88	CONVERT_CURRENCY	Converted 1 USD to 3.9800 PEN using rate 3.9800	2025-05-16 12:30:04.111967	admin
\.


--
-- Data for Name: exchange_rates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.exchange_rates (id, from_currency, to_currency, rate, updated_at) FROM stdin;
c4c8ebf7-340b-4783-8aee-871506ad1391	USD	EUR	0.8500	2025-05-15 22:28:43.381161
f71990d3-10c0-4c6e-999c-9f75f6ae0373	GBP	USD	1.2500	2025-05-15 22:28:43.381161
4a5f7790-2eff-4297-a228-baeeeffe9744	USD	BRL	5.0500	2025-05-15 22:28:43.381161
6b377a4b-e1b3-4d5a-9b9f-1ec51d549513	AUD	USD	0.6600	2025-05-15 22:28:43.381161
b5ec02af-df79-4e85-bd53-e340d44ec383	CAD	USD	0.7400	2025-05-15 22:28:43.381161
42a734e1-484f-49c0-b4cb-ce47749ce051	USD	PEN	3.9800	2025-05-16 06:53:06.923679
d5461e2c-fcd9-4d7a-9248-ce2e6c06bf70	AUD	BRL	1.0000	2025-05-16 11:37:10.19131
7a9d3955-26f3-43f9-bf25-d9b213431af4	AUD	BRL	1.9832	2025-05-16 11:37:27.062651
7f4a435f-2e04-47e7-869c-845a816cfb47	JPY	USD	0.0175	2025-05-16 11:44:45.980805
8463d1c3-cb21-42f0-a3ee-05e3b763aa77	EUR	PEN	4.1000	2025-05-16 11:47:01.145777
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, description) FROM stdin;
3297b6b9-ef23-431c-9d1a-611013856835	ADMIN	Administrator with full access
0275cf84-bf78-4942-9faf-2638a02c04db	USER	Regular user with read-only access
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_roles (user_id, role_id) FROM stdin;
85842ec0-2829-4b09-8367-0c467b1efd88	3297b6b9-ef23-431c-9d1a-611013856835
f08ef1ba-20f1-4f20-bd8a-1e9666c72352	0275cf84-bf78-4942-9faf-2638a02c04db
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, password, created_at) FROM stdin;
85842ec0-2829-4b09-8367-0c467b1efd88	admin	$2b$12$EW5Ki6dB.85Cn9CK0GULD.OdxLpCyDJZn96Rod44cq1KEDfTLvjZa	2025-05-15 18:15:01.807255
f08ef1ba-20f1-4f20-bd8a-1e9666c72352	user	$2b$12$pk1PmdRxhB6d8HhdH8x1lO3AuFtqV955U5pAFJt2uEWeIFX7eWKNe	2025-05-15 18:15:01.807255
\.


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: exchange_rates exchange_rates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.exchange_rates
    ADD CONSTRAINT exchange_rates_pkey PRIMARY KEY (id);


--
-- Name: roles roles_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_key UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: audit_logs audit_logs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_roles user_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE CASCADE;


--
-- Name: user_roles user_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

