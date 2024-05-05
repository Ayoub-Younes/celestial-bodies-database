--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    year_of_discovery integer,
    mass_in_bkg numeric
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spiral boolean,
    size_in_kpc numeric NOT NULL,
    distance_from_earth_in_mly integer NOT NULL,
    year_of_discovery integer NOT NULL,
    type character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    planet_id integer NOT NULL,
    temperature_in_k integer,
    surface_in_sqkm integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    surface_in_sqkm integer,
    temperature_in_k integer,
    star_id integer,
    position_in_system integer,
    number_of_satelite integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_northern boolean,
    age_in_mly integer NOT NULL,
    distance_in_ly integer NOT NULL,
    visual_magnitute numeric,
    spectral_type character varying(30),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, '99942 Apophis', 'is a near-Earth asteroid', 3, 2004, 26.99);
INSERT INTO public.asteroid VALUES (2, '101955 Bennu', 'is a carbonaceous asteroid', 3, 1999, 78.0);
INSERT INTO public.asteroid VALUES (3, '1999 AN10', 'is a kilometer-length near-Earth asteroid', 3, 1999, 2900.0);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Antennae Galaxies', 'pair of interacting galaxies', false, 150.0, 65, 1785, 'SB(s)m pec');
INSERT INTO public.galaxy VALUES (2, 'Black Eye Galaxy', 'also called Sleeping Beauty Galaxy', true, 16.51, 17, 1779, '(R)SA(rs)ab');
INSERT INTO public.galaxy VALUES (3, 'Cartwheel Galaxy', 'a lenticular ring galaxy', false, 44.23, 500, 1941, 'S pec (Ring)');
INSERT INTO public.galaxy VALUES (4, 'Messier 82', 'a starburst galaxy', false, 12.52, 12, 1774, 'I0');
INSERT INTO public.galaxy VALUES (5, 'Circinus Galaxy', 'a Seyfert galaxy', false, 14.85, 13, 1977, 'SA(s)b');
INSERT INTO public.galaxy VALUES (6, 'Comet Galaxy', 'currently being ripped to pieces', true, 0.18, 3200, 2007, 'dIrr');
INSERT INTO public.galaxy VALUES (8, 'Milky Way', 'the galaxy that includes the Solar System', true, 26.8, 26, 1610, 'Sb; Sbc; SB(rs)bc');
INSERT INTO public.galaxy VALUES (9, 'Carina Nebula', 'a large, complex area of bright and dark nebulosity', false, 1.0, 1, 1752, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', ' Earth only natural satellite', 3, 250, 37930000);
INSERT INTO public.moon VALUES (2, 'Deimos', 'is the smaller moon of Mars', 4, 233, 522);
INSERT INTO public.moon VALUES (3, 'Phobos', 'is the larger moon of Mars', 4, 233, 1640);
INSERT INTO public.moon VALUES (4, 'Metis', 'also known as Jupiter XVI', 5, 123, 6200);
INSERT INTO public.moon VALUES (5, 'Adrastea', 'also known as Jupiter XV', 5, 122, 1200);
INSERT INTO public.moon VALUES (6, 'Amalthea', 'It has the third closest orbit around Jupiter', 5, 120, NULL);
INSERT INTO public.moon VALUES (7, 'Thebe', 'also known as Jupiter XIV', 5, 124, 45000);
INSERT INTO public.moon VALUES (8, 'Io', ' Slightly larger than Earth moon', 5, 110, 41698064);
INSERT INTO public.moon VALUES (9, 'Europa', ' also known as Jupiter II', 5, 102, 30900000);
INSERT INTO public.moon VALUES (10, 'Ganymede', ' also known as Jupiter III', 5, 110, 87200000);
INSERT INTO public.moon VALUES (11, 'Callisto', ' also known as Jupiter IV', 5, 134, 73000000);
INSERT INTO public.moon VALUES (12, 'Mimas', 'also designated Saturn I', 6, 64, 500000);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'is the sixth-largest moon of Saturn', 6, 75, NULL);
INSERT INTO public.moon VALUES (14, 'Tethys', 'is the fifth-largest moon of Saturn', 6, 86, NULL);
INSERT INTO public.moon VALUES (15, 'Dione', 'is the fourth-largest moon of Saturn', 6, 87, 3964776);
INSERT INTO public.moon VALUES (16, 'Rhea', 'is the second-largest moon of Saturn', 6, 75, 7337000);
INSERT INTO public.moon VALUES (17, 'Titan', 'is the largest moon of Saturn', 6, 94, 83000000);
INSERT INTO public.moon VALUES (18, 'Bianca', ' is an inner satellite of Uranus', 7, 64, 8400);
INSERT INTO public.moon VALUES (19, 'Cressida', ' is an inner satellite of Uranus', 7, 65, 20000);
INSERT INTO public.moon VALUES (20, 'Desdemona', ' is an inner satellite of Uranus', 7, 64, 13000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'the smallest in the Solar System', 74800000, 437, 1, 1, 0);
INSERT INTO public.planet VALUES (2, 'Venus', 'It is a terrestrial planet', 46023000, 232, 1, 2, 0);
INSERT INTO public.planet VALUES (3, 'Earth', 'It is a terrestrial planet', 510072000, 255, 1, 3, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The surface of Mars is orange-red', 144370000, 209, 1, 4, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'the largest in the Solar System', 614690000, 88, 1, 5, 95);
INSERT INTO public.planet VALUES (6, 'Saturn', 'the second-largest in the Solar System', 42700000, 134, 1, 6, 146);
INSERT INTO public.planet VALUES (7, 'Neptune', 'farthest known planet from the Sun', 761870000, 72, 1, 8, 16);
INSERT INTO public.planet VALUES (8, 'Tugn', 'Planetary Class: J', 21237160, NULL, 6, 1, 0);
INSERT INTO public.planet VALUES (9, 'Atugn', 'Planetary Class: K', 27898600, NULL, 6, 2, 0);
INSERT INTO public.planet VALUES (10, 'Volumn', 'Planetary Class: M', 564946610, NULL, 6, 3, 2);
INSERT INTO public.planet VALUES (11, 'Valosm', 'Planetary Class: M', 430052600, NULL, 6, 4, 2);
INSERT INTO public.planet VALUES (12, 'Uranus', 'It is a gaseous cyan-coloured ice giant', 811560000, 76, 1, 7, 28);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'the star at the center of the Solar System', NULL, 4600, 0, -26.74, 'G2 V', 8);
INSERT INTO public.star VALUES (2, 'Sirius', 'the brightest star in the night sky', false, 242, 9, -1.46, 'A0mA1 Va DA2', 8);
INSERT INTO public.star VALUES (4, 'Vega', 'The brightest star in the northern constellation of Lyra', true, 455, 25, 0.03, 'A0 Va', 8);
INSERT INTO public.star VALUES (5, 'Capella', 'The brightest star in the northern constellation of Auriga', true, 650, 43, 0.08, 'K0 III, G1 III', 8);
INSERT INTO public.star VALUES (6, 'Rigel', 'a blue supergiant star in the constellation of Orion', false, 8000, 860, 0.13, 'B8 Ia', 8);
INSERT INTO public.star VALUES (3, 'Canopus', 'the brightest star in the southern constellation of Carina', false, 25, 310, -0.74, 'A9 II', 9);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid asteroid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

