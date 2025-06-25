--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-06-25 20:39:09

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

--
-- TOC entry 6 (class 2615 OID 50490)
-- Name: drizzle; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA drizzle;


ALTER SCHEMA drizzle OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 50492)
-- Name: __drizzle_migrations; Type: TABLE; Schema: drizzle; Owner: postgres
--

CREATE TABLE drizzle.__drizzle_migrations (
    id integer NOT NULL,
    hash text NOT NULL,
    created_at bigint
);


ALTER TABLE drizzle.__drizzle_migrations OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 50491)
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE; Schema: drizzle; Owner: postgres
--

CREATE SEQUENCE drizzle.__drizzle_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE drizzle.__drizzle_migrations_id_seq OWNER TO postgres;

--
-- TOC entry 5039 (class 0 OID 0)
-- Dependencies: 218
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: drizzle; Owner: postgres
--

ALTER SEQUENCE drizzle.__drizzle_migrations_id_seq OWNED BY drizzle.__drizzle_migrations.id;


--
-- TOC entry 220 (class 1259 OID 58682)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    email character varying(255) NOT NULL,
    password text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 58691)
-- Name: carousel_image; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carousel_image (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    "imageUrl" text NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    "publicId" text NOT NULL
);


ALTER TABLE public.carousel_image OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 66983)
-- Name: cart; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cart (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    product_id uuid NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.cart OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 58775)
-- Name: new_arrival_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_arrival_card (
    id uuid NOT NULL,
    product_id uuid NOT NULL,
    created timestamp without time zone DEFAULT now()
);


ALTER TABLE public.new_arrival_card OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 58781)
-- Name: new_bestselling_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_bestselling_card (
    id uuid NOT NULL,
    product_id uuid NOT NULL,
    created timestamp without time zone DEFAULT now()
);


ALTER TABLE public.new_bestselling_card OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 58787)
-- Name: new_toprated_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_toprated_card (
    id uuid NOT NULL,
    product_id uuid NOT NULL,
    created timestamp without time zone DEFAULT now()
);


ALTER TABLE public.new_toprated_card OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 66924)
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    order_id uuid NOT NULL,
    product_id uuid NOT NULL,
    quantity integer DEFAULT 1 NOT NULL,
    price integer NOT NULL
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 66931)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    full_name text NOT NULL,
    phone text NOT NULL,
    shipping_address text NOT NULL,
    stripe_session_id text,
    created_at timestamp with time zone DEFAULT now(),
    note text,
    payment_method text NOT NULL,
    status text NOT NULL,
    total integer NOT NULL,
    tracking_id uuid NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 58700)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id uuid NOT NULL,
    "productName" text NOT NULL,
    price numeric NOT NULL,
    details text NOT NULL,
    "imageUrl" text,
    "videoUrl" text,
    created timestamp without time zone DEFAULT now(),
    category text NOT NULL,
    "imagePublicId" text,
    "videoPublicId" text
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 58732)
-- Name: products_carousel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_carousel (
    id uuid NOT NULL,
    product_id uuid,
    created timestamp without time zone DEFAULT now()
);


ALTER TABLE public.products_carousel OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 58749)
-- Name: products_carousel_three; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_carousel_three (
    id uuid NOT NULL,
    product_id uuid NOT NULL,
    created timestamp without time zone DEFAULT now()
);


ALTER TABLE public.products_carousel_three OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 58743)
-- Name: products_carousel_two; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products_carousel_two (
    id uuid NOT NULL,
    product_id uuid NOT NULL,
    created timestamp without time zone DEFAULT now()
);


ALTER TABLE public.products_carousel_two OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 66941)
-- Name: public_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.public_user (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    email character varying(255) NOT NULL,
    password text NOT NULL,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.public_user OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 67026)
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    product_id uuid NOT NULL,
    user_id uuid NOT NULL,
    rating integer NOT NULL,
    comment text,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 66950)
-- Name: shipping_addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_addresses (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    full_name text NOT NULL,
    address_line_1 text NOT NULL,
    address_line_2 text,
    city text NOT NULL,
    postal_code text NOT NULL,
    country text NOT NULL,
    phone text NOT NULL
);


ALTER TABLE public.shipping_addresses OWNER TO postgres;

--
-- TOC entry 4803 (class 2604 OID 50495)
-- Name: __drizzle_migrations id; Type: DEFAULT; Schema: drizzle; Owner: postgres
--

ALTER TABLE ONLY drizzle.__drizzle_migrations ALTER COLUMN id SET DEFAULT nextval('drizzle.__drizzle_migrations_id_seq'::regclass);


--
-- TOC entry 5018 (class 0 OID 50492)
-- Dependencies: 219
-- Data for Name: __drizzle_migrations; Type: TABLE DATA; Schema: drizzle; Owner: postgres
--

COPY drizzle.__drizzle_migrations (id, hash, created_at) FROM stdin;
1	f050e1f19f21b052b120597e09066f2da95703b0187592fe9c4385e9a4adad4f	1748789638983
2	dd3a0660def52e38013bdc4a28e0cf6fd7896e4b55ead8080440c7f8793df8fa	1748789963733
3	5f02a60ef3cb5532b07626b425e78770ccbc690a4c853c71316d98a25cbc8239	1748846545157
4	5f02a60ef3cb5532b07626b425e78770ccbc690a4c853c71316d98a25cbc8239	1748874704117
5	db9b52e88afedfe34b0bf3170ffbec02d29fed5b0a208213303612f899c16a9b	1749538876052
6	84bb62737b67a51881494ebdaba720ccb5ac08f17b2a0149ea8f1581949c2554	1749665199080
\.


--
-- TOC entry 5019 (class 0 OID 58682)
-- Dependencies: 220
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin (id, email, password, created_at) FROM stdin;
2b86bd44-3a9d-4ff5-8131-097cdcade1e5	mahmudulsakib.110@gmail.com	$2a$10$juKBUOl9WG3STH9qmrYWU.J/roL3EAGifaPq/rLA7/xKK31oOAeIW	2025-06-03 00:14:56.029447
\.


--
-- TOC entry 5020 (class 0 OID 58691)
-- Dependencies: 221
-- Data for Name: carousel_image; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carousel_image (id, "imageUrl", created_at, "publicId") FROM stdin;
7a6c2b38-640c-445e-9c8f-f7c60639dfe1	https://res.cloudinary.com/dclfdubgy/image/upload/v1749925300/shopora_uploads/vylchjcsrs3exvnrm0lk.jpg	2025-06-15 00:21:42.117127	shopora_uploads/vylchjcsrs3exvnrm0lk
c4d19db9-81a0-4134-bcf0-eb24e7f74f97	https://res.cloudinary.com/dclfdubgy/image/upload/v1749925328/shopora_uploads/dsenijhc0hi7vp805fko.jpg	2025-06-15 00:22:10.439183	shopora_uploads/dsenijhc0hi7vp805fko
c6de45ef-71bb-4789-8f09-e7ec839060f0	https://res.cloudinary.com/dclfdubgy/image/upload/v1749925354/shopora_uploads/xcgnaucwxfkuqjjmu6hw.jpg	2025-06-15 00:22:36.011792	shopora_uploads/xcgnaucwxfkuqjjmu6hw
ca52d094-2adb-4f8c-a3f3-b7f1a99ccd93	https://res.cloudinary.com/dclfdubgy/image/upload/v1749925485/shopora_uploads/cecvjr0auo90eks7dnt3.jpg	2025-06-15 00:24:47.145329	shopora_uploads/cecvjr0auo90eks7dnt3
\.


--
-- TOC entry 5032 (class 0 OID 66983)
-- Dependencies: 233
-- Data for Name: cart; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cart (id, user_id, product_id, quantity, created_at) FROM stdin;
\.


--
-- TOC entry 5025 (class 0 OID 58775)
-- Dependencies: 226
-- Data for Name: new_arrival_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.new_arrival_card (id, product_id, created) FROM stdin;
917853dd-d6b2-4155-8324-7b4b841b41d1	e0e9cc76-4522-4e26-b0fa-fb1b80514086	2025-06-17 05:21:16.208037
cb6d74e3-6a86-4c52-b26a-224941d72cd9	7a7d12ee-b78d-474d-afa0-3e9623c80b95	2025-06-17 19:19:07.743102
4beda885-27fb-424e-9c87-f0bddce7ac7c	f42e9221-3da1-4024-8920-89e1ca1f3ac7	2025-06-17 19:19:19.411276
777092e0-5f05-4283-85eb-1d127ac928ce	f628908d-7726-4921-be83-21f6d9047e8c	2025-06-17 19:20:46.901616
739fa741-1dc5-4c12-91c6-3c13091ff9c9	b3063a27-26af-4214-8cb2-e479381ada40	2025-06-17 19:20:53.935955
f6b4884d-5d34-4fa4-a48b-ef4af46af082	3d49a49c-3d5c-4e25-9b12-766f5f4b0f3b	2025-06-17 19:21:00.624725
\.


--
-- TOC entry 5026 (class 0 OID 58781)
-- Dependencies: 227
-- Data for Name: new_bestselling_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.new_bestselling_card (id, product_id, created) FROM stdin;
d6496fc6-d2c7-4632-9f50-404bd8fe4e8e	b3063a27-26af-4214-8cb2-e479381ada40	2025-06-17 19:19:30.838894
832c34a5-b3cb-4ae6-8450-a823951f9418	f628908d-7726-4921-be83-21f6d9047e8c	2025-06-17 19:19:34.415368
03c52b4a-ef28-4f9c-9129-811e9a419625	85ce5a1a-cad9-4efa-a4be-9bddc01ff703	2025-06-17 19:19:40.498288
\.


--
-- TOC entry 5027 (class 0 OID 58787)
-- Dependencies: 228
-- Data for Name: new_toprated_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.new_toprated_card (id, product_id, created) FROM stdin;
df2e2032-8ceb-4419-bac7-9de48a81e8ba	e0e9cc76-4522-4e26-b0fa-fb1b80514086	2025-06-17 19:19:52.114436
969e034a-eb88-491e-b7d6-6a01bbf67fea	41aab7ba-7bfc-48fb-9b0a-05d3020e2c56	2025-06-17 19:20:03.419125
b4e96e17-48a3-479b-94ec-fc976541e39b	f628908d-7726-4921-be83-21f6d9047e8c	2025-06-17 19:20:09.306025
\.


--
-- TOC entry 5028 (class 0 OID 66924)
-- Dependencies: 229
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, order_id, product_id, quantity, price) FROM stdin;
88029cda-0773-4f07-ab90-00f542254a82	5faf14e1-d5a2-47b5-834b-9ef3752cb7af	033e4c00-1ca5-4114-b8c4-5b929bac2c62	1	4588
9e21f609-46aa-4f0c-8322-6c0350bb155e	cff127ed-1451-4ab4-b147-76dd660629c0	1958ede1-c782-4373-822e-03688748682c	1	112075
4625f28c-5039-4199-b829-671a15813b9b	d3a00109-f4c6-4f21-b458-eb85f46f61ee	9f55a350-b151-4890-9524-2dd4be51a5ba	1	14575
28d3b917-5c61-4ca8-9104-9ac02775da5f	c28dcce2-24ee-4b5d-a85c-90fea2835728	033e4c00-1ca5-4114-b8c4-5b929bac2c62	1	4588
abbf5f93-785d-4782-be0e-3011c84cb2d3	e442a64c-b5db-4ad9-adb6-9b15e66f5027	033e4c00-1ca5-4114-b8c4-5b929bac2c62	1	4588
a72312b1-28e3-4b78-9a90-a0228656930a	4298d2c7-a233-44d7-b535-ef8332ea971f	e0e9cc76-4522-4e26-b0fa-fb1b80514086	1	2578
71aa50a0-33a2-4aad-a649-f6f0ca466bd8	4298d2c7-a233-44d7-b535-ef8332ea971f	b3063a27-26af-4214-8cb2-e479381ada40	3	7599
\.


--
-- TOC entry 5029 (class 0 OID 66931)
-- Dependencies: 230
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, full_name, phone, shipping_address, stripe_session_id, created_at, note, payment_method, status, total, tracking_id) FROM stdin;
5faf14e1-d5a2-47b5-834b-9ef3752cb7af	20a56d03-d645-4527-a5c0-c367417cc034	Mahmudul H. Sakib	453535	Narayanganj, Narayanganj, 1430	\N	2025-06-17 04:23:53.59+06		cod	Completed	4588	2bcc942c-16f9-4e72-aea3-947880821e3e
cff127ed-1451-4ab4-b147-76dd660629c0	20a56d03-d645-4527-a5c0-c367417cc034	Mahmudul H. Sakib	4523535	Narayanganj, Narayanganj, 1430	\N	2025-06-17 04:30:34.793+06		cod	Shipped	112075	93732fdb-29c4-4c2d-8e48-4c323f922621
d3a00109-f4c6-4f21-b458-eb85f46f61ee	20a56d03-d645-4527-a5c0-c367417cc034	Mahmudul H. Sakib	3453535	Narayanganj, Narayanganj, 1430	\N	2025-06-17 04:40:53.908+06		cod	Cancelled	14575	a26f1a20-6555-41e7-8dc3-30474446d473
c28dcce2-24ee-4b5d-a85c-90fea2835728	20a56d03-d645-4527-a5c0-c367417cc034	Mahmudul H. Sakib	356465	Narayanganj, Narayanganj, 1430	\N	2025-06-17 04:44:57.715+06		cod	placed	4588	460a31b5-bc74-438c-8363-a9617639eae7
e442a64c-b5db-4ad9-adb6-9b15e66f5027	8b9fe695-0af2-43d2-8ac7-26a377eac8b6	Ara	23453535	Narayanganj, Narayanganj, 1430	\N	2025-06-17 04:45:57.062+06		cod	Shipped	4588	38ee45ee-722c-4548-94de-1e7d60f2d7a0
4298d2c7-a233-44d7-b535-ef8332ea971f	20a56d03-d645-4527-a5c0-c367417cc034	Mahmudul H. Sakib	0132222222	Narayanganj, Narayanganj, 1430	cs_test_b10Dari4G0AZOjuorVCvo4lNRTvj29q4pJCh2Al7uNZ9z0ZIFBfLMSrD0E	2025-06-17 19:45:11.777+06		stripe	Order Received	25375	390490d6-9a98-468b-b0f4-435d18582b4c
\.


--
-- TOC entry 5021 (class 0 OID 58700)
-- Dependencies: 222
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, "productName", price, details, "imageUrl", "videoUrl", created, category, "imagePublicId", "videoPublicId") FROM stdin;
9f55a350-b151-4890-9524-2dd4be51a5ba	Shopora Bag	145.75	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1749831222/shopora_product/asr1hb5euvgdpvyhsaac.png	\N	2025-06-13 22:13:45.068297	Women	shopora_product/asr1hb5euvgdpvyhsaac	\N
033e4c00-1ca5-4114-b8c4-5b929bac2c62	Shopora Watch	45.88	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1749831259/shopora_product/dct9kk1d9udcgtvjv1go.jpg	\N	2025-06-13 22:14:22.477896	Watch	shopora_product/dct9kk1d9udcgtvjv1go	\N
1958ede1-c782-4373-822e-03688748682c	Apple Watch	1120.75	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1749831309/shopora_product/u7pwmqwdtu9ssmkhpr9n.jpg	\N	2025-06-13 22:15:12.371546	Technology	shopora_product/u7pwmqwdtu9ssmkhpr9n	\N
e0e9cc76-4522-4e26-b0fa-fb1b80514086	Shopora Earbud	25.78	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1750115936/shopora_product/eagujitdmp1twuamk1ux.jpg	\N	2025-06-17 05:18:57.103478	Earbuds	shopora_product/eagujitdmp1twuamk1ux	\N
f42e9221-3da1-4024-8920-89e1ca1f3ac7	Shopora Women Bag	123.79	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1750116039/shopora_product/fvhsl8kgvyzis2iawpnq.jpg	\N	2025-06-17 05:20:40.040662	Women	shopora_product/fvhsl8kgvyzis2iawpnq	\N
634b3e18-5c96-4ee1-b095-f7672ccbb29d	Shopora Smart Watch	128.77	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1750165614/shopora_product/vingdfmjqh7i6wgewpoe.jpg	\N	2025-06-17 19:06:54.971565	Smart Watch	shopora_product/vingdfmjqh7i6wgewpoe	\N
3d49a49c-3d5c-4e25-9b12-766f5f4b0f3b	Ladies Jacket	225.99	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1750165735/shopora_product/ivlvsqcy8usuybisdw5j.jpg	\N	2025-06-17 19:08:56.661948	Women's Wear	shopora_product/ivlvsqcy8usuybisdw5j	\N
85ce5a1a-cad9-4efa-a4be-9bddc01ff703	Denim Jacket	98.99	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1750165773/shopora_product/zbh2oeg3lea83sj7iwu3.jpg	\N	2025-06-17 19:07:58.892802	Men's Wear	shopora_product/zbh2oeg3lea83sj7iwu3	\N
f628908d-7726-4921-be83-21f6d9047e8c	Women T-shirt	96.99	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1750165848/shopora_product/ibxsgexxtvii3b6iiahh.jpg	\N	2025-06-17 19:10:49.00754	Women's Wear	shopora_product/ibxsgexxtvii3b6iiahh	\N
7a7d12ee-b78d-474d-afa0-3e9623c80b95	Denim Pants	110.99	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1750165951/shopora_product/adfoyrxxi0cozj6hqgxu.jpg	\N	2025-06-17 19:12:03.592992	Women's Wear	shopora_product/adfoyrxxi0cozj6hqgxu	\N
b3063a27-26af-4214-8cb2-e479381ada40	Woment Castillo	75.99	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1750166040/shopora_product/spnywrv0m1ivct6ojxhc.jpg	\N	2025-06-17 19:14:01.225173	Women's Wear	shopora_product/spnywrv0m1ivct6ojxhc	\N
41aab7ba-7bfc-48fb-9b0a-05d3020e2c56	Shopora Women Shoe	884.99	Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.	https://res.cloudinary.com/dclfdubgy/image/upload/v1750166133/shopora_product/tys5meqx5w3dq7spdahm.jpg	\N	2025-06-17 19:15:34.769417	Women Shoe	shopora_product/tys5meqx5w3dq7spdahm	\N
\.


--
-- TOC entry 5022 (class 0 OID 58732)
-- Dependencies: 223
-- Data for Name: products_carousel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_carousel (id, product_id, created) FROM stdin;
588a3e7f-0fac-4eea-8202-ab4f75580509	9f55a350-b151-4890-9524-2dd4be51a5ba	2025-06-13 22:34:14.587319
ddd65ad0-92d9-48df-8b8f-d951af4dba18	1958ede1-c782-4373-822e-03688748682c	2025-06-13 22:34:19.823188
1bed0d0d-de32-4342-8d78-76affafd7f97	033e4c00-1ca5-4114-b8c4-5b929bac2c62	2025-06-13 22:34:23.551382
2ffe9030-f166-47ad-8c17-fbc6a0980ce4	f42e9221-3da1-4024-8920-89e1ca1f3ac7	2025-06-17 05:20:53.942297
46eee13f-e31a-477b-a6ed-508a617f3d08	41aab7ba-7bfc-48fb-9b0a-05d3020e2c56	2025-06-17 19:16:54.720764
7a73a1f0-f7af-4fe9-b619-1c2ef506760a	b3063a27-26af-4214-8cb2-e479381ada40	2025-06-17 19:17:00.600619
5a2c55a3-1caf-412d-869d-2cdc8b1570a4	7a7d12ee-b78d-474d-afa0-3e9623c80b95	2025-06-17 19:17:31.594332
\.


--
-- TOC entry 5024 (class 0 OID 58749)
-- Dependencies: 225
-- Data for Name: products_carousel_three; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_carousel_three (id, product_id, created) FROM stdin;
b6b867c8-06d1-406a-8c92-c1584f3cff76	033e4c00-1ca5-4114-b8c4-5b929bac2c62	2025-06-13 22:15:56.056776
38d949d1-8494-43f0-8d74-e437637c2492	9f55a350-b151-4890-9524-2dd4be51a5ba	2025-06-13 22:16:00.644325
3b9904b1-f946-4452-98b8-836dc8198c37	634b3e18-5c96-4ee1-b095-f7672ccbb29d	2025-06-17 19:18:28.406148
53d62463-bafa-4084-a258-80bb85b0e67b	b3063a27-26af-4214-8cb2-e479381ada40	2025-06-17 19:18:32.2202
cefed3f5-ab12-4d4d-a5c1-77286eed07c5	41aab7ba-7bfc-48fb-9b0a-05d3020e2c56	2025-06-17 19:18:50.933918
bcf833a9-c286-4273-8e40-9c0871902fc1	f628908d-7726-4921-be83-21f6d9047e8c	2025-06-17 19:21:37.934945
\.


--
-- TOC entry 5023 (class 0 OID 58743)
-- Dependencies: 224
-- Data for Name: products_carousel_two; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products_carousel_two (id, product_id, created) FROM stdin;
c5c39326-5c78-41a8-919e-a53f08030763	9f55a350-b151-4890-9524-2dd4be51a5ba	2025-06-13 22:16:26.49086
2feb85e7-1874-43cd-9c00-a35cfa49cad9	1958ede1-c782-4373-822e-03688748682c	2025-06-13 22:16:28.41005
aa970034-f554-42c8-ba0d-3b20d898af8c	3d49a49c-3d5c-4e25-9b12-766f5f4b0f3b	2025-06-17 19:17:41.950882
b4f05fca-64bb-4f65-a9ae-89b4a86e7316	e0e9cc76-4522-4e26-b0fa-fb1b80514086	2025-06-17 19:17:46.084209
6c2312bd-5258-4a37-a44c-9126493b0a7b	f628908d-7726-4921-be83-21f6d9047e8c	2025-06-17 19:17:50.159787
6784be49-9e1b-422a-afa1-3884865c7a2d	85ce5a1a-cad9-4efa-a4be-9bddc01ff703	2025-06-17 19:17:58.475096
c0509114-4958-4235-9d2d-90826df0ee5c	f42e9221-3da1-4024-8920-89e1ca1f3ac7	2025-06-17 19:18:14.502436
\.


--
-- TOC entry 5030 (class 0 OID 66941)
-- Dependencies: 231
-- Data for Name: public_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.public_user (id, email, password, created_at) FROM stdin;
20a56d03-d645-4527-a5c0-c367417cc034	mahmudulsakib.110@gmail.com	$2b$10$hj0C5fLCPCulXvDhvcODceCaV6/eahghS3adA2s3zcAuXXEaZzJy2	2025-06-15 21:22:36.249941
8b9fe695-0af2-43d2-8ac7-26a377eac8b6	aramahmud@gmail.com	$2b$10$0g28Cp8fjeqpQGB6pOaJMeIUh48okBZQvO1YWH8Oih3gtj8PFQV2q	2025-06-16 21:43:38.858382
\.


--
-- TOC entry 5033 (class 0 OID 67026)
-- Dependencies: 234
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (id, product_id, user_id, rating, comment, created_at) FROM stdin;
027825fa-87cd-4eb7-853b-0e612f1503b6	f42e9221-3da1-4024-8920-89e1ca1f3ac7	20a56d03-d645-4527-a5c0-c367417cc034	5	Cool Parse !!!	2025-06-17 19:52:12.405207+06
\.


--
-- TOC entry 5031 (class 0 OID 66950)
-- Dependencies: 232
-- Data for Name: shipping_addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_addresses (id, user_id, full_name, address_line_1, address_line_2, city, postal_code, country, phone) FROM stdin;
66715a34-b755-451e-999c-144a05f2ebbd	20a56d03-d645-4527-a5c0-c367417cc034	Mahmudul H. Sakib	Narayanganj	\N	N/A	N/A	N/A	01524585
\.


--
-- TOC entry 5040 (class 0 OID 0)
-- Dependencies: 218
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE SET; Schema: drizzle; Owner: postgres
--

SELECT pg_catalog.setval('drizzle.__drizzle_migrations_id_seq', 6, true);


--
-- TOC entry 4828 (class 2606 OID 50499)
-- Name: __drizzle_migrations __drizzle_migrations_pkey; Type: CONSTRAINT; Schema: drizzle; Owner: postgres
--

ALTER TABLE ONLY drizzle.__drizzle_migrations
    ADD CONSTRAINT __drizzle_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 4830 (class 2606 OID 58690)
-- Name: admin admin_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_id_unique PRIMARY KEY (id);


--
-- TOC entry 4856 (class 2606 OID 66990)
-- Name: cart cart_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (id);


--
-- TOC entry 4832 (class 2606 OID 58699)
-- Name: carousel_image image_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carousel_image
    ADD CONSTRAINT image_id_unique PRIMARY KEY (id);


--
-- TOC entry 4842 (class 2606 OID 58780)
-- Name: new_arrival_card new_arrival_card_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_arrival_card
    ADD CONSTRAINT new_arrival_card_id_unique PRIMARY KEY (id);


--
-- TOC entry 4844 (class 2606 OID 58786)
-- Name: new_bestselling_card new_bestselling_card_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_bestselling_card
    ADD CONSTRAINT new_bestselling_card_id_unique PRIMARY KEY (id);


--
-- TOC entry 4846 (class 2606 OID 58792)
-- Name: new_toprated_card new_toprated_card_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_toprated_card
    ADD CONSTRAINT new_toprated_card_id_unique PRIMARY KEY (id);


--
-- TOC entry 4848 (class 2606 OID 66930)
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- TOC entry 4850 (class 2606 OID 66940)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 4836 (class 2606 OID 58737)
-- Name: products_carousel products_carousel_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_carousel
    ADD CONSTRAINT products_carousel_id_unique PRIMARY KEY (id);


--
-- TOC entry 4840 (class 2606 OID 58754)
-- Name: products_carousel_three products_carousel_three_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_carousel_three
    ADD CONSTRAINT products_carousel_three_id_unique PRIMARY KEY (id);


--
-- TOC entry 4838 (class 2606 OID 58748)
-- Name: products_carousel_two products_carousel_two_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_carousel_two
    ADD CONSTRAINT products_carousel_two_id_unique PRIMARY KEY (id);


--
-- TOC entry 4834 (class 2606 OID 58707)
-- Name: products products_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_id_unique PRIMARY KEY (id);


--
-- TOC entry 4852 (class 2606 OID 66949)
-- Name: public_user public_user_id_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.public_user
    ADD CONSTRAINT public_user_id_unique PRIMARY KEY (id);


--
-- TOC entry 4858 (class 2606 OID 67034)
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- TOC entry 4854 (class 2606 OID 66957)
-- Name: shipping_addresses shipping_addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_addresses
    ADD CONSTRAINT shipping_addresses_pkey PRIMARY KEY (id);


--
-- TOC entry 4868 (class 2606 OID 66996)
-- Name: cart cart_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4869 (class 2606 OID 66991)
-- Name: cart cart_user_id_public_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_user_id_public_user_id_fk FOREIGN KEY (user_id) REFERENCES public.public_user(id);


--
-- TOC entry 4862 (class 2606 OID 67050)
-- Name: new_arrival_card new_arrival_card_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_arrival_card
    ADD CONSTRAINT new_arrival_card_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4863 (class 2606 OID 67055)
-- Name: new_bestselling_card new_bestselling_card_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_bestselling_card
    ADD CONSTRAINT new_bestselling_card_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4864 (class 2606 OID 67060)
-- Name: new_toprated_card new_toprated_card_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_toprated_card
    ADD CONSTRAINT new_toprated_card_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4865 (class 2606 OID 67021)
-- Name: order_items order_items_order_id_orders_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_orders_id_fk FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- TOC entry 4866 (class 2606 OID 66963)
-- Name: order_items order_items_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- TOC entry 4859 (class 2606 OID 67045)
-- Name: products_carousel products_carousel_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_carousel
    ADD CONSTRAINT products_carousel_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4861 (class 2606 OID 67070)
-- Name: products_carousel_three products_carousel_three_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_carousel_three
    ADD CONSTRAINT products_carousel_three_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4860 (class 2606 OID 67065)
-- Name: products_carousel_two products_carousel_two_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products_carousel_two
    ADD CONSTRAINT products_carousel_two_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4870 (class 2606 OID 67035)
-- Name: reviews reviews_product_id_products_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_product_id_products_id_fk FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- TOC entry 4871 (class 2606 OID 67040)
-- Name: reviews reviews_user_id_public_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_user_id_public_user_id_fk FOREIGN KEY (user_id) REFERENCES public.public_user(id) ON DELETE CASCADE;


--
-- TOC entry 4867 (class 2606 OID 66978)
-- Name: shipping_addresses shipping_addresses_user_id_public_user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_addresses
    ADD CONSTRAINT shipping_addresses_user_id_public_user_id_fk FOREIGN KEY (user_id) REFERENCES public.public_user(id);


-- Completed on 2025-06-25 20:39:10

--
-- PostgreSQL database dump complete
--

