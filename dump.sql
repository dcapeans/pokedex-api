--
-- PostgreSQL database dump
--

-- Dumped from database version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.7 (Ubuntu 12.7-0ubuntu0.20.04.1)

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
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: pokemons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.pokemons (
    id integer NOT NULL,
    name character varying NOT NULL,
    number character varying NOT NULL,
    weight character varying NOT NULL,
    height character varying NOT NULL,
    base_exp character varying NOT NULL,
    image character varying NOT NULL,
    description character varying NOT NULL,
    in_my_pokemons boolean NOT NULL
);


--
-- Name: pokemons_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.pokemons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: pokemons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.pokemons_id_seq OWNED BY public.pokemons.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying NOT NULL,
    "userId" integer
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: users_pokemons_pokemons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users_pokemons_pokemons (
    "usersId" integer NOT NULL,
    "pokemonsId" integer NOT NULL
);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: pokemons id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pokemons ALTER COLUMN id SET DEFAULT nextval('public.pokemons_id_seq'::regclass);


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations VALUES (1, 1628269703362, 'CreateTables1628269703362');


--
-- Data for Name: pokemons; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.pokemons VALUES (1, 'bulbasaur', '1', '69', '7', '64', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png', 'Loves to eat', false);
INSERT INTO public.pokemons VALUES (2, 'ivysaur', '2', '130', '10', '142', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png', 'Proud of its power', false);
INSERT INTO public.pokemons VALUES (3, 'venusaur', '3', '1000', '20', '236', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png', 'Sturdy body', false);
INSERT INTO public.pokemons VALUES (4, 'charmander', '4', '85', '6', '62', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png', 'Highly curious', false);
INSERT INTO public.pokemons VALUES (5, 'charmeleon', '5', '190', '11', '142', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png', 'Strong willed', false);
INSERT INTO public.pokemons VALUES (6, 'charizard', '6', '905', '17', '240', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png', 'Likes to run', false);
INSERT INTO public.pokemons VALUES (7, 'squirtle', '7', '90', '5', '63', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/7.png', 'Takes plenty of siestas', false);
INSERT INTO public.pokemons VALUES (8, 'wartortle', '8', '225', '10', '142', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/8.png', 'Likes to thrash about', false);
INSERT INTO public.pokemons VALUES (9, 'blastoise', '9', '855', '16', '239', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/9.png', 'Capable of taking hits', false);
INSERT INTO public.pokemons VALUES (10, 'caterpie', '10', '29', '3', '39', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/10.png', 'Mischievous', false);
INSERT INTO public.pokemons VALUES (11, 'metapod', '11', '99', '7', '72', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/11.png', 'Somewhat vain', false);
INSERT INTO public.pokemons VALUES (12, 'butterfree', '12', '320', '11', '178', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/12.png', 'Alert to sounds', false);
INSERT INTO public.pokemons VALUES (13, 'weedle', '13', '32', '3', '39', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/13.png', 'Nods off a lot', false);
INSERT INTO public.pokemons VALUES (14, 'kakuna', '14', '100', '6', '72', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/14.png', 'A little quick tempered', false);
INSERT INTO public.pokemons VALUES (15, 'beedrill', '15', '295', '10', '178', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/15.png', 'Highly persistent', false);
INSERT INTO public.pokemons VALUES (16, 'pidgey', '16', '18', '3', '50', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/16.png', 'Thoroughly cunning', false);
INSERT INTO public.pokemons VALUES (17, 'pidgeotto', '17', '300', '11', '122', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/17.png', 'Strongly defiant', false);
INSERT INTO public.pokemons VALUES (18, 'pidgeot', '18', '395', '15', '216', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/18.png', 'Impetuous and silly', false);
INSERT INTO public.pokemons VALUES (19, 'rattata', '19', '35', '3', '51', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/19.png', 'Scatters things often', false);
INSERT INTO public.pokemons VALUES (20, 'raticate', '20', '185', '7', '145', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/20.png', 'Likes to fight', false);
INSERT INTO public.pokemons VALUES (21, 'spearow', '21', '20', '3', '52', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/21.png', 'Good endurance', false);
INSERT INTO public.pokemons VALUES (22, 'fearow', '22', '380', '12', '155', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/22.png', 'Often lost in thought', false);
INSERT INTO public.pokemons VALUES (23, 'ekans', '23', '69', '20', '58', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/23.png', 'Hates to lose', false);
INSERT INTO public.pokemons VALUES (24, 'arbok', '24', '650', '35', '157', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/24.png', 'Somewhat of a clown', false);
INSERT INTO public.pokemons VALUES (25, 'pikachu', '25', '60', '4', '112', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png', 'Likes to relax', false);
INSERT INTO public.pokemons VALUES (26, 'raichu', '26', '300', '8', '218', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/26.png', 'Quick tempered', false);
INSERT INTO public.pokemons VALUES (27, 'sandshrew', '27', '120', '6', '60', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/27.png', 'Good perseverance', false);
INSERT INTO public.pokemons VALUES (28, 'sandslash', '28', '295', '10', '158', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/28.png', 'Very finicky', false);
INSERT INTO public.pokemons VALUES (29, 'nidoran-f', '29', '70', '4', '55', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/29.png', 'Somewhat stubborn', false);
INSERT INTO public.pokemons VALUES (30, 'nidorina', '30', '200', '8', '128', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/30.png', 'Quick to flee', false);
INSERT INTO public.pokemons VALUES (31, 'nidoqueen', '31', '600', '13', '227', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/31.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (32, 'nidoran-m', '32', '90', '5', '55', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/32.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (33, 'nidorino', '33', '195', '9', '128', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/33.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (34, 'nidoking', '34', '620', '14', '227', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/34.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (35, 'clefairy', '35', '75', '6', '113', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/35.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (36, 'clefable', '36', '400', '13', '217', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/36.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (37, 'vulpix', '37', '99', '6', '60', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/37.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (38, 'ninetales', '38', '199', '11', '177', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/38.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (39, 'jigglypuff', '39', '55', '5', '95', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/39.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (40, 'wigglytuff', '40', '120', '10', '196', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/40.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (41, 'zubat', '41', '75', '8', '49', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/41.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (42, 'golbat', '42', '550', '16', '159', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/42.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (43, 'oddish', '43', '54', '5', '64', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/43.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (44, 'gloom', '44', '86', '8', '138', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/44.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (45, 'vileplume', '45', '186', '12', '221', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/45.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (46, 'paras', '46', '54', '3', '57', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/46.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (47, 'parasect', '47', '295', '10', '142', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/47.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (48, 'venonat', '48', '300', '10', '61', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/48.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (49, 'venomoth', '49', '125', '15', '158', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/49.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (50, 'diglett', '50', '8', '2', '53', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/50.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (51, 'dugtrio', '51', '333', '7', '149', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/51.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (52, 'meowth', '52', '42', '4', '58', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/52.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (53, 'persian', '53', '320', '10', '154', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/53.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (54, 'psyduck', '54', '196', '8', '64', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/54.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (55, 'golduck', '55', '766', '17', '175', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/55.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (56, 'mankey', '56', '280', '5', '61', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/56.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (57, 'primeape', '57', '320', '10', '159', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/57.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (58, 'growlithe', '58', '190', '7', '70', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/58.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (59, 'arcanine', '59', '1550', '19', '194', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/59.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (60, 'poliwag', '60', '124', '6', '60', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/60.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (61, 'poliwhirl', '61', '200', '10', '135', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/61.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (62, 'poliwrath', '62', '540', '13', '230', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/62.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (63, 'abra', '63', '195', '9', '62', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/63.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (64, 'kadabra', '64', '565', '13', '140', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/64.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (65, 'alakazam', '65', '480', '15', '225', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/65.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (66, 'machop', '66', '195', '8', '61', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/66.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (67, 'machoke', '67', '705', '15', '142', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/67.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (68, 'machamp', '68', '1300', '16', '227', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/68.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (69, 'bellsprout', '69', '40', '7', '60', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/69.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (70, 'weepinbell', '70', '64', '10', '137', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/70.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (71, 'victreebel', '71', '155', '17', '221', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/71.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (72, 'tentacool', '72', '455', '9', '67', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/72.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (73, 'tentacruel', '73', '550', '16', '180', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/73.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (74, 'geodude', '74', '200', '4', '60', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/74.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (75, 'graveler', '75', '1050', '10', '137', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/75.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (76, 'golem', '76', '3000', '14', '223', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/76.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (77, 'ponyta', '77', '300', '10', '82', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/77.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (78, 'rapidash', '78', '950', '17', '175', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/78.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (79, 'slowpoke', '79', '360', '12', '63', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/79.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (80, 'slowbro', '80', '785', '16', '172', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/80.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (81, 'magnemite', '81', '60', '3', '65', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/81.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (82, 'magneton', '82', '600', '10', '163', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/82.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (83, 'farfetchd', '83', '150', '8', '132', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/83.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (84, 'doduo', '84', '392', '14', '62', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/84.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (85, 'dodrio', '85', '852', '18', '165', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/85.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (86, 'seel', '86', '900', '11', '65', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/86.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (87, 'dewgong', '87', '1200', '17', '166', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/87.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (88, 'grimer', '88', '300', '9', '65', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/88.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (89, 'muk', '89', '300', '12', '175', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/89.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (90, 'shellder', '90', '40', '3', '61', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/90.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (91, 'cloyster', '91', '1325', '15', '184', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/91.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (92, 'gastly', '92', '1', '13', '62', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/92.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (93, 'haunter', '93', '1', '16', '142', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/93.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (94, 'gengar', '94', '405', '15', '225', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/94.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (95, 'onix', '95', '2100', '88', '77', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/95.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (96, 'drowzee', '96', '324', '10', '66', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/96.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (97, 'hypno', '97', '756', '16', '169', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/97.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (98, 'krabby', '98', '65', '4', '65', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/98.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (99, 'kingler', '99', '600', '13', '166', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/99.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (100, 'voltorb', '100', '104', '5', '66', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/100.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (101, 'electrode', '101', '666', '12', '172', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/101.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (102, 'exeggcute', '102', '25', '4', '65', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/102.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (103, 'exeggutor', '103', '1200', '20', '186', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/103.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (104, 'cubone', '104', '65', '4', '64', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/104.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (105, 'marowak', '105', '450', '10', '149', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/105.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (106, 'hitmonlee', '106', '498', '15', '159', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/106.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (107, 'hitmonchan', '107', '502', '14', '159', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/107.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (108, 'lickitung', '108', '655', '12', '77', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/108.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (109, 'koffing', '109', '10', '6', '68', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/109.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (110, 'weezing', '110', '95', '12', '172', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/110.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (111, 'rhyhorn', '111', '1150', '10', '69', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/111.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (112, 'rhydon', '112', '1200', '19', '170', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/112.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (113, 'chansey', '113', '346', '11', '395', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/113.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (114, 'tangela', '114', '350', '10', '87', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/114.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (115, 'kangaskhan', '115', '800', '22', '172', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/115.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (116, 'horsea', '116', '80', '4', '59', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/116.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (117, 'seadra', '117', '250', '12', '154', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/117.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (118, 'goldeen', '118', '150', '6', '64', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/118.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (119, 'seaking', '119', '390', '13', '158', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/119.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (120, 'staryu', '120', '345', '8', '68', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/120.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (121, 'starmie', '121', '800', '11', '182', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/121.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (122, 'mr-mime', '122', '545', '13', '161', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/122.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (123, 'scyther', '123', '560', '15', '100', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/123.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (124, 'jynx', '124', '406', '14', '159', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/124.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (125, 'electabuzz', '125', '300', '11', '172', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/125.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (126, 'magmar', '126', '445', '13', '173', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/126.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (127, 'pinsir', '127', '550', '15', '175', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/127.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (128, 'tauros', '128', '884', '14', '172', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/128.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (129, 'magikarp', '129', '100', '9', '40', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/129.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (130, 'gyarados', '130', '2350', '65', '189', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/130.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (131, 'lapras', '131', '2200', '25', '187', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/131.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (132, 'ditto', '132', '40', '3', '101', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/132.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (133, 'eevee', '133', '65', '3', '65', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/133.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (134, 'vaporeon', '134', '290', '10', '184', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/134.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (135, 'jolteon', '135', '245', '8', '184', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/135.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (136, 'flareon', '136', '250', '9', '184', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/136.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (137, 'porygon', '137', '365', '8', '79', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/137.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (138, 'omanyte', '138', '75', '4', '71', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/138.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (139, 'omastar', '139', '350', '10', '173', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/139.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (140, 'kabuto', '140', '115', '5', '71', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/140.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (141, 'kabutops', '141', '405', '13', '173', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/141.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (142, 'aerodactyl', '142', '590', '18', '180', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/142.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (143, 'snorlax', '143', '4600', '21', '189', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/143.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (144, 'articuno', '144', '554', '17', '261', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/144.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (145, 'zapdos', '145', '526', '16', '261', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/145.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (146, 'moltres', '146', '600', '20', '261', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/146.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (147, 'dratini', '147', '33', '18', '60', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/147.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (148, 'dragonair', '148', '165', '40', '147', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/148.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (149, 'dragonite', '149', '2100', '22', '270', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/149.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (150, 'mewtwo', '150', '1220', '20', '306', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/150.png', '!!Work in progress!!', false);
INSERT INTO public.pokemons VALUES (151, 'mew', '151', '40', '4', '270', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/151.png', '!!Work in progress!!', false);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 1, '0f6b311a-6307-4dc1-862d-4e9ca74e593c', NULL);
INSERT INTO public.sessions VALUES (2, 4, '93782da5-327e-475f-b223-d17d50811a98', NULL);
INSERT INTO public.sessions VALUES (3, 1, 'db4a5d17-eccb-4549-8f63-fda09208e11f', NULL);
INSERT INTO public.sessions VALUES (4, 9, 'f4f6f787-4231-41d1-9ff5-43e9922b724b', NULL);
INSERT INTO public.sessions VALUES (5, 1, 'a35ac227-a993-4964-b8da-74484e886575', NULL);
INSERT INTO public.sessions VALUES (6, 1, '7464a30f-736b-4ba9-89c5-123fc96063bc', NULL);
INSERT INTO public.sessions VALUES (7, 14, '735b0159-81b3-4b74-871b-abf63219746e', NULL);
INSERT INTO public.sessions VALUES (8, 1, 'b38bbbf1-141e-44d8-a763-fbb500385ab4', NULL);
INSERT INTO public.sessions VALUES (9, 1, 'b80794d7-db6d-45ef-b3a7-42aa664f6573', NULL);
INSERT INTO public.sessions VALUES (10, 20, '6e59327b-9760-4936-8fcc-134f73fc48b3', NULL);
INSERT INTO public.sessions VALUES (11, 21, '627966a4-20f1-4f4f-8e36-9cea88392f98', NULL);
INSERT INTO public.sessions VALUES (12, 1, '224181aa-d7d2-44d3-b13f-07ac11271b63', NULL);
INSERT INTO public.sessions VALUES (13, 1, '97e3e6d9-32a4-4d90-9499-d0e0bb78977a', NULL);
INSERT INTO public.sessions VALUES (14, 26, '91d95d67-241d-4dcb-a40e-441f9301fb2e', NULL);
INSERT INTO public.sessions VALUES (15, 27, '729d0ab2-1f41-40f0-bf9b-276240c880c1', NULL);
INSERT INTO public.sessions VALUES (16, 1, 'ba05f136-d949-429b-9323-470558305ed5', NULL);
INSERT INTO public.sessions VALUES (17, 1, 'e924fc2c-b0e1-492c-beb9-4fd35ce57b00', NULL);
INSERT INTO public.sessions VALUES (18, 31, '677a0308-d37f-4217-b956-dda2df7a501b', NULL);
INSERT INTO public.sessions VALUES (19, 1, '18440db6-c963-4e82-bedb-64da0834b800', NULL);
INSERT INTO public.sessions VALUES (20, 1, '2e1c4c0a-143c-400c-aed5-56337bb3fdd3', NULL);
INSERT INTO public.sessions VALUES (21, 36, 'ed0a7e04-f1d3-4372-8f29-8270b9154cd8', NULL);
INSERT INTO public.sessions VALUES (22, 1, '566fc762-e8bb-47f3-ab87-54ea0b4d1572', NULL);
INSERT INTO public.sessions VALUES (23, 1, 'e746a4bd-6e37-47e3-805e-ab49c748b39a', NULL);
INSERT INTO public.sessions VALUES (24, 41, 'd272bd39-6118-48b3-b400-46fb942e47ca', NULL);
INSERT INTO public.sessions VALUES (25, 1, '42474407-34a2-47f1-8365-64ddee254f31', NULL);
INSERT INTO public.sessions VALUES (26, 1, '8e9a7bd6-5ef9-4c3a-bd5c-f6d78fbe6214', NULL);
INSERT INTO public.sessions VALUES (27, 46, 'dcc5f912-a900-46b1-afab-e452344ac489', NULL);
INSERT INTO public.sessions VALUES (28, 1, 'b9347ae2-fe3d-445b-b82e-f647065f3144', NULL);
INSERT INTO public.sessions VALUES (29, 1, '04639a92-5ed5-42f0-8e33-88a6dc33a22a', NULL);
INSERT INTO public.sessions VALUES (30, 51, 'd1611924-a4bc-413b-bc44-668bd94789a6', NULL);
INSERT INTO public.sessions VALUES (31, 1, '2e883afb-ad85-4ee8-99d8-55eeb410c664', NULL);
INSERT INTO public.sessions VALUES (32, 1, '838faaf5-ae23-4c16-ac99-835bb5ee17f5', NULL);
INSERT INTO public.sessions VALUES (33, 56, 'e48d445e-1373-468b-a424-77189afa59d0', NULL);
INSERT INTO public.sessions VALUES (34, 1, 'e61decc7-9bb3-4c1a-a479-668bd20a901b', NULL);
INSERT INTO public.sessions VALUES (35, 1, '5a44e483-b54c-4bc7-ae15-12b67b2eb7db', NULL);
INSERT INTO public.sessions VALUES (36, 61, '2de85398-d402-42c5-9089-11ce99e41e4d', NULL);
INSERT INTO public.sessions VALUES (37, 1, '343f0d1f-12d8-4efb-a2dc-5f066034283e', NULL);
INSERT INTO public.sessions VALUES (38, 1, '5c1912e7-6a63-4bac-87a8-883036f632e8', NULL);
INSERT INTO public.sessions VALUES (39, 66, 'cbbade0b-1c79-4bbe-af74-382b2b9b2a84', NULL);
INSERT INTO public.sessions VALUES (40, 1, 'c10bb64b-9c91-4f99-a61c-395ee23630ed', NULL);
INSERT INTO public.sessions VALUES (41, 1, 'dc59e8b4-a74b-4773-a0fe-290d81c08251', NULL);
INSERT INTO public.sessions VALUES (42, 71, '102e65aa-201d-4df0-989a-dd99f77a163d', NULL);
INSERT INTO public.sessions VALUES (43, 1, '54ae4995-edd5-4690-98a0-43590fa384e4', NULL);
INSERT INTO public.sessions VALUES (44, 1, '8b8daeed-4779-4d63-b5f4-a5e05deb1bf9', NULL);
INSERT INTO public.sessions VALUES (45, 76, '5dcfd9b1-c8b2-4047-807b-d9d896dd5503', NULL);
INSERT INTO public.sessions VALUES (46, 1, '4a74c360-7bd3-4e65-ab4f-c9ad9f8ca903', NULL);
INSERT INTO public.sessions VALUES (47, 1, '1e52b0e4-8b3a-411a-9ef8-b2a37793cd59', NULL);
INSERT INTO public.sessions VALUES (48, 81, '4ac46b57-825a-4ccb-8876-1f582a0dd775', NULL);
INSERT INTO public.sessions VALUES (49, 1, '28f23d05-2dbd-4d0d-82a5-d2fc83599318', NULL);
INSERT INTO public.sessions VALUES (50, 1, 'e15dee46-0706-45c5-acbb-eac5b8addd0b', NULL);
INSERT INTO public.sessions VALUES (51, 86, '5b606ee5-ba82-4b12-a76d-cbae968036a4', NULL);
INSERT INTO public.sessions VALUES (52, 91, '99304ecb-90c6-4bea-9c6a-c97fb3bf5de1', NULL);
INSERT INTO public.sessions VALUES (53, 1, 'a2c6c93f-ad6e-4b35-a8ec-8684549bd0a8', NULL);
INSERT INTO public.sessions VALUES (54, 1, '6f3ab286-ab23-4acf-a50a-4bff6905a9c0', NULL);
INSERT INTO public.sessions VALUES (55, 1, '7b858b6d-d8c6-441b-b20f-1d5c45dc373e', NULL);
INSERT INTO public.sessions VALUES (56, 1, 'ec8b4baf-b134-462e-99b5-d6be54ce8195', NULL);
INSERT INTO public.sessions VALUES (57, 1, 'a46c8f58-9f10-43ad-a477-9dc82703edef', NULL);
INSERT INTO public.sessions VALUES (58, 96, '5f616665-62d7-44e2-8122-011f4a7d024d', NULL);
INSERT INTO public.sessions VALUES (59, 1, 'b9127693-4379-4eff-9ab8-72b7285cc5ed', NULL);
INSERT INTO public.sessions VALUES (60, 1, '5ef6273a-c5a3-4f67-939d-9824be893f39', NULL);
INSERT INTO public.sessions VALUES (61, 1, 'ace8e690-4f67-409f-82d7-2d9624502121', NULL);
INSERT INTO public.sessions VALUES (62, 101, '4f2a0f90-2f2a-44d5-93d4-57630cef3ca6', NULL);
INSERT INTO public.sessions VALUES (63, 1, '6f25a45d-f1b1-4c9e-9ba8-f363f6fb853a', NULL);
INSERT INTO public.sessions VALUES (64, 1, 'b1118f44-a278-4ce9-8019-a782db14ddf1', NULL);
INSERT INTO public.sessions VALUES (65, 1, '58a8cab4-00a2-4bcc-ab52-63563fb5a384', NULL);
INSERT INTO public.sessions VALUES (66, 106, '5207b1ed-a9bd-44f3-b707-b79a0a3f18db', NULL);
INSERT INTO public.sessions VALUES (67, 1, 'a8058dda-5e53-4d78-a940-5851ad7ac68e', NULL);
INSERT INTO public.sessions VALUES (68, 1, '61edc33d-dc00-450e-a63c-baa6affd21f9', NULL);
INSERT INTO public.sessions VALUES (69, 1, '7169352e-358a-4a74-ae74-a1f3b18ca141', NULL);
INSERT INTO public.sessions VALUES (70, 111, '04111d60-9947-490c-bbcd-913af59e4593', NULL);
INSERT INTO public.sessions VALUES (71, 1, '01d9dd25-c671-4968-8ac2-5dd795a13947', NULL);
INSERT INTO public.sessions VALUES (72, 1, '51bcbee8-0095-4753-b62c-eca08e493433', NULL);
INSERT INTO public.sessions VALUES (73, 1, '018ba6c3-87d3-429c-9e0d-5f64034ae149', NULL);
INSERT INTO public.sessions VALUES (74, 116, '8ed17daf-ac2b-47c7-b3a1-9d7e2b311eec', NULL);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (117, 'email@email.com', '$2b$12$Z8v2CjFzHzGB.z5oM/7i5u9RQU2M/oGYsj7W3f.8l9kmzPietIMOu');


--
-- Data for Name: users_pokemons_pokemons; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 1, true);


--
-- Name: pokemons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.pokemons_id_seq', 151, true);


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 74, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 117, true);


--
-- Name: sessions PK_3238ef96f18b355b671619111bc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "PK_3238ef96f18b355b671619111bc" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: pokemons PK_a3172290413af616d9cfa1fdc9a; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.pokemons
    ADD CONSTRAINT "PK_a3172290413af616d9cfa1fdc9a" PRIMARY KEY (id);


--
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- Name: users_pokemons_pokemons PK_f4bc246eaef14b3a2af7f2d16b3; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_pokemons_pokemons
    ADD CONSTRAINT "PK_f4bc246eaef14b3a2af7f2d16b3" PRIMARY KEY ("usersId", "pokemonsId");


--
-- Name: IDX_186672f1f8a7bc81e034438415; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_186672f1f8a7bc81e034438415" ON public.users_pokemons_pokemons USING btree ("pokemonsId");


--
-- Name: IDX_347130834a95292bc92f95eda1; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_347130834a95292bc92f95eda1" ON public.users_pokemons_pokemons USING btree ("usersId");


--
-- Name: users_pokemons_pokemons FK_186672f1f8a7bc81e034438415d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_pokemons_pokemons
    ADD CONSTRAINT "FK_186672f1f8a7bc81e034438415d" FOREIGN KEY ("pokemonsId") REFERENCES public.pokemons(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: users_pokemons_pokemons FK_347130834a95292bc92f95eda15; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users_pokemons_pokemons
    ADD CONSTRAINT "FK_347130834a95292bc92f95eda15" FOREIGN KEY ("usersId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: sessions FK_57de40bc620f456c7311aa3a1e6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "FK_57de40bc620f456c7311aa3a1e6" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

