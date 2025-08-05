--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3 (Debian 16.3-1.pgdg120+1)

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
-- Name: aircraft_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.aircraft_data (
    id integer NOT NULL,
    hex character varying,
    flight character varying,
    first_seen timestamp with time zone,
    first_seen_epoch bigint,
    last_seen timestamp with time zone,
    last_seen_epoch bigint,
    type character varying,
    r character varying,
    t character varying,
    alt_baro integer,
    alt_geom integer,
    gs numeric(6,1),
    ias integer,
    tas integer,
    mach numeric(5,3),
    track numeric(5,2),
    track_rate numeric(5,2),
    roll numeric(5,2),
    mag_heading numeric(5,2),
    true_heading numeric(5,2),
    baro_rate integer,
    geom_rate integer,
    squawk character varying,
    emergency character varying,
    nav_qnh numeric(7,1),
    nav_altitude_mcp integer,
    nav_heading numeric(5,2),
    nav_modes text[],
    lat numeric(9,6),
    lon numeric(9,6),
    nic integer,
    rc integer,
    seen_pos numeric(9,3),
    r_dst numeric(8,3),
    r_dir numeric(8,3),
    version integer,
    nic_baro integer,
    nac_p integer,
    nac_v integer,
    sil integer,
    sil_type character varying,
    gva integer,
    sda integer,
    alert integer,
    spi integer,
    mlat text[],
    tisb text[],
    messages integer,
    seen numeric(8,3),
    rssi numeric(6,1),
    highest_aircraft_processed boolean DEFAULT false,
    lowest_aircraft_processed boolean DEFAULT false,
    fastest_aircraft_processed boolean DEFAULT false,
    slowest_aircraft_processed boolean DEFAULT false,
    db_flags integer,
    route_processed boolean DEFAULT false,
    registration_processed boolean DEFAULT false,
    interesting_processed boolean DEFAULT false,
    last_seen_lat numeric(9,6),
    last_seen_lon numeric(9,6),
    last_seen_distance numeric(6,2),
    last_seen_bearing numeric(6,3),
    destination_distance numeric(8,2)
);


--
-- Name: aircraft_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.aircraft_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aircraft_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.aircraft_data_id_seq OWNED BY public.aircraft_data.id;


--
-- Name: registration_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.registration_data (
    id integer NOT NULL,
    type character varying,
    icao_type character varying,
    manufacturer character varying,
    mode_s character varying,
    registration character varying,
    registered_owner_country_iso_name character varying,
    registered_owner_country_name character varying,
    registered_owner_operator_flag_code character varying,
    registered_owner character varying,
    url_photo character varying,
    url_photo_thumbnail character varying
);


--
-- Name: aircraft_registration_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.aircraft_registration_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: aircraft_registration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.aircraft_registration_id_seq OWNED BY public.registration_data.id;


--
-- Name: fastest_aircraft; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.fastest_aircraft (
    id integer NOT NULL,
    hex character varying,
    flight character varying,
    registration character varying,
    type character varying,
    first_seen timestamp with time zone,
    last_seen timestamp with time zone,
    ground_speed numeric(6,1),
    indicated_air_speed integer,
    true_air_speed integer
);


--
-- Name: fastest_aircraft_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.fastest_aircraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fastest_aircraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.fastest_aircraft_id_seq OWNED BY public.fastest_aircraft.id;


--
-- Name: route_data; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.route_data (
    id integer NOT NULL,
    route_callsign character varying,
    route_callsign_icao character varying,
    route_callsign_iata character varying,
    airline_name character varying,
    airline_icao character varying,
    airline_iata character varying,
    airline_country character varying,
    airline_country_iso character varying,
    airline_callsign character varying,
    origin_country_iso_name character varying,
    origin_country_name character varying,
    origin_elevation integer,
    origin_iata_code character varying,
    origin_icao_code character varying,
    origin_latitude numeric(9,6),
    origin_longitude numeric(9,6),
    origin_municipality character varying,
    origin_name character varying,
    destination_country_iso_name character varying,
    destination_country_name character varying,
    destination_elevation integer,
    destination_iata_code character varying,
    destination_icao_code character varying,
    destination_latitude numeric(9,6),
    destination_longitude numeric(9,6),
    destination_municipality character varying,
    destination_name character varying,
    last_updated timestamp without time zone,
    route_distance numeric(8,2)
);


--
-- Name: flight_route_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.flight_route_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flight_route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.flight_route_id_seq OWNED BY public.route_data.id;


--
-- Name: highest_aircraft; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.highest_aircraft (
    id integer NOT NULL,
    hex character varying,
    flight character varying,
    registration character varying,
    type character varying,
    first_seen timestamp with time zone,
    last_seen timestamp with time zone,
    barometric_altitude integer,
    geometric_altitude integer
);


--
-- Name: highest_aircraft_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.highest_aircraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: highest_aircraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.highest_aircraft_id_seq OWNED BY public.highest_aircraft.id;


--
-- Name: interesting_aircraft; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interesting_aircraft (
    icao text,
    registration text,
    operator text,
    type text,
    icao_type text,
    "group" text,
    tag1 text,
    tag2 text,
    tag3 text,
    category text,
    link text,
    image_link_1 text,
    image_link_2 text,
    image_link_3 text,
    image_link_4 text
);


--
-- Name: interesting_aircraft_seen; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.interesting_aircraft_seen (
    icao text,
    registration text,
    operator text,
    type text,
    icao_type text,
    "group" text,
    tag1 text,
    tag2 text,
    tag3 text,
    category text,
    link text,
    image_link_1 text,
    image_link_2 text,
    image_link_3 text,
    image_link_4 text,
    hex text,
    flight text,
    seen timestamp with time zone,
    seen_epoch bigint,
    r text,
    t text,
    alt_baro integer,
    alt_geom integer,
    gs numeric(6,1),
    ias integer,
    tas integer,
    track numeric(5,2),
    baro_rate integer,
    squawk text,
    emergency text,
    lat numeric(9,6),
    lon numeric(9,6),
    alert integer,
    db_flags integer
);


--
-- Name: lowest_aircraft; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lowest_aircraft (
    id integer NOT NULL,
    hex character varying,
    flight character varying,
    registration character varying,
    type character varying,
    first_seen timestamp with time zone,
    last_seen timestamp with time zone,
    barometric_altitude integer,
    geometric_altitude integer
);


--
-- Name: lowest_aircraft_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lowest_aircraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lowest_aircraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lowest_aircraft_id_seq OWNED BY public.lowest_aircraft.id;


--
-- Name: slowest_aircraft; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.slowest_aircraft (
    id integer NOT NULL,
    hex character varying,
    flight character varying,
    registration character varying,
    type character varying,
    first_seen timestamp with time zone,
    last_seen timestamp with time zone,
    ground_speed numeric(6,1),
    indicated_air_speed integer,
    true_air_speed integer
);


--
-- Name: slowest_aircraft_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.slowest_aircraft_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: slowest_aircraft_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.slowest_aircraft_id_seq OWNED BY public.slowest_aircraft.id;


--
-- Name: test; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.test AS
 SELECT id,
    r,
    hex,
    flight,
    first_seen,
    last_seen,
    alt_baro
   FROM public.aircraft_data
  ORDER BY last_seen DESC;


--
-- Name: aircraft_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aircraft_data ALTER COLUMN id SET DEFAULT nextval('public.aircraft_data_id_seq'::regclass);


--
-- Name: fastest_aircraft id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fastest_aircraft ALTER COLUMN id SET DEFAULT nextval('public.fastest_aircraft_id_seq'::regclass);


--
-- Name: highest_aircraft id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.highest_aircraft ALTER COLUMN id SET DEFAULT nextval('public.highest_aircraft_id_seq'::regclass);


--
-- Name: lowest_aircraft id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lowest_aircraft ALTER COLUMN id SET DEFAULT nextval('public.lowest_aircraft_id_seq'::regclass);


--
-- Name: registration_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_data ALTER COLUMN id SET DEFAULT nextval('public.aircraft_registration_id_seq'::regclass);


--
-- Name: route_data id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.route_data ALTER COLUMN id SET DEFAULT nextval('public.flight_route_id_seq'::regclass);


--
-- Name: slowest_aircraft id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slowest_aircraft ALTER COLUMN id SET DEFAULT nextval('public.slowest_aircraft_id_seq'::regclass);


--
-- Name: aircraft_data aircraft_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.aircraft_data
    ADD CONSTRAINT aircraft_data_pkey PRIMARY KEY (id);


--
-- Name: fastest_aircraft fastest_aircraft_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fastest_aircraft
    ADD CONSTRAINT fastest_aircraft_pkey PRIMARY KEY (id);


--
-- Name: fastest_aircraft fastest_aircraft_unique_hex_first_seen; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.fastest_aircraft
    ADD CONSTRAINT fastest_aircraft_unique_hex_first_seen UNIQUE (hex, first_seen);


--
-- Name: highest_aircraft highest_aircraft_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.highest_aircraft
    ADD CONSTRAINT highest_aircraft_pkey PRIMARY KEY (id);


--
-- Name: highest_aircraft highest_aircraft_unique_hex_first_seen; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.highest_aircraft
    ADD CONSTRAINT highest_aircraft_unique_hex_first_seen UNIQUE (hex, first_seen);


--
-- Name: lowest_aircraft lowest_aircraft_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lowest_aircraft
    ADD CONSTRAINT lowest_aircraft_pkey PRIMARY KEY (id);


--
-- Name: lowest_aircraft lowest_aircraft_unique_hex_first_seen; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lowest_aircraft
    ADD CONSTRAINT lowest_aircraft_unique_hex_first_seen UNIQUE (hex, first_seen);


--
-- Name: registration_data mode_s_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.registration_data
    ADD CONSTRAINT mode_s_unique UNIQUE (mode_s);


--
-- Name: route_data route_callsign_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.route_data
    ADD CONSTRAINT route_callsign_unique UNIQUE (route_callsign);


--
-- Name: slowest_aircraft slowest_aircraft_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slowest_aircraft
    ADD CONSTRAINT slowest_aircraft_pkey PRIMARY KEY (id);


--
-- Name: slowest_aircraft slowest_aircraft_unique_hex_first_seen; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.slowest_aircraft
    ADD CONSTRAINT slowest_aircraft_unique_hex_first_seen UNIQUE (hex, first_seen);


--
-- Name: aircraft_data_hex; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX aircraft_data_hex ON public.aircraft_data USING btree (hex) WITH (deduplicate_items='true');


--
-- Name: idx_aircraft_data_hex; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aircraft_data_hex ON public.aircraft_data USING btree (hex);


--
-- Name: idx_aircraft_data_hex_last_seen; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_aircraft_data_hex_last_seen ON public.aircraft_data USING btree (hex, last_seen DESC);


--
-- PostgreSQL database dump complete
--

