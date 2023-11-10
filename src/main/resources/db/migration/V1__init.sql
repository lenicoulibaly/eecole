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
    token_id bigint NOT NULL,
    action character varying(255),
    agent_id bigint,
    already_used boolean NOT NULL,
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    creation_date timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    email_sent boolean NOT NULL,
    expiration_date timestamp(6) without time zone,
    is_deleted boolean,
    password character varying(255),
    token character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    usage_date timestamp(6) without time zone,
    user_user_id bigint
);


ALTER TABLE public.account_token OWNER TO postgres;

--
-- Name: account_token_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account_token_aud (
    token_id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    agent_id bigint,
    already_used boolean,
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    creation_date timestamp(6) without time zone,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    email_sent boolean,
    expiration_date timestamp(6) without time zone,
    is_deleted boolean,
    password character varying(255),
    token character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    usage_date timestamp(6) without time zone,
    user_user_id bigint
);


ALTER TABLE public.account_token_aud OWNER TO postgres;

--
-- Name: annee_scolaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annee_scolaire (
    id bigint NOT NULL,
    annee_de_debut bigint NOT NULL,
    annee_de_fin bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    libelle_annee character varying(255)
);


ALTER TABLE public.annee_scolaire OWNER TO postgres;

--
-- Name: annee_scolaire_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.annee_scolaire_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    annee_de_debut bigint,
    annee_de_fin bigint,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    libelle_annee character varying(255)
);


ALTER TABLE public.annee_scolaire_aud OWNER TO postgres;

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
    id bigint NOT NULL,
    action character varying(255),
    classe_ids character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    ends_at date,
    fnc_status integer NOT NULL,
    is_deleted boolean,
    name character varying(255),
    starts_at date,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    ecole_id bigint,
    type_id character varying(255),
    user_id bigint
);


ALTER TABLE public.app_function OWNER TO postgres;

--
-- Name: app_function_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_function_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    classe_ids character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    ends_at date,
    fnc_status integer,
    is_deleted boolean,
    name character varying(255),
    starts_at date,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    ecole_id bigint,
    type_id character varying(255),
    user_id bigint
);


ALTER TABLE public.app_function_aud OWNER TO postgres;

--
-- Name: app_privilege; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_privilege (
    privilege_code character varying(255) NOT NULL,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    privilege_name text,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    prv_type_unique_code character varying(255)
);


ALTER TABLE public.app_privilege OWNER TO postgres;

--
-- Name: app_privilege_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_privilege_aud (
    privilege_code character varying(255) NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    privilege_name text,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    prv_type_unique_code character varying(255)
);


ALTER TABLE public.app_privilege_aud OWNER TO postgres;

--
-- Name: app_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_role (
    role_code character varying(255) NOT NULL,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    prv_authorized_types character varying(255),
    role_name character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.app_role OWNER TO postgres;

--
-- Name: app_role_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_role_aud (
    role_code character varying(255) NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    prv_authorized_types character varying(255),
    role_name character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.app_role_aud OWNER TO postgres;

--
-- Name: app_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user (
    user_id bigint NOT NULL,
    action character varying(255),
    active boolean NOT NULL,
    change_password_date timestamp(6) without time zone,
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    current_function_id bigint,
    date_naissance date,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    email character varying(255),
    first_name character varying(255),
    is_deleted boolean,
    last_name character varying(255),
    lieu_naissance character varying(255),
    nom_mere character varying(255),
    nom_pere character varying(255),
    not_blocked boolean NOT NULL,
    num_piece character varying(50),
    password character varying(255),
    tel character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    genre_code character varying(255),
    id_ecole bigint,
    nationalite_id character varying(255),
    statut_sta_code character varying(255),
    type_piece_code character varying(255),
    type_user_code character varying(255)
);


ALTER TABLE public.app_user OWNER TO postgres;

--
-- Name: app_user_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.app_user_aud (
    user_id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    active boolean,
    change_password_date timestamp(6) without time zone,
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    current_function_id bigint,
    date_naissance date,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    email character varying(255),
    first_name character varying(255),
    is_deleted boolean,
    last_name character varying(255),
    lieu_naissance character varying(255),
    nom_mere character varying(255),
    nom_pere character varying(255),
    not_blocked boolean,
    num_piece character varying(50),
    password character varying(255),
    tel character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    genre_code character varying(255),
    id_ecole bigint,
    nationalite_id character varying(255),
    statut_sta_code character varying(255),
    type_piece_code character varying(255),
    type_user_code character varying(255)
);


ALTER TABLE public.app_user_aud OWNER TO postgres;

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
    ass_type character varying(31) NOT NULL,
    ass_id bigint NOT NULL,
    ass_status integer NOT NULL,
    ends_at date,
    starts_at date,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    prv_id character varying(255),
    role_id character varying(255),
    fnc_id bigint
);


ALTER TABLE public.assignation OWNER TO postgres;

--
-- Name: assignation_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assignation_aud (
    ass_id bigint NOT NULL,
    rev integer NOT NULL,
    ass_type character varying(31) NOT NULL,
    revtype smallint,
    ass_status integer,
    ends_at date,
    starts_at date,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    fnc_id bigint,
    role_id character varying(255),
    prv_id character varying(255)
);


ALTER TABLE public.assignation_aud OWNER TO postgres;

--
-- Name: classe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classe (
    id bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    nom_classe character varying(255),
    id_ecole bigint,
    id_filiere bigint
);


ALTER TABLE public.classe OWNER TO postgres;

--
-- Name: classe_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classe_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    nom_classe character varying(255),
    id_ecole bigint,
    id_filiere bigint
);


ALTER TABLE public.classe_aud OWNER TO postgres;

--
-- Name: cours; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cours (
    id bigint NOT NULL
);


ALTER TABLE public.cours OWNER TO postgres;

--
-- Name: cours_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cours_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint
);


ALTER TABLE public.cours_aud OWNER TO postgres;

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
    id bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    nom_cycle_etude character varying(255),
    rang_cycle_etude bigint NOT NULL
);


ALTER TABLE public.cycle_etude OWNER TO postgres;

--
-- Name: cycle_etude_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cycle_etude_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    nom_cycle_etude character varying(255),
    rang_cycle_etude bigint
);


ALTER TABLE public.cycle_etude_aud OWNER TO postgres;

--
-- Name: echeance_paiement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.echeance_paiement (
    id bigint NOT NULL,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.echeance_paiement OWNER TO postgres;

--
-- Name: echeance_paiement_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.echeance_paiement_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.echeance_paiement_aud OWNER TO postgres;

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
    id bigint NOT NULL,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.echeancier OWNER TO postgres;

--
-- Name: echeancier_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.echeancier_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.echeancier_aud OWNER TO postgres;

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
    id bigint NOT NULL,
    action character varying(255),
    adresse character varying(255),
    code_ecole character varying(255),
    code_menet character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    email character varying(255),
    fax character varying(255),
    is_deleted boolean,
    nom_ecole character varying(255),
    sigle_ecole character varying(255),
    situation_geo character varying(255),
    tel character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    id_tutelle bigint,
    code_type_ecole character varying(255)
);


ALTER TABLE public.ecole OWNER TO postgres;

--
-- Name: ecole_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ecole_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    adresse character varying(255),
    code_ecole character varying(255),
    code_menet character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    email character varying(255),
    fax character varying(255),
    is_deleted boolean,
    nom_ecole character varying(255),
    sigle_ecole character varying(255),
    situation_geo character varying(255),
    tel character varying(255),
    updated_at timestamp(6) without time zone,
    updated_by character varying(50),
    id_tutelle bigint,
    code_type_ecole character varying(255)
);


ALTER TABLE public.ecole_aud OWNER TO postgres;

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
    mail_id bigint NOT NULL,
    email character varying(255),
    mail_message character varying(255),
    mail_object character varying(255),
    seen boolean NOT NULL,
    sender_user_id bigint,
    sending_date timestamp(6) without time zone,
    sent boolean NOT NULL,
    system_mail_sender character varying(255),
    token character varying(255),
    username character varying(255)
);


ALTER TABLE public.email_notification OWNER TO postgres;

--
-- Name: email_notification_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_notification_aud (
    mail_id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    email character varying(255),
    mail_message character varying(255),
    mail_object character varying(255),
    seen boolean,
    sender_user_id bigint,
    sending_date timestamp(6) without time zone,
    sent boolean,
    system_mail_sender character varying(255),
    token character varying(255),
    username character varying(255)
);


ALTER TABLE public.email_notification_aud OWNER TO postgres;

--
-- Name: enseignement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enseignement (
    id bigint NOT NULL
);


ALTER TABLE public.enseignement OWNER TO postgres;

--
-- Name: enseignement_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enseignement_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint
);


ALTER TABLE public.enseignement_aud OWNER TO postgres;

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
    id bigint NOT NULL,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.evaluation OWNER TO postgres;

--
-- Name: evaluation_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluation_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.evaluation_aud OWNER TO postgres;

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
    id bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    domaine character varying(255),
    is_deleted boolean,
    nom_filiere character varying(255)
);


ALTER TABLE public.filiere OWNER TO postgres;

--
-- Name: filiere_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filiere_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    domaine character varying(255),
    is_deleted boolean,
    nom_filiere character varying(255)
);


ALTER TABLE public.filiere_aud OWNER TO postgres;

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
    id bigint NOT NULL,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.inscription OWNER TO postgres;

--
-- Name: inscription_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inscription_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.inscription_aud OWNER TO postgres;

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
    id bigint NOT NULL,
    action character varying(255),
    action_date_time timestamp(6) without time zone,
    connection_id character varying(255),
    error_message character varying(500000),
    host_name character varying(255),
    ip_address character varying(255),
    mac_address bytea,
    main_action_id bigint,
    stack_trace character varying(500000),
    user_email character varying(255),
    user_id bigint,
    func_id bigint
);


ALTER TABLE public.log OWNER TO postgres;

--
-- Name: log_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.log_details (
    id bigint NOT NULL,
    column_name character varying(255),
    connection_id character varying(255),
    new_value character varying(100000),
    object_id character varying(255),
    old_value character varying(100000),
    table_name character varying(255),
    log_id bigint
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
-- Name: matiere_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matiere_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint
);


ALTER TABLE public.matiere_aud OWNER TO postgres;

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
    menu_code character varying(255) NOT NULL,
    name character varying(255),
    prvs_codes_chain character varying(4000),
    status character varying(255),
    CONSTRAINT menu_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'DELETED'::character varying, 'STORED'::character varying])::text[])))
);


ALTER TABLE public.menu OWNER TO postgres;

--
-- Name: menu_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_aud (
    menu_code character varying(255) NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    name character varying(255),
    prvs_codes_chain character varying(4000),
    status character varying(255),
    CONSTRAINT menu_aud_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'DELETED'::character varying, 'STORED'::character varying])::text[])))
);


ALTER TABLE public.menu_aud OWNER TO postgres;

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
-- Name: nationalite_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nationalite_aud (
    code_pays character varying(255) NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    nationalite character varying(255),
    nom_pays character varying(255)
);


ALTER TABLE public.nationalite_aud OWNER TO postgres;

--
-- Name: niveau_etude; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.niveau_etude (
    id bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    nom_niveau_etude character varying(255),
    rang_niveau_etude bigint NOT NULL,
    id_cycle_etude bigint
);


ALTER TABLE public.niveau_etude OWNER TO postgres;

--
-- Name: niveau_etude_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.niveau_etude_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    nom_niveau_etude character varying(255),
    rang_niveau_etude bigint,
    id_cycle_etude bigint
);


ALTER TABLE public.niveau_etude_aud OWNER TO postgres;

--
-- Name: note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.note (
    id bigint NOT NULL,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.note OWNER TO postgres;

--
-- Name: note_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.note_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.note_aud OWNER TO postgres;

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
    id bigint NOT NULL,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.periode_evaluation OWNER TO postgres;

--
-- Name: periode_evaluation_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periode_evaluation_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.periode_evaluation_aud OWNER TO postgres;

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
-- Name: programme_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.programme_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint
);


ALTER TABLE public.programme_aud OWNER TO postgres;

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
    id bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    id_annee_scolaire bigint,
    id_ecole bigint
);


ALTER TABLE public.rentree_scolaire OWNER TO postgres;

--
-- Name: rentree_scolaire_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rentree_scolaire_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    id_annee_scolaire bigint,
    id_ecole bigint
);


ALTER TABLE public.rentree_scolaire_aud OWNER TO postgres;

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
-- Name: revinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revinfo (
    rev integer NOT NULL,
    revtstmp bigint
);


ALTER TABLE public.revinfo OWNER TO postgres;

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
-- Name: salle_de_classe_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salle_de_classe_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint
);


ALTER TABLE public.salle_de_classe_aud OWNER TO postgres;

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
    sta_code character varying(255) NOT NULL,
    created_at timestamp(6) without time zone,
    sta_libelle character varying(255),
    sta_libelle_long character varying(255),
    sta_type smallint,
    updated_at timestamp(6) without time zone,
    CONSTRAINT statut_sta_type_check CHECK (((sta_type >= 0) AND (sta_type <= 5)))
);


ALTER TABLE public.statut OWNER TO postgres;

--
-- Name: statut_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statut_aud (
    sta_code character varying(255) NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    created_at timestamp(6) without time zone,
    sta_libelle character varying(255),
    sta_libelle_long character varying(255),
    sta_type smallint,
    updated_at timestamp(6) without time zone,
    CONSTRAINT statut_aud_sta_type_check CHECK (((sta_type >= 0) AND (sta_type <= 5)))
);


ALTER TABLE public.statut_aud OWNER TO postgres;

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
    unique_code character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    object_folder character varying(255),
    status character varying(255),
    type_group character varying(255),
    CONSTRAINT type_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'DELETED'::character varying, 'STORED'::character varying])::text[]))),
    CONSTRAINT type_type_group_check CHECK (((type_group)::text = ANY ((ARRAY['TYPE_REGLEMENT'::character varying, 'MOUVEMENT'::character varying, 'TYPE_PRV'::character varying, 'DOCUMENT'::character varying, 'MODE_REGLEMENT'::character varying, 'TYPE_CIVILITE'::character varying, 'TYPE_PIECE'::character varying, 'TYPE_FONCTION'::character varying, 'TYPE_USER'::character varying])::text[])))
);


ALTER TABLE public.type OWNER TO postgres;

--
-- Name: type_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_aud (
    unique_code character varying(255) NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    name character varying(255),
    object_folder character varying(255),
    status character varying(255),
    type_group character varying(255),
    CONSTRAINT type_aud_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'DELETED'::character varying, 'STORED'::character varying])::text[]))),
    CONSTRAINT type_aud_type_group_check CHECK (((type_group)::text = ANY ((ARRAY['TYPE_REGLEMENT'::character varying, 'MOUVEMENT'::character varying, 'TYPE_PRV'::character varying, 'DOCUMENT'::character varying, 'MODE_REGLEMENT'::character varying, 'TYPE_CIVILITE'::character varying, 'TYPE_PIECE'::character varying, 'TYPE_FONCTION'::character varying, 'TYPE_USER'::character varying])::text[])))
);


ALTER TABLE public.type_aud OWNER TO postgres;

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
    status character varying(255),
    child_code character varying(255),
    parent_code character varying(255),
    CONSTRAINT type_param_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'DELETED'::character varying, 'STORED'::character varying])::text[])))
);


ALTER TABLE public.type_param OWNER TO postgres;

--
-- Name: type_param_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.type_param_aud (
    type_param_id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    status character varying(255),
    child_code character varying(255),
    parent_code character varying(255),
    CONSTRAINT type_param_aud_status_check CHECK (((status)::text = ANY ((ARRAY['ACTIVE'::character varying, 'DELETED'::character varying, 'STORED'::character varying])::text[])))
);


ALTER TABLE public.type_param_aud OWNER TO postgres;

--
-- Name: unite_de_clasee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unite_de_clasee (
    id bigint NOT NULL,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    nom_unite_de_classe character varying(255),
    id_classe bigint
);


ALTER TABLE public.unite_de_clasee OWNER TO postgres;

--
-- Name: unite_de_clasee_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unite_de_clasee_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    nom_unite_de_classe character varying(255),
    id_classe bigint
);


ALTER TABLE public.unite_de_clasee_aud OWNER TO postgres;

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
    id bigint NOT NULL,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.versemenent_scolarite OWNER TO postgres;

--
-- Name: versemenent_scolarite_aud; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.versemenent_scolarite_aud (
    id bigint NOT NULL,
    rev integer NOT NULL,
    revtype smallint,
    action character varying(255),
    connection_id character varying(255),
    created_at timestamp(6) without time zone,
    created_by character varying(50),
    deleted_at timestamp(6) without time zone,
    deleted_by character varying(50),
    is_deleted boolean,
    updated_at timestamp(6) without time zone,
    updated_by character varying(50)
);


ALTER TABLE public.versemenent_scolarite_aud OWNER TO postgres;

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

COPY public.account_token (token_id, action, agent_id, already_used, connection_id, created_at, created_by, creation_date, deleted_at, deleted_by, email_sent, expiration_date, is_deleted, password, token, updated_at, updated_by, usage_date, user_user_id) FROM stdin;
22	\N	\N	t	\N	\N	\N	2023-09-04 18:21:36.571256	\N	\N	t	2023-09-05 18:21:36.571256	f	\N	12d81352-c496-4054-8e7c-f8643edf922e	\N	\N	2023-09-04 18:28:36.472285	32
\.


--
-- Data for Name: account_token_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.account_token_aud (token_id, rev, revtype, action, agent_id, already_used, connection_id, created_at, created_by, creation_date, deleted_at, deleted_by, email_sent, expiration_date, is_deleted, password, token, updated_at, updated_by, usage_date, user_user_id) FROM stdin;
22	126	0	\N	\N	f	\N	\N	\N	2023-09-04 18:21:36.571256	\N	\N	t	2023-09-05 18:21:36.571256	f	\N	12d81352-c496-4054-8e7c-f8643edf922e	\N	\N	\N	32
22	127	1	\N	\N	t	\N	\N	\N	2023-09-04 18:21:36.571256	\N	\N	t	2023-09-05 18:21:36.571256	f	\N	12d81352-c496-4054-8e7c-f8643edf922e	\N	\N	2023-09-04 18:28:36.472285	32
\.


--
-- Data for Name: annee_scolaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annee_scolaire (id, annee_de_debut, annee_de_fin, deleted_at, deleted_by, is_deleted, libelle_annee) FROM stdin;
\.


--
-- Data for Name: annee_scolaire_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.annee_scolaire_aud (id, rev, revtype, annee_de_debut, annee_de_fin, deleted_at, deleted_by, is_deleted, libelle_annee) FROM stdin;
\.


--
-- Data for Name: app_function; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_function (id, action, classe_ids, connection_id, created_at, created_by, deleted_at, deleted_by, ends_at, fnc_status, is_deleted, name, starts_at, updated_at, updated_by, ecole_id, type_id, user_id) FROM stdin;
1	\N		\N	2023-09-04 17:25:28.880178	UNKNOWN	\N	\N	2024-09-04	1	f	Devellopeur	2023-09-04	2023-09-04 17:25:28.880178	UNKNOWN	\N	ELEVE	1
\.


--
-- Data for Name: app_function_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_function_aud (id, rev, revtype, action, classe_ids, connection_id, created_at, created_by, deleted_at, deleted_by, ends_at, fnc_status, is_deleted, name, starts_at, updated_at, updated_by, ecole_id, type_id, user_id) FROM stdin;
1	2	0	\N		\N	2023-09-04 17:25:28.880178	UNKNOWN	\N	\N	2024-09-04	1	f	Devellopeur	2023-09-04	2023-09-04 17:25:28.880178	UNKNOWN	\N	ELEVE	1
\.


--
-- Data for Name: app_privilege; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_privilege (privilege_code, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, privilege_name, updated_at, updated_by, prv_type_unique_code) FROM stdin;
\.


--
-- Data for Name: app_privilege_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_privilege_aud (privilege_code, rev, revtype, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, privilege_name, updated_at, updated_by, prv_type_unique_code) FROM stdin;
\.


--
-- Data for Name: app_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_role (role_code, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, prv_authorized_types, role_name, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: app_role_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_role_aud (role_code, rev, revtype, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, prv_authorized_types, role_name, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: app_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user (user_id, action, active, change_password_date, connection_id, created_at, created_by, current_function_id, date_naissance, deleted_at, deleted_by, email, first_name, is_deleted, last_name, lieu_naissance, nom_mere, nom_pere, not_blocked, num_piece, password, tel, updated_at, updated_by, genre_code, id_ecole, nationalite_id, statut_sta_code, type_piece_code, type_user_code) FROM stdin;
1	\N	t	\N	\N	2023-09-04 17:25:28.829178	UNKNOWN	1	\N	\N	\N	lenicode777@gmail.com	Leni	f	Codeur	\N	\N	\N	t	\N	$2a$10$K5CipPHyS0tcuHko/agtT.D7.96pYa5FytOf/AoxpfSc55xoV9UKq	0505471049	2023-09-04 17:25:29.048625	UNKNOWN	\N	\N	\N	\N	\N	\N
32	\N	t	2023-09-04 18:28:36.456281	\N	2023-09-04 18:21:36.565788	lenicode777@gmail.com	\N	\N	\N	\N	lenigauss@gmail.com	Leni	f	Gauss	\N	\N	\N	t	\N	$2a$10$N3Qe27FR75HD/Nb5UzQE9ex2ZV/xJsGd9/ADmlmyuC0mqlFyhppkG	0505471048	2023-09-04 18:28:36.459281	UNKNOWN	\N	\N	\N	USR-ACT	\N	\N
\.


--
-- Data for Name: app_user_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.app_user_aud (user_id, rev, revtype, action, active, change_password_date, connection_id, created_at, created_by, current_function_id, date_naissance, deleted_at, deleted_by, email, first_name, is_deleted, last_name, lieu_naissance, nom_mere, nom_pere, not_blocked, num_piece, password, tel, updated_at, updated_by, genre_code, id_ecole, nationalite_id, statut_sta_code, type_piece_code, type_user_code) FROM stdin;
1	1	0	\N	t	\N	\N	2023-09-04 17:25:28.829178	UNKNOWN	\N	\N	\N	\N	lenicode777@gmail.com	Leni	f	Codeur	\N	\N	\N	t	\N	$2a$10$K5CipPHyS0tcuHko/agtT.D7.96pYa5FytOf/AoxpfSc55xoV9UKq	0505471049	2023-09-04 17:25:28.829178	UNKNOWN	\N	\N	\N	\N	\N	\N
1	3	1	\N	t	\N	\N	2023-09-04 17:25:28.829178	UNKNOWN	1	\N	\N	\N	lenicode777@gmail.com	Leni	f	Codeur	\N	\N	\N	t	\N	$2a$10$K5CipPHyS0tcuHko/agtT.D7.96pYa5FytOf/AoxpfSc55xoV9UKq	0505471049	2023-09-04 17:25:29.048625	UNKNOWN	\N	\N	\N	\N	\N	\N
32	126	0	\N	f	\N	\N	2023-09-04 18:21:36.565788	lenicode777@gmail.com	\N	\N	\N	\N	lenigauss@gmail.com	Leni	f	Gauss	\N	\N	\N	t	\N	\N	0505471048	2023-09-04 18:21:36.565788	lenicode777@gmail.com	\N	\N	\N	USR-BLQ	\N	\N
32	127	1	\N	t	2023-09-04 18:28:36.456281	\N	2023-09-04 18:21:36.565788	lenicode777@gmail.com	\N	\N	\N	\N	lenigauss@gmail.com	Leni	f	Gauss	\N	\N	\N	t	\N	$2a$10$N3Qe27FR75HD/Nb5UzQE9ex2ZV/xJsGd9/ADmlmyuC0mqlFyhppkG	0505471048	2023-09-04 18:28:36.459281	UNKNOWN	\N	\N	\N	USR-ACT	\N	\N
\.


--
-- Data for Name: assignation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assignation (ass_type, ass_id, ass_status, ends_at, starts_at, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by, prv_id, role_id, fnc_id) FROM stdin;
ROLE_TO_FNC	1	1	2043-09-04	2023-09-04	\N	\N	2023-09-04 17:25:29.191378	UNKNOWN	\N	\N	f	2023-09-04 17:25:29.191378	UNKNOWN	\N	\N	1
\.


--
-- Data for Name: assignation_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assignation_aud (ass_id, rev, ass_type, revtype, ass_status, ends_at, starts_at, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by, fnc_id, role_id, prv_id) FROM stdin;
1	4	ROLE_TO_FNC	0	1	2043-09-04	2023-09-04	\N	\N	2023-09-04 17:25:29.191378	UNKNOWN	\N	\N	f	2023-09-04 17:25:29.191378	UNKNOWN	1	\N	\N
\.


--
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classe (id, deleted_at, deleted_by, is_deleted, nom_classe, id_ecole, id_filiere) FROM stdin;
\.


--
-- Data for Name: classe_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classe_aud (id, rev, revtype, deleted_at, deleted_by, is_deleted, nom_classe, id_ecole, id_filiere) FROM stdin;
\.


--
-- Data for Name: cours; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cours (id) FROM stdin;
\.


--
-- Data for Name: cours_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cours_aud (id, rev, revtype) FROM stdin;
\.


--
-- Data for Name: cycle_etude; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cycle_etude (id, deleted_at, deleted_by, is_deleted, nom_cycle_etude, rang_cycle_etude) FROM stdin;
\.


--
-- Data for Name: cycle_etude_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cycle_etude_aud (id, rev, revtype, deleted_at, deleted_by, is_deleted, nom_cycle_etude, rang_cycle_etude) FROM stdin;
\.


--
-- Data for Name: echeance_paiement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.echeance_paiement (id, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: echeance_paiement_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.echeance_paiement_aud (id, rev, revtype, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: echeancier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.echeancier (id, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: echeancier_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.echeancier_aud (id, rev, revtype, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: ecole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecole (id, action, adresse, code_ecole, code_menet, connection_id, created_at, created_by, deleted_at, deleted_by, email, fax, is_deleted, nom_ecole, sigle_ecole, situation_geo, tel, updated_at, updated_by, id_tutelle, code_type_ecole) FROM stdin;
\.


--
-- Data for Name: ecole_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ecole_aud (id, rev, revtype, action, adresse, code_ecole, code_menet, connection_id, created_at, created_by, deleted_at, deleted_by, email, fax, is_deleted, nom_ecole, sigle_ecole, situation_geo, tel, updated_at, updated_by, id_tutelle, code_type_ecole) FROM stdin;
\.


--
-- Data for Name: email_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_notification (mail_id, email, mail_message, mail_object, seen, sender_user_id, sending_date, sent, system_mail_sender, token, username) FROM stdin;
22	lenigauss@gmail.com	\N	Activation de votre compte	f	1	2023-09-04 18:21:36.573258	t	\N	12d81352-c496-4054-8e7c-f8643edf922e	lenigauss@gmail.com
\.


--
-- Data for Name: email_notification_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.email_notification_aud (mail_id, rev, revtype, email, mail_message, mail_object, seen, sender_user_id, sending_date, sent, system_mail_sender, token, username) FROM stdin;
22	126	0	lenigauss@gmail.com	\N	Activation de votre compte	f	1	2023-09-04 18:21:36.573258	t	\N	12d81352-c496-4054-8e7c-f8643edf922e	lenigauss@gmail.com
\.


--
-- Data for Name: enseignement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enseignement (id) FROM stdin;
\.


--
-- Data for Name: enseignement_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enseignement_aud (id, rev, revtype) FROM stdin;
\.


--
-- Data for Name: evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation (id, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: evaluation_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.evaluation_aud (id, rev, revtype, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: filiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filiere (id, deleted_at, deleted_by, domaine, is_deleted, nom_filiere) FROM stdin;
\.


--
-- Data for Name: filiere_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.filiere_aud (id, rev, revtype, deleted_at, deleted_by, domaine, is_deleted, nom_filiere) FROM stdin;
\.


--
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) FROM stdin;
1	2	types init	SQL	V2__types_init.sql	-1846307696	postgres	2023-09-04 15:18:20.622592	11	t
\.


--
-- Data for Name: inscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscription (id, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: inscription_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inscription_aud (id, rev, revtype, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log (id, action, action_date_time, connection_id, error_message, host_name, ip_address, mac_address, main_action_id, stack_trace, user_email, user_id, func_id) FROM stdin;
1	Login	2023-09-04 17:47:05.750209	eee9c881-3b8a-414e-995d-c6f15a6beab9	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
3	SYSTEM_ERROR	\N	eee9c881-3b8a-414e-995d-c6f15a6beab9	Cannot invoke "Object.getClass()" because "obj" is null	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	java.lang.NullPointerException: Cannot invoke "Object.getClass()" because "obj" is null\r\n\tat lenicorp.eecole.sharedmodule.utilities.ObjectTypeUtils.isSimpleObject(ObjectTypeUtils.java:13)\r\n\tat lenicorp.eecole.modulelog.controller.service.LogService.lambda$saveLogDetails$2(LogService.java:154)\r\n\tat java.base/java.util.stream.ReferencePipeline$3$1.accept(ReferencePipeline.java:197)\r\n\tat java.base/java.util.stream.ReferencePipeline$2$1.accept(ReferencePipeline.java:179)\r\n\tat java.base/java.util.Spliterators$ArraySpliterator.forEachRemaining(Spliterators.java:992)\r\n\tat java.base/java.util.stream.AbstractPipeline.copyInto(AbstractPipeline.java:509)\r\n\tat java.base/java.util.stream.AbstractPipeline.wrapAndCopyInto(AbstractPipeline.java:499)\r\n\tat java.base/java.util.stream.ReduceOps$ReduceOp.evaluateSequential(ReduceOps.java:921)\r\n\tat java.base/java.util.stream.AbstractPipeline.evaluate(AbstractPipeline.java:234)\r\n\tat java.base/java.util.stream.ReferencePipeline.collect(ReferencePipeline.java:682)\r\n\tat lenicorp.eecole.modulelog.controller.service.LogService.saveLogDetails(LogService.java:170)\r\n\tat lenicorp.eecole.modulelog.controller.service.LogService.logg(LogService.java:44)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:196)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n\tat org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:756)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:756)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\r\n\tat lenicorp.eecole.modulelog.controller.service.LogService$$SpringCGLIB$$0.logg(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.createUser(UserService.java:113)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.invokeJoinpoint(ReflectiveMethodInvocation.java:196)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163)\r\n\tat org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:756)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:756)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.createUser(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.createUser(UserResource.java:46)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:914)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:590)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\n	lenicode777@gmail.com	1	1
15	SYSTEM_ERROR	\N	eee9c881-3b8a-414e-995d-c6f15a6beab9	org.hibernate.TransientPropertyValueException: object references an unsaved transient instance - save the transient instance before flushing : lenicorp.eecole.moduleauth.model.entities.AppUser.statut -> lenicorp.eecole.modulestatut.entities.Statut	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.TransientPropertyValueException: object references an unsaved transient instance - save the transient instance before flushing : lenicorp.eecole.moduleauth.model.entities.AppUser.statut -> lenicorp.eecole.modulestatut.entities.Statut\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.JpaTransactionManager.doCommit(JpaTransactionManager.java:565)\r\n\tat org.springframework.transaction.support.AbstractPlatformTransactionManager.processCommit(AbstractPlatformTransactionManager.java:743)\r\n\tat org.springframework.transaction.support.AbstractPlatformTransactionManager.commit(AbstractPlatformTransactionManager.java:711)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.commitTransactionAfterReturning(TransactionAspectSupport.java:660)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:410)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:756)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.createUser(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.createUser(UserResource.java:46)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:914)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:590)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: org.hibernate.TransientPropertyValueException: object references an unsaved transient instance - save the transient instance before flushing : lenicorp.eecole.moduleauth.model.entities.AppUser.statut -> lenicorp.eecole.modulestatut.entities.Statut\r\n\tat org.hibernate.internal.ExceptionConverterImpl.convert(ExceptionConverterImpl.java:152)\r\n\tat org.hibernate.internal.ExceptionConverterImpl.convert(ExceptionConverterImpl.java:162)\r\n\tat org.hibernate.internal.ExceptionConverterImpl.convert(ExceptionConverterImpl.java:168)\r\n\tat org.hibernate.internal.SessionImpl.doFlush(SessionImpl.java:1416)\r\n\tat org.hibernate.internal.SessionImpl.managedFlush(SessionImpl.java:485)\r\n\tat org.hibernate.internal.SessionImpl.flushBeforeTransactionCompletion(SessionImpl.java:2301)\r\n\tat org.hibernate.internal.SessionImpl.beforeTransactionCompletion(SessionImpl.java:1966)\r\n\tat org.hibernate.engine.jdbc.internal.JdbcCoordinatorImpl.beforeTransactionCompletion(JdbcCoordinatorImpl.java:439)\r\n\tat org.hibernate.resource.transaction.backend.jdbc.internal.JdbcResourceLocalTransactionCoordinatorImpl.beforeCompletionCallback(JdbcResourceLocalTransactionCoordinatorImpl.java:169)\r\n\tat org.hibernate.resource.transaction.backend.jdbc.internal.JdbcResourceLocalTransactionCoordinatorImpl$TransactionDriverControlImpl.commit(JdbcResourceLocalTransactionCoordinatorImpl.java:267)\r\n\tat org.hibernate.engine.transaction.internal.TransactionImpl.commit(TransactionImpl.java:101)\r\n\tat org.springframework.orm.jpa.JpaTransactionManager.doCommit(JpaTransactionManager.java:561)\r\n\t... 107 more\r\nCaused by: org.hibernate.TransientPropertyValueException: object references an unsaved transient instance - save the transient instance before flushing : lenicorp.eecole.moduleauth.model.entities.AppUser.statut -> lenicorp.eecole.modulestatut.entities.Statut\r\n\tat org.hibernate.engine.spi.CascadingActions$8.noCascade(CascadingActions.java:372)\r\n\tat org.hibernate.engine.internal.Cascade.cascade(Cascade.java:169)\r\n\tat org.hibernate.event.internal.AbstractFlushingEventListener.cascadeOnFlush(AbstractFlushingEventListener.java:155)\r\n\tat org.hibernate.event.internal.AbstractFlushingEventListener.prepareEntityFlushes(AbstractFlushingEventListener.java:145)\r\n\tat org.hibernate.event.internal.AbstractFlushingEventListener.flushEverythingToExecutions(AbstractFlushingEventListener.java:79)\r\n\tat org.hibernate.event.internal.DefaultFlushEventListener.onFlush(DefaultFlushEventListener.java:38)\r\n\tat org.hibernate.event.service.internal.EventListenerGroupImpl.fireEventOnEachListener(EventListenerGroupImpl.java:127)\r\n\tat org.hibernate.internal.SessionImpl.doFlush(SessionImpl.java:1412)\r\n\t... 115 more\r\n	lenicode777@gmail.com	1	1
25	SYSTEM_ERROR	\N	eee9c881-3b8a-414e-995d-c6f15a6beab9	org.hibernate.TransientPropertyValueException: object references an unsaved transient instance - save the transient instance before flushing : lenicorp.eecole.moduleauth.model.entities.AppUser.statut -> lenicorp.eecole.modulestatut.entities.Statut	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: org.hibernate.TransientPropertyValueException: object references an unsaved transient instance - save the transient instance before flushing : lenicorp.eecole.moduleauth.model.entities.AppUser.statut -> lenicorp.eecole.modulestatut.entities.Statut\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.JpaTransactionManager.doCommit(JpaTransactionManager.java:565)\r\n\tat org.springframework.transaction.support.AbstractPlatformTransactionManager.processCommit(AbstractPlatformTransactionManager.java:743)\r\n\tat org.springframework.transaction.support.AbstractPlatformTransactionManager.commit(AbstractPlatformTransactionManager.java:711)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.commitTransactionAfterReturning(TransactionAspectSupport.java:660)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:410)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.proceed(CglibAopProxy.java:756)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:708)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.createUser(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.createUser(UserResource.java:46)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doPost(FrameworkServlet.java:914)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:590)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: org.hibernate.TransientPropertyValueException: object references an unsaved transient instance - save the transient instance before flushing : lenicorp.eecole.moduleauth.model.entities.AppUser.statut -> lenicorp.eecole.modulestatut.entities.Statut\r\n\tat org.hibernate.internal.ExceptionConverterImpl.convert(ExceptionConverterImpl.java:152)\r\n\tat org.hibernate.internal.ExceptionConverterImpl.convert(ExceptionConverterImpl.java:162)\r\n\tat org.hibernate.internal.ExceptionConverterImpl.convert(ExceptionConverterImpl.java:168)\r\n\tat org.hibernate.internal.SessionImpl.doFlush(SessionImpl.java:1416)\r\n\tat org.hibernate.internal.SessionImpl.managedFlush(SessionImpl.java:485)\r\n\tat org.hibernate.internal.SessionImpl.flushBeforeTransactionCompletion(SessionImpl.java:2301)\r\n\tat org.hibernate.internal.SessionImpl.beforeTransactionCompletion(SessionImpl.java:1966)\r\n\tat org.hibernate.engine.jdbc.internal.JdbcCoordinatorImpl.beforeTransactionCompletion(JdbcCoordinatorImpl.java:439)\r\n\tat org.hibernate.resource.transaction.backend.jdbc.internal.JdbcResourceLocalTransactionCoordinatorImpl.beforeCompletionCallback(JdbcResourceLocalTransactionCoordinatorImpl.java:169)\r\n\tat org.hibernate.resource.transaction.backend.jdbc.internal.JdbcResourceLocalTransactionCoordinatorImpl$TransactionDriverControlImpl.commit(JdbcResourceLocalTransactionCoordinatorImpl.java:267)\r\n\tat org.hibernate.engine.transaction.internal.TransactionImpl.commit(TransactionImpl.java:101)\r\n\tat org.springframework.orm.jpa.JpaTransactionManager.doCommit(JpaTransactionManager.java:561)\r\n\t... 107 more\r\nCaused by: org.hibernate.TransientPropertyValueException: object references an unsaved transient instance - save the transient instance before flushing : lenicorp.eecole.moduleauth.model.entities.AppUser.statut -> lenicorp.eecole.modulestatut.entities.Statut\r\n\tat org.hibernate.engine.spi.CascadingActions$8.noCascade(CascadingActions.java:372)\r\n\tat org.hibernate.engine.internal.Cascade.cascade(Cascade.java:169)\r\n\tat org.hibernate.event.internal.AbstractFlushingEventListener.cascadeOnFlush(AbstractFlushingEventListener.java:155)\r\n\tat org.hibernate.event.internal.AbstractFlushingEventListener.prepareEntityFlushes(AbstractFlushingEventListener.java:145)\r\n\tat org.hibernate.event.internal.AbstractFlushingEventListener.flushEverythingToExecutions(AbstractFlushingEventListener.java:79)\r\n\tat org.hibernate.event.internal.DefaultFlushEventListener.onFlush(DefaultFlushEventListener.java:38)\r\n\tat org.hibernate.event.service.internal.EventListenerGroupImpl.fireEventOnEachListener(EventListenerGroupImpl.java:127)\r\n\tat org.hibernate.internal.SessionImpl.doFlush(SessionImpl.java:1412)\r\n\t... 115 more\r\n	lenicode777@gmail.com	1	1
32	Cr&ation d'un utilisateur	2023-09-04 18:21:39.94926	eee9c881-3b8a-414e-995d-c6f15a6beab9	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
33	Création d'un token de sécurité	2023-09-04 18:21:40.009677	eee9c881-3b8a-414e-995d-c6f15a6beab9	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	32	\N	lenicode777@gmail.com	1	1
34	Envoie d'un mail de réinitialisation de mot de passe	2023-09-04 18:21:40.043676	eee9c881-3b8a-414e-995d-c6f15a6beab9	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	32	\N	lenicode777@gmail.com	1	1
35	Activation de compte	2023-09-04 18:28:36.463278	\N	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenigauss@gmail.com	32	\N
36	Marquage d'un token comme déjà utilisé	2023-09-04 18:28:36.476319	\N	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	35	\N	lenigauss@gmail.com	32	\N
42	SYSTEM_ERROR	\N	\N	Request method 'GET' is not supported	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.web.HttpRequestMethodNotSupportedException: Request method 'GET' is not supported\r\n\tat org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.handleNoMatch(RequestMappingInfoHandlerMapping.java:265)\r\n\tat org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.lookupHandlerMethod(AbstractHandlerMethodMapping.java:441)\r\n\tat org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:382)\r\n\tat org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.getHandlerInternal(RequestMappingInfoHandlerMapping.java:126)\r\n\tat org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.getHandlerInternal(RequestMappingInfoHandlerMapping.java:68)\r\n\tat org.springframework.web.servlet.handler.AbstractHandlerMapping.getHandler(AbstractHandlerMapping.java:505)\r\n\tat org.springframework.web.servlet.DispatcherServlet.getHandler(DispatcherServlet.java:1275)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1057)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:31)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\n	\N	\N	\N
52	Login	2023-09-07 13:37:15.021362	eb3a6f5c-865d-47cc-b14c-a063d14d2548	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
53	Login	2023-09-07 13:37:33.160464	5078e93f-43e1-4ecf-8202-0d38f2ee2d72	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
54	Login	2023-09-07 13:38:15.294032	cdafc161-62b4-41bf-b4b3-2bacd4a9d75e	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
55	Login	2023-09-07 13:41:57.128413	3b941556-c3cd-4ad5-8a8c-c2ff74ca2aa3	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
56	Login	2023-09-07 13:49:16.339694	f794fde9-21d2-4bac-b8e7-5784d7764b39	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
57	Login	2023-09-07 13:50:09.959238	0722ffac-cab9-47a9-93c8-2b45b0d53f7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
58	Login	2023-09-07 13:50:24.887596	e4aa087b-f6a5-48e3-bd5f-321980e13837	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
59	Login	2023-09-07 13:50:26.64042	567b69bd-510b-4f95-98ba-f1e846d494c3	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
60	Login	2023-09-07 13:50:28.743727	c0797cec-8509-48e4-907d-20ec2e3a15a6	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
61	Login	2023-09-07 13:50:29.389053	138f9d14-5f78-468b-9fe8-75935ed4d18b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
62	Login	2023-09-07 13:50:29.646266	cf8d97b3-ac01-44c5-8e66-a362cf813780	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
63	Login	2023-09-07 13:50:29.879122	672f5255-7031-4c62-ba69-40641d16e630	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
64	Login	2023-09-07 13:50:30.207733	c111c76b-f1f5-406c-b9d8-4bddc3f5efda	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
66	Login	2023-09-07 13:50:30.654962	81adfe88-fef4-4c85-8d04-1cad07127f19	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
68	Login	2023-09-07 13:50:32.023183	06a1c10e-a736-4e84-bb46-bf4044742008	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
70	Login	2023-09-07 13:52:33.890146	67c8941d-946b-40a6-a628-861ecab5175d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
72	Login	2023-09-07 13:57:33.581343	d900682c-a472-440a-95d6-1a9999ca46d6	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
73	Login	2023-09-07 14:00:08.036907	62426d60-5232-4712-93f0-ea5223a1f67a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
75	Login	2023-09-07 14:02:01.043178	36e1ed1e-fa8d-4280-b4b6-e8f09fbce8e2	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
65	Login	2023-09-07 13:50:30.368968	25c275e0-9317-40ce-8dc7-39111def44b5	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
67	Login	2023-09-07 13:50:30.848927	cd9484dc-abbf-4373-a78c-d7cd895a89a6	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
69	Login	2023-09-07 13:52:01.221215	40e128f3-355a-4189-b77f-cc18f36f35f2	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
71	Login	2023-09-07 13:54:24.844179	0907691d-d4c4-4d52-9d60-bc874e5098c2	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
74	Login	2023-09-07 14:01:20.824601	067d6f88-4a15-4756-9b74-2c702803f5c9	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
76	Login	2023-09-07 17:20:51.664672	023ed77f-bdbd-4a8e-951e-55908fbaf256	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
77	Login	2023-09-07 17:38:59.766537	09c0adea-c52b-4e58-8cf5-f24f4b992146	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
78	Login	2023-09-07 23:54:18.068815	7c405eb7-7eaa-44c3-a43b-30c319c124f8	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
79	SYSTEM_ERROR	\N	\N	Request method 'GET' is not supported	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.web.HttpRequestMethodNotSupportedException: Request method 'GET' is not supported\r\n\tat org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.handleNoMatch(RequestMappingInfoHandlerMapping.java:265)\r\n\tat org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.lookupHandlerMethod(AbstractHandlerMethodMapping.java:441)\r\n\tat org.springframework.web.servlet.handler.AbstractHandlerMethodMapping.getHandlerInternal(AbstractHandlerMethodMapping.java:382)\r\n\tat org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.getHandlerInternal(RequestMappingInfoHandlerMapping.java:126)\r\n\tat org.springframework.web.servlet.mvc.method.RequestMappingInfoHandlerMapping.getHandlerInternal(RequestMappingInfoHandlerMapping.java:68)\r\n\tat org.springframework.web.servlet.handler.AbstractHandlerMapping.getHandler(AbstractHandlerMapping.java:505)\r\n\tat org.springframework.web.servlet.DispatcherServlet.getHandler(DispatcherServlet.java:1275)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1057)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:31)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\n	\N	\N	\N
82	Login	2023-09-12 11:03:31.981165	7a1e3edc-4679-4f79-b2fd-30d2eb83d4f9	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
83	Login	2023-09-12 11:03:46.885192	9978fe56-0d63-4a84-b6c1-9449bf30c1af	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
84	Login	2023-09-12 11:12:07.519438	badcb7a1-660b-4ce4-ae0f-4b5ce8248dce	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
85	Login	2023-09-12 11:13:33.884098	a9b74805-a01b-4a8f-bb9b-c89d93017c62	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
86	Login	2023-09-12 11:14:35.856145	0a4837e5-0205-49d4-b2ee-84c5a5750826	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
92	SYSTEM_ERROR	\N	\N	Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long'; For input string: "undefined"	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long'; For input string: "undefined"\r\n\tat org.springframework.web.method.annotation.AbstractNamedValueMethodArgumentResolver.resolveArgument(AbstractNamedValueMethodArgumentResolver.java:133)\r\n\tat org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:122)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.getMethodArgumentValues(InvocableHandlerMethod.java:179)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:146)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:31)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.NumberFormatException: For input string: "undefined"\r\n\tat java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n\tat java.base/java.lang.Long.parseLong(Long.java:711)\r\n\tat java.base/java.lang.Long.valueOf(Long.java:1163)\r\n\tat org.springframework.util.NumberUtils.parseNumber(NumberUtils.java:206)\r\n\tat org.springframework.beans.propertyeditors.CustomNumberEditor.setAsText(CustomNumberEditor.java:115)\r\n\tat org.springframework.beans.TypeConverterDelegate.doConvertTextValue(TypeConverterDelegate.java:425)\r\n\tat org.springframework.beans.TypeConverterDelegate.doConvertValue(TypeConverterDelegate.java:398)\r\n\tat org.springframework.beans.TypeConverterDelegate.convertIfNecessary(TypeConverterDelegate.java:155)\r\n\tat org.springframework.beans.TypeConverterSupport.convertIfNecessary(TypeConverterSupport.java:73)\r\n\tat org.springframework.beans.TypeConverterSupport.convertIfNecessary(TypeConverterSupport.java:53)\r\n\tat org.springframework.validation.DataBinder.convertIfNecessary(DataBinder.java:729)\r\n\tat org.springframework.web.method.annotation.AbstractNamedValueMethodArgumentResolver.resolveArgument(AbstractNamedValueMethodArgumentResolver.java:125)\r\n\t... 94 more\r\n	\N	\N	\N
93	SYSTEM_ERROR	\N	\N	Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long'; For input string: "null"	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.web.method.annotation.MethodArgumentTypeMismatchException: Failed to convert value of type 'java.lang.String' to required type 'java.lang.Long'; For input string: "null"\r\n\tat org.springframework.web.method.annotation.AbstractNamedValueMethodArgumentResolver.resolveArgument(AbstractNamedValueMethodArgumentResolver.java:133)\r\n\tat org.springframework.web.method.support.HandlerMethodArgumentResolverComposite.resolveArgument(HandlerMethodArgumentResolverComposite.java:122)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.getMethodArgumentValues(InvocableHandlerMethod.java:179)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:146)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:31)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.NumberFormatException: For input string: "null"\r\n\tat java.base/java.lang.NumberFormatException.forInputString(NumberFormatException.java:67)\r\n\tat java.base/java.lang.Long.parseLong(Long.java:711)\r\n\tat java.base/java.lang.Long.valueOf(Long.java:1163)\r\n\tat org.springframework.util.NumberUtils.parseNumber(NumberUtils.java:206)\r\n\tat org.springframework.beans.propertyeditors.CustomNumberEditor.setAsText(CustomNumberEditor.java:115)\r\n\tat org.springframework.beans.TypeConverterDelegate.doConvertTextValue(TypeConverterDelegate.java:425)\r\n\tat org.springframework.beans.TypeConverterDelegate.doConvertValue(TypeConverterDelegate.java:398)\r\n\tat org.springframework.beans.TypeConverterDelegate.convertIfNecessary(TypeConverterDelegate.java:155)\r\n\tat org.springframework.beans.TypeConverterSupport.convertIfNecessary(TypeConverterSupport.java:73)\r\n\tat org.springframework.beans.TypeConverterSupport.convertIfNecessary(TypeConverterSupport.java:53)\r\n\tat org.springframework.validation.DataBinder.convertIfNecessary(DataBinder.java:729)\r\n\tat org.springframework.web.method.annotation.AbstractNamedValueMethodArgumentResolver.resolveArgument(AbstractNamedValueMethodArgumentResolver.java:125)\r\n\t... 94 more\r\n	\N	\N	\N
102	Login	2023-09-17 19:34:04.939376	481c2378-906a-4b5e-9b2a-c2d214055877	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
103	Login	2023-09-17 19:35:17.430904	6f4bfa2b-d164-4fb8-ac30-80a0cfd7ea23	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
104	Login	2023-09-17 19:38:48.769901	7a6866fc-5c49-45fc-9ed9-10be30316b3c	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
105	Login	2023-09-17 19:39:16.268904	0b9e0658-7d97-4eb5-a915-c9ea7d55b6a9	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
106	Login	2023-09-17 19:39:23.090904	7d33e6b6-a215-4e5f-97a8-be4eb4abef1c	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
107	Login	2023-09-17 19:39:40.671902	161dd7aa-f94c-442e-af93-149449ccf2f0	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
108	Login	2023-09-17 19:39:57.997902	4d09e3d0-20ad-464e-bacd-2e4270afa14c	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
109	Login	2023-09-17 19:42:14.875909	40e06bf1-1ed9-4392-bf94-cef2396ed4d7	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
110	Login	2023-09-17 19:53:19.883942	2b2cddbc-316a-46e6-ba0a-b3b6fc9ce229	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
111	Login	2023-09-17 19:53:30.155944	f59d6e9f-cae5-4371-bb74-fc67086f22c8	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
112	Login	2023-09-17 20:02:30.536612	e20c91f9-e0a9-4071-9ad9-f7c1ac408c99	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
113	Login	2023-09-17 20:03:10.888425	314bf18d-4378-4b90-83bb-4ad9e57e8963	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
114	Login	2023-09-17 20:03:20.190427	66144a90-1e71-4e68-8d50-376131efd8ff	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
115	Login	2023-09-17 20:04:20.23543	0134f99d-d147-40d1-9eca-09943cb02a12	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
116	Login	2023-09-17 20:14:52.918748	2e6fb71e-5353-4412-97de-0013b2025c82	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
117	Login	2023-09-17 20:15:44.21914	c17565a6-d503-46d6-956a-de4400706315	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
118	Login	2023-09-17 20:17:08.737721	3f8f4713-a751-4ad7-b3f5-be9de3743f85	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
119	Login	2023-09-17 20:18:54.918849	0c9d93da-1141-4a7d-a2a0-5c16411805a8	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
120	Login	2023-09-17 20:19:18.646067	faf28a56-d20e-402f-9e82-f63cffabd5bf	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
122	Login	2023-09-18 01:07:04.429446	53c6b33d-cc25-4bee-9b07-e9cbec57bb9c	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
123	Login	2023-09-18 01:08:59.548208	4e80cfb0-b04c-49e7-a92c-73071fd189ac	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
124	Login	2023-09-18 01:11:34.297934	a1f12bd2-cd44-4dcc-adaa-85585281bac3	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
125	Login	2023-09-18 01:12:35.394939	c7585ff2-933b-4077-9df0-6d97af39843f	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
126	Login	2023-09-18 01:38:02.181148	3baac4d1-2bea-46a3-9b45-279fca011bff	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
127	Login	2023-09-18 01:49:29.320424	815cf81f-309d-45a9-812c-fcfae257fe79	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
128	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
129	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
130	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
131	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
132	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
144	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
142	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
143	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
145	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
146	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
147	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
148	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
149	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
150	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
151	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
152	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
153	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
154	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
155	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
156	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
157	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\r\n\tat java.base/jdk.internal.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:77)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 113 more\r\n	lenicode777@gmail.com	1	1
158	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor67.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor66.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 111 more\r\n	lenicode777@gmail.com	1	1
159	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor67.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor66.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 111 more\r\n	lenicode777@gmail.com	1	1
160	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor67.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor66.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 111 more\r\n	lenicode777@gmail.com	1	1
163	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor67.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor66.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 111 more\r\n	lenicode777@gmail.com	1	1
161	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor67.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor66.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 111 more\r\n	lenicode777@gmail.com	1	1
162	SYSTEM_ERROR	\N	815cf81f-309d-45a9-812c-fcfae257fe79	Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	org.springframework.dao.InvalidDataAccessApiUsageException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.springframework.orm.jpa.EntityManagerFactoryUtils.convertJpaAccessExceptionIfPossible(EntityManagerFactoryUtils.java:368)\r\n\tat org.springframework.orm.jpa.vendor.HibernateJpaDialect.translateExceptionIfPossible(HibernateJpaDialect.java:234)\r\n\tat org.springframework.orm.jpa.AbstractEntityManagerFactoryBean.translateExceptionIfPossible(AbstractEntityManagerFactoryBean.java:550)\r\n\tat org.springframework.dao.support.ChainedPersistenceExceptionTranslator.translateExceptionIfPossible(ChainedPersistenceExceptionTranslator.java:61)\r\n\tat org.springframework.dao.support.DataAccessUtils.translateIfNecessary(DataAccessUtils.java:242)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:152)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.jpa.repository.support.CrudMethodMetadataPostProcessor$CrudMethodMetadataPopulatingMethodInterceptor.invoke(CrudMethodMetadataPostProcessor.java:135)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.interceptor.ExposeInvocationInterceptor.invoke(ExposeInvocationInterceptor.java:97)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:244)\r\n\tat jdk.proxy2/jdk.proxy2.$Proxy160.searchUsers(Unknown Source)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService.searchUsers(UserService.java:315)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor67.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:343)\r\n\tat org.springframework.aop.framework.CglibAopProxy$DynamicAdvisedInterceptor.intercept(CglibAopProxy.java:704)\r\n\tat lenicorp.eecole.moduleauth.controller.services.impl.UserService$$SpringCGLIB$$0.searchUsers(<generated>)\r\n\tat lenicorp.eecole.moduleauth.controller.resources.UserResource.searchUser(UserResource.java:58)\r\n\tat jdk.internal.reflect.GeneratedMethodAccessor66.invoke(Unknown Source)\r\n\tat java.base/jdk.internal.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\r\n\tat java.base/java.lang.reflect.Method.invoke(Method.java:568)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.doInvoke(InvocableHandlerMethod.java:205)\r\n\tat org.springframework.web.method.support.InvocableHandlerMethod.invokeForRequest(InvocableHandlerMethod.java:150)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.ServletInvocableHandlerMethod.invokeAndHandle(ServletInvocableHandlerMethod.java:118)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.invokeHandlerMethod(RequestMappingHandlerAdapter.java:884)\r\n\tat org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter.handleInternal(RequestMappingHandlerAdapter.java:797)\r\n\tat org.springframework.web.servlet.mvc.method.AbstractHandlerMethodAdapter.handle(AbstractHandlerMethodAdapter.java:87)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doDispatch(DispatcherServlet.java:1081)\r\n\tat org.springframework.web.servlet.DispatcherServlet.doService(DispatcherServlet.java:974)\r\n\tat org.springframework.web.servlet.FrameworkServlet.processRequest(FrameworkServlet.java:1011)\r\n\tat org.springframework.web.servlet.FrameworkServlet.doGet(FrameworkServlet.java:903)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:564)\r\n\tat org.springframework.web.servlet.FrameworkServlet.service(FrameworkServlet.java:885)\r\n\tat jakarta.servlet.http.HttpServlet.service(HttpServlet.java:658)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:205)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.tomcat.websocket.server.WsFilter.doFilter(WsFilter.java:51)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:110)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.security.web.FilterChainProxy.lambda$doFilterInternal$3(FilterChainProxy.java:231)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:365)\r\n\tat org.springframework.security.web.access.intercept.AuthorizationFilter.doFilter(AuthorizationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:126)\r\n\tat org.springframework.security.web.access.ExceptionTranslationFilter.doFilter(ExceptionTranslationFilter.java:120)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:131)\r\n\tat org.springframework.security.web.session.SessionManagementFilter.doFilter(SessionManagementFilter.java:85)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.AnonymousAuthenticationFilter.doFilter(AnonymousAuthenticationFilter.java:100)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.servletapi.SecurityContextHolderAwareRequestFilter.doFilter(SecurityContextHolderAwareRequestFilter.java:179)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.savedrequest.RequestCacheAwareFilter.doFilter(RequestCacheAwareFilter.java:63)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat lenicorp.eecole.moduleauth.filters.JwtAuthenticationFilter.doFilterInternal(JwtAuthenticationFilter.java:46)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:107)\r\n\tat org.springframework.security.web.authentication.logout.LogoutFilter.doFilter(LogoutFilter.java:93)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.web.filter.CorsFilter.doFilterInternal(CorsFilter.java:91)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doHeadersAfter(HeaderWriterFilter.java:90)\r\n\tat org.springframework.security.web.header.HeaderWriterFilter.doFilterInternal(HeaderWriterFilter.java:75)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:82)\r\n\tat org.springframework.security.web.context.SecurityContextHolderFilter.doFilter(SecurityContextHolderFilter.java:69)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFilter.doFilterInternal(WebAsyncManagerIntegrationFilter.java:62)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.session.DisableEncodeUrlFilter.doFilterInternal(DisableEncodeUrlFilter.java:42)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.springframework.security.web.FilterChainProxy$VirtualFilterChain.doFilter(FilterChainProxy.java:374)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilterInternal(FilterChainProxy.java:233)\r\n\tat org.springframework.security.web.FilterChainProxy.doFilter(FilterChainProxy.java:191)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.invokeDelegate(DelegatingFilterProxy.java:352)\r\n\tat org.springframework.web.filter.DelegatingFilterProxy.doFilter(DelegatingFilterProxy.java:268)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.RequestContextFilter.doFilterInternal(RequestContextFilter.java:100)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.FormContentFilter.doFilterInternal(FormContentFilter.java:93)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.springframework.web.filter.CharacterEncodingFilter.doFilterInternal(CharacterEncodingFilter.java:201)\r\n\tat org.springframework.web.filter.OncePerRequestFilter.doFilter(OncePerRequestFilter.java:116)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.internalDoFilter(ApplicationFilterChain.java:174)\r\n\tat org.apache.catalina.core.ApplicationFilterChain.doFilter(ApplicationFilterChain.java:149)\r\n\tat org.apache.catalina.core.StandardWrapperValve.invoke(StandardWrapperValve.java:166)\r\n\tat org.apache.catalina.core.StandardContextValve.invoke(StandardContextValve.java:90)\r\n\tat org.apache.catalina.authenticator.AuthenticatorBase.invoke(AuthenticatorBase.java:482)\r\n\tat org.apache.catalina.core.StandardHostValve.invoke(StandardHostValve.java:115)\r\n\tat org.apache.catalina.valves.ErrorReportValve.invoke(ErrorReportValve.java:93)\r\n\tat org.apache.catalina.core.StandardEngineValve.invoke(StandardEngineValve.java:74)\r\n\tat org.apache.catalina.connector.CoyoteAdapter.service(CoyoteAdapter.java:341)\r\n\tat org.apache.coyote.http11.Http11Processor.service(Http11Processor.java:391)\r\n\tat org.apache.coyote.AbstractProcessorLight.process(AbstractProcessorLight.java:63)\r\n\tat org.apache.coyote.AbstractProtocol$ConnectionHandler.process(AbstractProtocol.java:894)\r\n\tat org.apache.tomcat.util.net.NioEndpoint$SocketProcessor.doRun(NioEndpoint.java:1740)\r\n\tat org.apache.tomcat.util.net.SocketProcessorBase.run(SocketProcessorBase.java:52)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1191)\r\n\tat org.apache.tomcat.util.threads.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:659)\r\n\tat org.apache.tomcat.util.threads.TaskThread$WrappingRunnable.run(TaskThread.java:61)\r\n\tat java.base/java.lang.Thread.run(Thread.java:833)\r\nCaused by: java.lang.IllegalStateException: Could not determine appropriate instantiation strategy - no matching constructor found and one or more arguments did not define alias for bean-injection\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.resolveAssembler(DynamicInstantiationResultImpl.java:197)\r\n\tat org.hibernate.sql.results.graph.instantiation.internal.DynamicInstantiationResultImpl.createResultAssembler(DynamicInstantiationResultImpl.java:106)\r\n\tat org.hibernate.sql.results.jdbc.internal.StandardJdbcValuesMapping.resolveAssemblers(StandardJdbcValuesMapping.java:53)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:76)\r\n\tat org.hibernate.sql.results.internal.ResultsHelper.createRowReader(ResultsHelper.java:62)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.doExecuteQuery(JdbcSelectExecutorStandardImpl.java:340)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.executeQuery(JdbcSelectExecutorStandardImpl.java:168)\r\n\tat org.hibernate.sql.exec.internal.JdbcSelectExecutorStandardImpl.list(JdbcSelectExecutorStandardImpl.java:93)\r\n\tat org.hibernate.sql.exec.spi.JdbcSelectExecutor.list(JdbcSelectExecutor.java:31)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.lambda$new$0(ConcreteSqmSelectQueryPlan.java:110)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.withCacheableSqmInterpretation(ConcreteSqmSelectQueryPlan.java:303)\r\n\tat org.hibernate.query.sqm.internal.ConcreteSqmSelectQueryPlan.performList(ConcreteSqmSelectQueryPlan.java:244)\r\n\tat org.hibernate.query.sqm.internal.QuerySqmImpl.doList(QuerySqmImpl.java:518)\r\n\tat org.hibernate.query.spi.AbstractSelectionQuery.list(AbstractSelectionQuery.java:367)\r\n\tat org.hibernate.query.Query.getResultList(Query.java:119)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution$PagedExecution.doExecute(JpaQueryExecution.java:204)\r\n\tat org.springframework.data.jpa.repository.query.JpaQueryExecution.execute(JpaQueryExecution.java:92)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.doExecute(AbstractJpaQuery.java:148)\r\n\tat org.springframework.data.jpa.repository.query.AbstractJpaQuery.execute(AbstractJpaQuery.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.doInvoke(RepositoryMethodInvoker.java:136)\r\n\tat org.springframework.data.repository.core.support.RepositoryMethodInvoker.invoke(RepositoryMethodInvoker.java:120)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.doInvoke(QueryExecutorMethodInterceptor.java:164)\r\n\tat org.springframework.data.repository.core.support.QueryExecutorMethodInterceptor.invoke(QueryExecutorMethodInterceptor.java:143)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.data.projection.DefaultMethodInvokingMethodInterceptor.invoke(DefaultMethodInvokingMethodInterceptor.java:72)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor$1.proceedWithInvocation(TransactionInterceptor.java:123)\r\n\tat org.springframework.transaction.interceptor.TransactionAspectSupport.invokeWithinTransaction(TransactionAspectSupport.java:391)\r\n\tat org.springframework.transaction.interceptor.TransactionInterceptor.invoke(TransactionInterceptor.java:119)\r\n\tat org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:184)\r\n\tat org.springframework.dao.support.PersistenceExceptionTranslationInterceptor.invoke(PersistenceExceptionTranslationInterceptor.java:137)\r\n\t... 111 more\r\n	lenicode777@gmail.com	1	1
172	Refresh token	2023-09-20 11:16:31.347102	faf28a56-d20e-402f-9e82-f63cffabd5bf	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
182	Refresh token	2023-09-20 11:40:37.776939	faf28a56-d20e-402f-9e82-f63cffabd5bf	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
183	Login	2023-09-20 11:43:40.311119	60b154df-4a60-406c-ab5a-d5a9addf598f	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
184	Refresh token	2023-09-20 11:45:35.819783	60b154df-4a60-406c-ab5a-d5a9addf598f	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
192	Login	2023-09-20 11:48:05.166672	e6d76d4c-8146-4c33-9a23-798c8bac196a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
193	Login	2023-09-20 11:52:32.763996	ee2e450b-c05d-4894-90f3-6418e3473037	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
194	Refresh token	2023-09-20 11:53:10.249575	ee2e450b-c05d-4894-90f3-6418e3473037	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
195	Refresh token	2023-09-20 11:53:13.805178	ee2e450b-c05d-4894-90f3-6418e3473037	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
196	Login	2023-09-20 12:47:35.779501	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
197	Refresh token	2023-09-20 12:47:53.7783	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
198	Refresh token	2023-09-20 12:47:53.828405	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
199	Refresh token	2023-09-20 12:48:16.155232	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
200	Refresh token	2023-09-20 12:48:21.943177	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
201	Refresh token	2023-09-20 12:48:21.987174	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
202	Refresh token	2023-09-20 12:49:30.581855	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
203	Refresh token	2023-09-20 12:49:36.853059	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
204	Refresh token	2023-09-20 12:50:37.432382	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
205	Refresh token	2023-09-20 12:53:33.992856	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
206	Refresh token	2023-09-20 12:55:23.667937	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
207	Refresh token	2023-09-20 12:55:41.006888	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
208	Refresh token	2023-09-20 12:59:16.189183	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
209	Refresh token	2023-09-20 12:59:16.227212	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
210	Refresh token	2023-09-20 12:59:19.639737	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
211	Refresh token	2023-09-20 12:59:38.250909	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
212	Refresh token	2023-09-20 13:00:24.17091	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
213	Refresh token	2023-09-20 13:00:24.20091	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
214	Refresh token	2023-09-20 13:00:24.945853	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
215	Refresh token	2023-09-20 13:01:48.680494	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
216	Refresh token	2023-09-20 13:02:37.168934	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
217	Refresh token	2023-09-20 13:02:37.196936	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
218	Refresh token	2023-09-20 13:02:40.536955	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
219	Refresh token	2023-09-20 13:02:48.40077	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
220	Refresh token	2023-09-20 13:02:49.263815	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
221	Refresh token	2023-09-20 13:02:49.327769	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
222	Refresh token	2023-09-20 13:04:00.194502	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
223	Refresh token	2023-09-20 13:04:00.224504	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
224	Refresh token	2023-09-20 13:04:00.275505	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
225	Refresh token	2023-09-20 13:04:03.360648	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
226	Refresh token	2023-09-20 13:04:04.25863	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
227	Refresh token	2023-09-20 13:04:04.30863	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
228	Refresh token	2023-09-20 13:05:09.562121	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
229	Refresh token	2023-09-20 13:05:21.526794	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
230	Refresh token	2023-09-20 13:06:57.118613	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
233	Refresh token	2023-09-20 13:14:38.122106	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
234	Refresh token	2023-09-20 13:16:05.149989	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
231	Refresh token	2023-09-20 13:07:16.447731	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
232	Refresh token	2023-09-20 13:14:11.104212	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
235	Refresh token	2023-09-20 13:16:20.817444	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
236	Refresh token	2023-09-20 13:16:54.665132	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
237	Refresh token	2023-09-20 13:17:04.529495	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
238	Refresh token	2023-09-20 13:19:27.178549	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
239	Refresh token	2023-09-20 13:19:27.212589	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
240	Refresh token	2023-09-20 13:19:28.305337	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
241	Refresh token	2023-09-20 13:21:03.171643	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
242	Refresh token	2023-09-20 13:21:03.205644	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
243	Refresh token	2023-09-20 13:21:07.025368	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
244	Refresh token	2023-09-20 13:21:10.368039	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
245	Refresh token	2023-09-20 13:21:11.329039	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
246	Refresh token	2023-09-20 13:21:11.38204	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
247	Refresh token	2023-09-20 13:22:13.216349	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
248	Refresh token	2023-09-20 13:23:53.291326	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
249	Refresh token	2023-09-20 13:25:27.835575	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
250	Refresh token	2023-09-20 13:26:10.225305	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
251	Refresh token	2023-09-20 13:31:47.69446	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
252	Refresh token	2023-09-20 13:34:04.152115	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
253	Refresh token	2023-09-20 13:34:31.173744	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
254	Refresh token	2023-09-20 13:34:31.204744	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
255	Refresh token	2023-09-20 13:34:34.195139	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
256	Refresh token	2023-09-20 13:37:16.174306	c67ec66a-302a-4f8b-91a2-0d383aa32bdc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
257	Login	2023-09-20 13:42:47.674162	d414c368-a70e-4715-b35a-53140cc04071	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
262	Login	2023-09-20 13:44:57.417239	6685d5a6-fae9-48f4-b26e-badb571aa8ff	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
263	Login	2023-09-20 13:45:25.579756	ba7ecf42-bb64-4274-8f6d-c137461cdb1c	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
264	Login	2023-09-20 13:46:01.457183	aa015e9a-5ebc-47d9-acc2-f10c3d6fdca3	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
265	Login	2023-09-20 13:46:50.161733	fa86214b-26ef-44b0-9c15-06a5b0c88763	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
266	Login	2023-09-20 13:47:12.145299	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
267	Refresh token	2023-09-20 13:56:50.226772	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
268	Refresh token	2023-09-20 13:56:50.275769	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
269	Refresh token	2023-09-20 13:56:50.30777	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
270	Refresh token	2023-09-20 13:56:50.337769	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
271	Refresh token	2023-09-20 13:56:53.792356	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
272	Refresh token	2023-09-20 13:57:13.662571	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
273	Refresh token	2023-09-20 13:57:13.719575	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
274	Refresh token	2023-09-20 13:57:18.918796	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
275	Refresh token	2023-09-20 13:57:19.5718	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
276	Refresh token	2023-09-20 13:57:19.627797	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
277	Refresh token	2023-09-20 13:57:54.524278	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
278	Refresh token	2023-09-20 13:57:54.556276	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
279	Refresh token	2023-09-20 13:58:02.730019	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
282	Refresh token	2023-09-20 13:59:14.880222	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
283	Refresh token	2023-09-20 13:59:15.131223	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
284	Refresh token	2023-09-20 13:59:15.207221	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
285	Refresh token	2023-09-20 14:00:34.192594	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
286	Refresh token	2023-09-20 14:00:34.255595	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
287	Refresh token	2023-09-20 14:01:49.996279	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
288	Refresh token	2023-09-20 14:01:50.04828	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
289	Refresh token	2023-09-20 14:01:50.100282	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
290	Refresh token	2023-09-20 14:01:50.16028	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
291	Refresh token	2023-09-20 14:05:29.240093	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
292	Refresh token	2023-09-20 14:05:29.285093	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
293	Refresh token	2023-09-20 14:05:29.318092	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
294	Refresh token	2023-09-20 14:05:29.346091	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
295	Refresh token	2023-09-20 14:05:29.36909	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
296	Refresh token	2023-09-20 14:05:29.394091	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
297	Refresh token	2023-09-20 14:05:29.41709	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
298	Refresh token	2023-09-20 14:05:29.442091	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
299	Refresh token	2023-09-20 14:07:40.914809	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
300	Refresh token	2023-09-20 14:08:48.252706	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
301	Refresh token	2023-09-20 14:09:54.855406	7c522154-80ba-4f81-8d73-dfe043d7606d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
302	Login	2023-09-20 14:10:48.771467	4b7326ab-01aa-4054-aadb-3330d12042f4	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
303	Refresh token	2023-09-20 14:14:14.683625	4b7326ab-01aa-4054-aadb-3330d12042f4	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
304	Login	2023-09-20 14:16:11.041657	4fdb0da8-79c6-4fb7-af2b-4d1227f55aaa	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
305	Refresh token	2023-09-20 14:20:56.186211	4fdb0da8-79c6-4fb7-af2b-4d1227f55aaa	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
306	Refresh token	2023-09-20 14:20:56.210211	4fdb0da8-79c6-4fb7-af2b-4d1227f55aaa	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
307	Refresh token	2023-09-20 14:20:56.233212	4fdb0da8-79c6-4fb7-af2b-4d1227f55aaa	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
308	Refresh token	2023-09-20 14:20:56.25521	4fdb0da8-79c6-4fb7-af2b-4d1227f55aaa	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
309	Refresh token	2023-09-20 14:22:22.260262	4fdb0da8-79c6-4fb7-af2b-4d1227f55aaa	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
310	Refresh token	2023-09-20 14:22:22.290263	4fdb0da8-79c6-4fb7-af2b-4d1227f55aaa	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
311	Refresh token	2023-09-20 14:22:22.314261	4fdb0da8-79c6-4fb7-af2b-4d1227f55aaa	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
312	Refresh token	2023-09-20 14:22:22.346261	4fdb0da8-79c6-4fb7-af2b-4d1227f55aaa	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
313	Login	2023-09-20 14:22:54.029122	056a5d08-42a4-41bc-966c-7cdcde57e7c1	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
314	Login	2023-09-20 14:24:01.517972	6515884f-badb-45b4-9610-deb5baf73fff	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
315	Refresh token	2023-09-20 14:26:21.172255	6515884f-badb-45b4-9610-deb5baf73fff	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
316	Refresh token	2023-09-20 14:26:21.196294	6515884f-badb-45b4-9610-deb5baf73fff	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
317	Refresh token	2023-09-20 14:26:21.216257	6515884f-badb-45b4-9610-deb5baf73fff	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
318	Refresh token	2023-09-20 14:26:21.241258	6515884f-badb-45b4-9610-deb5baf73fff	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
319	Login	2023-09-20 14:26:43.532311	7348380b-d801-41a3-acfd-4fd4b044df71	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
320	Refresh token	2023-09-20 14:30:42.203572	7348380b-d801-41a3-acfd-4fd4b044df71	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
321	Refresh token	2023-09-20 14:30:42.241571	7348380b-d801-41a3-acfd-4fd4b044df71	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
322	Refresh token	2023-09-20 14:30:42.271572	7348380b-d801-41a3-acfd-4fd4b044df71	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
323	Refresh token	2023-09-20 14:30:42.295574	7348380b-d801-41a3-acfd-4fd4b044df71	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
324	Login	2023-09-20 14:31:44.522665	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
325	Refresh token	2023-09-20 14:32:50.410366	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
326	Refresh token	2023-09-20 14:32:50.437363	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
327	Refresh token	2023-09-20 14:32:50.46236	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
328	Refresh token	2023-09-20 14:32:50.48936	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
329	Refresh token	2023-09-20 14:35:20.009993	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
330	Refresh token	2023-09-20 14:35:20.033981	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
331	Refresh token	2023-09-20 14:35:20.059019	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
332	Refresh token	2023-09-20 14:35:20.079979	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
333	Refresh token	2023-09-20 14:39:24.182354	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
334	Refresh token	2023-09-20 14:39:24.210353	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
335	Refresh token	2023-09-20 14:39:24.242351	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
336	Refresh token	2023-09-20 14:39:24.268352	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
337	Refresh token	2023-09-20 14:39:24.294354	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
338	Refresh token	2023-09-20 14:39:24.318351	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
339	Refresh token	2023-09-20 14:39:24.336351	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
340	Refresh token	2023-09-20 14:39:24.35235	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
341	Refresh token	2023-09-20 14:41:26.588577	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
342	Refresh token	2023-09-20 14:43:07.902773	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
343	Refresh token	2023-09-20 14:45:44.194515	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
344	Refresh token	2023-09-20 14:45:44.219514	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
345	Refresh token	2023-09-20 14:45:44.247515	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
346	Refresh token	2023-09-20 14:45:44.271515	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
347	Refresh token	2023-09-20 14:47:32.175077	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
348	Refresh token	2023-09-20 14:47:32.205077	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
349	Refresh token	2023-09-20 14:47:32.228079	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
350	Refresh token	2023-09-20 14:47:32.255077	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
351	Refresh token	2023-09-20 14:47:32.277078	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
352	Refresh token	2023-09-20 14:47:32.300078	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
353	Refresh token	2023-09-20 14:47:32.322075	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
354	Refresh token	2023-09-20 14:47:32.341076	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
355	Refresh token	2023-09-20 14:48:52.172621	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
356	Refresh token	2023-09-20 14:48:52.20062	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
357	Refresh token	2023-09-20 14:48:52.23062	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
358	Refresh token	2023-09-20 14:48:52.274622	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
359	Refresh token	2023-09-20 15:51:41.405948	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
360	Refresh token	2023-09-20 15:59:02.842723	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
361	Refresh token	2023-09-20 17:53:58.288425	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
362	Refresh token	2023-09-20 17:53:58.336424	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
363	Refresh token	2023-09-20 17:53:58.366429	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
364	Refresh token	2023-09-20 17:53:58.399428	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
365	Refresh token	2023-09-20 17:56:29.216815	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
366	Refresh token	2023-09-20 17:56:29.253812	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
367	Refresh token	2023-09-20 17:56:29.277815	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
368	Refresh token	2023-09-20 17:56:29.344812	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
369	Refresh token	2023-09-20 17:58:22.16465	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
370	Refresh token	2023-09-20 17:58:22.319371	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
371	Refresh token	2023-09-20 17:58:22.342365	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
372	Refresh token	2023-09-20 17:58:22.365367	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
373	Refresh token	2023-09-20 18:02:12.212913	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
374	Refresh token	2023-09-20 18:02:12.237911	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
375	Refresh token	2023-09-20 18:04:04.245939	dcf77c15-6229-4fa9-afe1-673a40da8172	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
376	Login	2023-09-20 18:09:22.749906	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
377	Refresh token	2023-09-20 18:11:11.289134	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
378	Refresh token	2023-09-20 18:11:11.356128	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
379	Refresh token	2023-09-20 18:11:11.382131	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
380	Refresh token	2023-09-20 18:11:11.406137	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
381	Refresh token	2023-09-20 18:12:45.123354	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
382	Refresh token	2023-09-20 18:12:45.224392	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
383	Refresh token	2023-09-21 19:08:39.354027	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
384	Refresh token	2023-09-21 19:08:39.445083	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
385	Refresh token	2023-09-21 19:08:39.537524	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
386	Refresh token	2023-09-21 19:08:39.585424	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
387	Refresh token	2023-09-21 19:08:39.639475	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
388	Refresh token	2023-09-21 19:08:39.699472	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
389	Refresh token	2023-09-21 19:08:39.762605	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
390	Refresh token	2023-09-21 19:08:39.815554	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
391	Refresh token	2023-09-21 19:21:27.194264	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
392	Refresh token	2023-09-21 19:21:27.585308	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
393	Refresh token	2023-09-21 19:24:52.344499	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
394	Refresh token	2023-09-21 19:27:25.173229	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
395	Refresh token	2023-09-21 19:27:25.235335	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
396	Refresh token	2023-09-21 19:28:35.67035	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
397	Refresh token	2023-09-21 19:29:43.104168	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
398	Refresh token	2023-09-21 19:31:03.14376	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
399	Refresh token	2023-09-21 19:32:05.549899	666cdafb-d79c-4e04-8666-119a18ffbb7b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
400	Login	2023-09-21 19:33:02.534278	af55fa04-0fab-4c1a-8369-1babdd652150	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
401	Login	2023-09-21 19:33:15.753992	51e68d54-ce70-4b83-9d4d-ad1923911166	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
402	Login	2023-09-21 19:36:52.903457	4a239dca-b740-461c-8c21-7b49d625fc6f	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
403	Login	2023-09-21 19:39:40.062544	d54d50a7-1c3b-4120-887d-1ec2a1135ce2	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
404	Login	2023-09-21 19:40:35.351508	a5a8ccbf-553a-451c-a9e2-46d4298a7212	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
405	Refresh token	2023-09-21 19:44:46.129982	a5a8ccbf-553a-451c-a9e2-46d4298a7212	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
406	Refresh token	2023-09-21 19:44:46.188981	a5a8ccbf-553a-451c-a9e2-46d4298a7212	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
407	Login	2023-09-21 19:45:38.142616	f2298cb5-f287-46fb-9e42-8ea072ef0c97	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
408	Login	2023-09-21 19:46:51.058755	251e57e0-6284-453a-bc6f-f6a3bb5df036	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
409	Login	2023-09-21 19:47:23.293485	9a9ac7fe-b7af-4f19-93a9-3e5976e5f4cf	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
410	Login	2023-09-21 19:50:30.664891	0ce499cb-bcbc-49d7-b610-c0ebb03bccc8	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
411	Login	2023-09-21 19:50:47.253331	3d74fa74-60e3-4e38-a5df-8c55987e3f36	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
412	Refresh token	2023-09-21 19:52:19.768035	3d74fa74-60e3-4e38-a5df-8c55987e3f36	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
413	Refresh token	2023-09-21 19:58:12.942295	3d74fa74-60e3-4e38-a5df-8c55987e3f36	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
414	Login	2023-09-21 19:58:45.64931	c98df0c7-bada-4baf-b721-6ddf0b24d014	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
415	Login	2023-09-21 20:50:03.222457	f2f4c220-e971-4bdd-8520-846d44c9a26c	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
416	Login	2023-09-21 20:50:52.862203	bcffbea5-46e0-4fd0-9f3d-3a44cc0416a7	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
417	Refresh token	2023-09-21 20:52:28.231668	bcffbea5-46e0-4fd0-9f3d-3a44cc0416a7	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
418	Refresh token	2023-09-21 20:52:28.459668	bcffbea5-46e0-4fd0-9f3d-3a44cc0416a7	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
419	Login	2023-09-21 20:55:25.399526	6b68c0a8-aa0c-43d4-ba10-6cf3f1096794	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
420	Login	2023-09-21 20:55:39.705098	8daee865-bf77-4fb4-b951-0eb3396b2bec	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
421	Login	2023-09-21 20:57:57.288143	63ece417-a415-4aa8-a2fb-1e61ce676ce0	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
422	Login	2023-09-21 20:58:17.730076	96de29cc-91ef-4dd8-9b08-6935fb6ced31	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
423	Login	2023-09-21 21:01:49.927837	e52fff57-5c94-4a88-9717-ae1855b53d08	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
424	Login	2023-09-21 21:02:15.820186	5a156212-888b-4035-8967-4009dc045ed2	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
425	Refresh token	2023-09-21 21:06:02.230308	5a156212-888b-4035-8967-4009dc045ed2	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
426	Login	2023-09-21 21:06:48.743284	3dc16bae-0687-494d-b333-735c2f6aa2f7	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
427	Login	2023-09-21 21:07:36.143017	26b9dfa8-8853-43d3-950b-6165e617e827	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
428	Login	2023-09-21 21:07:40.444887	b8fe1ccc-c6c3-45c0-af5c-3259d0c99a20	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
429	Login	2023-09-21 21:07:42.028065	b2101a7e-8024-41af-ae7c-38ca6e46ef3b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
430	Login	2023-09-21 21:07:43.364327	522e096e-948a-49e5-8a42-b2c2290d1092	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
431	Login	2023-09-21 21:07:44.551793	7b54ea45-0c75-4375-85b2-1620d1d529d8	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
432	Login	2023-09-21 21:07:47.342565	6a25dd12-902d-4692-ac0c-234f53730f53	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
433	Login	2023-09-21 21:07:48.071094	02ebe246-13f4-401a-95bb-654be3267fb2	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
434	Login	2023-09-21 21:08:58.387531	e33d6dc6-1fd1-4178-929a-ac397327b7d4	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
435	Login	2023-09-21 21:08:58.44253	8acc9447-6802-4bec-b808-754ccd73afe7	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
436	Login	2023-09-21 21:08:59.180534	7d4af944-649b-4dc6-ad21-271d2ab935f4	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
438	Login	2023-09-21 21:08:59.181532	b536ae84-6859-4bd8-8a14-6c8e786ddf27	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
439	Login	2023-09-21 21:08:59.183532	723350b5-e493-4df0-be1a-b5158b99c63f	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
437	Login	2023-09-21 21:08:59.184534	9ddcd29d-a25c-4903-89a7-3257e4d13e3d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
440	Login	2023-09-21 21:08:59.232534	13c00fa3-9969-467f-8284-a4d219c8e8b1	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
441	Login	2023-09-21 21:08:59.317531	7787df54-7734-4ace-baad-f5f70a87dc15	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
442	Login	2023-09-21 21:08:59.420533	f5238fb0-f23f-4fc9-9e87-e4942e5f4e13	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
443	Login	2023-09-21 21:08:59.424536	b41cef17-b316-4cb5-ba9a-54436d51541c	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
445	Login	2023-09-21 21:08:59.438533	405bce81-6b5c-4461-805a-f5c29462241d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
444	Login	2023-09-21 21:08:59.438533	fce1ce38-a847-4924-9e02-f3e6867f3c92	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
446	Login	2023-09-21 21:08:59.494532	78171154-cdab-4443-a220-a0f362e95883	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
447	Login	2023-09-21 21:08:59.529531	dad50f2a-a4fc-4725-b0ab-80f5a9ce8ae8	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
449	Login	2023-09-21 21:08:59.726532	30dc39ca-303c-4383-a10a-d9a24f81ba59	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
448	Login	2023-09-21 21:08:59.736532	a7bea7b1-ba91-4456-9d1b-b5fcfa3c45b9	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
450	Login	2023-09-21 21:08:59.794533	afeae63d-75ba-4d42-96ee-87ac0ff78dde	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
451	Login	2023-09-21 21:08:59.800533	cb5a7483-fb22-400e-a824-b046e5421406	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
452	Login	2023-09-21 21:08:59.860534	21ca9d29-9e51-4efa-8226-330a8e07185b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
453	Login	2023-09-21 21:08:59.860534	b7b0ddc3-41b3-4727-ac9d-7065cc063eef	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
454	Login	2023-09-21 21:08:59.934533	b66e18c1-7201-4e2e-a84c-ca7ec91fbe5d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
455	Login	2023-09-21 21:08:59.949533	1fdf04d0-cfce-491d-9c23-74b27ae71b61	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
456	Login	2023-09-21 21:08:59.960545	182321d7-6474-4e9c-bb62-b678dc76a7a6	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
457	Login	2023-09-21 21:08:59.983532	de9591eb-57e9-4f6e-b52c-d39eca7a9908	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
458	Login	2023-09-21 21:09:25.261527	56535eb3-3800-4578-bf64-719c3167a8dd	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
459	Login	2023-09-21 21:09:27.423026	384b4aa2-fb95-41ec-8346-040184c27a9a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
460	Login	2023-09-21 21:09:28.445032	5f0d356f-b88b-4bb2-a9df-1dbd9d4d9160	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
461	Login	2023-09-21 21:09:28.81838	e3e679e1-e232-459d-a593-65f11b44debf	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
462	Login	2023-09-21 21:09:29.199362	9ec14210-5ec9-4326-9df5-14549530a292	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
463	Login	2023-09-21 21:09:29.528145	6fe91746-1c46-48ae-9e3b-47648dbac64e	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
464	Login	2023-09-21 21:09:29.699145	ad60d4e1-c6e7-4c9b-9828-bc9b3957ac54	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
465	Login	2023-09-21 21:09:29.862204	814202fe-b024-46a4-b470-7e30178c39c6	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
466	Login	2023-09-21 21:09:30.028849	3eaa77ba-667b-4bcb-95c2-08ee29ac58ef	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
467	Login	2023-09-21 21:09:30.200674	29b4039f-9f51-418d-8446-8d2b17032bb1	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
472	Login	2023-09-21 21:09:31.115605	2d784645-06d2-49c5-8c80-4d510311bf3f	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
476	Login	2023-09-21 21:09:31.748238	a96a2ec8-409f-4ce9-975b-36d40e90d5fe	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
468	Login	2023-09-21 21:09:30.363549	8c7af8e1-95db-47e6-b7ff-97de6029a559	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
474	Login	2023-09-21 21:09:31.473807	bf401a47-d623-4e0b-9d0c-38c4d4ca1010	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
478	Login	2023-09-21 21:09:32.130263	1ca93ebd-75a1-4aff-9748-951ea45b245f	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
469	Login	2023-09-21 21:09:30.647449	0a0238a6-1596-44b1-b8f9-004a7e8e58b1	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
473	Login	2023-09-21 21:09:31.304781	30de65f8-6fee-4c8d-b92e-59d2bb6be6e9	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
479	Login	2023-09-21 21:09:33.031659	cbfea372-047a-4fa8-8918-7905be045316	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
470	Login	2023-09-21 21:09:30.823563	c47c654a-04c1-4d5f-906d-9a2936549938	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
471	Login	2023-09-21 21:09:30.942564	15082935-ce82-4142-9627-4965aed34aa0	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
475	Login	2023-09-21 21:09:31.56678	6d794546-3972-414a-8b1d-60d6cd87c58d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
477	Login	2023-09-21 21:09:31.926266	95acbc87-65f4-4e92-8cd5-d7fad46444b6	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
480	Refresh token	2023-09-21 21:11:06.493251	cbfea372-047a-4fa8-8918-7905be045316	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
481	Refresh token	2023-09-21 21:13:59.191445	cbfea372-047a-4fa8-8918-7905be045316	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
482	Refresh token	2023-09-21 21:14:59.904435	cbfea372-047a-4fa8-8918-7905be045316	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
483	Login	2023-09-21 21:15:36.883331	71eafc92-14ec-4bbc-89f8-19d362eeaa99	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
484	Refresh token	2023-09-21 21:17:14.205553	71eafc92-14ec-4bbc-89f8-19d362eeaa99	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
485	Login	2023-09-21 21:17:38.985622	1cb3b980-b495-4f32-82cf-4e70da7b983b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
486	Refresh token	2023-09-21 21:20:08.187374	1cb3b980-b495-4f32-82cf-4e70da7b983b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
487	Refresh token	2023-09-21 21:23:05.589971	1cb3b980-b495-4f32-82cf-4e70da7b983b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
488	Refresh token	2023-09-21 21:27:15.208402	1cb3b980-b495-4f32-82cf-4e70da7b983b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
489	Refresh token	2023-09-21 21:31:02.200421	1cb3b980-b495-4f32-82cf-4e70da7b983b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
490	Login	2023-09-21 21:31:46.563616	9f2aaacd-0dc5-4d38-b4fe-56d0b4287fd3	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
491	Login	2023-09-21 21:31:53.62639	ba91d3bb-2319-4d00-ac5f-c4414b696058	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
492	Login	2023-09-21 21:31:55.508245	a8a605cf-fb38-4094-99e5-9edaa593d902	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
493	Login	2023-09-21 21:31:57.488934	11222f9e-163f-4f98-8e40-33e89009884b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
494	Login	2023-09-21 21:31:59.455196	bc9367f8-2beb-4cf2-b704-d11561ba0baf	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
495	Login	2023-09-21 21:32:07.034664	a8608ee0-3f81-4ee6-850a-886d17ddabb0	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
496	Login	2023-09-21 22:33:13.247227	b732b490-96b5-46c3-82d3-02fab388ed3e	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
497	Login	2023-09-21 22:33:16.075628	bde147f1-7767-43f5-a612-a38ecf1d8937	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
498	Login	2023-09-21 22:33:17.456574	10582b74-30d2-413f-bab3-9dc024336d96	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
499	Login	2023-09-21 22:34:32.739954	2e2d203c-c07c-46f2-8722-5c2bf2486dc1	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
500	Login	2023-09-21 22:35:23.951707	cb6b4bcc-cdaf-4fed-a76f-067f69668b56	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
501	Login	2023-09-21 22:35:28.925852	becf325a-43d2-4781-9c7e-cde5fe1648ee	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
502	Login	2023-09-21 22:35:32.339697	a5bdb0b8-3382-4402-9595-01aa0270ace9	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
503	Login	2023-09-21 22:35:33.477471	0054fee9-a6aa-49aa-b14a-52967410b168	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
504	Login	2023-09-21 22:35:34.314724	2cb1265b-d1d1-49b0-9ea3-6bb799a84e6a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
505	Login	2023-09-21 22:35:35.958142	49e73cc8-5225-4ed5-8c03-9c21dcbdb5c8	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
506	Login	2023-09-21 22:35:36.299138	e84517a7-5a70-47bc-92f8-dbf3d58c2b7e	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
507	Login	2023-09-21 22:35:36.638794	cc9cb86a-8548-46d1-9922-69c172a68940	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
508	Login	2023-09-21 22:35:37.131088	0360fd88-180d-43a1-846e-8e6ca4a229f5	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
509	Login	2023-09-21 22:35:37.595307	87ce56a6-2f0f-41fe-bc0b-4173e16689f3	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
510	Login	2023-09-21 22:35:38.072135	f72b8863-bb3d-41cc-8629-0f5dda50a55f	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
511	Login	2023-09-21 22:35:38.395848	af0929bf-afa1-4ffe-9134-c826203a5809	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
512	Login	2023-09-21 22:35:58.254279	9e54de5d-d40c-45af-a9eb-8f2d1ce85541	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
513	Login	2023-09-23 10:06:21.927799	1d6d481d-b8ed-41d2-bd4a-6c0b66358e89	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
514	Login	2023-09-25 14:54:53.519669	7ed6446d-e47e-4492-9be2-bc3c821178ed	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
515	Login	2023-09-25 14:55:12.107974	5aded271-02c5-4591-9370-67d69c9b2b60	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
516	Login	2023-09-25 14:56:25.178034	5189e626-5a4c-4a43-bcaf-bb3eb713a06e	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
517	Login	2023-09-25 14:56:28.894702	503bdfdd-aa46-48ff-aa9e-496f666c4269	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
518	Login	2023-09-25 14:56:32.746993	7a1b916c-9059-4d26-a77e-e63d81e0774d	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
519	Login	2023-09-25 14:56:36.379494	1038ad32-b107-4e56-8d0d-d2c17ddc00ff	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
520	Login	2023-09-25 14:56:42.4892	a4364852-8bf3-4bf7-9735-a7098c612f12	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
521	Login	2023-09-25 14:56:48.479577	c8f0a1c7-ad64-4ce0-87e1-855fbb523bc0	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
522	Login	2023-09-25 14:56:51.13539	24ddf55c-da71-40d0-a65a-a612d52c422f	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
523	Login	2023-09-25 14:56:53.17725	6525d1c5-cce7-4072-9283-4c1f84f6e72c	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
524	Login	2023-09-25 14:57:09.264957	a4115fa0-e304-4c92-a40f-b4cf0a90b8d7	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
525	Login	2023-09-25 14:58:06.543347	7dab5471-5639-4256-8dca-85ab20f7f2bf	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
526	Login	2023-09-25 14:58:10.139121	d089d948-88a3-4f12-8e30-b58b0a3a03fa	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
527	Login	2023-09-25 14:58:13.864937	10c3b04a-270f-45b0-90b1-018599e0df47	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
528	Login	2023-09-25 14:58:29.015326	de2fd215-d881-4a38-a6db-f24829573726	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
529	Login	2023-09-25 14:58:34.019094	3ac9076c-af02-4751-bb91-7b97a4198842	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
530	Login	2023-09-25 15:01:50.17168	a55b2491-6d5a-493f-9112-79698b331422	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
531	Login	2023-09-25 15:02:03.870832	adfb967d-ce69-4648-85da-a2d5a61a62d1	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
532	Login	2023-09-25 15:03:30.210905	96eb7823-7e94-44df-b69e-21748054d463	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
533	Login	2023-09-25 15:05:46.595043	26c25f3f-77ce-4176-845f-b03748375fcc	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
534	Login	2023-09-25 15:10:54.193286	294f77b5-eb05-49a9-a47c-a86ba0d1c86b	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
535	Login	2023-09-25 15:11:34.027815	21ea603d-8f08-42e1-af2c-fba8209fd467	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
536	Login	2023-09-25 15:15:52.299808	7a8dd734-5f35-4164-a2a2-ec55e1372773	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
537	Login	2023-09-25 15:18:04.457879	479ad31f-526e-4fee-9410-4f82652acb41	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
538	Login	2023-09-25 15:19:15.64783	cd1602b0-3c1a-4049-8531-326fcba5e292	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
539	Login	2023-09-25 15:21:02.162634	69a20fd2-272b-4add-8d7c-c62eb22c13a9	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
540	Login	2023-09-25 15:28:45.498511	35f5caf3-1a86-4bb0-a931-4862b5ed5ad8	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
541	Login	2023-09-25 15:29:28.154512	1ce2ec8f-eba6-4856-8bc2-0a4705b3ba22	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
542	Login	2023-09-25 15:30:33.895064	c7f37bf6-a3c6-4016-8a86-81561fc2947a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
543	Login	2023-09-25 15:31:32.313958	25eda40b-f19d-4a7e-b71c-8ebb5f74f101	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
544	Login	2023-09-25 15:32:20.329503	bc575ef1-6025-4606-8843-49e91df3be59	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
545	Login	2023-09-25 15:46:09.719703	7e5f5bba-a619-4306-aa4b-5afdfd208a65	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
546	Login	2023-09-25 15:47:12.575158	5b6545a0-36b8-4c3e-920a-b50eba530502	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
547	Login	2023-09-25 15:49:01.973173	dd083211-138c-434a-ab9f-ed340aa4a5d8	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
548	Login	2023-09-25 15:49:27.860994	b836735a-a868-46f8-84a1-f70f347dda52	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
549	Login	2023-09-25 15:51:48.89275	e232b5b7-7f99-4d76-a5e2-2c7b78366496	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
550	Login	2023-09-25 15:53:03.927246	15c2fb50-5b50-4ac2-919d-f2e8211b0b79	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
551	Login	2023-09-25 15:55:07.27368	b22b9a29-adb5-443f-9f42-196751f2aa16	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
552	Login	2023-09-25 15:57:39.200092	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
553	Refresh token	2023-10-01 15:33:11.512457	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
554	Refresh token	2023-10-01 15:41:08.16722	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
555	Refresh token	2023-10-01 15:47:48.584375	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
556	Refresh token	2023-10-01 15:47:48.979777	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
557	Refresh token	2023-10-01 15:47:58.742656	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
558	Refresh token	2023-10-01 15:47:59.66166	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
559	Refresh token	2023-10-01 15:48:58.014406	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
560	Refresh token	2023-10-01 15:49:03.657417	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
561	Refresh token	2023-10-01 15:49:04.556413	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
562	Refresh token	2023-10-01 15:50:38.504983	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
563	Refresh token	2023-10-01 15:50:41.650234	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
564	Refresh token	2023-10-01 15:50:42.655233	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
565	Refresh token	2023-10-01 15:51:32.363038	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
566	Refresh token	2023-10-01 15:51:57.175376	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
567	Refresh token	2023-10-01 15:51:58.429286	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
568	Refresh token	2023-10-01 15:56:16.338253	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
569	Refresh token	2023-10-01 15:56:17.688009	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
570	Refresh token	2023-10-01 16:08:48.057666	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
571	Refresh token	2023-10-01 16:11:18.420122	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
572	Refresh token	2023-10-01 16:11:18.678119	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
573	Refresh token	2023-10-01 16:22:31.756101	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
574	Refresh token	2023-10-01 16:38:15.352546	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
575	Refresh token	2023-10-01 16:38:15.888742	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
576	Refresh token	2023-10-01 16:38:16.171793	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
577	Refresh token	2023-10-01 16:48:16.516361	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
578	Refresh token	2023-10-01 16:49:45.515703	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
579	Refresh token	2023-10-01 16:51:40.040215	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
580	Refresh token	2023-10-01 16:51:40.10593	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
581	Refresh token	2023-10-01 16:51:40.177286	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
582	Refresh token	2023-10-01 16:53:02.163877	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
583	Refresh token	2023-10-01 16:53:05.198394	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
584	Refresh token	2023-10-01 16:53:05.238289	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
585	Refresh token	2023-10-01 16:59:47.87774	dd4d0061-3501-40ff-aed3-5f4db9467d5a	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
586	Login	2023-10-01 17:00:25.456288	cc523ecc-006c-44f5-b6db-c4a9a9e574be	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
587	Refresh token	2023-10-01 17:09:07.914534	cc523ecc-006c-44f5-b6db-c4a9a9e574be	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
588	Refresh token	2023-10-01 17:16:18.580966	cc523ecc-006c-44f5-b6db-c4a9a9e574be	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
589	Login	2023-10-01 17:16:33.602982	15d00ade-2048-4a97-928e-6c0be018b745	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
590	Login	2023-10-01 17:17:51.781126	90f26b4e-1c1f-4d0c-bf31-2f392daea9ea	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
591	Login	2023-10-01 17:18:27.210245	feb873d8-9656-41c6-ad96-fb0029c9906f	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
592	Refresh token	2023-10-01 17:20:08.008083	feb873d8-9656-41c6-ad96-fb0029c9906f	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
593	Login	2023-10-01 17:20:33.177005	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
594	Refresh token	2023-10-01 17:22:05.43144	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
595	Refresh token	2023-10-01 17:22:05.533035	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
596	Refresh token	2023-10-01 17:24:44.102884	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
597	Refresh token	2023-10-01 17:25:45.148549	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
598	Refresh token	2023-10-01 19:28:55.812494	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
599	Refresh token	2023-10-01 19:28:56.058166	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
600	Refresh token	2023-10-01 19:31:47.061886	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
601	Refresh token	2023-10-01 19:52:21.799436	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
602	Refresh token	2023-10-01 19:57:17.719394	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
603	Refresh token	2023-10-01 20:05:16.796458	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
604	Refresh token	2023-10-01 20:05:16.8659	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
605	Refresh token	2023-10-01 20:05:16.907203	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
606	Refresh token	2023-10-01 20:16:26.631415	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
607	Refresh token	2023-10-01 20:19:41.259376	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
608	Refresh token	2023-10-01 20:20:48.091586	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
609	Refresh token	2023-10-01 20:22:02.946651	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
610	Refresh token	2023-10-01 20:37:06.252203	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
611	Refresh token	2023-10-01 20:37:06.62417	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
612	Refresh token	2023-10-01 20:39:15.224802	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
613	Refresh token	2023-10-01 20:42:56.986341	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
614	Refresh token	2023-10-01 20:46:43.757904	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
615	Refresh token	2023-10-01 20:47:46.390078	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
616	Refresh token	2023-10-01 20:49:17.882841	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
617	Refresh token	2023-10-01 20:54:20.629324	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
618	Refresh token	2023-10-01 20:58:38.122982	9c815c03-b2f0-4920-9332-90ef7d6b5133	\N	DESKTOP-JNTQD2M	0:0:0:0:0:0:0:1	\\xc0a83801	\N	\N	lenicode777@gmail.com	1	1
\.


--
-- Data for Name: log_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.log_details (id, column_name, connection_id, new_value, object_id, old_value, table_name, log_id) FROM stdin;
121	userId	eee9c881-3b8a-414e-995d-c6f15a6beab9	32	32		app_user	32
122	firstName	eee9c881-3b8a-414e-995d-c6f15a6beab9	Leni	32		app_user	32
123	lastName	eee9c881-3b8a-414e-995d-c6f15a6beab9	Gauss	32		app_user	32
124	password	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
125	email	eee9c881-3b8a-414e-995d-c6f15a6beab9	lenigauss@gmail.com	32		app_user	32
126	tel	eee9c881-3b8a-414e-995d-c6f15a6beab9	0505471048	32		app_user	32
127	lieuNaissance	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
128	dateNaissance	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
129	ecole	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
130	civilite	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
131	nationalite	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
132	typePiece	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
133	numPiece	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
134	nomPere	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
135	nomMere	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
136	typeUtilisateur	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
137	active	eee9c881-3b8a-414e-995d-c6f15a6beab9	false	32		app_user	32
138	notBlocked	eee9c881-3b8a-414e-995d-c6f15a6beab9	true	32		app_user	32
139	currentFunctionId	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
140	changePasswordDate	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
141	statut	eee9c881-3b8a-414e-995d-c6f15a6beab9	USR-BLQ	32		app_user	32
142	createdAt	eee9c881-3b8a-414e-995d-c6f15a6beab9	2023-09-04T18:21:36.565787700	32		app_user	32
143	createdBy	eee9c881-3b8a-414e-995d-c6f15a6beab9	lenicode777@gmail.com	32		app_user	32
144	updatedAt	eee9c881-3b8a-414e-995d-c6f15a6beab9	2023-09-04T18:21:36.565787700	32		app_user	32
145	updatedBy	eee9c881-3b8a-414e-995d-c6f15a6beab9	lenicode777@gmail.com	32		app_user	32
146	deletedAt	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
147	deletedBy	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
148	isDeleted	eee9c881-3b8a-414e-995d-c6f15a6beab9	false	32		app_user	32
149	action	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
150	connectionId	eee9c881-3b8a-414e-995d-c6f15a6beab9		32		app_user	32
151	tokenId	eee9c881-3b8a-414e-995d-c6f15a6beab9	22	22		account_token	33
152	token	eee9c881-3b8a-414e-995d-c6f15a6beab9	12d81352-c496-4054-8e7c-f8643edf922e	22		account_token	33
153	creationDate	eee9c881-3b8a-414e-995d-c6f15a6beab9	2023-09-04T18:21:36.571256300	22		account_token	33
154	expirationDate	eee9c881-3b8a-414e-995d-c6f15a6beab9	2023-09-05T18:21:36.571256300	22		account_token	33
155	usageDate	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		account_token	33
156	alreadyUsed	eee9c881-3b8a-414e-995d-c6f15a6beab9	false	22		account_token	33
157	agentId	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		account_token	33
158	password	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		account_token	33
159	emailSent	eee9c881-3b8a-414e-995d-c6f15a6beab9	true	22		account_token	33
160	user	eee9c881-3b8a-414e-995d-c6f15a6beab9	32	22		account_token	33
161	createdAt	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		account_token	33
162	createdBy	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		account_token	33
163	updatedAt	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		account_token	33
164	updatedBy	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		account_token	33
165	deletedAt	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		account_token	33
166	deletedBy	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		account_token	33
167	isDeleted	eee9c881-3b8a-414e-995d-c6f15a6beab9	false	22		account_token	33
168	action	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		account_token	33
169	connectionId	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		account_token	33
170	mailId	eee9c881-3b8a-414e-995d-c6f15a6beab9	22	22		email_notification	34
171	username	eee9c881-3b8a-414e-995d-c6f15a6beab9	lenigauss@gmail.com	22		email_notification	34
172	email	eee9c881-3b8a-414e-995d-c6f15a6beab9	lenigauss@gmail.com	22		email_notification	34
173	token	eee9c881-3b8a-414e-995d-c6f15a6beab9	12d81352-c496-4054-8e7c-f8643edf922e	22		email_notification	34
174	sendingDate	eee9c881-3b8a-414e-995d-c6f15a6beab9	2023-09-04T18:21:36.573258200	22		email_notification	34
175	seen	eee9c881-3b8a-414e-995d-c6f15a6beab9	false	22		email_notification	34
176	sent	eee9c881-3b8a-414e-995d-c6f15a6beab9	true	22		email_notification	34
177	mailObject	eee9c881-3b8a-414e-995d-c6f15a6beab9	Activation de votre compte	22		email_notification	34
178	mailMessage	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		email_notification	34
179	senderUserId	eee9c881-3b8a-414e-995d-c6f15a6beab9	1	22		email_notification	34
180	systemMailSender	eee9c881-3b8a-414e-995d-c6f15a6beab9		22		email_notification	34
181	password	\N	$2a$10$N3Qe27FR75HD/Nb5UzQE9ex2ZV/xJsGd9/ADmlmyuC0mqlFyhppkG	32		app_user	35
182	active	\N	true	32	false	app_user	35
183	changePasswordDate	\N	2023-09-04T18:28:36.456280600	32		app_user	35
184	statut	\N	USR-ACT	32	USR-BLQ	app_user	35
185	updatedAt	\N	2023-09-04T18:28:36.459281	32	2023-09-04T18:21:36.565788	app_user	35
186	updatedBy	\N	UNKNOWN	32	lenicode777@gmail.com	app_user	35
187	usageDate	\N	2023-09-04T18:28:36.472284500	22		account_token	36
188	alreadyUsed	\N	true	22	false	account_token	36
\.


--
-- Data for Name: matiere; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matiere (id) FROM stdin;
\.


--
-- Data for Name: matiere_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matiere_aud (id, rev, revtype) FROM stdin;
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu (menu_code, name, prvs_codes_chain, status) FROM stdin;
\.


--
-- Data for Name: menu_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_aud (menu_code, rev, revtype, name, prvs_codes_chain, status) FROM stdin;
\.


--
-- Data for Name: nationalite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nationalite (code_pays, nationalite, nom_pays) FROM stdin;
\.


--
-- Data for Name: nationalite_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nationalite_aud (code_pays, rev, revtype, nationalite, nom_pays) FROM stdin;
\.


--
-- Data for Name: niveau_etude; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.niveau_etude (id, deleted_at, deleted_by, is_deleted, nom_niveau_etude, rang_niveau_etude, id_cycle_etude) FROM stdin;
\.


--
-- Data for Name: niveau_etude_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.niveau_etude_aud (id, rev, revtype, deleted_at, deleted_by, is_deleted, nom_niveau_etude, rang_niveau_etude, id_cycle_etude) FROM stdin;
\.


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.note (id, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: note_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.note_aud (id, rev, revtype, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: periode_evaluation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.periode_evaluation (id, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: periode_evaluation_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.periode_evaluation_aud (id, rev, revtype, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: programme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programme (id) FROM stdin;
\.


--
-- Data for Name: programme_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.programme_aud (id, rev, revtype) FROM stdin;
\.


--
-- Data for Name: rentree_scolaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rentree_scolaire (id, deleted_at, deleted_by, is_deleted, id_annee_scolaire, id_ecole) FROM stdin;
\.


--
-- Data for Name: rentree_scolaire_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rentree_scolaire_aud (id, rev, revtype, deleted_at, deleted_by, is_deleted, id_annee_scolaire, id_ecole) FROM stdin;
\.


--
-- Data for Name: revinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.revinfo (rev, revtstmp) FROM stdin;
1	1693848328869
2	1693848328937
3	1693848329058
4	1693848329195
52	1693851333250
53	1693851333261
54	1693851333265
55	1693851333269
56	1693851333538
57	1693851333571
58	1693851333579
59	1693851333586
60	1693851333595
61	1693851333612
62	1693851333615
63	1693851333620
64	1693851333629
65	1693851333632
102	1693851674960
103	1693851674972
104	1693851674976
105	1693851674980
106	1693851674985
107	1693851674989
108	1693851674992
109	1693851674995
110	1693851674999
111	1693851675014
112	1693851675017
113	1693851675020
114	1693851675024
115	1693851675027
116	1693851675030
117	1693851675036
118	1693851675040
119	1693851675043
120	1693851675046
121	1693851675049
122	1693851675051
123	1693851675054
124	1693851675057
125	1693851675060
126	1693851703035
127	1693852116479
152	1694089449078
153	1694089449192
154	1694089449196
155	1694089449200
156	1694089449244
157	1694089449249
158	1694089449254
159	1694089449258
160	1694089449262
161	1694089449266
162	1694089449269
163	1694089449273
164	1694089449276
165	1694089449280
166	1694089449283
167	1694089449288
168	1694089449292
169	1694089449296
170	1694089449299
171	1694089449303
172	1694089449307
173	1694089449310
174	1694089449313
175	1694089449316
\.


--
-- Data for Name: salle_de_classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salle_de_classe (id) FROM stdin;
\.


--
-- Data for Name: salle_de_classe_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.salle_de_classe_aud (id, rev, revtype) FROM stdin;
\.


--
-- Data for Name: statut; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statut (sta_code, created_at, sta_libelle, sta_libelle_long, sta_type, updated_at) FROM stdin;
SAI	2023-09-07 12:24:08.797712	Saisie	Saisie	5	2023-09-07 12:24:08.960671
TRA	2023-09-07 12:24:09.190447	Transmis(e)	Transmis	5	2023-09-07 12:24:09.191448
RET	2023-09-07 12:24:09.194735	Retourné(e)	Retourné(e)	5	2023-09-07 12:24:09.195743
ARC	2023-09-07 12:24:09.203744	Archivé(e)	Archivé(e)	5	2023-09-07 12:24:09.205745
SUP	2023-09-07 12:24:09.24625	Supprimé(e)	supprimé(e)	5	2023-09-07 12:24:09.248247
ACT	2023-09-07 12:24:09.252053	Actif	Actif	0	2023-09-07 12:24:09.253062
SUPP	2023-09-07 12:24:09.256062	Supprimée	Supprimé	0	2023-09-07 12:24:09.257063
AVAL	2023-09-07 12:24:09.260063	En attente de validation	En attente de validation	5	2023-09-07 12:24:09.261082
VAL	2023-09-07 12:24:09.264064	Validé(e)	Validé(e)	5	2023-09-07 12:24:09.265095
ACONF	2023-09-07 12:24:09.268451	En attente de confirmation	En attente de confirmation	3	2023-09-07 12:24:09.269493
REFUSE	2023-09-07 12:24:09.271461	Refusé(e)	Refusé(e)	5	2023-09-07 12:24:09.272458
ANNULE	2023-09-07 12:24:09.274459	Annulé(e)	Annulé(e)	5	2023-09-07 12:24:09.27646
MOD	2023-09-07 12:24:09.278459	Modifié(e)	Modifié(e)	5	2023-09-07 12:24:09.279491
SAI-CRT	2023-09-07 12:24:09.28146	Saisie courtier	Saisie(e) par le courtier	5	2023-09-07 12:24:09.282459
APAI	2023-09-07 12:24:09.285495	En attente de paiement	En attente de paiement	5	2023-09-07 12:24:09.287461
CPAI	2023-09-07 12:24:09.290737	En cours de paiement	En cours de paiement	5	2023-09-07 12:24:09.291735
CREV	2023-09-07 12:24:09.294735	En cours de reversement	En cours de reversement	5	2023-09-07 12:24:09.295772
CPAI-CREV	2023-09-07 12:24:09.298735	En cours de paiement et de reversement	En cours de paiement et de reversement	5	2023-09-07 12:24:09.299735
SOLD	2023-09-07 12:24:09.301735	Règlement soldé	Règlement soldé	5	2023-09-07 12:24:09.302735
USR-BLQ	2023-09-07 12:24:09.305736	Utilisateur bloqué	Utilisateur bloqué	4	2023-09-07 12:24:09.306734
USR-ACT	2023-09-07 12:24:09.308854	Utilisateur actif	Utilisateur actif	4	2023-09-07 12:24:09.309851
USR-AACT	2023-09-07 12:24:09.312853	Utilisateur en attente d'activation	Utilisateur en attente d'activation	4	2023-09-07 12:24:09.313884
USR-ALA	2023-09-07 12:24:09.315885	Utilisateur en attente d'un lien d'activation	Utilisateur en attente d'un lien d'activation	4	2023-09-07 12:24:09.316851
\.


--
-- Data for Name: statut_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.statut_aud (sta_code, rev, revtype, created_at, sta_libelle, sta_libelle_long, sta_type, updated_at) FROM stdin;
SAI	102	0	2023-09-04 18:21:14.937252	Saisie	Saisie	5	2023-09-04 18:21:14.937252
TRA	103	0	2023-09-04 18:21:14.971896	Transmis(e)	Transmis	5	2023-09-04 18:21:14.971896
RET	104	0	2023-09-04 18:21:14.975897	Retourné(e)	Retourné(e)	5	2023-09-04 18:21:14.975897
VAL	105	0	2023-09-04 18:21:14.979897	Validé(e)	Validé(e)	5	2023-09-04 18:21:14.979897
ARC	106	0	2023-09-04 18:21:14.984897	Archivé(e)	Archivé(e)	5	2023-09-04 18:21:14.984897
SUP	107	0	2023-09-04 18:21:14.988896	Supprimé(e)	supprimé(e)	5	2023-09-04 18:21:14.988896
ACT	108	0	2023-09-04 18:21:14.992896	Actif	Actif	0	2023-09-04 18:21:14.992896
SUPP	109	0	2023-09-04 18:21:14.995898	Supprimée	Supprimé	0	2023-09-04 18:21:14.995898
AVAL	110	0	2023-09-04 18:21:14.998896	En attente de validation	En attente de validation	5	2023-09-04 18:21:14.998896
VAL	111	1	2023-09-04 18:21:15.000897	Validé(e)	Validé(e)	5	2023-09-04 18:21:15.007897
ACONF	112	0	2023-09-04 18:21:15.017897	En attente de confirmation	En attente de confirmation	3	2023-09-04 18:21:15.017897
REFUSE	113	0	2023-09-04 18:21:15.020897	Refusé(e)	Refusé(e)	5	2023-09-04 18:21:15.020897
ANNULE	114	0	2023-09-04 18:21:15.024897	Annulé(e)	Annulé(e)	5	2023-09-04 18:21:15.024897
MOD	115	0	2023-09-04 18:21:15.027897	Modifié(e)	Modifié(e)	5	2023-09-04 18:21:15.027897
SAI-CRT	116	0	2023-09-04 18:21:15.029897	Saisie courtier	Saisie(e) par le courtier	5	2023-09-04 18:21:15.029897
APAI	117	0	2023-09-04 18:21:15.034899	En attente de paiement	En attente de paiement	5	2023-09-04 18:21:15.034899
CPAI	118	0	2023-09-04 18:21:15.039896	En cours de paiement	En cours de paiement	5	2023-09-04 18:21:15.039896
CREV	119	0	2023-09-04 18:21:15.043898	En cours de reversement	En cours de reversement	5	2023-09-04 18:21:15.043898
CPAI-CREV	120	0	2023-09-04 18:21:15.046895	En cours de paiement et de reversement	En cours de paiement et de reversement	5	2023-09-04 18:21:15.046895
SOLD	121	0	2023-09-04 18:21:15.048897	Règlement soldé	Règlement soldé	5	2023-09-04 18:21:15.048897
USR-BLQ	122	0	2023-09-04 18:21:15.051897	Utilisateur bloqué	Utilisateur bloqué	4	2023-09-04 18:21:15.051897
USR-ACT	123	0	2023-09-04 18:21:15.053899	Utilisateur actif	Utilisateur actif	4	2023-09-04 18:21:15.053899
USR-AACT	124	0	2023-09-04 18:21:15.056897	Utilisateur en attente d'activation	Utilisateur en attente d'activation	4	2023-09-04 18:21:15.056897
USR-ALA	125	0	2023-09-04 18:21:15.059897	Utilisateur en attente d'un lien d'activation	Utilisateur en attente d'un lien d'activation	4	2023-09-04 18:21:15.059897
SAI	152	1	2023-09-07 12:24:08.797712	Saisie	Saisie	5	2023-09-07 12:24:08.960671
TRA	153	1	2023-09-07 12:24:09.190447	Transmis(e)	Transmis	5	2023-09-07 12:24:09.191448
RET	154	1	2023-09-07 12:24:09.194735	Retourné(e)	Retourné(e)	5	2023-09-07 12:24:09.195743
VAL	155	1	2023-09-07 12:24:09.198745	Validé(e)	Validé(e)	5	2023-09-07 12:24:09.199749
ARC	156	1	2023-09-07 12:24:09.203744	Archivé(e)	Archivé(e)	5	2023-09-07 12:24:09.205745
SUP	157	1	2023-09-07 12:24:09.24625	Supprimé(e)	supprimé(e)	5	2023-09-07 12:24:09.248247
ACT	158	1	2023-09-07 12:24:09.252053	Actif	Actif	0	2023-09-07 12:24:09.253062
SUPP	159	1	2023-09-07 12:24:09.256062	Supprimée	Supprimé	0	2023-09-07 12:24:09.257063
AVAL	160	1	2023-09-07 12:24:09.260063	En attente de validation	En attente de validation	5	2023-09-07 12:24:09.261082
VAL	161	1	2023-09-07 12:24:09.264064	Validé(e)	Validé(e)	5	2023-09-07 12:24:09.265095
ACONF	162	1	2023-09-07 12:24:09.268451	En attente de confirmation	En attente de confirmation	3	2023-09-07 12:24:09.269493
REFUSE	163	1	2023-09-07 12:24:09.271461	Refusé(e)	Refusé(e)	5	2023-09-07 12:24:09.272458
ANNULE	164	1	2023-09-07 12:24:09.274459	Annulé(e)	Annulé(e)	5	2023-09-07 12:24:09.27646
MOD	165	1	2023-09-07 12:24:09.278459	Modifié(e)	Modifié(e)	5	2023-09-07 12:24:09.279491
SAI-CRT	166	1	2023-09-07 12:24:09.28146	Saisie courtier	Saisie(e) par le courtier	5	2023-09-07 12:24:09.282459
APAI	167	1	2023-09-07 12:24:09.285495	En attente de paiement	En attente de paiement	5	2023-09-07 12:24:09.287461
CPAI	168	1	2023-09-07 12:24:09.290737	En cours de paiement	En cours de paiement	5	2023-09-07 12:24:09.291735
CREV	169	1	2023-09-07 12:24:09.294735	En cours de reversement	En cours de reversement	5	2023-09-07 12:24:09.295772
CPAI-CREV	170	1	2023-09-07 12:24:09.298735	En cours de paiement et de reversement	En cours de paiement et de reversement	5	2023-09-07 12:24:09.299735
SOLD	171	1	2023-09-07 12:24:09.301735	Règlement soldé	Règlement soldé	5	2023-09-07 12:24:09.302735
USR-BLQ	172	1	2023-09-07 12:24:09.305736	Utilisateur bloqué	Utilisateur bloqué	4	2023-09-07 12:24:09.306734
USR-ACT	173	1	2023-09-07 12:24:09.308854	Utilisateur actif	Utilisateur actif	4	2023-09-07 12:24:09.309851
USR-AACT	174	1	2023-09-07 12:24:09.312853	Utilisateur en attente d'activation	Utilisateur en attente d'activation	4	2023-09-07 12:24:09.313884
USR-ALA	175	1	2023-09-07 12:24:09.315885	Utilisateur en attente d'un lien d'activation	Utilisateur en attente d'un lien d'activation	4	2023-09-07 12:24:09.316851
\.


--
-- Data for Name: type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type (unique_code, name, object_folder, status, type_group) FROM stdin;
M.	Monsieur	\N	ACTIVE	TYPE_CIVILITE
Mme.	Madame	\N	ACTIVE	TYPE_CIVILITE
Mlle.	Mademoiselle	\N	ACTIVE	TYPE_CIVILITE
CNI	Carte nationale d'identité	\N	ACTIVE	TYPE_PIECE
PC	Permis de conduire	\N	ACTIVE	TYPE_PIECE
AI	Attestation d'identité	\N	ACTIVE	TYPE_PIECE
PSPRT	Passeport	\N	ACTIVE	TYPE_PIECE
RCNI	Récépicé de demande de CNI	\N	ACTIVE	TYPE_PIECE
ELEVE	Elève	\N	ACTIVE	TYPE_USER
ENSEIGNAT	Enseignant	\N	ACTIVE	TYPE_PIECE
ADMINISTRATIF	Administratif	\N	ACTIVE	TYPE_USER
FNC_ELEVE	Fonction élève	\N	ACTIVE	TYPE_FONCTION
FNC_ENSEIGNAT	Fonction enseignant	\N	ACTIVE	TYPE_FONCTION
FNC_ADMINISTRATIF	Fonction administratif	\N	ACTIVE	TYPE_FONCTION
FNC_COMPTABLE	Fonction comptable	\N	ACTIVE	TYPE_FONCTION
\.


--
-- Data for Name: type_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_aud (unique_code, rev, revtype, name, object_folder, status, type_group) FROM stdin;
\.


--
-- Data for Name: type_param; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_param (type_param_id, status, child_code, parent_code) FROM stdin;
\.


--
-- Data for Name: type_param_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.type_param_aud (type_param_id, rev, revtype, status, child_code, parent_code) FROM stdin;
\.


--
-- Data for Name: unite_de_clasee; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unite_de_clasee (id, deleted_at, deleted_by, is_deleted, nom_unite_de_classe, id_classe) FROM stdin;
\.


--
-- Data for Name: unite_de_clasee_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unite_de_clasee_aud (id, rev, revtype, deleted_at, deleted_by, is_deleted, nom_unite_de_classe, id_classe) FROM stdin;
\.


--
-- Data for Name: versemenent_scolarite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.versemenent_scolarite (id, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Data for Name: versemenent_scolarite_aud; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.versemenent_scolarite_aud (id, rev, revtype, action, connection_id, created_at, created_by, deleted_at, deleted_by, is_deleted, updated_at, updated_by) FROM stdin;
\.


--
-- Name: annee_scolaire_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.annee_scolaire_seq', 1, false);


--
-- Name: ass_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ass_id_gen', 1, true);


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

SELECT pg_catalog.setval('public.fnc_id_gen', 1, true);


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

SELECT pg_catalog.setval('public.log_details_id_seq', 188, true);


--
-- Name: log_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.log_id_gen', 621, true);


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

SELECT pg_catalog.setval('public.notif_id_gen', 31, true);


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

SELECT pg_catalog.setval('public.revinfo_seq', 201, true);


--
-- Name: salle_de_classe_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.salle_de_classe_seq', 1, false);


--
-- Name: token_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.token_id_gen', 31, true);


--
-- Name: type_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.type_id_gen', 1, false);


--
-- Name: user_id_gen; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_gen', 51, true);


--
-- Name: versemenent_scolarite_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.versemenent_scolarite_seq', 1, false);


--
-- Name: account_token_aud account_token_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_token_aud
    ADD CONSTRAINT account_token_aud_pkey PRIMARY KEY (rev, token_id);


--
-- Name: account_token account_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_token
    ADD CONSTRAINT account_token_pkey PRIMARY KEY (token_id);


--
-- Name: annee_scolaire_aud annee_scolaire_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annee_scolaire_aud
    ADD CONSTRAINT annee_scolaire_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: annee_scolaire annee_scolaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annee_scolaire
    ADD CONSTRAINT annee_scolaire_pkey PRIMARY KEY (id);


--
-- Name: app_function_aud app_function_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_function_aud
    ADD CONSTRAINT app_function_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: app_function app_function_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_function
    ADD CONSTRAINT app_function_pkey PRIMARY KEY (id);


--
-- Name: app_privilege_aud app_privilege_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_privilege_aud
    ADD CONSTRAINT app_privilege_aud_pkey PRIMARY KEY (rev, privilege_code);


--
-- Name: app_privilege app_privilege_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_privilege
    ADD CONSTRAINT app_privilege_pkey PRIMARY KEY (privilege_code);


--
-- Name: app_role_aud app_role_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_role_aud
    ADD CONSTRAINT app_role_aud_pkey PRIMARY KEY (rev, role_code);


--
-- Name: app_role app_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_role
    ADD CONSTRAINT app_role_pkey PRIMARY KEY (role_code);


--
-- Name: app_user_aud app_user_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_aud
    ADD CONSTRAINT app_user_aud_pkey PRIMARY KEY (rev, user_id);


--
-- Name: app_user app_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT app_user_pkey PRIMARY KEY (user_id);


--
-- Name: assignation_aud assignation_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignation_aud
    ADD CONSTRAINT assignation_aud_pkey PRIMARY KEY (rev, ass_id);


--
-- Name: assignation assignation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignation
    ADD CONSTRAINT assignation_pkey PRIMARY KEY (ass_id);


--
-- Name: classe_aud classe_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe_aud
    ADD CONSTRAINT classe_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: classe classe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe
    ADD CONSTRAINT classe_pkey PRIMARY KEY (id);


--
-- Name: cours_aud cours_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cours_aud
    ADD CONSTRAINT cours_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: cours cours_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cours
    ADD CONSTRAINT cours_pkey PRIMARY KEY (id);


--
-- Name: cycle_etude_aud cycle_etude_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cycle_etude_aud
    ADD CONSTRAINT cycle_etude_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: cycle_etude cycle_etude_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cycle_etude
    ADD CONSTRAINT cycle_etude_pkey PRIMARY KEY (id);


--
-- Name: echeance_paiement_aud echeance_paiement_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.echeance_paiement_aud
    ADD CONSTRAINT echeance_paiement_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: echeance_paiement echeance_paiement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.echeance_paiement
    ADD CONSTRAINT echeance_paiement_pkey PRIMARY KEY (id);


--
-- Name: echeancier_aud echeancier_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.echeancier_aud
    ADD CONSTRAINT echeancier_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: echeancier echeancier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.echeancier
    ADD CONSTRAINT echeancier_pkey PRIMARY KEY (id);


--
-- Name: ecole_aud ecole_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecole_aud
    ADD CONSTRAINT ecole_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: ecole ecole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecole
    ADD CONSTRAINT ecole_pkey PRIMARY KEY (id);


--
-- Name: email_notification_aud email_notification_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_notification_aud
    ADD CONSTRAINT email_notification_aud_pkey PRIMARY KEY (rev, mail_id);


--
-- Name: email_notification email_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_notification
    ADD CONSTRAINT email_notification_pkey PRIMARY KEY (mail_id);


--
-- Name: enseignement_aud enseignement_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enseignement_aud
    ADD CONSTRAINT enseignement_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: enseignement enseignement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enseignement
    ADD CONSTRAINT enseignement_pkey PRIMARY KEY (id);


--
-- Name: evaluation_aud evaluation_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_aud
    ADD CONSTRAINT evaluation_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: evaluation evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation
    ADD CONSTRAINT evaluation_pkey PRIMARY KEY (id);


--
-- Name: filiere_aud filiere_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filiere_aud
    ADD CONSTRAINT filiere_aud_pkey PRIMARY KEY (rev, id);


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
-- Name: inscription_aud inscription_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscription_aud
    ADD CONSTRAINT inscription_aud_pkey PRIMARY KEY (rev, id);


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
-- Name: matiere_aud matiere_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matiere_aud
    ADD CONSTRAINT matiere_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: matiere matiere_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matiere
    ADD CONSTRAINT matiere_pkey PRIMARY KEY (id);


--
-- Name: menu_aud menu_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_aud
    ADD CONSTRAINT menu_aud_pkey PRIMARY KEY (rev, menu_code);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menu_code);


--
-- Name: nationalite_aud nationalite_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalite_aud
    ADD CONSTRAINT nationalite_aud_pkey PRIMARY KEY (rev, code_pays);


--
-- Name: nationalite nationalite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalite
    ADD CONSTRAINT nationalite_pkey PRIMARY KEY (code_pays);


--
-- Name: niveau_etude_aud niveau_etude_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveau_etude_aud
    ADD CONSTRAINT niveau_etude_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: niveau_etude niveau_etude_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveau_etude
    ADD CONSTRAINT niveau_etude_pkey PRIMARY KEY (id);


--
-- Name: note_aud note_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note_aud
    ADD CONSTRAINT note_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: note note_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- Name: periode_evaluation_aud periode_evaluation_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_evaluation_aud
    ADD CONSTRAINT periode_evaluation_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: periode_evaluation periode_evaluation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_evaluation
    ADD CONSTRAINT periode_evaluation_pkey PRIMARY KEY (id);


--
-- Name: programme_aud programme_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programme_aud
    ADD CONSTRAINT programme_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: programme programme_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programme
    ADD CONSTRAINT programme_pkey PRIMARY KEY (id);


--
-- Name: rentree_scolaire_aud rentree_scolaire_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentree_scolaire_aud
    ADD CONSTRAINT rentree_scolaire_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: rentree_scolaire rentree_scolaire_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentree_scolaire
    ADD CONSTRAINT rentree_scolaire_pkey PRIMARY KEY (id);


--
-- Name: revinfo revinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revinfo
    ADD CONSTRAINT revinfo_pkey PRIMARY KEY (rev);


--
-- Name: salle_de_classe_aud salle_de_classe_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salle_de_classe_aud
    ADD CONSTRAINT salle_de_classe_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: salle_de_classe salle_de_classe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salle_de_classe
    ADD CONSTRAINT salle_de_classe_pkey PRIMARY KEY (id);


--
-- Name: statut_aud statut_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statut_aud
    ADD CONSTRAINT statut_aud_pkey PRIMARY KEY (rev, sta_code);


--
-- Name: statut statut_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statut
    ADD CONSTRAINT statut_pkey PRIMARY KEY (sta_code);


--
-- Name: type_aud type_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_aud
    ADD CONSTRAINT type_aud_pkey PRIMARY KEY (rev, unique_code);


--
-- Name: type_param_aud type_param_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_param_aud
    ADD CONSTRAINT type_param_aud_pkey PRIMARY KEY (rev, type_param_id);


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
-- Name: app_user uk_1j9d9a06i600gd43uu3km82jw; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT uk_1j9d9a06i600gd43uu3km82jw UNIQUE (email);


--
-- Name: app_privilege uk_1po8lq7nyoqw6twfaxfklxpsm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_privilege
    ADD CONSTRAINT uk_1po8lq7nyoqw6twfaxfklxpsm UNIQUE (privilege_name);


--
-- Name: app_user uk_2e2m70mqraajufopuyt9yj0c7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT uk_2e2m70mqraajufopuyt9yj0c7 UNIQUE (tel);


--
-- Name: nationalite uk_6vk29o0a5y2ftbpjwklt6asfu; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalite
    ADD CONSTRAINT uk_6vk29o0a5y2ftbpjwklt6asfu UNIQUE (nationalite);


--
-- Name: app_role uk_c9vam58sxsparp1djngaittd6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_role
    ADD CONSTRAINT uk_c9vam58sxsparp1djngaittd6 UNIQUE (role_name);


--
-- Name: app_user uk_emhvdu16vb2058duet94f59ic; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user
    ADD CONSTRAINT uk_emhvdu16vb2058duet94f59ic UNIQUE (num_piece);


--
-- Name: menu uk_m05sb1hgsv38qjb4ksyh5eat2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu
    ADD CONSTRAINT uk_m05sb1hgsv38qjb4ksyh5eat2 UNIQUE (name);


--
-- Name: nationalite uk_pcor4g6jcnx5bf8pkeunvegic; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalite
    ADD CONSTRAINT uk_pcor4g6jcnx5bf8pkeunvegic UNIQUE (nom_pays);


--
-- Name: account_token uk_r2oobdl606k0c87c7hwg60yeg; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_token
    ADD CONSTRAINT uk_r2oobdl606k0c87c7hwg60yeg UNIQUE (token);


--
-- Name: unite_de_clasee_aud unite_de_clasee_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite_de_clasee_aud
    ADD CONSTRAINT unite_de_clasee_aud_pkey PRIMARY KEY (rev, id);


--
-- Name: unite_de_clasee unite_de_clasee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite_de_clasee
    ADD CONSTRAINT unite_de_clasee_pkey PRIMARY KEY (id);


--
-- Name: versemenent_scolarite_aud versemenent_scolarite_aud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versemenent_scolarite_aud
    ADD CONSTRAINT versemenent_scolarite_aud_pkey PRIMARY KEY (rev, id);


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
-- Name: nationalite_aud fk125ellpoen06iueu2ru1go96t; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nationalite_aud
    ADD CONSTRAINT fk125ellpoen06iueu2ru1go96t FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: assignation fk1bn3jvr0wy2col5fgkfx52un6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignation
    ADD CONSTRAINT fk1bn3jvr0wy2col5fgkfx52un6 FOREIGN KEY (prv_id) REFERENCES public.app_privilege(privilege_code);


--
-- Name: statut_aud fk1he99favf63kqagucbrklqpdm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statut_aud
    ADD CONSTRAINT fk1he99favf63kqagucbrklqpdm FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: inscription_aud fk2043vxc8pne2lqdtic522nqux; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inscription_aud
    ADD CONSTRAINT fk2043vxc8pne2lqdtic522nqux FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: evaluation_aud fk2s7r2579cmna2g4ntx6p8ymlb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluation_aud
    ADD CONSTRAINT fk2s7r2579cmna2g4ntx6p8ymlb FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


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
-- Name: menu_aud fk4r7t931m6wx6g62rqs95ekvdy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_aud
    ADD CONSTRAINT fk4r7t931m6wx6g62rqs95ekvdy FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


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
-- Name: account_token_aud fka13mxkdaeb4fm18mrt2v7f1jj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account_token_aud
    ADD CONSTRAINT fka13mxkdaeb4fm18mrt2v7f1jj FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: ecole_aud fka6ms4c21smn9d26t4ek8rfbng; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ecole_aud
    ADD CONSTRAINT fka6ms4c21smn9d26t4ek8rfbng FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: rentree_scolaire_aud fkaj7aa4864wofuf0473k52xu51; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rentree_scolaire_aud
    ADD CONSTRAINT fkaj7aa4864wofuf0473k52xu51 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: unite_de_clasee fkb3fwv8eqr7rbtxgi0sbsyb8lk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite_de_clasee
    ADD CONSTRAINT fkb3fwv8eqr7rbtxgi0sbsyb8lk FOREIGN KEY (id_classe) REFERENCES public.classe(id);


--
-- Name: email_notification_aud fkcu5q8pqc4vsjx5u8tryydt5b6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_notification_aud
    ADD CONSTRAINT fkcu5q8pqc4vsjx5u8tryydt5b6 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: assignation_aud fkdfwwsev3u8y63xp9rkdp1j1yc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assignation_aud
    ADD CONSTRAINT fkdfwwsev3u8y63xp9rkdp1j1yc FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


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
-- Name: filiere_aud fkdxvf52ammkj0jmosr8rvkcg8p; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.filiere_aud
    ADD CONSTRAINT fkdxvf52ammkj0jmosr8rvkcg8p FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


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
-- Name: enseignement_aud fkeo2c7h51dyvtn9g2pkudd1ips; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enseignement_aud
    ADD CONSTRAINT fkeo2c7h51dyvtn9g2pkudd1ips FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: note_aud fkf4lnpja18lffbwr2fij7t2xrt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.note_aud
    ADD CONSTRAINT fkf4lnpja18lffbwr2fij7t2xrt FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: app_function fkf662ix86g2aym05kr6uhygbph; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_function
    ADD CONSTRAINT fkf662ix86g2aym05kr6uhygbph FOREIGN KEY (ecole_id) REFERENCES public.ecole(id);


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
-- Name: app_role_aud fkhd8msl9b8usp6k1q9mk6drg4v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_role_aud
    ADD CONSTRAINT fkhd8msl9b8usp6k1q9mk6drg4v FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


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
-- Name: programme_aud fkixxmvwgkehnnk99adcmvtavs; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.programme_aud
    ADD CONSTRAINT fkixxmvwgkehnnk99adcmvtavs FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: log_details fkjwxihril8uh9qojh0a3lupdhh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.log_details
    ADD CONSTRAINT fkjwxihril8uh9qojh0a3lupdhh FOREIGN KEY (log_id) REFERENCES public.log(id);


--
-- Name: classe_aud fkkesj3w2wpdu7ukv5t21tm1ek7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe_aud
    ADD CONSTRAINT fkkesj3w2wpdu7ukv5t21tm1ek7 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: type_aud fkkgostd6sjmqo1ddve74irk4xt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_aud
    ADD CONSTRAINT fkkgostd6sjmqo1ddve74irk4xt FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: app_function_aud fkkhg7giffdh0i0qhbli6jxmwqe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_function_aud
    ADD CONSTRAINT fkkhg7giffdh0i0qhbli6jxmwqe FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: app_privilege_aud fkkmgf1uwt9hm5a0ji4jx9q9h68; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_privilege_aud
    ADD CONSTRAINT fkkmgf1uwt9hm5a0ji4jx9q9h68 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: type_param_aud fklaqq3e17ikmpejqti8etfumwg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.type_param_aud
    ADD CONSTRAINT fklaqq3e17ikmpejqti8etfumwg FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: periode_evaluation_aud fklogfkhtuee6mj5cmicysn6ft0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periode_evaluation_aud
    ADD CONSTRAINT fklogfkhtuee6mj5cmicysn6ft0 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: app_user_aud fklrwde4gab1o0jmxy358bobg55; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.app_user_aud
    ADD CONSTRAINT fklrwde4gab1o0jmxy358bobg55 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: versemenent_scolarite_aud fklxwq7f818k6tlhe7nsv9oje1a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.versemenent_scolarite_aud
    ADD CONSTRAINT fklxwq7f818k6tlhe7nsv9oje1a FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: echeancier_aud fkm2bnbvp9a8wht2y2r5odihs8l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.echeancier_aud
    ADD CONSTRAINT fkm2bnbvp9a8wht2y2r5odihs8l FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


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
-- Name: niveau_etude_aud fkoyfn8k8ac08x60phghife7fv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveau_etude_aud
    ADD CONSTRAINT fkoyfn8k8ac08x60phghife7fv FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: unite_de_clasee_aud fkp1xhwaomaxf0xm5ag1w9ltxrr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unite_de_clasee_aud
    ADD CONSTRAINT fkp1xhwaomaxf0xm5ag1w9ltxrr FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: annee_scolaire_aud fkp7xx58rnmnmcy43w8597aiiph; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.annee_scolaire_aud
    ADD CONSTRAINT fkp7xx58rnmnmcy43w8597aiiph FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: cycle_etude_aud fkq440rirqx2m6uiuvnx60a21cg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cycle_etude_aud
    ADD CONSTRAINT fkq440rirqx2m6uiuvnx60a21cg FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: niveau_etude fkqnt8t8jqtnittegr28itmhn6k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.niveau_etude
    ADD CONSTRAINT fkqnt8t8jqtnittegr28itmhn6k FOREIGN KEY (id_cycle_etude) REFERENCES public.cycle_etude(id);


--
-- Name: matiere_aud fkqwciasp0922b80psp3mdbvbeb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matiere_aud
    ADD CONSTRAINT fkqwciasp0922b80psp3mdbvbeb FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: cours_aud fkreid50s6n7qno4q0djwkg8lx2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cours_aud
    ADD CONSTRAINT fkreid50s6n7qno4q0djwkg8lx2 FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: echeance_paiement_aud fku6b6ypbr9msrxvx8ntxa1djh; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.echeance_paiement_aud
    ADD CONSTRAINT fku6b6ypbr9msrxvx8ntxa1djh FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- Name: salle_de_classe_aud fkyxrj2eg2061yfgtnlv1g75n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salle_de_classe_aud
    ADD CONSTRAINT fkyxrj2eg2061yfgtnlv1g75n FOREIGN KEY (rev) REFERENCES public.revinfo(rev);


--
-- PostgreSQL database dump complete
--

