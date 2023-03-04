--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.1

-- Started on 2023-03-03 14:19:12 UTC

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
-- TOC entry 6 (class 2615 OID 16676)
-- Name: lib_schema; Type: SCHEMA; Schema: -; Owner: admin
--
CREATE DATABASE library
    WITH
    OWNER = admin
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

ALTER DATABASE library OWNER TO admin;

\connect library

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

CREATE SCHEMA lib_schema;


ALTER SCHEMA lib_schema OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 232 (class 1259 OID 16750)
-- Name: address; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.address (
    address_id integer NOT NULL,
    address_title text NOT NULL,
    address_postcode text NOT NULL,
    address_latitude real NOT NULL,
    address_longitude real NOT NULL
);


ALTER TABLE lib_schema.address OWNER TO admin;

--
-- TOC entry 231 (class 1259 OID 16749)
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.address_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.address_address_id_seq OWNER TO admin;

--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 231
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.address_address_id_seq OWNED BY lib_schema.address.address_id;


--
-- TOC entry 234 (class 1259 OID 16759)
-- Name: archive; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.archive (
    archive_id integer NOT NULL,
    archive_book_id integer NOT NULL,
    archive_vault_id integer NOT NULL
);


ALTER TABLE lib_schema.archive OWNER TO admin;

--
-- TOC entry 233 (class 1259 OID 16758)
-- Name: archive_archive_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.archive_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.archive_archive_id_seq OWNER TO admin;

--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 233
-- Name: archive_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.archive_archive_id_seq OWNED BY lib_schema.archive.archive_id;


--
-- TOC entry 216 (class 1259 OID 16678)
-- Name: book; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book (
    book_id integer NOT NULL,
    book_title text NOT NULL,
    book_author integer NOT NULL,
    book_genre integer NOT NULL,
    book_lang integer NOT NULL,
    book_publisher integer NOT NULL,
    book_publish_year smallint NOT NULL,
    book_publish_month smallint NOT NULL,
    book_publish_day smallint NOT NULL,
    book_page_num integer NOT NULL,
    book_rating real NOT NULL,
    book_num_reviews integer NOT NULL
);


ALTER TABLE lib_schema.book OWNER TO admin;

--
-- TOC entry 238 (class 1259 OID 16773)
-- Name: book_archive; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_archive (
    book_archive_id integer NOT NULL,
    book_archive_address integer NOT NULL
);


ALTER TABLE lib_schema.book_archive OWNER TO admin;

--
-- TOC entry 237 (class 1259 OID 16772)
-- Name: book_archive_book_archive_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_archive_book_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_archive_book_archive_id_seq OWNER TO admin;

--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 237
-- Name: book_archive_book_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_archive_book_archive_id_seq OWNED BY lib_schema.book_archive.book_archive_id;


--
-- TOC entry 218 (class 1259 OID 16687)
-- Name: book_author; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_author (
    author_id integer NOT NULL,
    author_name text NOT NULL,
    author_sex integer NOT NULL
);


ALTER TABLE lib_schema.book_author OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 16686)
-- Name: book_author_author_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_author_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_author_author_id_seq OWNER TO admin;

--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 217
-- Name: book_author_author_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_author_author_id_seq OWNED BY lib_schema.book_author.author_id;


--
-- TOC entry 215 (class 1259 OID 16677)
-- Name: book_book_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_book_id_seq OWNER TO admin;

--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 215
-- Name: book_book_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_book_id_seq OWNED BY lib_schema.book.book_id;


--
-- TOC entry 220 (class 1259 OID 16696)
-- Name: book_genre; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_genre (
    genre_id integer NOT NULL,
    genre_title text NOT NULL
);


ALTER TABLE lib_schema.book_genre OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 16695)
-- Name: book_genre_genre_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_genre_genre_id_seq OWNER TO admin;

--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 219
-- Name: book_genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_genre_genre_id_seq OWNED BY lib_schema.book_genre.genre_id;


--
-- TOC entry 222 (class 1259 OID 16705)
-- Name: book_lang; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_lang (
    lang_id integer NOT NULL,
    lang_title text NOT NULL
);


ALTER TABLE lib_schema.book_lang OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 16704)
-- Name: book_lang_lang_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_lang_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_lang_lang_id_seq OWNER TO admin;

--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 221
-- Name: book_lang_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_lang_lang_id_seq OWNED BY lib_schema.book_lang.lang_id;


--
-- TOC entry 224 (class 1259 OID 16714)
-- Name: book_publisher; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_publisher (
    publisher_id integer NOT NULL,
    publisher_name text NOT NULL
);


ALTER TABLE lib_schema.book_publisher OWNER TO admin;

--
-- TOC entry 223 (class 1259 OID 16713)
-- Name: book_publisher_publisher_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_publisher_publisher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_publisher_publisher_id_seq OWNER TO admin;

--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 223
-- Name: book_publisher_publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_publisher_publisher_id_seq OWNED BY lib_schema.book_publisher.publisher_id;


--
-- TOC entry 236 (class 1259 OID 16766)
-- Name: book_vault; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_vault (
    book_vault_id integer NOT NULL,
    book_vault_arcive_num integer NOT NULL,
    book_vault_floor integer NOT NULL,
    book_vault_row integer NOT NULL,
    book_vault_rack integer NOT NULL,
    book_vault_shelf integer NOT NULL,
    book_vault_shelf_interval integer NOT NULL
);


ALTER TABLE lib_schema.book_vault OWNER TO admin;

--
-- TOC entry 235 (class 1259 OID 16765)
-- Name: book_vault_book_vault_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_vault_book_vault_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_vault_book_vault_id_seq OWNER TO admin;

--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 235
-- Name: book_vault_book_vault_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_vault_book_vault_id_seq OWNED BY lib_schema.book_vault.book_vault_id;


--
-- TOC entry 240 (class 1259 OID 16780)
-- Name: data_vault; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.data_vault (
    data_vault_id integer NOT NULL,
    data_vault_path text NOT NULL,
    data_vault_book_format integer NOT NULL
);


ALTER TABLE lib_schema.data_vault OWNER TO admin;

--
-- TOC entry 239 (class 1259 OID 16779)
-- Name: data_vault_data_vault_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.data_vault_data_vault_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.data_vault_data_vault_id_seq OWNER TO admin;

--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 239
-- Name: data_vault_data_vault_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.data_vault_data_vault_id_seq OWNED BY lib_schema.data_vault.data_vault_id;


--
-- TOC entry 252 (class 1259 OID 16830)
-- Name: equipement; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.equipement (
    equipement_id integer NOT NULL,
    equipement_name text NOT NULL,
    equipement_desc text NOT NULL
);


ALTER TABLE lib_schema.equipement OWNER TO admin;

--
-- TOC entry 251 (class 1259 OID 16829)
-- Name: equipement_equipement_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.equipement_equipement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.equipement_equipement_id_seq OWNER TO admin;

--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 251
-- Name: equipement_equipement_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.equipement_equipement_id_seq OWNED BY lib_schema.equipement.equipement_id;


--
-- TOC entry 242 (class 1259 OID 16789)
-- Name: format; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.format (
    format_id integer NOT NULL,
    format_extension text NOT NULL
);


ALTER TABLE lib_schema.format OWNER TO admin;

--
-- TOC entry 241 (class 1259 OID 16788)
-- Name: format_format_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.format_format_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.format_format_id_seq OWNER TO admin;

--
-- TOC entry 3558 (class 0 OID 0)
-- Dependencies: 241
-- Name: format_format_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.format_format_id_seq OWNED BY lib_schema.format.format_id;


--
-- TOC entry 246 (class 1259 OID 16805)
-- Name: hall; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.hall (
    hall_id integer NOT NULL,
    hall_name text NOT NULL,
    hall_desc text NOT NULL,
    hall_work_time time without time zone NOT NULL,
    hall_tel integer NOT NULL
);


ALTER TABLE lib_schema.hall OWNER TO admin;

--
-- TOC entry 245 (class 1259 OID 16804)
-- Name: hall_hall_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.hall_hall_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.hall_hall_id_seq OWNER TO admin;

--
-- TOC entry 3559 (class 0 OID 0)
-- Dependencies: 245
-- Name: hall_hall_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.hall_hall_id_seq OWNED BY lib_schema.hall.hall_id;


--
-- TOC entry 244 (class 1259 OID 16798)
-- Name: journal; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.journal (
    journal_id integer NOT NULL,
    journal_reader_id integer NOT NULL,
    journal_book_id integer NOT NULL,
    journal_rental_period integer NOT NULL,
    journal_rental_period_start date NOT NULL,
    journal_rental_period_end date NOT NULL,
    journal_rental_status boolean NOT NULL
);


ALTER TABLE lib_schema.journal OWNER TO admin;

--
-- TOC entry 243 (class 1259 OID 16797)
-- Name: journal_journal_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.journal_journal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.journal_journal_id_seq OWNER TO admin;

--
-- TOC entry 3560 (class 0 OID 0)
-- Dependencies: 243
-- Name: journal_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.journal_journal_id_seq OWNED BY lib_schema.journal.journal_id;


--
-- TOC entry 226 (class 1259 OID 16723)
-- Name: people; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.people (
    people_id integer NOT NULL,
    people_name text NOT NULL,
    people_surname text NOT NULL,
    people_patronymic text NOT NULL,
    people_sex integer NOT NULL,
    people_address integer NOT NULL,
    people_tel_num bigint NOT NULL,
    people_pass_num integer NOT NULL,
    people_email text NOT NULL,
    people_password text NOT NULL,
    people_role integer NOT NULL
);


ALTER TABLE lib_schema.people OWNER TO admin;

--
-- TOC entry 225 (class 1259 OID 16722)
-- Name: people_people_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.people_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.people_people_id_seq OWNER TO admin;

--
-- TOC entry 3561 (class 0 OID 0)
-- Dependencies: 225
-- Name: people_people_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.people_people_id_seq OWNED BY lib_schema.people.people_id;


--
-- TOC entry 250 (class 1259 OID 16823)
-- Name: place; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.place (
    place_id integer NOT NULL,
    place_hall integer NOT NULL,
    place_type integer NOT NULL
);


ALTER TABLE lib_schema.place OWNER TO admin;

--
-- TOC entry 253 (class 1259 OID 16838)
-- Name: place_equipement; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.place_equipement (
    place_place_id integer NOT NULL,
    equipement_equipement_id integer NOT NULL
);


ALTER TABLE lib_schema.place_equipement OWNER TO admin;

--
-- TOC entry 255 (class 1259 OID 16842)
-- Name: place_journal; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.place_journal (
    place_journal_id integer NOT NULL,
    place_journal_place integer NOT NULL,
    place_journal_people integer NOT NULL,
    place_journal_date date NOT NULL
);


ALTER TABLE lib_schema.place_journal OWNER TO admin;

--
-- TOC entry 254 (class 1259 OID 16841)
-- Name: place_journal_place_journal_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.place_journal_place_journal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.place_journal_place_journal_id_seq OWNER TO admin;

--
-- TOC entry 3562 (class 0 OID 0)
-- Dependencies: 254
-- Name: place_journal_place_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.place_journal_place_journal_id_seq OWNED BY lib_schema.place_journal.place_journal_id;


--
-- TOC entry 249 (class 1259 OID 16822)
-- Name: place_place_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.place_place_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.place_place_id_seq OWNER TO admin;

--
-- TOC entry 3563 (class 0 OID 0)
-- Dependencies: 249
-- Name: place_place_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.place_place_id_seq OWNED BY lib_schema.place.place_id;


--
-- TOC entry 248 (class 1259 OID 16814)
-- Name: place_type; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.place_type (
    place_type_id integer NOT NULL,
    place_type_name text NOT NULL,
    place_type_n_people integer NOT NULL
);


ALTER TABLE lib_schema.place_type OWNER TO admin;

--
-- TOC entry 247 (class 1259 OID 16813)
-- Name: place_type_place_type_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.place_type_place_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.place_type_place_type_id_seq OWNER TO admin;

--
-- TOC entry 3564 (class 0 OID 0)
-- Dependencies: 247
-- Name: place_type_place_type_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.place_type_place_type_id_seq OWNED BY lib_schema.place_type.place_type_id;


--
-- TOC entry 230 (class 1259 OID 16741)
-- Name: role; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.role (
    role_id integer NOT NULL,
    role_name text NOT NULL,
    role_permissions text NOT NULL
);


ALTER TABLE lib_schema.role OWNER TO admin;

--
-- TOC entry 229 (class 1259 OID 16740)
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.role_role_id_seq OWNER TO admin;

--
-- TOC entry 3565 (class 0 OID 0)
-- Dependencies: 229
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.role_role_id_seq OWNED BY lib_schema.role.role_id;


--
-- TOC entry 228 (class 1259 OID 16732)
-- Name: sex; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.sex (
    sex_id integer NOT NULL,
    sex_title text NOT NULL
);


ALTER TABLE lib_schema.sex OWNER TO admin;

--
-- TOC entry 227 (class 1259 OID 16731)
-- Name: sex_sex_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.sex_sex_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.sex_sex_id_seq OWNER TO admin;

--
-- TOC entry 3566 (class 0 OID 0)
-- Dependencies: 227
-- Name: sex_sex_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.sex_sex_id_seq OWNED BY lib_schema.sex.sex_id;


--
-- TOC entry 3284 (class 2604 OID 16753)
-- Name: address address_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.address ALTER COLUMN address_id SET DEFAULT nextval('lib_schema.address_address_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 16762)
-- Name: archive archive_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.archive ALTER COLUMN archive_id SET DEFAULT nextval('lib_schema.archive_archive_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 16681)
-- Name: book book_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book ALTER COLUMN book_id SET DEFAULT nextval('lib_schema.book_book_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 16776)
-- Name: book_archive book_archive_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_archive ALTER COLUMN book_archive_id SET DEFAULT nextval('lib_schema.book_archive_book_archive_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 16690)
-- Name: book_author author_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_author ALTER COLUMN author_id SET DEFAULT nextval('lib_schema.book_author_author_id_seq'::regclass);


--
-- TOC entry 3278 (class 2604 OID 16699)
-- Name: book_genre genre_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_genre ALTER COLUMN genre_id SET DEFAULT nextval('lib_schema.book_genre_genre_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 16708)
-- Name: book_lang lang_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_lang ALTER COLUMN lang_id SET DEFAULT nextval('lib_schema.book_lang_lang_id_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 16717)
-- Name: book_publisher publisher_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_publisher ALTER COLUMN publisher_id SET DEFAULT nextval('lib_schema.book_publisher_publisher_id_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 16769)
-- Name: book_vault book_vault_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_vault ALTER COLUMN book_vault_id SET DEFAULT nextval('lib_schema.book_vault_book_vault_id_seq'::regclass);


--
-- TOC entry 3288 (class 2604 OID 16783)
-- Name: data_vault data_vault_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.data_vault ALTER COLUMN data_vault_id SET DEFAULT nextval('lib_schema.data_vault_data_vault_id_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 16833)
-- Name: equipement equipement_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.equipement ALTER COLUMN equipement_id SET DEFAULT nextval('lib_schema.equipement_equipement_id_seq'::regclass);


--
-- TOC entry 3289 (class 2604 OID 16792)
-- Name: format format_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.format ALTER COLUMN format_id SET DEFAULT nextval('lib_schema.format_format_id_seq'::regclass);


--
-- TOC entry 3291 (class 2604 OID 16808)
-- Name: hall hall_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.hall ALTER COLUMN hall_id SET DEFAULT nextval('lib_schema.hall_hall_id_seq'::regclass);


--
-- TOC entry 3290 (class 2604 OID 16801)
-- Name: journal journal_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.journal ALTER COLUMN journal_id SET DEFAULT nextval('lib_schema.journal_journal_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 16726)
-- Name: people people_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.people ALTER COLUMN people_id SET DEFAULT nextval('lib_schema.people_people_id_seq'::regclass);


--
-- TOC entry 3293 (class 2604 OID 16826)
-- Name: place place_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place ALTER COLUMN place_id SET DEFAULT nextval('lib_schema.place_place_id_seq'::regclass);


--
-- TOC entry 3295 (class 2604 OID 16845)
-- Name: place_journal place_journal_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_journal ALTER COLUMN place_journal_id SET DEFAULT nextval('lib_schema.place_journal_place_journal_id_seq'::regclass);


--
-- TOC entry 3292 (class 2604 OID 16817)
-- Name: place_type place_type_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_type ALTER COLUMN place_type_id SET DEFAULT nextval('lib_schema.place_type_place_type_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 16744)
-- Name: role role_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.role ALTER COLUMN role_id SET DEFAULT nextval('lib_schema.role_role_id_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 16735)
-- Name: sex sex_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.sex ALTER COLUMN sex_id SET DEFAULT nextval('lib_schema.sex_sex_id_seq'::regclass);


--
-- TOC entry 3518 (class 0 OID 16750)
-- Dependencies: 232
-- Data for Name: address; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.address (address_id, address_title, address_postcode, address_latitude, address_longitude) FROM stdin;
\.


--
-- TOC entry 3520 (class 0 OID 16759)
-- Dependencies: 234
-- Data for Name: archive; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.archive (archive_id, archive_book_id, archive_vault_id) FROM stdin;
\.


--
-- TOC entry 3502 (class 0 OID 16678)
-- Dependencies: 216
-- Data for Name: book; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.book (book_id, book_title, book_author, book_genre, book_lang, book_publisher, book_publish_year, book_publish_month, book_publish_day, book_page_num, book_rating, book_num_reviews) FROM stdin;
\.


--
-- TOC entry 3524 (class 0 OID 16773)
-- Dependencies: 238
-- Data for Name: book_archive; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.book_archive (book_archive_id, book_archive_address) FROM stdin;
\.


--
-- TOC entry 3504 (class 0 OID 16687)
-- Dependencies: 218
-- Data for Name: book_author; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.book_author (author_id, author_name, author_sex) FROM stdin;
\.


--
-- TOC entry 3506 (class 0 OID 16696)
-- Dependencies: 220
-- Data for Name: book_genre; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.book_genre (genre_id, genre_title) FROM stdin;
\.


--
-- TOC entry 3508 (class 0 OID 16705)
-- Dependencies: 222
-- Data for Name: book_lang; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.book_lang (lang_id, lang_title) FROM stdin;
\.


--
-- TOC entry 3510 (class 0 OID 16714)
-- Dependencies: 224
-- Data for Name: book_publisher; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.book_publisher (publisher_id, publisher_name) FROM stdin;
\.


--
-- TOC entry 3522 (class 0 OID 16766)
-- Dependencies: 236
-- Data for Name: book_vault; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.book_vault (book_vault_id, book_vault_arcive_num, book_vault_floor, book_vault_row, book_vault_rack, book_vault_shelf, book_vault_shelf_interval) FROM stdin;
\.


--
-- TOC entry 3526 (class 0 OID 16780)
-- Dependencies: 240
-- Data for Name: data_vault; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.data_vault (data_vault_id, data_vault_path, data_vault_book_format) FROM stdin;
\.


--
-- TOC entry 3538 (class 0 OID 16830)
-- Dependencies: 252
-- Data for Name: equipement; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.equipement (equipement_id, equipement_name, equipement_desc) FROM stdin;
\.


--
-- TOC entry 3528 (class 0 OID 16789)
-- Dependencies: 242
-- Data for Name: format; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.format (format_id, format_extension) FROM stdin;
\.


--
-- TOC entry 3532 (class 0 OID 16805)
-- Dependencies: 246
-- Data for Name: hall; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.hall (hall_id, hall_name, hall_desc, hall_work_time, hall_tel) FROM stdin;
\.


--
-- TOC entry 3530 (class 0 OID 16798)
-- Dependencies: 244
-- Data for Name: journal; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.journal (journal_id, journal_reader_id, journal_book_id, journal_rental_period, journal_rental_period_start, journal_rental_period_end, journal_rental_status) FROM stdin;
\.


--
-- TOC entry 3512 (class 0 OID 16723)
-- Dependencies: 226
-- Data for Name: people; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.people (people_id, people_name, people_surname, people_patronymic, people_sex, people_address, people_tel_num, people_pass_num, people_email, people_password, people_role) FROM stdin;
\.


--
-- TOC entry 3536 (class 0 OID 16823)
-- Dependencies: 250
-- Data for Name: place; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.place (place_id, place_hall, place_type) FROM stdin;
\.


--
-- TOC entry 3539 (class 0 OID 16838)
-- Dependencies: 253
-- Data for Name: place_equipement; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.place_equipement (place_place_id, equipement_equipement_id) FROM stdin;
\.


--
-- TOC entry 3541 (class 0 OID 16842)
-- Dependencies: 255
-- Data for Name: place_journal; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.place_journal (place_journal_id, place_journal_place, place_journal_people, place_journal_date) FROM stdin;
\.


--
-- TOC entry 3534 (class 0 OID 16814)
-- Dependencies: 248
-- Data for Name: place_type; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.place_type (place_type_id, place_type_name, place_type_n_people) FROM stdin;
\.


--
-- TOC entry 3516 (class 0 OID 16741)
-- Dependencies: 230
-- Data for Name: role; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.role (role_id, role_name, role_permissions) FROM stdin;
\.


--
-- TOC entry 3514 (class 0 OID 16732)
-- Dependencies: 228
-- Data for Name: sex; Type: TABLE DATA; Schema: lib_schema; Owner: admin
--

COPY lib_schema.sex (sex_id, sex_title) FROM stdin;
\.


--
-- TOC entry 3567 (class 0 OID 0)
-- Dependencies: 231
-- Name: address_address_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.address_address_id_seq', 1, false);


--
-- TOC entry 3568 (class 0 OID 0)
-- Dependencies: 233
-- Name: archive_archive_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.archive_archive_id_seq', 1, false);


--
-- TOC entry 3569 (class 0 OID 0)
-- Dependencies: 237
-- Name: book_archive_book_archive_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.book_archive_book_archive_id_seq', 1, false);


--
-- TOC entry 3570 (class 0 OID 0)
-- Dependencies: 217
-- Name: book_author_author_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.book_author_author_id_seq', 1, false);


--
-- TOC entry 3571 (class 0 OID 0)
-- Dependencies: 215
-- Name: book_book_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.book_book_id_seq', 1, false);


--
-- TOC entry 3572 (class 0 OID 0)
-- Dependencies: 219
-- Name: book_genre_genre_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.book_genre_genre_id_seq', 1, false);


--
-- TOC entry 3573 (class 0 OID 0)
-- Dependencies: 221
-- Name: book_lang_lang_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.book_lang_lang_id_seq', 1, false);


--
-- TOC entry 3574 (class 0 OID 0)
-- Dependencies: 223
-- Name: book_publisher_publisher_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.book_publisher_publisher_id_seq', 1, false);


--
-- TOC entry 3575 (class 0 OID 0)
-- Dependencies: 235
-- Name: book_vault_book_vault_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.book_vault_book_vault_id_seq', 1, false);


--
-- TOC entry 3576 (class 0 OID 0)
-- Dependencies: 239
-- Name: data_vault_data_vault_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.data_vault_data_vault_id_seq', 1, false);


--
-- TOC entry 3577 (class 0 OID 0)
-- Dependencies: 251
-- Name: equipement_equipement_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.equipement_equipement_id_seq', 1, false);


--
-- TOC entry 3578 (class 0 OID 0)
-- Dependencies: 241
-- Name: format_format_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.format_format_id_seq', 1, false);


--
-- TOC entry 3579 (class 0 OID 0)
-- Dependencies: 245
-- Name: hall_hall_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.hall_hall_id_seq', 1, false);


--
-- TOC entry 3580 (class 0 OID 0)
-- Dependencies: 243
-- Name: journal_journal_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.journal_journal_id_seq', 1, false);


--
-- TOC entry 3581 (class 0 OID 0)
-- Dependencies: 225
-- Name: people_people_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.people_people_id_seq', 1, false);


--
-- TOC entry 3582 (class 0 OID 0)
-- Dependencies: 254
-- Name: place_journal_place_journal_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.place_journal_place_journal_id_seq', 1, false);


--
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 249
-- Name: place_place_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.place_place_id_seq', 1, false);


--
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 247
-- Name: place_type_place_type_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.place_type_place_type_id_seq', 1, false);


--
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 229
-- Name: role_role_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.role_role_id_seq', 1, false);


--
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 227
-- Name: sex_sex_id_seq; Type: SEQUENCE SET; Schema: lib_schema; Owner: admin
--

SELECT pg_catalog.setval('lib_schema.sex_sex_id_seq', 1, false);


--
-- TOC entry 3313 (class 2606 OID 16757)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- TOC entry 3315 (class 2606 OID 16764)
-- Name: archive archive_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.archive
    ADD CONSTRAINT archive_pkey PRIMARY KEY (archive_id);


--
-- TOC entry 3319 (class 2606 OID 16778)
-- Name: book_archive book_archive_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_archive
    ADD CONSTRAINT book_archive_pkey PRIMARY KEY (book_archive_id);


--
-- TOC entry 3299 (class 2606 OID 16694)
-- Name: book_author book_author_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_author
    ADD CONSTRAINT book_author_pkey PRIMARY KEY (author_id);


--
-- TOC entry 3301 (class 2606 OID 16703)
-- Name: book_genre book_genre_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_genre
    ADD CONSTRAINT book_genre_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 3303 (class 2606 OID 16712)
-- Name: book_lang book_lang_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_lang
    ADD CONSTRAINT book_lang_pkey PRIMARY KEY (lang_id);


--
-- TOC entry 3297 (class 2606 OID 16685)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);


--
-- TOC entry 3305 (class 2606 OID 16721)
-- Name: book_publisher book_publisher_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_publisher
    ADD CONSTRAINT book_publisher_pkey PRIMARY KEY (publisher_id);


--
-- TOC entry 3317 (class 2606 OID 16771)
-- Name: book_vault book_vault_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_vault
    ADD CONSTRAINT book_vault_pkey PRIMARY KEY (book_vault_id);


--
-- TOC entry 3321 (class 2606 OID 16787)
-- Name: data_vault data_vault_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.data_vault
    ADD CONSTRAINT data_vault_pkey PRIMARY KEY (data_vault_id);


--
-- TOC entry 3333 (class 2606 OID 16837)
-- Name: equipement equipement_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.equipement
    ADD CONSTRAINT equipement_pkey PRIMARY KEY (equipement_id);


--
-- TOC entry 3323 (class 2606 OID 16796)
-- Name: format format_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.format
    ADD CONSTRAINT format_pkey PRIMARY KEY (format_id);


--
-- TOC entry 3327 (class 2606 OID 16812)
-- Name: hall hall_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.hall
    ADD CONSTRAINT hall_pkey PRIMARY KEY (hall_id);


--
-- TOC entry 3325 (class 2606 OID 16803)
-- Name: journal journal_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.journal
    ADD CONSTRAINT journal_pkey PRIMARY KEY (journal_id);


--
-- TOC entry 3307 (class 2606 OID 16730)
-- Name: people people_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (people_id);


--
-- TOC entry 3335 (class 2606 OID 16847)
-- Name: place_journal place_journal_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_journal
    ADD CONSTRAINT place_journal_pkey PRIMARY KEY (place_journal_id);


--
-- TOC entry 3331 (class 2606 OID 16828)
-- Name: place place_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place
    ADD CONSTRAINT place_pkey PRIMARY KEY (place_id);


--
-- TOC entry 3329 (class 2606 OID 16821)
-- Name: place_type place_type_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_type
    ADD CONSTRAINT place_type_pkey PRIMARY KEY (place_type_id);


--
-- TOC entry 3311 (class 2606 OID 16748)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- TOC entry 3309 (class 2606 OID 16739)
-- Name: sex sex_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.sex
    ADD CONSTRAINT sex_pkey PRIMARY KEY (sex_id);


--
-- TOC entry 3344 (class 2606 OID 16893)
-- Name: archive archive_archive_book_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.archive
    ADD CONSTRAINT archive_archive_book_id_fkey FOREIGN KEY (archive_book_id) REFERENCES lib_schema.book(book_id) NOT VALID;


--
-- TOC entry 3345 (class 2606 OID 16888)
-- Name: archive archive_archive_vault_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.archive
    ADD CONSTRAINT archive_archive_vault_id_fkey FOREIGN KEY (archive_vault_id) REFERENCES lib_schema.book_vault(book_vault_id) NOT VALID;


--
-- TOC entry 3346 (class 2606 OID 16898)
-- Name: archive archive_archive_vault_id_fkey1; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.archive
    ADD CONSTRAINT archive_archive_vault_id_fkey1 FOREIGN KEY (archive_vault_id) REFERENCES lib_schema.data_vault(data_vault_id) NOT VALID;


--
-- TOC entry 3348 (class 2606 OID 16908)
-- Name: book_archive book_archive_book_archive_address_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_archive
    ADD CONSTRAINT book_archive_book_archive_address_fkey FOREIGN KEY (book_archive_address) REFERENCES lib_schema.address(address_id) NOT VALID;


--
-- TOC entry 3340 (class 2606 OID 16868)
-- Name: book_author book_author_author_sex_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_author
    ADD CONSTRAINT book_author_author_sex_fkey FOREIGN KEY (author_sex) REFERENCES lib_schema.sex(sex_id) NOT VALID;


--
-- TOC entry 3336 (class 2606 OID 16848)
-- Name: book book_book_author_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book
    ADD CONSTRAINT book_book_author_fkey FOREIGN KEY (book_author) REFERENCES lib_schema.book_author(author_id) NOT VALID;


--
-- TOC entry 3337 (class 2606 OID 16853)
-- Name: book book_book_genre_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book
    ADD CONSTRAINT book_book_genre_fkey FOREIGN KEY (book_genre) REFERENCES lib_schema.book_genre(genre_id) NOT VALID;


--
-- TOC entry 3338 (class 2606 OID 16858)
-- Name: book book_book_lang_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book
    ADD CONSTRAINT book_book_lang_fkey FOREIGN KEY (book_lang) REFERENCES lib_schema.book_lang(lang_id) NOT VALID;


--
-- TOC entry 3339 (class 2606 OID 16863)
-- Name: book book_book_publisher_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book
    ADD CONSTRAINT book_book_publisher_fkey FOREIGN KEY (book_publisher) REFERENCES lib_schema.book_publisher(publisher_id) NOT VALID;


--
-- TOC entry 3347 (class 2606 OID 16903)
-- Name: book_vault book_vault_book_vault_arcive_num_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_vault
    ADD CONSTRAINT book_vault_book_vault_arcive_num_fkey FOREIGN KEY (book_vault_arcive_num) REFERENCES lib_schema.book_archive(book_archive_id) NOT VALID;


--
-- TOC entry 3349 (class 2606 OID 16913)
-- Name: data_vault data_vault_data_vault_book_format_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.data_vault
    ADD CONSTRAINT data_vault_data_vault_book_format_fkey FOREIGN KEY (data_vault_book_format) REFERENCES lib_schema.format(format_id) NOT VALID;


--
-- TOC entry 3350 (class 2606 OID 16928)
-- Name: journal journal_journal_book_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.journal
    ADD CONSTRAINT journal_journal_book_id_fkey FOREIGN KEY (journal_book_id) REFERENCES lib_schema.archive(archive_id) NOT VALID;


--
-- TOC entry 3351 (class 2606 OID 16918)
-- Name: journal journal_journal_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.journal
    ADD CONSTRAINT journal_journal_id_fkey FOREIGN KEY (journal_id) REFERENCES lib_schema.people(people_id) NOT VALID;


--
-- TOC entry 3352 (class 2606 OID 16923)
-- Name: journal journal_journal_reader_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.journal
    ADD CONSTRAINT journal_journal_reader_id_fkey FOREIGN KEY (journal_reader_id) REFERENCES lib_schema.people(people_id) NOT VALID;


--
-- TOC entry 3341 (class 2606 OID 16883)
-- Name: people people_people_address_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.people
    ADD CONSTRAINT people_people_address_fkey FOREIGN KEY (people_address) REFERENCES lib_schema.address(address_id) NOT VALID;


--
-- TOC entry 3342 (class 2606 OID 16878)
-- Name: people people_people_role_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.people
    ADD CONSTRAINT people_people_role_fkey FOREIGN KEY (people_role) REFERENCES lib_schema.role(role_id) NOT VALID;


--
-- TOC entry 3343 (class 2606 OID 16873)
-- Name: people people_people_sex_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.people
    ADD CONSTRAINT people_people_sex_fkey FOREIGN KEY (people_sex) REFERENCES lib_schema.sex(sex_id) NOT VALID;


--
-- TOC entry 3355 (class 2606 OID 16948)
-- Name: place_equipement place_equipement_equipement_equipement_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_equipement
    ADD CONSTRAINT place_equipement_equipement_equipement_id_fkey FOREIGN KEY (equipement_equipement_id) REFERENCES lib_schema.equipement(equipement_id) NOT VALID;


--
-- TOC entry 3356 (class 2606 OID 16943)
-- Name: place_equipement place_equipement_place_place_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_equipement
    ADD CONSTRAINT place_equipement_place_place_id_fkey FOREIGN KEY (place_place_id) REFERENCES lib_schema.place(place_id) NOT VALID;


--
-- TOC entry 3357 (class 2606 OID 16958)
-- Name: place_journal place_journal_place_journal_people_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_journal
    ADD CONSTRAINT place_journal_place_journal_people_fkey FOREIGN KEY (place_journal_people) REFERENCES lib_schema.people(people_id) NOT VALID;


--
-- TOC entry 3358 (class 2606 OID 16953)
-- Name: place_journal place_journal_place_journal_place_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_journal
    ADD CONSTRAINT place_journal_place_journal_place_fkey FOREIGN KEY (place_journal_place) REFERENCES lib_schema.place(place_id) NOT VALID;


--
-- TOC entry 3353 (class 2606 OID 16933)
-- Name: place place_place_hall_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place
    ADD CONSTRAINT place_place_hall_fkey FOREIGN KEY (place_hall) REFERENCES lib_schema.hall(hall_id) NOT VALID;


--
-- TOC entry 3354 (class 2606 OID 16938)
-- Name: place place_place_type_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place
    ADD CONSTRAINT place_place_type_fkey FOREIGN KEY (place_type) REFERENCES lib_schema.place_type(place_type_id) NOT VALID;


-- Completed on 2023-03-03 14:19:12 UTC

--
-- PostgreSQL database dump complete
--

-- -- Enable PostGIS (as of 3.0 contains just geometry/geography)
-- CREATE EXTENSION postgis SCHEMA lib_schema;
-- -- enable raster support (for 3+)
-- CREATE EXTENSION postgis_raster SCHEMA lib_schema;
-- -- Enable Topology
-- CREATE EXTENSION postgis_topology SCHEMA topology;
-- -- Enable PostGIS Advanced 3D
-- -- and other geoprocessing algorithms
-- -- sfcgal not available with all distributions
-- CREATE EXTENSION postgis_sfcgal SCHEMA lib_schema;
-- -- fuzzy matching needed for Tiger
-- CREATE EXTENSION fuzzystrmatch SCHEMA lib_schema;
-- -- rule based standardizer
-- CREATE EXTENSION address_standardizer SCHEMA lib_schema;
-- -- example rule data set
-- CREATE EXTENSION address_standardizer_data_us SCHEMA lib_schema;
-- -- Enable US Tiger Geocoder
-- CREATE EXTENSION postgis_tiger_geocoder SCHEMA lib_schema;