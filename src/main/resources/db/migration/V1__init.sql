CREATE DATABASE eecole WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_Côte d''Ivoire.1252';
ALTER DATABASE eecole OWNER TO postgres;

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


CREATE FUNCTION public.strip_accents(text) RETURNS text
    LANGUAGE sql IMMUTABLE
    AS $_$
SELECT unaccent($1);
$_$;


ALTER FUNCTION public.strip_accents(text) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;


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


CREATE TABLE public.annee_scolaire (
    is_deleted boolean,
    annee_de_debut bigint NOT NULL,
    annee_de_fin bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    deleted_by character varying(50),
    libelle_annee character varying(255)
);


ALTER TABLE public.annee_scolaire OWNER TO postgres;


CREATE SEQUENCE public.annee_scolaire_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.annee_scolaire_seq OWNER TO postgres;

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
-- Name: classe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classe (
    is_deleted boolean,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    id_ecole bigint,
    id_filiere bigint,
    deleted_by character varying(50),
    nom_classe character varying(255)
);


ALTER TABLE public.classe OWNER TO postgres;

--
-- Name: cours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cours (
    id bigint NOT NULL
);


ALTER TABLE public.cours OWNER TO postgres;

--
-- Name: cours_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cours_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cours_seq OWNER TO postgres;

--
-- Name: cycle_etude; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cycle_etude (
    is_deleted boolean,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    rang_cycle_etude bigint NOT NULL,
    deleted_by character varying(50),
    nom_cycle_etude character varying(255)
);


ALTER TABLE public.cycle_etude OWNER TO postgres;

--
-- Name: echeance_paiement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.echeance_paiement (
    is_deleted boolean,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255)
);


ALTER TABLE public.echeance_paiement OWNER TO postgres;

--
-- Name: echeance_paiement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.echeance_paiement_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.echeance_paiement_seq OWNER TO postgres;

--
-- Name: echeancier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.echeancier (
    is_deleted boolean,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255)
);


ALTER TABLE public.echeancier OWNER TO postgres;

--
-- Name: echeancier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.echeancier_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.echeancier_seq OWNER TO postgres;

--
-- Name: ecole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecole (
    is_deleted boolean,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    id_tutelle bigint,
    updated_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    adresse character varying(255),
    code_ecole character varying(255),
    code_menet character varying(255),
    code_type_ecole character varying(255),
    connection_id character varying(255),
    email character varying(255),
    fax character varying(255),
    nom_ecole character varying(255),
    sigle_ecole character varying(255),
    situation_geo character varying(255),
    tel character varying(255)
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
-- Name: enseignement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enseignement (
    id bigint NOT NULL
);


ALTER TABLE public.enseignement OWNER TO postgres;

--
-- Name: enseignement_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enseignement_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.enseignement_seq OWNER TO postgres;

--
-- Name: evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluation (
    is_deleted boolean,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255)
);


ALTER TABLE public.evaluation OWNER TO postgres;

--
-- Name: evaluation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evaluation_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.evaluation_seq OWNER TO postgres;

--
-- Name: filiere; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filiere (
    is_deleted boolean,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    deleted_by character varying(50),
    domaine character varying(255),
    nom_filiere character varying(255)
);


ALTER TABLE public.filiere OWNER TO postgres;

--
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

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
-- Name: id_classe_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_classe_gen
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_classe_gen OWNER TO postgres;

--
-- Name: id_cycle_etude_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_cycle_etude_gen
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_cycle_etude_gen OWNER TO postgres;

--
-- Name: id_ecole_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_ecole_gen
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_ecole_gen OWNER TO postgres;

--
-- Name: id_filiere_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_filiere_gen
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_filiere_gen OWNER TO postgres;

--
-- Name: id_niveau_etude_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_niveau_etude_gen
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_niveau_etude_gen OWNER TO postgres;

--
-- Name: id_unite_de_classe_gen; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_unite_de_classe_gen
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_unite_de_classe_gen OWNER TO postgres;

--
-- Name: inscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscription (
    is_deleted boolean,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255)
);


ALTER TABLE public.inscription OWNER TO postgres;

--
-- Name: inscription_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.inscription_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.inscription_seq OWNER TO postgres;

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
-- Name: matiere; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matiere (
    id bigint NOT NULL
);


ALTER TABLE public.matiere OWNER TO postgres;

--
-- Name: matiere_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matiere_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.matiere_seq OWNER TO postgres;

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
-- Name: niveau_etude; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.niveau_etude (
    is_deleted boolean,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    id_cycle_etude bigint,
    rang_niveau_etude bigint NOT NULL,
    deleted_by character varying(50),
    nom_niveau_etude character varying(255)
);


ALTER TABLE public.niveau_etude OWNER TO postgres;

--
-- Name: note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.note (
    is_deleted boolean,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255)
);


ALTER TABLE public.note OWNER TO postgres;

--
-- Name: note_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.note_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.note_seq OWNER TO postgres;

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
-- Name: periode_evaluation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periode_evaluation (
    is_deleted boolean,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255)
);


ALTER TABLE public.periode_evaluation OWNER TO postgres;

--
-- Name: periode_evaluation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.periode_evaluation_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.periode_evaluation_seq OWNER TO postgres;

--
-- Name: programme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programme (
    id bigint NOT NULL
);


ALTER TABLE public.programme OWNER TO postgres;

--
-- Name: programme_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.programme_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.programme_seq OWNER TO postgres;

--
-- Name: rentree_scolaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rentree_scolaire (
    is_deleted boolean,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    id_annee_scolaire bigint,
    id_ecole bigint,
    deleted_by character varying(50)
);


ALTER TABLE public.rentree_scolaire OWNER TO postgres;

--
-- Name: rentree_scolaire_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rentree_scolaire_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rentree_scolaire_seq OWNER TO postgres;

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
-- Name: revinfo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.revinfo_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.revinfo_seq OWNER TO postgres;

--
-- Name: salle_de_classe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salle_de_classe (
    id bigint NOT NULL
);


ALTER TABLE public.salle_de_classe OWNER TO postgres;

--
-- Name: salle_de_classe_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.salle_de_classe_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salle_de_classe_seq OWNER TO postgres;

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
    CONSTRAINT type_type_group_check CHECK (((type_group)::text = ANY ((ARRAY['TYPE_REGLEMENT'::character varying, 'MOUVEMENT'::character varying, 'TYPE_PRV'::character varying, 'DOCUMENT'::character varying, 'MODE_REGLEMENT'::character varying, 'TYPE_CIVILITE'::character varying, 'TYPE_PIECE'::character varying, 'TYPE_FONCTION'::character varying, 'TYPE_USER'::character varying])::text[])))
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
-- Name: unite_de_clasee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unite_de_clasee (
    is_deleted boolean,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    id_classe bigint,
    deleted_by character varying(50),
    nom_unite_de_classe character varying(255)
);


ALTER TABLE public.unite_de_clasee OWNER TO postgres;

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
-- Name: versemenent_scolarite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.versemenent_scolarite (
    is_deleted boolean,
    created_at timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    id bigint NOT NULL,
    updated_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_by character varying(50),
    updated_by character varying(50),
    action character varying(255),
    connection_id character varying(255)
);


ALTER TABLE public.versemenent_scolarite OWNER TO postgres;

--
-- Name: versemenent_scolarite_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.versemenent_scolarite_seq
    START WITH 1
    INCREMENT BY 50
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.versemenent_scolarite_seq OWNER TO postgres;

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

COPY public.annee_scolaire (is_deleted, annee_de_debut, annee_de_fin, deleted_at, id, deleted_by, libelle_annee) FROM stdin;
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
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classe (is_deleted, deleted_at, id, id_ecole, id_filiere, deleted_by, nom_classe) FROM stdin;
\.


--
-- Data for Name: cours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cours (id) FROM stdin;
\.


--
-- Data for Name: cycle_etude; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cycle_etude (is_deleted, deleted_at, id, rang_cycle_etude, deleted_by, nom_cycle_etude) FROM stdin;
\.


--
-- Data for Name: echeance_paiement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.echeance_paiement (is_deleted, created_at, deleted_at, id, updated_at, created_by, deleted_by, updated_by, action, connection_id) FROM stdin;
\.


--
-- Data for Name: echeancier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.echeancier (is_deleted, created_at, deleted_at, id, updated_at, created_by, deleted_by, updated_by, action, connection_id) FROM stdin;
\.


--
-- Data for Name: ecole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecole (is_deleted, created_at, deleted_at, id, id_tutelle, updated_at, created_by, deleted_by, updated_by, action, adresse, code_ecole, code_menet, code_type_ecole, connection_id, email, fax, nom_ecole, sigle_ecole, situation_geo, tel) FROM stdin;
\.


--
-- Data for Name: email_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_notification (seen, sent, mail_id, sender_user_id, sending_date, email, mail_message, mail_object, system_mail_sender, token, username) FROM stdin;
\.


--
-- Data for Name: enseignement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enseignement (id) FROM stdin;
\.


--
-- Data for Name: evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation (is_deleted, created_at, deleted_at, id, updated_at, created_by, deleted_by, updated_by, action, connection_id) FROM stdin;
\.


--
-- Data for Name: filiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filiere (is_deleted, deleted_at, id, deleted_by, domaine, nom_filiere) FROM stdin;
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
\.


--
-- Data for Name: inscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscription (is_deleted, created_at, deleted_at, id, updated_at, created_by, deleted_by, updated_by, action, connection_id) FROM stdin;
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
-- Data for Name: matiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matiere (id) FROM stdin;
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
-- Data for Name: niveau_etude; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.niveau_etude (is_deleted, deleted_at, id, id_cycle_etude, rang_niveau_etude, deleted_by, nom_niveau_etude) FROM stdin;
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.note (is_deleted, created_at, deleted_at, id, updated_at, created_by, deleted_by, updated_by, action, connection_id) FROM stdin;
\.


--
-- Data for Name: periode_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.periode_evaluation (is_deleted, created_at, deleted_at, id, updated_at, created_by, deleted_by, updated_by, action, connection_id) FROM stdin;
\.


--
-- Data for Name: programme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programme (id) FROM stdin;
\.


--
-- Data for Name: rentree_scolaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rentree_scolaire (is_deleted, deleted_at, id, id_annee_scolaire, id_ecole, deleted_by) FROM stdin;
\.


--
-- Data for Name: salle_de_classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salle_de_classe (id) FROM stdin;
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
-- Data for Name: unite_de_clasee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unite_de_clasee (is_deleted, deleted_at, id, id_classe, deleted_by, nom_unite_de_classe) FROM stdin;
\.


--
-- Data for Name: versemenent_scolarite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.versemenent_scolarite (is_deleted, created_at, deleted_at, id, updated_at, created_by, deleted_by, updated_by, action, connection_id) FROM stdin;
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
-- Name: cours_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cours_seq', 1, false);


--
-- Name: echeance_paiement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.echeance_paiement_seq', 1, false);


--
-- Name: echeancier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.echeancier_seq', 1, false);


--
-- Name: ecole_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ecole_id_gen', 1, false);


--
-- Name: enseignement_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enseignement_seq', 1, false);


--
-- Name: evaluation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evaluation_seq', 1, false);


--
-- Name: fnc_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fnc_id_gen', 1, false);


--
-- Name: id_classe_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_classe_gen', 1, false);


--
-- Name: id_cycle_etude_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_cycle_etude_gen', 1, false);


--
-- Name: id_ecole_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_ecole_gen', 1, false);


--
-- Name: id_filiere_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_filiere_gen', 1, false);


--
-- Name: id_niveau_etude_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_niveau_etude_gen', 1, false);


--
-- Name: id_unite_de_classe_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_unite_de_classe_gen', 1, false);


--
-- Name: inscription_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.inscription_seq', 1, false);


--
-- Name: log_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_details_id_seq', 1, false);


--
-- Name: log_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_id_gen', 1, false);


--
-- Name: matiere_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matiere_seq', 1, false);


--
-- Name: note_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.note_seq', 1, false);


--
-- Name: notif_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notif_id_gen', 1, false);


--
-- Name: periode_evaluation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.periode_evaluation_seq', 1, false);


--
-- Name: programme_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.programme_seq', 1, false);


--
-- Name: rentree_scolaire_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rentree_scolaire_seq', 1, false);


--
-- Name: representation_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.representation_id_gen', 1, false);


--
-- Name: revinfo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.revinfo_seq', 1, false);


--
-- Name: salle_de_classe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salle_de_classe_seq', 1, false);


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
-- Name: versemenent_scolarite_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.versemenent_scolarite_seq', 1, false);


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
-- Name: classe classe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe
    ADD CONSTRAINT classe_pkey PRIMARY KEY (id);


--
-- Name: cours cours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cours
    ADD CONSTRAINT cours_pkey PRIMARY KEY (id);


--
-- Name: cycle_etude cycle_etude_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cycle_etude
    ADD CONSTRAINT cycle_etude_pkey PRIMARY KEY (id);


--
-- Name: echeance_paiement echeance_paiement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.echeance_paiement
    ADD CONSTRAINT echeance_paiement_pkey PRIMARY KEY (id);


--
-- Name: echeancier echeancier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.echeancier
    ADD CONSTRAINT echeancier_pkey PRIMARY KEY (id);


--
-- Name: ecole ecole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecole
    ADD CONSTRAINT ecole_pkey PRIMARY KEY (id);


--
-- Name: email_notification email_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_notification
    ADD CONSTRAINT email_notification_pkey PRIMARY KEY (mail_id);


--
-- Name: enseignement enseignement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enseignement
    ADD CONSTRAINT enseignement_pkey PRIMARY KEY (id);


--
-- Name: evaluation evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_pkey PRIMARY KEY (id);


--
-- Name: filiere filiere_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filiere
    ADD CONSTRAINT filiere_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- Name: inscription inscription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscription
    ADD CONSTRAINT inscription_pkey PRIMARY KEY (id);


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
-- Name: matiere matiere_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matiere
    ADD CONSTRAINT matiere_pkey PRIMARY KEY (id);


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
-- Name: niveau_etude niveau_etude_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveau_etude
    ADD CONSTRAINT niveau_etude_pkey PRIMARY KEY (id);


--
-- Name: note note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- Name: periode_evaluation periode_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_evaluation
    ADD CONSTRAINT periode_evaluation_pkey PRIMARY KEY (id);


--
-- Name: programme programme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programme
    ADD CONSTRAINT programme_pkey PRIMARY KEY (id);


--
-- Name: rentree_scolaire rentree_scolaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentree_scolaire
    ADD CONSTRAINT rentree_scolaire_pkey PRIMARY KEY (id);


--
-- Name: salle_de_classe salle_de_classe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salle_de_classe
    ADD CONSTRAINT salle_de_classe_pkey PRIMARY KEY (id);


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
-- Name: unite_de_clasee unite_de_clasee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite_de_clasee
    ADD CONSTRAINT unite_de_clasee_pkey PRIMARY KEY (id);


--
-- Name: versemenent_scolarite versemenent_scolarite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versemenent_scolarite
    ADD CONSTRAINT versemenent_scolarite_pkey PRIMARY KEY (id);


--
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


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
-- Name: classe fk8rp81dl48wqiod1o5vbquvxth; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe
    ADD CONSTRAINT fk8rp81dl48wqiod1o5vbquvxth FOREIGN KEY (id_ecole) REFERENCES public.ecole(id);


--
-- Name: ecole fk9b5824qvxo8cy1xhwcswrrv1a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecole
    ADD CONSTRAINT fk9b5824qvxo8cy1xhwcswrrv1a FOREIGN KEY (id_tutelle) REFERENCES public.ecole(id);


--
-- Name: app_user fk9xgn3i07uwx367pemmfybcvy4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fk9xgn3i07uwx367pemmfybcvy4 FOREIGN KEY (type_user_code) REFERENCES public.type(unique_code);


--
-- Name: unite_de_clasee fkb3fwv8eqr7rbtxgi0sbsyb8lk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite_de_clasee
    ADD CONSTRAINT fkb3fwv8eqr7rbtxgi0sbsyb8lk FOREIGN KEY (id_classe) REFERENCES public.classe(id);


--
-- Name: rentree_scolaire fkdjjx38vn4u094lnsx70obe71d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentree_scolaire
    ADD CONSTRAINT fkdjjx38vn4u094lnsx70obe71d FOREIGN KEY (id_ecole) REFERENCES public.ecole(id);


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
-- Name: ecole fkeg9yxy6ld93gt5f76dwl4acu7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecole
    ADD CONSTRAINT fkeg9yxy6ld93gt5f76dwl4acu7 FOREIGN KEY (code_type_ecole) REFERENCES public.type(unique_code);


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
-- Name: rentree_scolaire fkgphh9n6r4icnh6o1xmoxnceet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentree_scolaire
    ADD CONSTRAINT fkgphh9n6r4icnh6o1xmoxnceet FOREIGN KEY (id_annee_scolaire) REFERENCES public.annee_scolaire(id);


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
-- Name: classe fkiv7hdkdpt3sd6jry2i91av71l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe
    ADD CONSTRAINT fkiv7hdkdpt3sd6jry2i91av71l FOREIGN KEY (id_filiere) REFERENCES public.filiere(id);


--
-- Name: log_details fkjwxihril8uh9qojh0a3lupdhh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_details
    ADD CONSTRAINT fkjwxihril8uh9qojh0a3lupdhh FOREIGN KEY (log_id) REFERENCES public.log(id);


--
-- Name: app_user fkme21gyicp9iijn8fogv4b7hv1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT fkme21gyicp9iijn8fogv4b7hv1 FOREIGN KEY (id_ecole) REFERENCES public.ecole(id);


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
-- Name: niveau_etude fkqnt8t8jqtnittegr28itmhn6k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveau_etude
    ADD CONSTRAINT fkqnt8t8jqtnittegr28itmhn6k FOREIGN KEY (id_cycle_etude) REFERENCES public.cycle_etude(id);


--
-- PostgreSQL database dump complete
--

