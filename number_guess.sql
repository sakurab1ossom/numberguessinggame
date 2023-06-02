--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game_result; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_result (
    game_id integer NOT NULL,
    user_id integer,
    guess_count integer
);


ALTER TABLE public.game_result OWNER TO freecodecamp;

--
-- Name: game_result_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.game_result_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.game_result_game_id_seq OWNER TO freecodecamp;

--
-- Name: game_result_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.game_result_game_id_seq OWNED BY public.game_result.game_id;


--
-- Name: user_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_info (
    user_id integer NOT NULL,
    user_name character varying(22)
);


ALTER TABLE public.user_info OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_info_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_info_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_info_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_info_user_id_seq OWNED BY public.user_info.user_id;


--
-- Name: game_result game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_result ALTER COLUMN game_id SET DEFAULT nextval('public.game_result_game_id_seq'::regclass);


--
-- Name: user_info user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info ALTER COLUMN user_id SET DEFAULT nextval('public.user_info_user_id_seq'::regclass);


--
-- Data for Name: game_result; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_result VALUES (1, 16, 21);
INSERT INTO public.game_result VALUES (2, 17, 14);
INSERT INTO public.game_result VALUES (3, 17, 6);
INSERT INTO public.game_result VALUES (4, 18, 1);
INSERT INTO public.game_result VALUES (5, 18, 4);
INSERT INTO public.game_result VALUES (6, 17, 4);
INSERT INTO public.game_result VALUES (7, 17, 4);
INSERT INTO public.game_result VALUES (8, 17, 1);


--
-- Data for Name: user_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_info VALUES (1, 'user_1685661561656');
INSERT INTO public.user_info VALUES (2, 'user_1685661561655');
INSERT INTO public.user_info VALUES (3, 'user_1685661645563');
INSERT INTO public.user_info VALUES (4, 'user_1685661645562');
INSERT INTO public.user_info VALUES (5, 'user_1685661860517');
INSERT INTO public.user_info VALUES (6, 'user_1685661860516');
INSERT INTO public.user_info VALUES (7, 'user_1685661888449');
INSERT INTO public.user_info VALUES (8, 'user_1685661888448');
INSERT INTO public.user_info VALUES (9, 'user_1685662092690');
INSERT INTO public.user_info VALUES (10, 'user_1685662092689');
INSERT INTO public.user_info VALUES (11, 'user_1685700331727');
INSERT INTO public.user_info VALUES (12, 'user_1685700331726');
INSERT INTO public.user_info VALUES (13, 'user_1685700364737');
INSERT INTO public.user_info VALUES (14, 'user_1685700364736');
INSERT INTO public.user_info VALUES (15, 'k');
INSERT INTO public.user_info VALUES (16, 'ken');
INSERT INTO public.user_info VALUES (17, 'user_1685707584780');
INSERT INTO public.user_info VALUES (18, 'user_1685707584779');


--
-- Name: game_result_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.game_result_game_id_seq', 8, true);


--
-- Name: user_info_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_info_user_id_seq', 18, true);


--
-- Name: game_result game_result_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_result
    ADD CONSTRAINT game_result_pkey PRIMARY KEY (game_id);


--
-- Name: user_info user_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_info
    ADD CONSTRAINT user_info_pkey PRIMARY KEY (user_id);


--
-- Name: game_result game_result_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_result
    ADD CONSTRAINT game_result_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_info(user_id);


--
-- PostgreSQL database dump complete
--

