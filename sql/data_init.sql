--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.7
-- Dumped by pg_dump version 9.4.7
-- Started on 2016-04-27 09:42:45 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 2119 (class 0 OID 25804)
-- Dependencies: 184
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: dev
--



--
-- TOC entry 2124 (class 0 OID 0)
-- Dependencies: 183
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('images_id_seq', 14, true);


--
-- TOC entry 2109 (class 0 OID 25696)
-- Dependencies: 174
-- Data for Name: luticate_groups; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO luticate_groups VALUES (0, 'Super Administrators');
INSERT INTO luticate_groups VALUES (1, 'Administrators');


--
-- TOC entry 2125 (class 0 OID 0)
-- Dependencies: 173
-- Name: luticate_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('luticate_groups_id_seq', 2, true);


--
-- TOC entry 2110 (class 0 OID 25703)
-- Dependencies: 175
-- Data for Name: luticate_permissions; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO luticate_permissions VALUES ('LU_USER_SET_PASSWORD', false);
INSERT INTO luticate_permissions VALUES ('LU_USER_LOGIN', true);
INSERT INTO luticate_permissions VALUES ('LU_USER_EDIT_ME', true);
INSERT INTO luticate_permissions VALUES ('LU_USER_SET_PASSWORD_ME', true);
INSERT INTO luticate_permissions VALUES ('LU_GROUP_ADD', false);
INSERT INTO luticate_permissions VALUES ('LU_GROUP_DEL', false);
INSERT INTO luticate_permissions VALUES ('LU_GROUP_EDIT', false);
INSERT INTO luticate_permissions VALUES ('LU_GROUP_USER_ADD', false);
INSERT INTO luticate_permissions VALUES ('LU_GROUP_USER_DEL', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_ADD', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_DEL', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_EDIT', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_EFFECTIVE_GET', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_GET', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_GROUP_ADD', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_GROUP_DEL', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_GROUP_EDIT', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_GROUP_GET', false);
INSERT INTO luticate_permissions VALUES ('LU_GROUP_GET', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_USER_ADD', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_USER_DEL', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_USER_EDIT', false);
INSERT INTO luticate_permissions VALUES ('LU_USER_EDIT', false);
INSERT INTO luticate_permissions VALUES ('LU_USER_DEL', false);
INSERT INTO luticate_permissions VALUES ('LU_USER_ADD', false);
INSERT INTO luticate_permissions VALUES ('LU_PERM_USER_GET', false);
INSERT INTO luticate_permissions VALUES ('LU_SETTING_DEL', false);
INSERT INTO luticate_permissions VALUES ('LU_SETTING_EDIT', false);
INSERT INTO luticate_permissions VALUES ('LU_SETTING_EFFECTIVE_GET', false);
INSERT INTO luticate_permissions VALUES ('LU_SETTING_GET', false);
INSERT INTO luticate_permissions VALUES ('LU_SETTING_USER_EDIT', false);
INSERT INTO luticate_permissions VALUES ('LU_SETTING_USER_GET', false);
INSERT INTO luticate_permissions VALUES ('LU_SETTING_EDIT_ME', false);
INSERT INTO luticate_permissions VALUES ('LU_SETTING_ADD', false);
INSERT INTO luticate_permissions VALUES ('PX_UPLOAD', true);
INSERT INTO luticate_permissions VALUES ('LU_USER_GET', true);


--
-- TOC entry 2111 (class 0 OID 25706)
-- Dependencies: 176
-- Data for Name: luticate_permissions_groups; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_ADD', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_DEL', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_EDIT', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_GET', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_USER_ADD', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_USER_DEL', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_EFFECTIVE_GET', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_GET', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_GROUP_ADD', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_GROUP_DEL', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_GROUP_EDIT', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_GROUP_GET', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_USER_ADD', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_USER_DEL', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_USER_EDIT', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_USER_GET', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_ADD', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_DEL', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_EDIT', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_EDIT_ME', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_GET', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_LOGIN', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_SET_PASSWORD', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_SET_PASSWORD_ME', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_ADD', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_DEL', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_EDIT', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_GET', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_USER_ADD', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_GROUP_USER_DEL', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_EFFECTIVE_GET', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_GET', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_GROUP_ADD', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_GROUP_DEL', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_GROUP_EDIT', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_GROUP_GET', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_USER_ADD', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_USER_DEL', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_USER_EDIT', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_USER_GET', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_ADD', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_DEL', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_EDIT', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_EDIT_ME', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_GET', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_LOGIN', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_SET_PASSWORD', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_USER_SET_PASSWORD_ME', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_EDIT', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_DEL', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_ADD', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_ADD', false, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_EDIT', false, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_PERM_DEL', false, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_ADD', false, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_DEL', false, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_EDIT', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_EFFECTIVE_GET', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_GET', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_USER_EDIT', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_USER_GET', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_ADD', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_DEL', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_EDIT', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_EFFECTIVE_GET', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_GET', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_USER_EDIT', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_USER_GET', true, 0);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_EDIT_ME', true, 1);
INSERT INTO luticate_permissions_groups VALUES ('LU_SETTING_EDIT_ME', true, 0);


--
-- TOC entry 2114 (class 0 OID 25714)
-- Dependencies: 179
-- Data for Name: luticate_users; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO luticate_users VALUES (0, 'anonymous', 'anonymous@example.com', '', '', NULL, 'anonymous', 'anonymous');
INSERT INTO luticate_users VALUES (1, 'root', 'root@example.com', '$2y$10$m1aN1a1ZEr1vmjFPfWl4Pu/63EhcxVCrC/DF0DFhdGbvORwtJtCmy', 'AGLUILNxbh', NULL, 'root', 'root');


--
-- TOC entry 2112 (class 0 OID 25709)
-- Dependencies: 177
-- Data for Name: luticate_permissions_users; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO luticate_permissions_users VALUES ('LU_GROUP_ADD', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_GROUP_DEL', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_GROUP_EDIT', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_GROUP_USER_ADD', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_GROUP_USER_DEL', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_ADD', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_DEL', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_EDIT', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_EFFECTIVE_GET', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_GET', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_GROUP_ADD', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_GROUP_DEL', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_GROUP_EDIT', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_GROUP_GET', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_USER_ADD', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_USER_DEL', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_USER_EDIT', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_PERM_USER_GET', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_USER_DEL', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_USER_EDIT', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_USER_EDIT_ME', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_USER_SET_PASSWORD', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_USER_SET_PASSWORD_ME', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_USER_LOGIN', true, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_GROUP_GET', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_SETTING_USER_GET', true, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_SETTING_ADD', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_SETTING_EDIT', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_SETTING_EFFECTIVE_GET', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_SETTING_DEL', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_SETTING_EDIT_ME', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_SETTING_GET', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_SETTING_USER_EDIT', false, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_USER_ADD', true, 0);
INSERT INTO luticate_permissions_users VALUES ('LU_USER_GET', true, 0);
INSERT INTO luticate_permissions_users VALUES ('PX_UPLOAD', false, 0);


--
-- TOC entry 2116 (class 0 OID 25774)
-- Dependencies: 181
-- Data for Name: luticate_settings; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO luticate_settings VALUES ('LU_SESSION_DAYS', 'int', '30', true, true);
INSERT INTO luticate_settings VALUES ('LU_USERS_PER_PAGE', 'int', '15', false, false);
INSERT INTO luticate_settings VALUES ('LU_GROUPS_PER_PAGE', 'int', '15', false, false);
INSERT INTO luticate_settings VALUES ('LU_SETTINGS_PER_PAGE', 'int', '15', false, false);
INSERT INTO luticate_settings VALUES ('LU_PERMISSIONS_PER_PAGE', 'int', '15', false, false);


--
-- TOC entry 2117 (class 0 OID 25780)
-- Dependencies: 182
-- Data for Name: luticate_settings_users; Type: TABLE DATA; Schema: public; Owner: dev
--



--
-- TOC entry 2115 (class 0 OID 25721)
-- Dependencies: 180
-- Data for Name: luticate_users_groups; Type: TABLE DATA; Schema: public; Owner: dev
--

INSERT INTO luticate_users_groups VALUES (1, 0);


--
-- TOC entry 2126 (class 0 OID 0)
-- Dependencies: 178
-- Name: luticate_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('luticate_users_id_seq', 3, true);


-- Completed on 2016-04-27 09:42:45 CEST

--
-- PostgreSQL database dump complete
--

