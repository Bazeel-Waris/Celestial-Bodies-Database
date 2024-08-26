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
-- Name: astronomical_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomical_event (
    astronomical_event_id integer NOT NULL,
    name character varying(255) NOT NULL,
    event_name character varying(255) NOT NULL,
    event_description text,
    event_date date NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.astronomical_event OWNER TO freecodecamp;

--
-- Name: astronomical_event_astronomical_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomical_event_astronomical_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomical_event_astronomical_event_id_seq OWNER TO freecodecamp;

--
-- Name: astronomical_event_astronomical_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomical_event_astronomical_event_id_seq OWNED BY public.astronomical_event.astronomical_event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth numeric(10,2)
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
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    planet_id integer
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
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    star_id integer NOT NULL
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
    name character varying(40) NOT NULL,
    description text NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_start_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_start_id_seq OWNER TO freecodecamp;

--
-- Name: star_start_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_start_id_seq OWNED BY public.star.star_id;


--
-- Name: astronomical_event astronomical_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event ALTER COLUMN astronomical_event_id SET DEFAULT nextval('public.astronomical_event_astronomical_event_id_seq'::regclass);


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_start_id_seq'::regclass);


--
-- Data for Name: astronomical_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomical_event VALUES (1, 'Supernova Explosion Event', 'Supernova Explosion', 'A massive explosion of a star, resulting in a supernova.', '2024-03-15', 1, 2, NULL, NULL);
INSERT INTO public.astronomical_event VALUES (2, 'Titan Eclipse Event', 'Eclipse of Titan', 'A total eclipse observed on Saturn’s moon Titan.', '2024-05-22', 1, 5, 3, NULL);
INSERT INTO public.astronomical_event VALUES (3, 'Galactic Collision Event', 'Galactic Collision', 'An event where two galaxies collide and interact.', '2024-07-10', 2, NULL, NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy with billions of stars', true, true, 13600, 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to the Milky Way', false, true, 10000, 2537.00);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'A classic spiral galaxy, face-on view', false, true, 500, 23000.00);
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'A galaxy with a bright nucleus and a large central bulge', false, true, 13000, 29000.00);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'A small spiral galaxy that is part of the Local Group', false, true, 10000, 3000.00);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'A face-on spiral galaxy, one of the largest known galaxies', false, true, 14000, 21000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Earth only natural satellite, known for influencing tides', false, true, 4500, 0, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'One of the two moons of Mars, irregular in shape', false, false, 4600, 1, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 'The smaller of Mars two moons, also irregular in shape', false, false, 4600, 2, 2);
INSERT INTO public.moon VALUES (4, 'Io', 'The most volcanically active moon in the Solar System, orbiting Jupiter', false, true, 4500, 628, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 'A moon of Jupiter with a possible subsurface ocean', false, true, 4500, 628, 2);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'The largest moon in the Solar System, orbiting Jupiter', false, true, 4500, 628, 2);
INSERT INTO public.moon VALUES (7, 'Callisto', 'A heavily cratered moon of Jupiter', false, true, 4500, 628, 2);
INSERT INTO public.moon VALUES (8, 'Titan', 'The largest moon of Saturn, known for its thick atmosphere', false, true, 4500, 1270, 3);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'A moon of Saturn with geysers that shoot water ice', false, true, 4500, 1270, 3);
INSERT INTO public.moon VALUES (10, 'Rhea', 'The second largest moon of Saturn', false, true, 4500, 1270, 3);
INSERT INTO public.moon VALUES (11, 'Iapetus', 'A moon of Saturn with a striking two-tone coloration', false, true, 4500, 1270, 3);
INSERT INTO public.moon VALUES (12, 'Triton', 'The largest moon of Neptune, with a retrograde orbit', false, true, 4500, 4300, 5);
INSERT INTO public.moon VALUES (13, 'Proteus', 'A small moon of Neptune, irregular in shape', false, true, 4500, 4300, 5);
INSERT INTO public.moon VALUES (14, 'Nereid', 'A distant, eccentric moon of Neptune', false, true, 4500, 4300, 5);
INSERT INTO public.moon VALUES (15, 'Charon', 'The largest moon of Pluto, almost half its size', false, true, 4500, 5900, 6);
INSERT INTO public.moon VALUES (16, 'Hydra', 'A small moon of Pluto', false, true, 4500, 5900, 6);
INSERT INTO public.moon VALUES (17, 'Nix', 'A small moon of Pluto, named after the Greek goddess of night', false, true, 4500, 5900, 6);
INSERT INTO public.moon VALUES (18, 'Kepler-1625b I', 'An exomoon orbiting a gas giant in the Kepler-1625 system', false, true, 10000, 8000, 7);
INSERT INTO public.moon VALUES (19, 'Pandora', 'A small moon of Saturn with sharp edges', false, true, 4500, 1270, 3);
INSERT INTO public.moon VALUES (20, 'Miranda', 'A moon of Uranus with an unusual, patchwork appearance', false, true, 4500, 2600, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'The only planet known to support life', true, true, 4500, 0, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'The Red Planet, potential for future human colonization', false, true, 4600, 1, 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', 'An exoplanet orbiting Proxima Centauri', NULL, true, 4700, 4, 2);
INSERT INTO public.planet VALUES (4, 'Venus', 'The second planet from the Sun, known for its thick, toxic atmosphere', false, true, 4600, 0, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The largest planet in our Solar System, a gas giant', false, true, 4600, 0, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet from the Sun, famous for its ring system', false, true, 4600, 0, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet from the Sun, a gas giant with a unique tilt', false, true, 4600, 0, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth planet from the Sun, a gas giant with strong winds', false, true, 4600, 0, 1);
INSERT INTO public.planet VALUES (9, 'Proxima c', 'A second exoplanet orbiting Proxima Centauri, possibly habitable', false, true, 4700, 4, 2);
INSERT INTO public.planet VALUES (10, 'Proxima d', 'A third exoplanet in the Proxima Centauri system, a cold planet', false, true, 4700, 4, 2);
INSERT INTO public.planet VALUES (11, 'Barnards Star b', 'An exoplanet orbiting Barnards Star, one of the closest stars to Earth', false, true, 10000, 6, 3);
INSERT INTO public.planet VALUES (12, 'Barnards Star c', 'A second exoplanet in the Barnards Star system, a gas giant', false, true, 10000, 6, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The star at the center of our Solar System', true, true, 4600, 0, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'The closest known star to the Sun', false, true, 4700, 4, 2);
INSERT INTO public.star VALUES (3, 'Sirius', 'The brightest star in the night sky', false, true, 300, 8, 2);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'A red supergiant star in the constellation of Orion', false, true, 8500, 642, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 'A blue supergiant star, the brightest in the constellation of Orion', false, true, 8600, 860, 1);
INSERT INTO public.star VALUES (6, 'Vega', 'A bright star in the constellation of Lyra, one of the most luminous in the vicinity of Earth', false, true, 450, 25, 2);


--
-- Name: astronomical_event_astronomical_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomical_event_astronomical_event_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_start_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_start_id_seq', 6, true);


--
-- Name: astronomical_event astronomical_event_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_event_name_key UNIQUE (event_name);


--
-- Name: astronomical_event astronomical_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_name_key UNIQUE (name);


--
-- Name: astronomical_event astronomical_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_pkey PRIMARY KEY (astronomical_event_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


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
-- Name: planet plant_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT plant_name UNIQUE (name);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_id UNIQUE (galaxy_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: astronomical_event astronomical_event_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: astronomical_event astronomical_event_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: astronomical_event astronomical_event_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: astronomical_event astronomical_event_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomical_event
    ADD CONSTRAINT astronomical_event_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

