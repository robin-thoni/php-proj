--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.7
-- Dumped by pg_dump version 9.4.7
-- Started on 2016-04-27 09:40:56 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11893)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- TOC entry 201 (class 1255 OID 25843)
-- Name: sp_get_images(boolean, integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_get_images(_only_mine boolean, _user_id_me integer, OUT id integer, OUT name text, OUT user_id integer, OUT date timestamp without time zone) RETURNS SETOF record
    LANGUAGE sql IMMUTABLE SECURITY DEFINER COST 10
    AS $$
        SELECT i.id, i.name, i.user_id, i.date
        FROM images i
        WHERE (CASE WHEN _only_mine THEN i.user_id = _user_id_me ELSE TRUE END)
$$;


--
-- TOC entry 198 (class 1255 OID 25773)
-- Name: sp_lu_get_all_user_permission(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_lu_get_all_user_permission(_user_id integer, OUT _permisson_name character varying, OUT val boolean) RETURNS SETOF record
    LANGUAGE sql IMMUTABLE SECURITY DEFINER COST 10
    AS $$
SELECT p.name, sp_lu_get_user_permission(_user_id, p.name) FROM luticate_permissions p ORDER bY p.name
$$;


--
-- TOC entry 200 (class 1255 OID 25801)
-- Name: sp_lu_get_all_user_settings(integer); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_lu_get_all_user_settings(_user_id integer, OUT _settings json) RETURNS SETOF json
    LANGUAGE sql IMMUTABLE SECURITY DEFINER COST 10
    AS $$
	SELECT sp_lu_get_user_setting(_user_id, s.name)
	FROM luticate_settings s
	WHERE NOT s.is_admin
	ORDER BY s.name
$$;


--
-- TOC entry 197 (class 1255 OID 25772)
-- Name: sp_lu_get_user_permission(integer, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_lu_get_user_permission(_user_id integer, _permisson_name character varying, OUT val boolean) RETURNS boolean
    LANGUAGE plpgsql IMMUTABLE SECURITY DEFINER COST 10
    AS $$
DECLARE
    groups int[];
    g INT;
BEGIN
    SELECT "value" INTO val FROM luticate_permissions_users WHERE "user_id" = _user_id AND "name" = _permisson_name;
    IF val is null THEN
        SELECT lpg."value" into val FROM luticate_permissions_groups lpg
            INNER JOIN luticate_groups lg ON lg."id" = lpg."group_id"
            INNER JOIN luticate_users_groups lug ON lug."user_id" = _user_id AND lug."group_id" = lg."id"
        WHERE lpg."name" = _permisson_name and lpg."value" = FALSE;
        IF val is null then
            SELECT lpg."value" into val FROM luticate_permissions_groups lpg
                INNER JOIN luticate_groups lg ON lg."id" = lpg."group_id"
                INNER JOIN luticate_users_groups lug ON lug."user_id" = _user_id AND lug."group_id" = lg."id"
            WHERE lpg."name" = _permisson_name and lpg."value" = TRUE;
            IF val is null then
                SELECT "value" INTO val FROM luticate_permissions WHERE "name" = _permisson_name;
            END IF;
        end if;
    END IF;
END;
$$;


--
-- TOC entry 199 (class 1255 OID 25800)
-- Name: sp_lu_get_user_setting(integer, character varying); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION sp_lu_get_user_setting(_user_id integer, _setting_name character varying, OUT setting json) RETURNS json
    LANGUAGE plpgsql IMMUTABLE SECURITY DEFINER COST 10
    AS $$
DECLARE
_setting luticate_settings;
_setting_user luticate_settings_users;
BEGIN
    SELECT * INTO _setting FROM luticate_settings WHERE "name" = _setting_name AND NOT "is_admin";
    IF _setting IS NULL THEN
        setting := NULL;
    ELSE
        IF NOT _setting.is_blocked THEN
            SELECT * INTO _setting_user FROM luticate_settings_users WHERE "user_id" = _user_id AND "name" = _setting_name;
            IF _setting_user IS NOT NULL THEN
                _setting.value := _setting_user.value;
            END IF;
        END IF;
        setting := to_json(_setting);
    END IF;
END;
$$;


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 184 (class 1259 OID 25804)
-- Name: images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE images (
    id integer NOT NULL,
    user_id integer NOT NULL,
    path text NOT NULL,
    date timestamp without time zone DEFAULT now() NOT NULL,
    name text NOT NULL
);


--
-- TOC entry 183 (class 1259 OID 25802)
-- Name: images_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 183
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE images_id_seq OWNED BY images.id;


--
-- TOC entry 173 (class 1259 OID 25694)
-- Name: luticate_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE luticate_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 174 (class 1259 OID 25696)
-- Name: luticate_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE luticate_groups (
    id integer DEFAULT nextval('luticate_groups_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL
);


--
-- TOC entry 175 (class 1259 OID 25703)
-- Name: luticate_permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE luticate_permissions (
    name character varying(128) NOT NULL,
    value boolean NOT NULL
);


--
-- TOC entry 176 (class 1259 OID 25706)
-- Name: luticate_permissions_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE luticate_permissions_groups (
    name character varying(128) NOT NULL,
    value boolean NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 177 (class 1259 OID 25709)
-- Name: luticate_permissions_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE luticate_permissions_users (
    name character varying(128) NOT NULL,
    value boolean,
    user_id integer NOT NULL
);


--
-- TOC entry 181 (class 1259 OID 25774)
-- Name: luticate_settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE luticate_settings (
    name character varying(128) NOT NULL,
    type character varying(128) NOT NULL,
    value text NOT NULL,
    is_blocked boolean NOT NULL,
    is_admin boolean NOT NULL
);


--
-- TOC entry 182 (class 1259 OID 25780)
-- Name: luticate_settings_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE luticate_settings_users (
    name character varying(128) NOT NULL,
    value text NOT NULL,
    user_id integer NOT NULL,
    is_blocked boolean NOT NULL
);


--
-- TOC entry 178 (class 1259 OID 25712)
-- Name: luticate_users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE luticate_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 179 (class 1259 OID 25714)
-- Name: luticate_users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE luticate_users (
    id integer DEFAULT nextval('luticate_users_id_seq'::regclass) NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    salt character varying(10) NOT NULL,
    profile_id integer,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL
);


--
-- TOC entry 180 (class 1259 OID 25721)
-- Name: luticate_users_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE luticate_users_groups (
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 1965 (class 2604 OID 25807)
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY images ALTER COLUMN id SET DEFAULT nextval('images_id_seq'::regclass);


--
-- TOC entry 1990 (class 2606 OID 25812)
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- TOC entry 1968 (class 2606 OID 25725)
-- Name: luticate_groups_name_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY luticate_groups
    ADD CONSTRAINT luticate_groups_name_key UNIQUE (name);


--
-- TOC entry 1970 (class 2606 OID 25727)
-- Name: luticate_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY luticate_groups
    ADD CONSTRAINT luticate_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 1972 (class 2606 OID 25729)
-- Name: luticate_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY luticate_permissions
    ADD CONSTRAINT luticate_permissions_pkey PRIMARY KEY (name);


--
-- TOC entry 1976 (class 2606 OID 25731)
-- Name: luticate_permissions_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY luticate_permissions_users
    ADD CONSTRAINT luticate_permissions_users_pkey PRIMARY KEY (name, user_id);


--
-- TOC entry 1986 (class 2606 OID 25787)
-- Name: luticate_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY luticate_settings
    ADD CONSTRAINT luticate_settings_pkey PRIMARY KEY (name);


--
-- TOC entry 1988 (class 2606 OID 25789)
-- Name: luticate_settings_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY luticate_settings_users
    ADD CONSTRAINT luticate_settings_users_pkey PRIMARY KEY (name, user_id);


--
-- TOC entry 1978 (class 2606 OID 25733)
-- Name: luticate_users_email_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY luticate_users
    ADD CONSTRAINT luticate_users_email_key UNIQUE (email);


--
-- TOC entry 1984 (class 2606 OID 25735)
-- Name: luticate_users_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY luticate_users_groups
    ADD CONSTRAINT luticate_users_groups_pkey PRIMARY KEY (user_id, group_id);


--
-- TOC entry 1980 (class 2606 OID 25737)
-- Name: luticate_users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY luticate_users
    ADD CONSTRAINT luticate_users_pkey PRIMARY KEY (id);


--
-- TOC entry 1982 (class 2606 OID 25739)
-- Name: luticate_users_username_key; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY luticate_users
    ADD CONSTRAINT luticate_users_username_key UNIQUE (username);


--
-- TOC entry 1974 (class 2606 OID 25741)
-- Name: pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY luticate_permissions_groups
    ADD CONSTRAINT pkey PRIMARY KEY (name, group_id);


--
-- TOC entry 1991 (class 2606 OID 25742)
-- Name: foreign_group; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY luticate_permissions_groups
    ADD CONSTRAINT foreign_group FOREIGN KEY (group_id) REFERENCES luticate_groups(id) ON DELETE CASCADE;


--
-- TOC entry 1995 (class 2606 OID 25747)
-- Name: foreign_group; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY luticate_users_groups
    ADD CONSTRAINT foreign_group FOREIGN KEY (group_id) REFERENCES luticate_groups(id) ON DELETE CASCADE;


--
-- TOC entry 1992 (class 2606 OID 25752)
-- Name: foreign_name; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY luticate_permissions_groups
    ADD CONSTRAINT foreign_name FOREIGN KEY (name) REFERENCES luticate_permissions(name) ON DELETE CASCADE;


--
-- TOC entry 1993 (class 2606 OID 25757)
-- Name: foreign_name; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY luticate_permissions_users
    ADD CONSTRAINT foreign_name FOREIGN KEY (name) REFERENCES luticate_permissions(name) ON DELETE CASCADE;


--
-- TOC entry 1994 (class 2606 OID 25762)
-- Name: foreign_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY luticate_permissions_users
    ADD CONSTRAINT foreign_user FOREIGN KEY (user_id) REFERENCES luticate_users(id) ON DELETE CASCADE;


--
-- TOC entry 1996 (class 2606 OID 25767)
-- Name: foreign_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY luticate_users_groups
    ADD CONSTRAINT foreign_user FOREIGN KEY (user_id) REFERENCES luticate_users(id) ON DELETE CASCADE;


--
-- TOC entry 1997 (class 2606 OID 25790)
-- Name: luticate_settings_users_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY luticate_settings_users
    ADD CONSTRAINT luticate_settings_users_name_fkey FOREIGN KEY (name) REFERENCES luticate_settings(name) ON DELETE CASCADE;


--
-- TOC entry 1998 (class 2606 OID 25795)
-- Name: luticate_settings_users_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY luticate_settings_users
    ADD CONSTRAINT luticate_settings_users_user_id_fkey FOREIGN KEY (user_id) REFERENCES luticate_users(id) ON DELETE CASCADE;


-- Completed on 2016-04-27 09:40:56 CEST

--
-- PostgreSQL database dump complete
--

