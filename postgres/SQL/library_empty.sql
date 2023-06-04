--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2 (Debian 15.2-1.pgdg110+1)
-- Dumped by pg_dump version 15.3

-- Started on 2023-06-03 10:14:56 UTC

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
-- TOC entry 6 (class 2615 OID 17230)
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

CREATE SCHEMA lib_schema;


ALTER SCHEMA lib_schema OWNER TO admin;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 230 (class 1259 OID 17295)
-- Name: address; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.address
(
    address_id        integer NOT NULL,
    address_title     text    NOT NULL,
    address_postcode  text    NOT NULL,
    address_latitude  real    NOT NULL,
    address_longitude real    NOT NULL
);


ALTER TABLE lib_schema.address
    OWNER TO admin;

--
-- TOC entry 229 (class 1259 OID 17294)
-- Name: address_address_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.address_address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.address_address_id_seq
    OWNER TO admin;

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 229
-- Name: address_address_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.address_address_id_seq OWNED BY lib_schema.address.address_id;


--
-- TOC entry 216 (class 1259 OID 17232)
-- Name: book; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book
(
    book_id            integer  NOT NULL,
    book_title         text     NOT NULL,
    book_desc          text     NOT NULL,
    book_publisher     integer  NOT NULL,
    book_publish_year  smallint NOT NULL,
    book_publish_month smallint NOT NULL,
    book_publish_day   smallint NOT NULL,
    book_page_num      integer  NOT NULL,
    book_rating        real     NOT NULL,
    book_num_reviews   integer  NOT NULL
);


ALTER TABLE lib_schema.book
    OWNER TO admin;

--
-- TOC entry 232 (class 1259 OID 17304)
-- Name: book_archive; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_archive
(
    book_archive_id      integer NOT NULL,
    book_archive_address integer NOT NULL
);


ALTER TABLE lib_schema.book_archive
    OWNER TO admin;

--
-- TOC entry 231 (class 1259 OID 17303)
-- Name: book_archive_book_archive_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_archive_book_archive_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_archive_book_archive_id_seq
    OWNER TO admin;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 231
-- Name: book_archive_book_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_archive_book_archive_id_seq OWNED BY lib_schema.book_archive.book_archive_id;


--
-- TOC entry 218 (class 1259 OID 17241)
-- Name: book_author; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_author
(
    author_id   integer NOT NULL,
    author_name text    NOT NULL,
    author_sex  boolean NOT NULL
);


ALTER TABLE lib_schema.book_author
    OWNER TO admin;

--
-- TOC entry 217 (class 1259 OID 17240)
-- Name: book_author_author_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_author_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_author_author_id_seq
    OWNER TO admin;

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 217
-- Name: book_author_author_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_author_author_id_seq OWNED BY lib_schema.book_author.author_id;


--
-- TOC entry 258 (class 1259 OID 17398)
-- Name: book_book_author; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_book_author
(
    book_book_id          integer NOT NULL,
    book_author_author_id integer NOT NULL
);


ALTER TABLE lib_schema.book_book_author
    OWNER TO admin;

--
-- TOC entry 257 (class 1259 OID 17397)
-- Name: book_book_author_book_author_author_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_book_author_book_author_author_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_book_author_book_author_author_id_seq
    OWNER TO admin;

--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 257
-- Name: book_book_author_book_author_author_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_book_author_book_author_author_id_seq OWNED BY lib_schema.book_book_author.book_author_author_id;


--
-- TOC entry 256 (class 1259 OID 17396)
-- Name: book_book_author_book_book_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_book_author_book_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_book_author_book_book_id_seq
    OWNER TO admin;

--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 256
-- Name: book_book_author_book_book_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_book_author_book_book_id_seq OWNED BY lib_schema.book_book_author.book_book_id;


--
-- TOC entry 261 (class 1259 OID 17405)
-- Name: book_book_genre; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_book_genre
(
    book_book_id        integer NOT NULL,
    book_genre_genre_id integer NOT NULL
);


ALTER TABLE lib_schema.book_book_genre
    OWNER TO admin;

--
-- TOC entry 259 (class 1259 OID 17403)
-- Name: book_book_genre_book_book_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_book_genre_book_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_book_genre_book_book_id_seq
    OWNER TO admin;

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 259
-- Name: book_book_genre_book_book_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_book_genre_book_book_id_seq OWNED BY lib_schema.book_book_genre.book_book_id;


--
-- TOC entry 260 (class 1259 OID 17404)
-- Name: book_book_genre_book_genre_genre_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_book_genre_book_genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_book_genre_book_genre_genre_id_seq
    OWNER TO admin;

--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 260
-- Name: book_book_genre_book_genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_book_genre_book_genre_genre_id_seq OWNED BY lib_schema.book_book_genre.book_genre_genre_id;


--
-- TOC entry 215 (class 1259 OID 17231)
-- Name: book_book_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_book_id_seq
    OWNER TO admin;

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 215
-- Name: book_book_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_book_id_seq OWNED BY lib_schema.book.book_id;


--
-- TOC entry 264 (class 1259 OID 17412)
-- Name: book_book_lang; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_book_lang
(
    book_book_id      integer NOT NULL,
    book_lang_lang_id integer NOT NULL
);


ALTER TABLE lib_schema.book_book_lang
    OWNER TO admin;

--
-- TOC entry 262 (class 1259 OID 17410)
-- Name: book_book_lang_book_book_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_book_lang_book_book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_book_lang_book_book_id_seq
    OWNER TO admin;

--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 262
-- Name: book_book_lang_book_book_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_book_lang_book_book_id_seq OWNED BY lib_schema.book_book_lang.book_book_id;


--
-- TOC entry 263 (class 1259 OID 17411)
-- Name: book_book_lang_book_lang_lang_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_book_lang_book_lang_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_book_lang_book_lang_lang_id_seq
    OWNER TO admin;

--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 263
-- Name: book_book_lang_book_lang_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_book_lang_book_lang_lang_id_seq OWNED BY lib_schema.book_book_lang.book_lang_lang_id;


--
-- TOC entry 220 (class 1259 OID 17250)
-- Name: book_genre; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_genre
(
    genre_id    integer NOT NULL,
    genre_title text    NOT NULL
);


ALTER TABLE lib_schema.book_genre
    OWNER TO admin;

--
-- TOC entry 219 (class 1259 OID 17249)
-- Name: book_genre_genre_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_genre_genre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_genre_genre_id_seq
    OWNER TO admin;

--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 219
-- Name: book_genre_genre_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_genre_genre_id_seq OWNED BY lib_schema.book_genre.genre_id;


--
-- TOC entry 222 (class 1259 OID 17259)
-- Name: book_lang; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_lang
(
    lang_id    integer NOT NULL,
    lang_title text    NOT NULL
);


ALTER TABLE lib_schema.book_lang
    OWNER TO admin;

--
-- TOC entry 221 (class 1259 OID 17258)
-- Name: book_lang_lang_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_lang_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_lang_lang_id_seq
    OWNER TO admin;

--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 221
-- Name: book_lang_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_lang_lang_id_seq OWNED BY lib_schema.book_lang.lang_id;


--
-- TOC entry 224 (class 1259 OID 17268)
-- Name: book_publisher; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.book_publisher
(
    publisher_id    integer NOT NULL,
    publisher_title text    NOT NULL,
    publisher_desc  text    NOT NULL
);


ALTER TABLE lib_schema.book_publisher
    OWNER TO admin;

--
-- TOC entry 223 (class 1259 OID 17267)
-- Name: book_publisher_publisher_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.book_publisher_publisher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.book_publisher_publisher_id_seq
    OWNER TO admin;

--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 223
-- Name: book_publisher_publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.book_publisher_publisher_id_seq OWNED BY lib_schema.book_publisher.publisher_id;


--
-- TOC entry 242 (class 1259 OID 17343)
-- Name: equipement; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.equipement
(
    equipement_id    integer NOT NULL,
    equipement_title text    NOT NULL,
    equipement_desc  text    NOT NULL
);


ALTER TABLE lib_schema.equipement
    OWNER TO admin;

--
-- TOC entry 241 (class 1259 OID 17342)
-- Name: equipement_equipement_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.equipement_equipement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.equipement_equipement_id_seq
    OWNER TO admin;

--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 241
-- Name: equipement_equipement_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.equipement_equipement_id_seq OWNED BY lib_schema.equipement.equipement_id;


--
-- TOC entry 236 (class 1259 OID 17318)
-- Name: hall; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.hall
(
    hall_id        integer NOT NULL,
    hall_title     text    NOT NULL,
    hall_desc      text    NOT NULL,
    hall_work_time text    NOT NULL,
    hall_tel       bigint  NOT NULL
);


ALTER TABLE lib_schema.hall
    OWNER TO admin;

--
-- TOC entry 235 (class 1259 OID 17317)
-- Name: hall_hall_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.hall_hall_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.hall_hall_id_seq
    OWNER TO admin;

--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 235
-- Name: hall_hall_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.hall_hall_id_seq OWNED BY lib_schema.hall.hall_id;


--
-- TOC entry 234 (class 1259 OID 17311)
-- Name: journal; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.journal
(
    journal_id                  integer NOT NULL,
    journal_reader_id           integer NOT NULL,
    journal_book_id             integer NOT NULL,
    journal_rental_period       integer NOT NULL,
    journal_rental_period_start date    NOT NULL,
    journal_rental_period_end   date    NOT NULL,
    journal_rental_status       boolean NOT NULL
);


ALTER TABLE lib_schema.journal
    OWNER TO admin;

--
-- TOC entry 233 (class 1259 OID 17310)
-- Name: journal_journal_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.journal_journal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.journal_journal_id_seq
    OWNER TO admin;

--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 233
-- Name: journal_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.journal_journal_id_seq OWNED BY lib_schema.journal.journal_id;


--
-- TOC entry 226 (class 1259 OID 17277)
-- Name: people; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.people
(
    people_id         integer NOT NULL,
    people_name       text    NOT NULL,
    people_surname    text    NOT NULL,
    people_patronymic text    NOT NULL,
    people_sex        boolean NOT NULL,
    people_address    integer NOT NULL,
    people_tel_num    bigint  NOT NULL,
    people_pass_num   integer NOT NULL,
    people_email      text    NOT NULL,
    people_password   text    NOT NULL,
    people_role       integer NOT NULL
);


ALTER TABLE lib_schema.people
    OWNER TO admin;

--
-- TOC entry 225 (class 1259 OID 17276)
-- Name: people_people_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.people_people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.people_people_id_seq
    OWNER TO admin;

--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 225
-- Name: people_people_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.people_people_id_seq OWNED BY lib_schema.people.people_id;


--
-- TOC entry 240 (class 1259 OID 17336)
-- Name: place; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.place
(
    place_id   integer NOT NULL,
    place_hall integer NOT NULL,
    place_type integer NOT NULL
);


ALTER TABLE lib_schema.place
    OWNER TO admin;

--
-- TOC entry 243 (class 1259 OID 17351)
-- Name: place_equipement; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.place_equipement
(
    place_place_id           integer NOT NULL,
    equipement_equipement_id integer NOT NULL
);


ALTER TABLE lib_schema.place_equipement
    OWNER TO admin;

--
-- TOC entry 245 (class 1259 OID 17355)
-- Name: place_journal; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.place_journal
(
    place_journal_id     integer NOT NULL,
    place_journal_place  integer NOT NULL,
    place_journal_people integer NOT NULL,
    place_journal_date   date    NOT NULL
);


ALTER TABLE lib_schema.place_journal
    OWNER TO admin;

--
-- TOC entry 244 (class 1259 OID 17354)
-- Name: place_journal_place_journal_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.place_journal_place_journal_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.place_journal_place_journal_id_seq
    OWNER TO admin;

--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 244
-- Name: place_journal_place_journal_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.place_journal_place_journal_id_seq OWNED BY lib_schema.place_journal.place_journal_id;


--
-- TOC entry 239 (class 1259 OID 17335)
-- Name: place_place_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.place_place_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.place_place_id_seq
    OWNER TO admin;

--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 239
-- Name: place_place_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.place_place_id_seq OWNED BY lib_schema.place.place_id;


--
-- TOC entry 238 (class 1259 OID 17327)
-- Name: place_type; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.place_type
(
    place_type_id       integer NOT NULL,
    place_type_title    text    NOT NULL,
    place_type_n_people integer NOT NULL
);


ALTER TABLE lib_schema.place_type
    OWNER TO admin;

--
-- TOC entry 237 (class 1259 OID 17326)
-- Name: place_type_place_type_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.place_type_place_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.place_type_place_type_id_seq
    OWNER TO admin;

--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 237
-- Name: place_type_place_type_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.place_type_place_type_id_seq OWNED BY lib_schema.place_type.place_type_id;


--
-- TOC entry 228 (class 1259 OID 17286)
-- Name: role; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.role
(
    role_id    integer NOT NULL,
    role_title text    NOT NULL
);


ALTER TABLE lib_schema.role
    OWNER TO admin;

--
-- TOC entry 227 (class 1259 OID 17285)
-- Name: role_role_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.role_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.role_role_id_seq
    OWNER TO admin;

--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 227
-- Name: role_role_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.role_role_id_seq OWNED BY lib_schema.role.role_id;


--
-- TOC entry 255 (class 1259 OID 17390)
-- Name: vault; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.vault
(
    vault_id    integer NOT NULL,
    vault_arch  integer NOT NULL,
    vault_floor integer NOT NULL
);


ALTER TABLE lib_schema.vault
    OWNER TO admin;

--
-- TOC entry 253 (class 1259 OID 17383)
-- Name: vault_floor; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.vault_floor
(
    vault_floor_id  integer NOT NULL,
    vault_floor_num integer NOT NULL,
    vault_floor_row integer NOT NULL
);


ALTER TABLE lib_schema.vault_floor
    OWNER TO admin;

--
-- TOC entry 252 (class 1259 OID 17382)
-- Name: vault_floor_vault_floor_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.vault_floor_vault_floor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.vault_floor_vault_floor_id_seq
    OWNER TO admin;

--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 252
-- Name: vault_floor_vault_floor_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.vault_floor_vault_floor_id_seq OWNED BY lib_schema.vault_floor.vault_floor_id;


--
-- TOC entry 249 (class 1259 OID 17369)
-- Name: vault_rack; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.vault_rack
(
    vault_rack_id    integer NOT NULL,
    vault_rack_num   integer NOT NULL,
    vault_rack_shelf integer NOT NULL
);


ALTER TABLE lib_schema.vault_rack
    OWNER TO admin;

--
-- TOC entry 248 (class 1259 OID 17368)
-- Name: vault_rack_vault_rack_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.vault_rack_vault_rack_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.vault_rack_vault_rack_id_seq
    OWNER TO admin;

--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 248
-- Name: vault_rack_vault_rack_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.vault_rack_vault_rack_id_seq OWNED BY lib_schema.vault_rack.vault_rack_id;


--
-- TOC entry 251 (class 1259 OID 17376)
-- Name: vault_row; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.vault_row
(
    vault_row_id   integer NOT NULL,
    vault_row_num  integer NOT NULL,
    vault_row_rack integer NOT NULL
);


ALTER TABLE lib_schema.vault_row
    OWNER TO admin;

--
-- TOC entry 250 (class 1259 OID 17375)
-- Name: vault_row_vault_row_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.vault_row_vault_row_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.vault_row_vault_row_id_seq
    OWNER TO admin;

--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 250
-- Name: vault_row_vault_row_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.vault_row_vault_row_id_seq OWNED BY lib_schema.vault_row.vault_row_id;


--
-- TOC entry 247 (class 1259 OID 17362)
-- Name: vault_shelf; Type: TABLE; Schema: lib_schema; Owner: admin
--

CREATE TABLE lib_schema.vault_shelf
(
    vault_shelf_id  integer NOT NULL,
    vault_shelf_num integer NOT NULL
);


ALTER TABLE lib_schema.vault_shelf
    OWNER TO admin;

--
-- TOC entry 246 (class 1259 OID 17361)
-- Name: vault_shelf_vault_shelf_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.vault_shelf_vault_shelf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.vault_shelf_vault_shelf_id_seq
    OWNER TO admin;

--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 246
-- Name: vault_shelf_vault_shelf_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.vault_shelf_vault_shelf_id_seq OWNED BY lib_schema.vault_shelf.vault_shelf_id;


--
-- TOC entry 254 (class 1259 OID 17389)
-- Name: vault_vault_id_seq; Type: SEQUENCE; Schema: lib_schema; Owner: admin
--

CREATE SEQUENCE lib_schema.vault_vault_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lib_schema.vault_vault_id_seq
    OWNER TO admin;

--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 254
-- Name: vault_vault_id_seq; Type: SEQUENCE OWNED BY; Schema: lib_schema; Owner: admin
--

ALTER SEQUENCE lib_schema.vault_vault_id_seq OWNED BY lib_schema.vault.vault_id;


--
-- TOC entry 3301 (class 2604 OID 17298)
-- Name: address address_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.address
    ALTER COLUMN address_id SET DEFAULT nextval('lib_schema.address_address_id_seq'::regclass);


--
-- TOC entry 3294 (class 2604 OID 17235)
-- Name: book book_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book
    ALTER COLUMN book_id SET DEFAULT nextval('lib_schema.book_book_id_seq'::regclass);


--
-- TOC entry 3302 (class 2604 OID 17307)
-- Name: book_archive book_archive_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_archive
    ALTER COLUMN book_archive_id SET DEFAULT nextval('lib_schema.book_archive_book_archive_id_seq'::regclass);


--
-- TOC entry 3295 (class 2604 OID 17244)
-- Name: book_author author_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_author
    ALTER COLUMN author_id SET DEFAULT nextval('lib_schema.book_author_author_id_seq'::regclass);


--
-- TOC entry 3314 (class 2604 OID 17401)
-- Name: book_book_author book_book_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_author
    ALTER COLUMN book_book_id SET DEFAULT nextval('lib_schema.book_book_author_book_book_id_seq'::regclass);


--
-- TOC entry 3315 (class 2604 OID 17402)
-- Name: book_book_author book_author_author_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_author
    ALTER COLUMN book_author_author_id SET DEFAULT nextval('lib_schema.book_book_author_book_author_author_id_seq'::regclass);


--
-- TOC entry 3316 (class 2604 OID 17408)
-- Name: book_book_genre book_book_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_genre
    ALTER COLUMN book_book_id SET DEFAULT nextval('lib_schema.book_book_genre_book_book_id_seq'::regclass);


--
-- TOC entry 3317 (class 2604 OID 17409)
-- Name: book_book_genre book_genre_genre_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_genre
    ALTER COLUMN book_genre_genre_id SET DEFAULT nextval('lib_schema.book_book_genre_book_genre_genre_id_seq'::regclass);


--
-- TOC entry 3318 (class 2604 OID 17415)
-- Name: book_book_lang book_book_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_lang
    ALTER COLUMN book_book_id SET DEFAULT nextval('lib_schema.book_book_lang_book_book_id_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 17416)
-- Name: book_book_lang book_lang_lang_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_lang
    ALTER COLUMN book_lang_lang_id SET DEFAULT nextval('lib_schema.book_book_lang_book_lang_lang_id_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 17253)
-- Name: book_genre genre_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_genre
    ALTER COLUMN genre_id SET DEFAULT nextval('lib_schema.book_genre_genre_id_seq'::regclass);


--
-- TOC entry 3297 (class 2604 OID 17262)
-- Name: book_lang lang_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_lang
    ALTER COLUMN lang_id SET DEFAULT nextval('lib_schema.book_lang_lang_id_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 17271)
-- Name: book_publisher publisher_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_publisher
    ALTER COLUMN publisher_id SET DEFAULT nextval('lib_schema.book_publisher_publisher_id_seq'::regclass);


--
-- TOC entry 3307 (class 2604 OID 17346)
-- Name: equipement equipement_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.equipement
    ALTER COLUMN equipement_id SET DEFAULT nextval('lib_schema.equipement_equipement_id_seq'::regclass);


--
-- TOC entry 3304 (class 2604 OID 17321)
-- Name: hall hall_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.hall
    ALTER COLUMN hall_id SET DEFAULT nextval('lib_schema.hall_hall_id_seq'::regclass);


--
-- TOC entry 3303 (class 2604 OID 17314)
-- Name: journal journal_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.journal
    ALTER COLUMN journal_id SET DEFAULT nextval('lib_schema.journal_journal_id_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 17280)
-- Name: people people_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.people
    ALTER COLUMN people_id SET DEFAULT nextval('lib_schema.people_people_id_seq'::regclass);


--
-- TOC entry 3306 (class 2604 OID 17339)
-- Name: place place_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place
    ALTER COLUMN place_id SET DEFAULT nextval('lib_schema.place_place_id_seq'::regclass);


--
-- TOC entry 3308 (class 2604 OID 17358)
-- Name: place_journal place_journal_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_journal
    ALTER COLUMN place_journal_id SET DEFAULT nextval('lib_schema.place_journal_place_journal_id_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 17330)
-- Name: place_type place_type_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_type
    ALTER COLUMN place_type_id SET DEFAULT nextval('lib_schema.place_type_place_type_id_seq'::regclass);


--
-- TOC entry 3300 (class 2604 OID 17289)
-- Name: role role_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.role
    ALTER COLUMN role_id SET DEFAULT nextval('lib_schema.role_role_id_seq'::regclass);


--
-- TOC entry 3313 (class 2604 OID 17393)
-- Name: vault vault_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault
    ALTER COLUMN vault_id SET DEFAULT nextval('lib_schema.vault_vault_id_seq'::regclass);


--
-- TOC entry 3312 (class 2604 OID 17386)
-- Name: vault_floor vault_floor_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault_floor
    ALTER COLUMN vault_floor_id SET DEFAULT nextval('lib_schema.vault_floor_vault_floor_id_seq'::regclass);


--
-- TOC entry 3310 (class 2604 OID 17372)
-- Name: vault_rack vault_rack_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault_rack
    ALTER COLUMN vault_rack_id SET DEFAULT nextval('lib_schema.vault_rack_vault_rack_id_seq'::regclass);


--
-- TOC entry 3311 (class 2604 OID 17379)
-- Name: vault_row vault_row_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault_row
    ALTER COLUMN vault_row_id SET DEFAULT nextval('lib_schema.vault_row_vault_row_id_seq'::regclass);


--
-- TOC entry 3309 (class 2604 OID 17365)
-- Name: vault_shelf vault_shelf_id; Type: DEFAULT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault_shelf
    ALTER COLUMN vault_shelf_id SET DEFAULT nextval('lib_schema.vault_shelf_vault_shelf_id_seq'::regclass);


--
-- TOC entry 3335 (class 2606 OID 17302)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (address_id);


--
-- TOC entry 3337 (class 2606 OID 17309)
-- Name: book_archive book_archive_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_archive
    ADD CONSTRAINT book_archive_pkey PRIMARY KEY (book_archive_id);


--
-- TOC entry 3323 (class 2606 OID 17248)
-- Name: book_author book_author_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_author
    ADD CONSTRAINT book_author_pkey PRIMARY KEY (author_id);


--
-- TOC entry 3325 (class 2606 OID 17257)
-- Name: book_genre book_genre_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_genre
    ADD CONSTRAINT book_genre_pkey PRIMARY KEY (genre_id);


--
-- TOC entry 3327 (class 2606 OID 17266)
-- Name: book_lang book_lang_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_lang
    ADD CONSTRAINT book_lang_pkey PRIMARY KEY (lang_id);


--
-- TOC entry 3321 (class 2606 OID 17239)
-- Name: book book_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book
    ADD CONSTRAINT book_pkey PRIMARY KEY (book_id);


--
-- TOC entry 3329 (class 2606 OID 17275)
-- Name: book_publisher book_publisher_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_publisher
    ADD CONSTRAINT book_publisher_pkey PRIMARY KEY (publisher_id);


--
-- TOC entry 3347 (class 2606 OID 17350)
-- Name: equipement equipement_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.equipement
    ADD CONSTRAINT equipement_pkey PRIMARY KEY (equipement_id);


--
-- TOC entry 3341 (class 2606 OID 17325)
-- Name: hall hall_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.hall
    ADD CONSTRAINT hall_pkey PRIMARY KEY (hall_id);


--
-- TOC entry 3339 (class 2606 OID 17316)
-- Name: journal journal_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.journal
    ADD CONSTRAINT journal_pkey PRIMARY KEY (journal_id);


--
-- TOC entry 3331 (class 2606 OID 17284)
-- Name: people people_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (people_id);


--
-- TOC entry 3349 (class 2606 OID 17360)
-- Name: place_journal place_journal_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_journal
    ADD CONSTRAINT place_journal_pkey PRIMARY KEY (place_journal_id);


--
-- TOC entry 3345 (class 2606 OID 17341)
-- Name: place place_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place
    ADD CONSTRAINT place_pkey PRIMARY KEY (place_id);


--
-- TOC entry 3343 (class 2606 OID 17334)
-- Name: place_type place_type_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_type
    ADD CONSTRAINT place_type_pkey PRIMARY KEY (place_type_id);


--
-- TOC entry 3333 (class 2606 OID 17293)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_id);


--
-- TOC entry 3357 (class 2606 OID 17388)
-- Name: vault_floor vault_floor_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault_floor
    ADD CONSTRAINT vault_floor_pkey PRIMARY KEY (vault_floor_id);


--
-- TOC entry 3359 (class 2606 OID 17395)
-- Name: vault vault_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault
    ADD CONSTRAINT vault_pkey PRIMARY KEY (vault_id);


--
-- TOC entry 3353 (class 2606 OID 17374)
-- Name: vault_rack vault_rack_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault_rack
    ADD CONSTRAINT vault_rack_pkey PRIMARY KEY (vault_rack_id);


--
-- TOC entry 3355 (class 2606 OID 17381)
-- Name: vault_row vault_row_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault_row
    ADD CONSTRAINT vault_row_pkey PRIMARY KEY (vault_row_id);


--
-- TOC entry 3351 (class 2606 OID 17367)
-- Name: vault_shelf vault_shelf_pkey; Type: CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault_shelf
    ADD CONSTRAINT vault_shelf_pkey PRIMARY KEY (vault_shelf_id);


--
-- TOC entry 3363 (class 2606 OID 17432)
-- Name: book_archive book_archive_book_archive_address_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_archive
    ADD CONSTRAINT book_archive_book_archive_address_fkey FOREIGN KEY (book_archive_address) REFERENCES lib_schema.address (address_id) NOT VALID;


--
-- TOC entry 3376 (class 2606 OID 17502)
-- Name: book_book_author book_book_author_book_author_author_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_author
    ADD CONSTRAINT book_book_author_book_author_author_id_fkey FOREIGN KEY (book_author_author_id) REFERENCES lib_schema.book_author (author_id) NOT VALID;


--
-- TOC entry 3377 (class 2606 OID 17497)
-- Name: book_book_author book_book_author_book_book_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_author
    ADD CONSTRAINT book_book_author_book_book_id_fkey FOREIGN KEY (book_book_id) REFERENCES lib_schema.book (book_id) NOT VALID;


--
-- TOC entry 3378 (class 2606 OID 17507)
-- Name: book_book_genre book_book_genre_book_book_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_genre
    ADD CONSTRAINT book_book_genre_book_book_id_fkey FOREIGN KEY (book_book_id) REFERENCES lib_schema.book (book_id) NOT VALID;


--
-- TOC entry 3379 (class 2606 OID 17512)
-- Name: book_book_genre book_book_genre_book_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_genre
    ADD CONSTRAINT book_book_genre_book_genre_genre_id_fkey FOREIGN KEY (book_genre_genre_id) REFERENCES lib_schema.book_genre (genre_id) NOT VALID;


--
-- TOC entry 3380 (class 2606 OID 17517)
-- Name: book_book_lang book_book_lang_book_book_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_lang
    ADD CONSTRAINT book_book_lang_book_book_id_fkey FOREIGN KEY (book_book_id) REFERENCES lib_schema.book (book_id) NOT VALID;


--
-- TOC entry 3381 (class 2606 OID 17522)
-- Name: book_book_lang book_book_lang_book_lang_lang_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book_book_lang
    ADD CONSTRAINT book_book_lang_book_lang_lang_id_fkey FOREIGN KEY (book_lang_lang_id) REFERENCES lib_schema.book_lang (lang_id) NOT VALID;


--
-- TOC entry 3360 (class 2606 OID 17417)
-- Name: book book_book_publisher_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.book
    ADD CONSTRAINT book_book_publisher_fkey FOREIGN KEY (book_publisher) REFERENCES lib_schema.book_publisher (publisher_id) NOT VALID;


--
-- TOC entry 3364 (class 2606 OID 17437)
-- Name: journal journal_journal_reader_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.journal
    ADD CONSTRAINT journal_journal_reader_id_fkey FOREIGN KEY (journal_reader_id) REFERENCES lib_schema.people (people_id) NOT VALID;


--
-- TOC entry 3361 (class 2606 OID 17427)
-- Name: people people_people_address_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.people
    ADD CONSTRAINT people_people_address_fkey FOREIGN KEY (people_address) REFERENCES lib_schema.address (address_id) NOT VALID;


--
-- TOC entry 3362 (class 2606 OID 17422)
-- Name: people people_people_role_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.people
    ADD CONSTRAINT people_people_role_fkey FOREIGN KEY (people_role) REFERENCES lib_schema.role (role_id) NOT VALID;


--
-- TOC entry 3367 (class 2606 OID 17457)
-- Name: place_equipement place_equipement_equipement_equipement_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_equipement
    ADD CONSTRAINT place_equipement_equipement_equipement_id_fkey FOREIGN KEY (equipement_equipement_id) REFERENCES lib_schema.equipement (equipement_id) NOT VALID;


--
-- TOC entry 3368 (class 2606 OID 17452)
-- Name: place_equipement place_equipement_place_place_id_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_equipement
    ADD CONSTRAINT place_equipement_place_place_id_fkey FOREIGN KEY (place_place_id) REFERENCES lib_schema.place (place_id) NOT VALID;


--
-- TOC entry 3369 (class 2606 OID 17467)
-- Name: place_journal place_journal_place_journal_people_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_journal
    ADD CONSTRAINT place_journal_place_journal_people_fkey FOREIGN KEY (place_journal_people) REFERENCES lib_schema.people (people_id) NOT VALID;


--
-- TOC entry 3370 (class 2606 OID 17462)
-- Name: place_journal place_journal_place_journal_place_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place_journal
    ADD CONSTRAINT place_journal_place_journal_place_fkey FOREIGN KEY (place_journal_place) REFERENCES lib_schema.place (place_id) NOT VALID;


--
-- TOC entry 3365 (class 2606 OID 17442)
-- Name: place place_place_hall_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place
    ADD CONSTRAINT place_place_hall_fkey FOREIGN KEY (place_hall) REFERENCES lib_schema.hall (hall_id) NOT VALID;


--
-- TOC entry 3366 (class 2606 OID 17447)
-- Name: place place_place_type_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.place
    ADD CONSTRAINT place_place_type_fkey FOREIGN KEY (place_type) REFERENCES lib_schema.place_type (place_type_id) NOT VALID;


--
-- TOC entry 3373 (class 2606 OID 17482)
-- Name: vault_floor vault_floor_vault_floor_row_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault_floor
    ADD CONSTRAINT vault_floor_vault_floor_row_fkey FOREIGN KEY (vault_floor_row) REFERENCES lib_schema.vault_row (vault_row_id) NOT VALID;


--
-- TOC entry 3371 (class 2606 OID 17472)
-- Name: vault_rack vault_rack_vault_rack_shelf_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault_rack
    ADD CONSTRAINT vault_rack_vault_rack_shelf_fkey FOREIGN KEY (vault_rack_shelf) REFERENCES lib_schema.vault_shelf (vault_shelf_id) NOT VALID;


--
-- TOC entry 3372 (class 2606 OID 17477)
-- Name: vault_row vault_row_vault_row_rack_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault_row
    ADD CONSTRAINT vault_row_vault_row_rack_fkey FOREIGN KEY (vault_row_rack) REFERENCES lib_schema.vault_rack (vault_rack_id) NOT VALID;


--
-- TOC entry 3374 (class 2606 OID 17487)
-- Name: vault vault_vault_arch_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault
    ADD CONSTRAINT vault_vault_arch_fkey FOREIGN KEY (vault_arch) REFERENCES lib_schema.book_archive (book_archive_id) NOT VALID;


--
-- TOC entry 3375 (class 2606 OID 17492)
-- Name: vault vault_vault_floor_fkey; Type: FK CONSTRAINT; Schema: lib_schema; Owner: admin
--

ALTER TABLE ONLY lib_schema.vault
    ADD CONSTRAINT vault_vault_floor_fkey FOREIGN KEY (vault_floor) REFERENCES lib_schema.vault_floor (vault_floor_id) NOT VALID;


-- Completed on 2023-06-03 10:14:56 UTC

--
-- PostgreSQL database dump complete
--

