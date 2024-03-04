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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    galaxy_name character varying(60) NOT NULL,
    notable_feature text,
    age_in_billions_of_years numeric(3,1),
    diameter_in_light_years integer,
    galaxy_type_id integer NOT NULL
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    galaxy_type_name character varying(30) NOT NULL,
    name_abbrevation character varying(3) NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    moon_name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    discovery_year integer,
    age_in_billions_of_years numeric(2,1)
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
    planet_name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    has_moon boolean,
    habitable boolean
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
    star_name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature_in_celsius integer,
    latin_name text
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'The Whirlpool Galaxy is a classic example of a grand-design spiral galaxy and is famous for its prominent spiral arms and active star formation', NULL, 60000, 6);
INSERT INTO public.galaxy VALUES (8, ' Caldwell 53', NULL, 8.0, 90000, 9);
INSERT INTO public.galaxy VALUES (7, 'Southern Pinwheel Galaxy', NULL, 12.0, 60000, 8);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'M87 is famous for its enormous black hole, which was imaged for the first time in 2019 by the Event Horizon Telescope', 10.0, 120000, 6);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda is on a collision course with the Milky Way and is expected to merge with it in about 4 billion years', 12.0, 220000, 6);
INSERT INTO public.galaxy VALUES (9, ' Large Magellanic Cloud', NULL, NULL, 14000, 10);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'The Sombrero Galaxy has an unusually large central bulge and is classified as an unbarred spiral galaxy', 11.0, NULL, 9);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'The Triangulum Galaxy is known for its extensive H II regions, where active star formation is taking place', 14.0, 60000, 6);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The Milky Way is known for its spiral arms, central bulge, and massive supermassive black hole at its center', 13.6, 100000, 6);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (6, 'Elliptical Galaxies', 'E');
INSERT INTO public.galaxy_type VALUES (7, 'Spiral Galaxies', 'S');
INSERT INTO public.galaxy_type VALUES (8, 'Barred Spiral Galaxies', 'SB');
INSERT INTO public.galaxy_type VALUES (9, 'Lenticular Galaxies', 'SO');
INSERT INTO public.galaxy_type VALUES (10, 'Irregular Galaxies', 'Irr');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, NULL, 4.5);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1877, 4.3);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 1877, 4.3);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, 1610, 4.6);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, 1610, 4.6);
INSERT INTO public.moon VALUES (6, 'Io', 5, 1610, 4.6);
INSERT INTO public.moon VALUES (7, 'Europa', 5, 1610, 4.6);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 1655, 4.5);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1672, 4.5);
INSERT INTO public.moon VALUES (10, 'Iapetus', 6, 1671, 4.5);
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1684, 4.5);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 1684, 4.5);
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 1789, 4.5);
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 1789, 4.5);
INSERT INTO public.moon VALUES (15, 'Miranda', 7, 1948, 4.5);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 1787, 4.5);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 1787, 4.5);
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 1851, 4.5);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 1851, 4.5);
INSERT INTO public.moon VALUES (20, 'Charon', 13, 1978, 4.6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, false, false);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, true, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, true, false);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 7, NULL, false);
INSERT INTO public.planet VALUES (10, 'Kepler-442b', 8, NULL, true);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 9, NULL, false);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 10, NULL, false);
INSERT INTO public.planet VALUES (13, 'Pluto', 1, true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 5500, 'Sol');
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9666, 'Alpha Canis Majoris');
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 1, 5556, 'Rigil Kentaurus');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 3326, 'Alpha Orionis');
INSERT INTO public.star VALUES (5, 'Vega', 1, 9876, 'Alpha Lyrae');
INSERT INTO public.star VALUES (6, 'Arcturus', 1, 4016, 'Alpha Boötis');
INSERT INTO public.star VALUES (7, 'Proxima Centauri', 1, 2769, NULL);
INSERT INTO public.star VALUES (8, 'Kepler-442', 1, 4726, NULL);
INSERT INTO public.star VALUES (9, 'TRAPPIST-1', 1, NULL, NULL);
INSERT INTO public.star VALUES (10, 'Gliese 581', 1, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (galaxy_name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_galaxy_type_name_key UNIQUE (galaxy_type_name);


--
-- Name: galaxy_type galaxy_type_name_abbrevation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_abbrevation_key UNIQUE (name_abbrevation);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_name_key UNIQUE (moon_name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_name_key UNIQUE (planet_name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_name_key UNIQUE (star_name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy fk_galaxy_type_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_type_id FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon fk_moon_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

