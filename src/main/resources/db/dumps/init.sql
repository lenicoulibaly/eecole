--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

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
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


--
-- Name: strip_accents(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.strip_accents(text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
SELECT unaccent($1);
$_$;


ALTER FUNCTION public.strip_accents(text) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: account_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_token (
    already_used boolean NOT NULL,
    email_sent boolean NOT NULL,
    is_deleted boolean,
    agent_id bigint,
    created_at timestamp(6) without time zone,
    creation_date timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    expiration_date timestamp(6) without time zone,
    token_id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    usage_date timestamp(6) without time zone,
    user_user_id bigint,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255),
    password character varying(255),
    token character varying(255)
);


ALTER TABLE public.account_token OWNER TO postgres;

--
-- Name: annee_scolaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annee_scolaire (
    annee bigint NOT NULL,
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.annee_scolaire OWNER TO postgres;

--
-- Name: annee_scolaire_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.annee_scolaire_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annee_scolaire_seq OWNER TO postgres;

--
-- Name: app_function; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_function (
    ends_at date,
    fnc_status integer NOT NULL,
    is_deleted boolean,
    starts_at date,
    ces_id bigint,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    user_id bigint,
    visibility_id bigint,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255),
    name character varying(255),
    type_id character varying(255)
);


ALTER TABLE public.app_function OWNER TO postgres;

--
-- Name: app_privilege; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_privilege (
    is_deleted boolean,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255),
    privilege_code character varying(255) NOT NULL,
    privilege_name text,
    prv_type_unique_code character varying(255)
);


ALTER TABLE public.app_privilege OWNER TO postgres;

--
-- Name: app_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_role (
    is_deleted boolean,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255),
    prv_authorized_types character varying(255),
    role_code character varying(255) NOT NULL,
    role_name character varying(255)
);


ALTER TABLE public.app_role OWNER TO postgres;

--
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    active boolean NOT NULL,
    date_naissance date,
    is_deleted boolean,
    not_blocked boolean NOT NULL,
    change_password_date timestamp(6) without time zone,
    created_at timestamp(6) without time zone,
    current_function_id bigint,
    deleted_at timestamp(6) without time zone,
    id_ecole bigint,
    updated_at timestamp(6) without time zone,
    user_id bigint NOT NULL,
    created_by character varying(50),
    deleted_by character varying(50),
    num_piece character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255),
    email character varying(255),
    first_name character varying(255),
    genre_code character varying(255),
    last_name character varying(255),
    lieu_naissance character varying(255),
    nationalite_id character varying(255),
    nom_mere character varying(255),
    nom_pere character varying(255),
    password character varying(255),
    statut_sta_code character varying(255),
    tel character varying(255),
    type_piece_code character varying(255),
    type_user_code character varying(255)
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- Name: ass_id_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ass_id_gen
    START WITH 1
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ass_id_gen OWNER TO postgres;

--
-- Name: assignation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignation (
    ass_status integer NOT NULL,
    ends_at date,
    is_deleted boolean,
    starts_at date,
    ass_id bigint NOT NULL,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    fnc_id bigint,
    updated_at timestamp(6) without time zone,
    ass_type character varying(31) NOT NULL,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255),
    prv_id character varying(255),
    role_id character varying(255)
);


ALTER TABLE public.assignation OWNER TO postgres;

--
-- Name: ecole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecole (
    id_ecloe bigint NOT NULL,
    tutelle_id_ecloe bigint,
    adresse character varying(255),
    code_ecole character varying(255),
    code_menet character varying(255),
    email character varying(255),
    fax character varying(255),
    nom_ecole character varying(255),
    sigle_ecole character varying(255),
    situation_geo character varying(255),
    telepohone character varying(255)
);


ALTER TABLE public.ecole OWNER TO postgres;

--
-- Name: ecole_id_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ecole_id_gen
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ecole_id_gen OWNER TO postgres;

--
-- Name: email_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_notification (
    seen boolean NOT NULL,
    sent boolean NOT NULL,
    mail_id bigint NOT NULL,
    sender_user_id bigint,
    sending_date timestamp(6) without time zone,
    email character varying(255),
    mail_message character varying(255),
    mail_object character varying(255),
    system_mail_sender character varying(255),
    token character varying(255),
    username character varying(255)
);


ALTER TABLE public.email_notification OWNER TO postgres;

--
-- Name: fnc_id_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.fnc_id_gen
    START WITH 1
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.fnc_id_gen OWNER TO postgres;

--
-- Name: log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log (
    action_date_time timestamp(6) without time zone,
    func_id bigint,
    id bigint NOT NULL,
    main_action_id bigint,
    user_id bigint,
    error_message character varying(500000),
    stack_trace character varying(500000),
    action character varying(255),
    connection_id character varying(255),
    host_name character varying(255),
    ip_address character varying(255),
    user_email character varying(255),
    mac_address bytea
);


ALTER TABLE public.log OWNER TO postgres;

--
-- Name: log_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_details (
    id bigint NOT NULL,
    log_id bigint,
    new_value character varying(100000),
    old_value character varying(100000),
    column_name character varying(255),
    connection_id character varying(255),
    object_id character varying(255),
    table_name character varying(255)
);


ALTER TABLE public.log_details OWNER TO postgres;

--
-- Name: log_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_details_id_seq OWNER TO postgres;

--
-- Name: log_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.log_details_id_seq OWNED BY public.log_details.id;


--
-- Name: log_id_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.log_id_gen
    START WITH 1
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.log_id_gen OWNER TO postgres;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu (
    prvs_codes_chain character varying(4000),
    menu_code character varying(255) NOT NULL,
    name character varying(255),
    status character varying(255),
    CONSTRAINT menu_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'DELETED'::character varying, 'STORED'::character varying])::text[])))
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: nationalite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nationalite (
    code_pays character varying(255) NOT NULL,
    nationalite character varying(255),
    nom_pays character varying(255)
);


ALTER TABLE public.nationalite OWNER TO postgres;

--
-- Name: notif_id_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notif_id_gen
    START WITH 1
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.notif_id_gen OWNER TO postgres;

--
-- Name: representation_ecole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.representation_ecole (
    id_representation bigint NOT NULL
);


ALTER TABLE public.representation_ecole OWNER TO postgres;

--
-- Name: representation_id_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.representation_id_gen
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.representation_id_gen OWNER TO postgres;

--
-- Name: statut; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statut (
    sta_type smallint,
    created_at timestamp(6) without time zone,
    updated_at timestamp(6) without time zone,
    sta_code character varying(255) NOT NULL,
    sta_libelle character varying(255),
    sta_libelle_long character varying(255),
    CONSTRAINT statut_sta_type_check CHECK (((sta_type >= 0) AND (sta_type <= 5)))
);


ALTER TABLE public.statut OWNER TO postgres;

--
-- Name: token_id_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.token_id_gen
    START WITH 1
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.token_id_gen OWNER TO postgres;

--
-- Name: type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type (
    name character varying(255) NOT NULL,
    object_folder character varying(255),
    status character varying(255),
    type_group character varying(255),
    unique_code character varying(255) NOT NULL,
    CONSTRAINT type_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'DELETED'::character varying, 'STORED'::character varying])::text[]))),
    CONSTRAINT type_type_group_check CHECK (((type_group)::text = ANY ((ARRAY['TYPE_REP'::character varying, 'TYPE_AFFAIRE'::character varying, 'TYPE_CED'::character varying, 'TYPE_REGLEMENT'::character varying, 'TYPE_BORDEREAU'::character varying, 'MOUVEMENT'::character varying, 'TYPE_PRV'::character varying, 'DOCUMENT'::character varying, 'CESSIONNAIRE'::character varying, 'MODE_REGLEMENT'::character varying, 'TYPE_PCL'::character varying])::text[])))
);


ALTER TABLE public.type OWNER TO postgres;

--
-- Name: type_id_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.type_id_gen
    START WITH 1
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_id_gen OWNER TO postgres;

--
-- Name: type_param; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_param (
    type_param_id bigint NOT NULL,
    child_code character varying(255),
    parent_code character varying(255),
    status character varying(255),
    CONSTRAINT type_param_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'DELETED'::character varying, 'STORED'::character varying])::text[])))
);


ALTER TABLE public.type_param OWNER TO postgres;

--
-- Name: user_id_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_id_gen
    START WITH 1
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id_gen OWNER TO postgres;

--
-- Name: log_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_details ALTER COLUMN id SET DEFAULT nextval('public.log_details_id_seq'::regclass);


--
-- Data for Name: account_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_token (already_used, email_sent, is_deleted, agent_id, created_at, creation_date, deleted_at, expiration_date, token_id, updated_at, usage_date, user_user_id, created_by, deleted_by, updated_by, action, connection_id, password, token) FROM stdin;
\.


--
-- Data for Name: annee_scolaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annee_scolaire (annee, id, name) FROM stdin;
\.


--
-- Data for Name: app_function; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_function (ends_at, fnc_status, is_deleted, starts_at, ces_id, created_at, deleted_at, id, updated_at, user_id, visibility_id, created_by, deleted_by, updated_by, action, connection_id, name, type_id) FROM stdin;
\.


--
-- Data for Name: app_privilege; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_privilege (is_deleted, created_at, deleted_at, updated_at, created_by, deleted_by, updated_by, action, connection_id, privilege_code, privilege_name, prv_type_unique_code) FROM stdin;
\.


--
-- Data for Name: app_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_role (is_deleted, created_at, deleted_at, updated_at, created_by, deleted_by, updated_by, action, connection_id, prv_authorized_types, role_code, role_name) FROM stdin;
\.


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user (active, date_naissance, is_deleted, not_blocked, change_password_date, created_at, current_function_id, deleted_at, id_ecole, updated_at, user_id, created_by, deleted_by, num_piece, updated_by, action, connection_id, email, first_name, genre_code, last_name, lieu_naissance, nationalite_id, nom_mere, nom_pere, password, statut_sta_code, tel, type_piece_code, type_user_code) FROM stdin;
\.


--
-- Data for Name: assignation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assignation (ass_status, ends_at, is_deleted, starts_at, ass_id, created_at, deleted_at, fnc_id, updated_at, ass_type, created_by, deleted_by, updated_by, action, connection_id, prv_id, role_id) FROM stdin;
\.


--
-- Data for Name: ecole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecole (id_ecloe, tutelle_id_ecloe, adresse, code_ecole, code_menet, email, fax, nom_ecole, sigle_ecole, situation_geo, telepohone) FROM stdin;
\.


--
-- Data for Name: email_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_notification (seen, sent, mail_id, sender_user_id, sending_date, email, mail_message, mail_object, system_mail_sender, token, username) FROM stdin;
\.


--
-- Data for Name: log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log (action_date_time, func_id, id, main_action_id, user_id, error_message, stack_trace, action, connection_id, host_name, ip_address, user_email, mac_address) FROM stdin;
\.


--
-- Data for Name: log_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_details (id, log_id, new_value, old_value, column_name, connection_id, object_id, table_name) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (prvs_codes_chain, menu_code, name, status) FROM stdin;
\.


--
-- Data for Name: nationalite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nationalite (code_pays, nationalite, nom_pays) FROM stdin;
\.


--
-- Data for Name: representation_ecole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.representation_ecole (id_representation) FROM stdin;
\.


--
-- Data for Name: statut; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statut (sta_type, created_at, updated_at, sta_code, sta_libelle, sta_libelle_long) FROM stdin;
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type (name, object_folder, status, type_group, unique_code) FROM stdin;
\.


--
-- Data for Name: type_param; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_param (type_param_id, child_code, parent_code, status) FROM stdin;
\.


--
-- Name: annee_scolaire_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annee_scolaire_seq', 1, false);


--
-- Name: ass_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ass_id_gen', 1, false);


--
-- Name: ecole_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ecole_id_gen', 1, false);


--
-- Name: fnc_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fnc_id_gen', 1, false);


--
-- Name: log_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_details_id_seq', 1, false);


--
-- Name: log_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_id_gen', 1, false);


--
-- Name: notif_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notif_id_gen', 1, false);


--
-- Name: representation_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.representation_id_gen', 1, false);


--
-- Name: token_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_id_gen', 1, false);


--
-- Name: type_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_id_gen', 1, false);


--
-- Name: user_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_gen', 1, false);


--
-- Name: account_token account_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_token
    ADD CONSTRAINT account_token_pkey PRIMARY KEY (token_id);


--
-- Name: account_token account_token_token_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_token
    ADD CONSTRAINT account_token_token_key UNIQUE (token);


--
-- Name: annee_scolaire annee_scolaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annee_scolaire
    ADD CONSTRAINT annee_scolaire_pkey PRIMARY KEY (id);


--
-- Name: app_function app_function_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_function
    ADD CONSTRAINT app_function_pkey PRIMARY KEY (id);


--
-- Name: app_privilege app_privilege_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_privilege
    ADD CONSTRAINT app_privilege_pkey PRIMARY KEY (privilege_code);


--
-- Name: app_privilege app_privilege_privilege_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_privilege
    ADD CONSTRAINT app_privilege_privilege_name_key UNIQUE (privilege_name);


--
-- Name: app_role app_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_role
    ADD CONSTRAINT app_role_pkey PRIMARY KEY (role_code);


--
-- Name: app_role app_role_role_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_role
    ADD CONSTRAINT app_role_role_name_key UNIQUE (role_name);


--
-- Name: app_user app_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_email_key UNIQUE (email);


--
-- Name: app_user app_user_num_piece_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_num_piece_key UNIQUE (num_piece);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (user_id);


--
-- Name: app_user app_user_tel_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_tel_key UNIQUE (tel);


--
-- Name: assignation assignation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignation
    ADD CONSTRAINT assignation_pkey PRIMARY KEY (ass_id);


--
-- Name: ecole ecole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecole
    ADD CONSTRAINT ecole_pkey PRIMARY KEY (id_ecloe);


--
-- Name: email_notification email_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_notification
    ADD CONSTRAINT email_notification_pkey PRIMARY KEY (mail_id);


--
-- Name: log_details log_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_details
    ADD CONSTRAINT log_details_pkey PRIMARY KEY (id);


--
-- Name: log log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT log_pkey PRIMARY KEY (id);


--
-- Name: menu menu_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_name_key UNIQUE (name);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menu_code);


--
-- Name: nationalite nationalite_nationalite_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalite
    ADD CONSTRAINT nationalite_nationalite_key UNIQUE (nationalite);


--
-- Name: nationalite nationalite_nom_pays_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalite
    ADD CONSTRAINT nationalite_nom_pays_key UNIQUE (nom_pays);


--
-- Name: nationalite nationalite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalite
    ADD CONSTRAINT nationalite_pkey PRIMARY KEY (code_pays);


--
-- Name: representation_ecole representation_ecole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.representation_ecole
    ADD CONSTRAINT representation_ecole_pkey PRIMARY KEY (id_representation);


--
-- Name: statut statut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statut
    ADD CONSTRAINT statut_pkey PRIMARY KEY (sta_code);


--
-- Name: type_param type_param_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_param
    ADD CONSTRAINT type_param_pkey PRIMARY KEY (type_param_id);


--
-- Name: type type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type
    ADD CONSTRAINT type_pkey PRIMARY KEY (unique_code);


--
-- Name: assignation fk1bn3jvr0wy2col5fgkfx52un6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignation
    ADD CONSTRAINT fk1bn3jvr0wy2col5fgkfx52un6 FOREIGN KEY (prv_id) REFERENCES public.app_privilege(privilege_code);


--
-- Name: app_user fk30rp71gbed0dudi7i5udr6uxe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fk30rp71gbed0dudi7i5udr6uxe FOREIGN KEY (nationalite_id) REFERENCES public.nationalite(code_pays);


--
-- Name: type_param fk3bhf23bb6iabg3pmmurgjfj69; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_param
    ADD CONSTRAINT fk3bhf23bb6iabg3pmmurgjfj69 FOREIGN KEY (child_code) REFERENCES public.type(unique_code);


--
-- Name: account_token fk40e2pm1x283k9g36vx92g00og; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_token
    ADD CONSTRAINT fk40e2pm1x283k9g36vx92g00og FOREIGN KEY (user_user_id) REFERENCES public.app_user(user_id);


--
-- Name: ecole fk4aljl1os2yh7u812x4wdqx1o0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecole
    ADD CONSTRAINT fk4aljl1os2yh7u812x4wdqx1o0 FOREIGN KEY (tutelle_id_ecloe) REFERENCES public.ecole(id_ecloe);


--
-- Name: app_user fk9xgn3i07uwx367pemmfybcvy4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fk9xgn3i07uwx367pemmfybcvy4 FOREIGN KEY (type_user_code) REFERENCES public.type(unique_code);


--
-- Name: app_privilege fkdq1812gw03u1pqtm18xn9bf2d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_privilege
    ADD CONSTRAINT fkdq1812gw03u1pqtm18xn9bf2d FOREIGN KEY (prv_type_unique_code) REFERENCES public.type(unique_code);


--
-- Name: assignation fkeg32gf0ccaore0fh57rda9m44; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignation
    ADD CONSTRAINT fkeg32gf0ccaore0fh57rda9m44 FOREIGN KEY (role_id) REFERENCES public.app_role(role_code);


--
-- Name: app_user fkfabgwkyabw3ykiwmfilssxop2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fkfabgwkyabw3ykiwmfilssxop2 FOREIGN KEY (statut_sta_code) REFERENCES public.statut(sta_code);


--
-- Name: app_user fkfv15tlvw8p5gj6ui9vxjjydp9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fkfv15tlvw8p5gj6ui9vxjjydp9 FOREIGN KEY (type_piece_code) REFERENCES public.type(unique_code);


--
-- Name: app_user fkgkxrj54xv9tnvovogfxk13p55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fkgkxrj54xv9tnvovogfxk13p55 FOREIGN KEY (genre_code) REFERENCES public.type(unique_code);


--
-- Name: assignation fkhwktl14p2iqlwp54mf0o78iii; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignation
    ADD CONSTRAINT fkhwktl14p2iqlwp54mf0o78iii FOREIGN KEY (fnc_id) REFERENCES public.app_function(id);


--
-- Name: app_function fki0dn2ecqea1e07yai1l2r2ok3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_function
    ADD CONSTRAINT fki0dn2ecqea1e07yai1l2r2ok3 FOREIGN KEY (type_id) REFERENCES public.type(unique_code);


--
-- Name: log_details fkjwxihril8uh9qojh0a3lupdhh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_details
    ADD CONSTRAINT fkjwxihril8uh9qojh0a3lupdhh FOREIGN KEY (log_id) REFERENCES public.log(id);


--
-- Name: app_user fkme21gyicp9iijn8fogv4b7hv1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fkme21gyicp9iijn8fogv4b7hv1 FOREIGN KEY (id_ecole) REFERENCES public.ecole(id_ecloe);


--
-- Name: type_param fkmxixkkur638ehwjj6p0ibpjad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_param
    ADD CONSTRAINT fkmxixkkur638ehwjj6p0ibpjad FOREIGN KEY (parent_code) REFERENCES public.type(unique_code);


--
-- Name: log fkntm4nyfqvq3gqs1m3scak5v4t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log
    ADD CONSTRAINT fkntm4nyfqvq3gqs1m3scak5v4t FOREIGN KEY (func_id) REFERENCES public.app_function(id);


--
-- Name: app_function fkntt2700y34edhunqxum92dmg3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_function
    ADD CONSTRAINT fkntt2700y34edhunqxum92dmg3 FOREIGN KEY (user_id) REFERENCES public.app_user(user_id);


--
-- PostgreSQL database dump complete
--

