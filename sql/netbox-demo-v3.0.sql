--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.8 (Ubuntu 14.8-0ubuntu0.22.04.1)

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO netbox;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO netbox;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: circuits_circuit; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuit (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    cid character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    install_date date,
    commit_rate integer,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id bigint NOT NULL,
    tenant_id bigint,
    termination_a_id bigint,
    termination_z_id bigint,
    type_id bigint NOT NULL,
    CONSTRAINT circuits_circuit_commit_rate_check CHECK ((commit_rate >= 0))
);


ALTER TABLE public.circuits_circuit OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuit_id_seq OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuit_id_seq OWNED BY public.circuits_circuit.id;


--
-- Name: circuits_circuittermination; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittermination (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    term_side character varying(1) NOT NULL,
    port_speed integer,
    upstream_speed integer,
    xconnect_id character varying(50) NOT NULL,
    pp_info character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_type_id integer,
    cable_id bigint,
    circuit_id bigint NOT NULL,
    provider_network_id bigint,
    site_id bigint,
    CONSTRAINT circuits_circuittermination__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT circuits_circuittermination_port_speed_check CHECK ((port_speed >= 0)),
    CONSTRAINT circuits_circuittermination_upstream_speed_check CHECK ((upstream_speed >= 0))
);


ALTER TABLE public.circuits_circuittermination OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittermination_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittermination_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittermination_id_seq OWNED BY public.circuits_circuittermination.id;


--
-- Name: circuits_circuittype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittype (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.circuits_circuittype OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittype_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittype_id_seq OWNED BY public.circuits_circuittype.id;


--
-- Name: circuits_provider; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_provider (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    asn bigint,
    account character varying(30) NOT NULL,
    portal_url character varying(200) NOT NULL,
    noc_contact text NOT NULL,
    admin_contact text NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.circuits_provider OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_provider_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_provider_id_seq OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_provider_id_seq OWNED BY public.circuits_provider.id;


--
-- Name: circuits_providernetwork; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_providernetwork (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    provider_id bigint NOT NULL
);


ALTER TABLE public.circuits_providernetwork OWNER TO netbox;

--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_providernetwork_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_providernetwork_id_seq OWNER TO netbox;

--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_providernetwork_id_seq OWNED BY public.circuits_providernetwork.id;


--
-- Name: dcim_cable; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cable (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    termination_a_id integer NOT NULL,
    termination_b_id integer NOT NULL,
    type character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    label character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    length numeric(8,2),
    length_unit character varying(50) NOT NULL,
    _abs_length numeric(10,4),
    _termination_a_device_id bigint,
    _termination_b_device_id bigint,
    termination_a_type_id integer NOT NULL,
    termination_b_type_id integer NOT NULL,
    CONSTRAINT dcim_cable_termination_a_id_check CHECK ((termination_a_id >= 0)),
    CONSTRAINT dcim_cable_termination_b_id_check CHECK ((termination_b_id >= 0))
);


ALTER TABLE public.dcim_cable OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cable_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cable_id_seq OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cable_id_seq OWNED BY public.dcim_cable.id;


--
-- Name: dcim_cablepath; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cablepath (
    id bigint NOT NULL,
    origin_id integer NOT NULL,
    destination_id integer,
    path character varying(40)[] NOT NULL,
    is_active boolean NOT NULL,
    is_split boolean NOT NULL,
    destination_type_id integer,
    origin_type_id integer NOT NULL,
    CONSTRAINT dcim_cablepath_destination_id_check CHECK ((destination_id >= 0)),
    CONSTRAINT dcim_cablepath_origin_id_check CHECK ((origin_id >= 0))
);


ALTER TABLE public.dcim_cablepath OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cablepath_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cablepath_id_seq OWNER TO netbox;

--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cablepath_id_seq OWNED BY public.dcim_cablepath.id;


--
-- Name: dcim_consoleport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleport (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    speed integer,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    CONSTRAINT dcim_consoleport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_consoleport_speed_check CHECK ((speed >= 0))
);


ALTER TABLE public.dcim_consoleport OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleport_id_seq OWNED BY public.dcim_consoleport.id;


--
-- Name: dcim_consoleporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleporttemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_consoleporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleporttemplate_id_seq OWNED BY public.dcim_consoleporttemplate.id;


--
-- Name: dcim_consoleserverport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverport (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    speed integer,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    CONSTRAINT dcim_consoleserverport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_consoleserverport_speed_check CHECK ((speed >= 0))
);


ALTER TABLE public.dcim_consoleserverport OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverport_id_seq OWNED BY public.dcim_consoleserverport.id;


--
-- Name: dcim_consoleserverporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverporttemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_consoleserverporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverporttemplate_id_seq OWNED BY public.dcim_consoleserverporttemplate.id;


--
-- Name: dcim_device; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_device (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    name character varying(64),
    _name character varying(100),
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    "position" smallint,
    face character varying(50) NOT NULL,
    status character varying(50) NOT NULL,
    vc_position smallint,
    vc_priority smallint,
    comments text NOT NULL,
    cluster_id bigint,
    device_role_id bigint NOT NULL,
    device_type_id bigint NOT NULL,
    location_id bigint,
    platform_id bigint,
    primary_ip4_id bigint,
    primary_ip6_id bigint,
    rack_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    virtual_chassis_id bigint,
    CONSTRAINT dcim_device_position_check CHECK (("position" >= 0)),
    CONSTRAINT dcim_device_vc_position_check CHECK ((vc_position >= 0)),
    CONSTRAINT dcim_device_vc_priority_check CHECK ((vc_priority >= 0))
);


ALTER TABLE public.dcim_device OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_device_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_device_id_seq OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_device_id_seq OWNED BY public.dcim_device.id;


--
-- Name: dcim_devicebay; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebay (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint NOT NULL,
    installed_device_id bigint
);


ALTER TABLE public.dcim_devicebay OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebay_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebay_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebay_id_seq OWNED BY public.dcim_devicebay.id;


--
-- Name: dcim_devicebaytemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebaytemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_devicebaytemplate OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebaytemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebaytemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebaytemplate_id_seq OWNED BY public.dcim_devicebaytemplate.id;


--
-- Name: dcim_devicerole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicerole (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    vm_role boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_devicerole OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicerole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicerole_id_seq OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicerole_id_seq OWNED BY public.dcim_devicerole.id;


--
-- Name: dcim_devicetype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicetype (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    model character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    part_number character varying(50) NOT NULL,
    u_height smallint NOT NULL,
    is_full_depth boolean NOT NULL,
    subdevice_role character varying(50) NOT NULL,
    front_image character varying(100) NOT NULL,
    rear_image character varying(100) NOT NULL,
    comments text NOT NULL,
    manufacturer_id bigint NOT NULL,
    CONSTRAINT dcim_devicetype_u_height_check CHECK ((u_height >= 0))
);


ALTER TABLE public.dcim_devicetype OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicetype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicetype_id_seq OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicetype_id_seq OWNED BY public.dcim_devicetype.id;


--
-- Name: dcim_frontport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontport (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    _cable_peer_type_id integer,
    cable_id bigint,
    device_id bigint NOT NULL,
    rear_port_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    CONSTRAINT dcim_frontport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_frontport_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontport OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontport_id_seq OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontport_id_seq OWNED BY public.dcim_frontport.id;


--
-- Name: dcim_frontporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontporttemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    rear_port_position smallint NOT NULL,
    device_type_id bigint NOT NULL,
    rear_port_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    CONSTRAINT dcim_frontporttemplate_rear_port_position_check CHECK ((rear_port_position >= 0))
);


ALTER TABLE public.dcim_frontporttemplate OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontporttemplate_id_seq OWNED BY public.dcim_frontporttemplate.id;


--
-- Name: dcim_interface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    enabled boolean NOT NULL,
    mac_address macaddr,
    mtu integer,
    mode character varying(50) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    lag_id bigint,
    parent_id bigint,
    untagged_vlan_id bigint,
    CONSTRAINT dcim_interface__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_interface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.dcim_interface OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_id_seq OWNED BY public.dcim_interface.id;


--
-- Name: dcim_interface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_tagged_vlans (
    id integer NOT NULL,
    interface_id bigint NOT NULL,
    vlan_id bigint NOT NULL
);


ALTER TABLE public.dcim_interface_tagged_vlans OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_tagged_vlans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_tagged_vlans_id_seq OWNED BY public.dcim_interface_tagged_vlans.id;


--
-- Name: dcim_interfacetemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interfacetemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    mgmt_only boolean NOT NULL,
    device_type_id bigint NOT NULL
);


ALTER TABLE public.dcim_interfacetemplate OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interfacetemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interfacetemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interfacetemplate_id_seq OWNED BY public.dcim_interfacetemplate.id;


--
-- Name: dcim_inventoryitem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitem (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    part_id character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    discovered boolean NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    device_id bigint NOT NULL,
    manufacturer_id bigint,
    parent_id bigint,
    CONSTRAINT dcim_inventoryitem_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_inventoryitem_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_inventoryitem_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_inventoryitem_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_inventoryitem OWNER TO netbox;

--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_inventoryitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_inventoryitem_id_seq OWNER TO netbox;

--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_inventoryitem_id_seq OWNED BY public.dcim_inventoryitem.id;


--
-- Name: dcim_location; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_location (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    site_id bigint NOT NULL,
    CONSTRAINT dcim_location_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_location_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_location_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_location_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_location OWNER TO netbox;

--
-- Name: dcim_location_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_location_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_location_id_seq OWNER TO netbox;

--
-- Name: dcim_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_location_id_seq OWNED BY public.dcim_location.id;


--
-- Name: dcim_manufacturer; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_manufacturer (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_manufacturer OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_manufacturer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_manufacturer_id_seq OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_manufacturer_id_seq OWNED BY public.dcim_manufacturer.id;


--
-- Name: dcim_platform; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_platform (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    napalm_driver character varying(50) NOT NULL,
    napalm_args jsonb,
    description character varying(200) NOT NULL,
    manufacturer_id bigint
);


ALTER TABLE public.dcim_platform OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_platform_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_platform_id_seq OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_platform_id_seq OWNED BY public.dcim_platform.id;


--
-- Name: dcim_powerfeed; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerfeed (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    name character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    type character varying(50) NOT NULL,
    supply character varying(50) NOT NULL,
    phase character varying(50) NOT NULL,
    voltage smallint NOT NULL,
    amperage smallint NOT NULL,
    max_utilization smallint NOT NULL,
    available_power integer NOT NULL,
    comments text NOT NULL,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    power_panel_id bigint NOT NULL,
    rack_id bigint,
    CONSTRAINT dcim_powerfeed__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_powerfeed_amperage_check CHECK ((amperage >= 0)),
    CONSTRAINT dcim_powerfeed_available_power_check CHECK ((available_power >= 0)),
    CONSTRAINT dcim_powerfeed_max_utilization_check CHECK ((max_utilization >= 0))
);


ALTER TABLE public.dcim_powerfeed OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerfeed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerfeed_id_seq OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerfeed_id_seq OWNED BY public.dcim_powerfeed.id;


--
-- Name: dcim_poweroutlet; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlet (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    power_port_id bigint,
    CONSTRAINT dcim_poweroutlet__cable_peer_id_check CHECK ((_cable_peer_id >= 0))
);


ALTER TABLE public.dcim_poweroutlet OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlet_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlet_id_seq OWNED BY public.dcim_poweroutlet.id;


--
-- Name: dcim_poweroutlettemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlettemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    feed_leg character varying(50) NOT NULL,
    device_type_id bigint NOT NULL,
    power_port_id bigint
);


ALTER TABLE public.dcim_poweroutlettemplate OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlettemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlettemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlettemplate_id_seq OWNED BY public.dcim_poweroutlettemplate.id;


--
-- Name: dcim_powerpanel; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerpanel (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    location_id bigint,
    site_id bigint NOT NULL
);


ALTER TABLE public.dcim_powerpanel OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerpanel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerpanel_id_seq OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerpanel_id_seq OWNED BY public.dcim_powerpanel.id;


--
-- Name: dcim_powerport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerport (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    _cable_peer_type_id integer,
    _path_id bigint,
    cable_id bigint,
    device_id bigint NOT NULL,
    CONSTRAINT dcim_powerport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_powerport_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerport_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerport OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerport_id_seq OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerport_id_seq OWNED BY public.dcim_powerport.id;


--
-- Name: dcim_powerporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerporttemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    maximum_draw smallint,
    allocated_draw smallint,
    device_type_id bigint NOT NULL,
    CONSTRAINT dcim_powerporttemplate_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerporttemplate_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerporttemplate OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerporttemplate_id_seq OWNED BY public.dcim_powerporttemplate.id;


--
-- Name: dcim_rack; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rack (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    facility_id character varying(50),
    status character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    asset_tag character varying(50),
    type character varying(50) NOT NULL,
    width smallint NOT NULL,
    u_height smallint NOT NULL,
    desc_units boolean NOT NULL,
    outer_width smallint,
    outer_depth smallint,
    outer_unit character varying(50) NOT NULL,
    comments text NOT NULL,
    location_id bigint,
    role_id bigint,
    site_id bigint NOT NULL,
    tenant_id bigint,
    CONSTRAINT dcim_rack_outer_depth_check CHECK ((outer_depth >= 0)),
    CONSTRAINT dcim_rack_outer_width_check CHECK ((outer_width >= 0)),
    CONSTRAINT dcim_rack_u_height_check CHECK ((u_height >= 0)),
    CONSTRAINT dcim_rack_width_check CHECK ((width >= 0))
);


ALTER TABLE public.dcim_rack OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rack_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rack_id_seq OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rack_id_seq OWNED BY public.dcim_rack.id;


--
-- Name: dcim_rackreservation; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackreservation (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    units smallint[] NOT NULL,
    description character varying(200) NOT NULL,
    rack_id bigint NOT NULL,
    tenant_id bigint,
    user_id integer NOT NULL
);


ALTER TABLE public.dcim_rackreservation OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackreservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackreservation_id_seq OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackreservation_id_seq OWNED BY public.dcim_rackreservation.id;


--
-- Name: dcim_rackrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackrole (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.dcim_rackrole OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackrole_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackrole_id_seq OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackrole_id_seq OWNED BY public.dcim_rackrole.id;


--
-- Name: dcim_rearport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearport (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    _cable_peer_id integer,
    mark_connected boolean NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    _cable_peer_type_id integer,
    cable_id bigint,
    device_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    CONSTRAINT dcim_rearport__cable_peer_id_check CHECK ((_cable_peer_id >= 0)),
    CONSTRAINT dcim_rearport_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearport OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearport_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearport_id_seq OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearport_id_seq OWNED BY public.dcim_rearport.id;


--
-- Name: dcim_rearporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearporttemplate (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    label character varying(64) NOT NULL,
    description character varying(200) NOT NULL,
    type character varying(50) NOT NULL,
    positions smallint NOT NULL,
    device_type_id bigint NOT NULL,
    color character varying(6) NOT NULL,
    CONSTRAINT dcim_rearporttemplate_positions_check CHECK ((positions >= 0))
);


ALTER TABLE public.dcim_rearporttemplate OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearporttemplate_id_seq OWNED BY public.dcim_rearporttemplate.id;


--
-- Name: dcim_region; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_region (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT dcim_region_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_region_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_region_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_region_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_region OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_region_id_seq OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_region_id_seq OWNED BY public.dcim_region.id;


--
-- Name: dcim_site; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_site (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    _name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    status character varying(50) NOT NULL,
    facility character varying(50) NOT NULL,
    asn bigint,
    time_zone character varying(63) NOT NULL,
    description character varying(200) NOT NULL,
    physical_address character varying(200) NOT NULL,
    shipping_address character varying(200) NOT NULL,
    latitude numeric(8,6),
    longitude numeric(9,6),
    contact_name character varying(50) NOT NULL,
    contact_phone character varying(20) NOT NULL,
    contact_email character varying(254) NOT NULL,
    comments text NOT NULL,
    group_id bigint,
    region_id bigint,
    tenant_id bigint
);


ALTER TABLE public.dcim_site OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_site_id_seq OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_site_id_seq OWNED BY public.dcim_site.id;


--
-- Name: dcim_sitegroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_sitegroup (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT dcim_sitegroup_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_sitegroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_sitegroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_sitegroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_sitegroup OWNER TO netbox;

--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_sitegroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_sitegroup_id_seq OWNER TO netbox;

--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_sitegroup_id_seq OWNED BY public.dcim_sitegroup.id;


--
-- Name: dcim_virtualchassis; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_virtualchassis (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    domain character varying(30) NOT NULL,
    master_id bigint
);


ALTER TABLE public.dcim_virtualchassis OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_virtualchassis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_virtualchassis_id_seq OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_virtualchassis_id_seq OWNED BY public.dcim_virtualchassis.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO netbox;

--
-- Name: extras_configcontext; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext (
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    is_active boolean NOT NULL,
    data jsonb NOT NULL,
    CONSTRAINT extras_configcontext_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_configcontext OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_cluster_groups (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    clustergroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_cluster_groups OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_cluster_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_cluster_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_cluster_groups_id_seq OWNED BY public.extras_configcontext_cluster_groups.id;


--
-- Name: extras_configcontext_clusters; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_clusters (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    cluster_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_clusters OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_clusters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_clusters_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_clusters_id_seq OWNED BY public.extras_configcontext_clusters.id;


--
-- Name: extras_configcontext_device_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_device_types (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    devicetype_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_device_types OWNER TO netbox;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_device_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_device_types_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_device_types_id_seq OWNED BY public.extras_configcontext_device_types.id;


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_id_seq OWNED BY public.extras_configcontext.id;


--
-- Name: extras_configcontext_platforms; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_platforms (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    platform_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_platforms OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_platforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_platforms_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_platforms_id_seq OWNED BY public.extras_configcontext_platforms.id;


--
-- Name: extras_configcontext_regions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_regions (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    region_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_regions OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_regions_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_regions_id_seq OWNED BY public.extras_configcontext_regions.id;


--
-- Name: extras_configcontext_roles; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_roles (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    devicerole_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_roles OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_roles_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_roles_id_seq OWNED BY public.extras_configcontext_roles.id;


--
-- Name: extras_configcontext_site_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_site_groups (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    sitegroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_site_groups OWNER TO netbox;

--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_site_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_site_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_site_groups_id_seq OWNED BY public.extras_configcontext_site_groups.id;


--
-- Name: extras_configcontext_sites; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_sites (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    site_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_sites OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_sites_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_sites_id_seq OWNED BY public.extras_configcontext_sites.id;


--
-- Name: extras_configcontext_tags; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tags (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tags OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tags_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tags_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tags_id_seq OWNED BY public.extras_configcontext_tags.id;


--
-- Name: extras_configcontext_tenant_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenant_groups (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    tenantgroup_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tenant_groups OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenant_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenant_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenant_groups_id_seq OWNED BY public.extras_configcontext_tenant_groups.id;


--
-- Name: extras_configcontext_tenants; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenants (
    id integer NOT NULL,
    configcontext_id bigint NOT NULL,
    tenant_id bigint NOT NULL
);


ALTER TABLE public.extras_configcontext_tenants OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenants_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenants_id_seq OWNED BY public.extras_configcontext_tenants.id;


--
-- Name: extras_customfield; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield (
    id bigint NOT NULL,
    type character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    label character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    required boolean NOT NULL,
    filter_logic character varying(50) NOT NULL,
    "default" jsonb,
    weight smallint NOT NULL,
    validation_minimum integer,
    validation_maximum integer,
    validation_regex character varying(500) NOT NULL,
    choices character varying(100)[],
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT extras_customfield_validation_maximum_check CHECK ((validation_maximum >= 0)),
    CONSTRAINT extras_customfield_validation_minimum_check CHECK ((validation_minimum >= 0)),
    CONSTRAINT extras_customfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfield OWNER TO netbox;

--
-- Name: extras_customfield_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield_content_types (
    id integer NOT NULL,
    customfield_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_customfield_content_types OWNER TO netbox;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_content_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_content_types_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_content_types_id_seq OWNED BY public.extras_customfield_content_types.id;


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_id_seq OWNED BY public.extras_customfield.id;


--
-- Name: extras_customlink; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customlink (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    link_text character varying(500) NOT NULL,
    link_url character varying(500) NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(50) NOT NULL,
    button_class character varying(30) NOT NULL,
    new_window boolean NOT NULL,
    content_type_id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT extras_customlink_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customlink OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customlink_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customlink_id_seq OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customlink_id_seq OWNED BY public.extras_customlink.id;


--
-- Name: extras_exporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_exporttemplate (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    template_code text NOT NULL,
    mime_type character varying(50) NOT NULL,
    file_extension character varying(15) NOT NULL,
    as_attachment boolean NOT NULL,
    content_type_id integer NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.extras_exporttemplate OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_exporttemplate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_exporttemplate_id_seq OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_exporttemplate_id_seq OWNED BY public.extras_exporttemplate.id;


--
-- Name: extras_imageattachment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_imageattachment (
    id bigint NOT NULL,
    object_id integer NOT NULL,
    image character varying(100) NOT NULL,
    image_height smallint NOT NULL,
    image_width smallint NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT extras_imageattachment_image_height_check CHECK ((image_height >= 0)),
    CONSTRAINT extras_imageattachment_image_width_check CHECK ((image_width >= 0)),
    CONSTRAINT extras_imageattachment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.extras_imageattachment OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_imageattachment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_imageattachment_id_seq OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_imageattachment_id_seq OWNED BY public.extras_imageattachment.id;


--
-- Name: extras_jobresult; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_jobresult (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    completed timestamp with time zone,
    status character varying(30) NOT NULL,
    data jsonb,
    job_id uuid NOT NULL,
    obj_type_id integer NOT NULL,
    user_id integer
);


ALTER TABLE public.extras_jobresult OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_jobresult_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_jobresult_id_seq OWNER TO netbox;

--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_jobresult_id_seq OWNED BY public.extras_jobresult.id;


--
-- Name: extras_journalentry; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_journalentry (
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    assigned_object_id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    kind character varying(30) NOT NULL,
    comments text NOT NULL,
    assigned_object_type_id integer NOT NULL,
    created_by_id integer,
    CONSTRAINT extras_journalentry_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.extras_journalentry OWNER TO netbox;

--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_journalentry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_journalentry_id_seq OWNER TO netbox;

--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_journalentry_id_seq OWNED BY public.extras_journalentry.id;


--
-- Name: extras_objectchange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_objectchange (
    id bigint NOT NULL,
    "time" timestamp with time zone NOT NULL,
    user_name character varying(150) NOT NULL,
    request_id uuid NOT NULL,
    action character varying(50) NOT NULL,
    changed_object_id integer NOT NULL,
    related_object_id integer,
    object_repr character varying(200) NOT NULL,
    prechange_data jsonb,
    postchange_data jsonb,
    changed_object_type_id integer NOT NULL,
    related_object_type_id integer,
    user_id integer,
    CONSTRAINT extras_objectchange_changed_object_id_check CHECK ((changed_object_id >= 0)),
    CONSTRAINT extras_objectchange_related_object_id_check CHECK ((related_object_id >= 0))
);


ALTER TABLE public.extras_objectchange OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_objectchange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_objectchange_id_seq OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_objectchange_id_seq OWNED BY public.extras_objectchange.id;


--
-- Name: extras_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_tag (
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    created date,
    last_updated timestamp with time zone,
    id bigint NOT NULL,
    color character varying(6) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_tag OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_tag_id_seq OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_tag_id_seq OWNED BY public.extras_tag.id;


--
-- Name: extras_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_taggeditem (
    object_id integer NOT NULL,
    id bigint NOT NULL,
    content_type_id integer NOT NULL,
    tag_id bigint NOT NULL
);


ALTER TABLE public.extras_taggeditem OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_taggeditem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_taggeditem_id_seq OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_taggeditem_id_seq OWNED BY public.extras_taggeditem.id;


--
-- Name: extras_webhook; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook (
    id bigint NOT NULL,
    name character varying(150) NOT NULL,
    type_create boolean NOT NULL,
    type_update boolean NOT NULL,
    type_delete boolean NOT NULL,
    payload_url character varying(500) NOT NULL,
    enabled boolean NOT NULL,
    http_method character varying(30) NOT NULL,
    http_content_type character varying(100) NOT NULL,
    additional_headers text NOT NULL,
    body_template text NOT NULL,
    secret character varying(255) NOT NULL,
    ssl_verification boolean NOT NULL,
    ca_file_path character varying(4096),
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.extras_webhook OWNER TO netbox;

--
-- Name: extras_webhook_content_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook_content_types (
    id integer NOT NULL,
    webhook_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_webhook_content_types OWNER TO netbox;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_content_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_content_types_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_content_types_id_seq OWNED BY public.extras_webhook_content_types.id;


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_id_seq OWNED BY public.extras_webhook.id;


--
-- Name: ipam_aggregate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_aggregate (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    prefix cidr NOT NULL,
    date_added date,
    description character varying(200) NOT NULL,
    rir_id bigint NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_aggregate OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_aggregate_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_aggregate_id_seq OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_aggregate_id_seq OWNED BY public.ipam_aggregate.id;


--
-- Name: ipam_ipaddress; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_ipaddress (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    address inet NOT NULL,
    status character varying(50) NOT NULL,
    role character varying(50) NOT NULL,
    assigned_object_id integer,
    dns_name character varying(255) NOT NULL,
    description character varying(200) NOT NULL,
    assigned_object_type_id integer,
    nat_inside_id bigint,
    tenant_id bigint,
    vrf_id bigint,
    CONSTRAINT ipam_ipaddress_assigned_object_id_check CHECK ((assigned_object_id >= 0))
);


ALTER TABLE public.ipam_ipaddress OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_ipaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_ipaddress_id_seq OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_ipaddress_id_seq OWNED BY public.ipam_ipaddress.id;


--
-- Name: ipam_iprange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_iprange (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    start_address inet NOT NULL,
    end_address inet NOT NULL,
    size integer NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    role_id bigint,
    tenant_id bigint,
    vrf_id bigint,
    CONSTRAINT ipam_iprange_size_check CHECK ((size >= 0))
);


ALTER TABLE public.ipam_iprange OWNER TO netbox;

--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_iprange_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_iprange_id_seq OWNER TO netbox;

--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_iprange_id_seq OWNED BY public.ipam_iprange.id;


--
-- Name: ipam_prefix; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_prefix (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    prefix cidr NOT NULL,
    status character varying(50) NOT NULL,
    is_pool boolean NOT NULL,
    description character varying(200) NOT NULL,
    role_id bigint,
    site_id bigint,
    tenant_id bigint,
    vlan_id bigint,
    vrf_id bigint,
    _children bigint NOT NULL,
    _depth smallint NOT NULL,
    mark_utilized boolean NOT NULL,
    CONSTRAINT ipam_prefix__children_check CHECK ((_children >= 0)),
    CONSTRAINT ipam_prefix__depth_check CHECK ((_depth >= 0))
);


ALTER TABLE public.ipam_prefix OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_prefix_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_prefix_id_seq OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_prefix_id_seq OWNED BY public.ipam_prefix.id;


--
-- Name: ipam_rir; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_rir (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    is_private boolean NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.ipam_rir OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_rir_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_rir_id_seq OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_rir_id_seq OWNED BY public.ipam_rir.id;


--
-- Name: ipam_role; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_role (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(200) NOT NULL,
    CONSTRAINT ipam_role_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.ipam_role OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_role_id_seq OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_role_id_seq OWNED BY public.ipam_role.id;


--
-- Name: ipam_routetarget; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_routetarget (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(21) NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_routetarget OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_routetarget_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_routetarget_id_seq OWNER TO netbox;

--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_routetarget_id_seq OWNED BY public.ipam_routetarget.id;


--
-- Name: ipam_service; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    protocol character varying(50) NOT NULL,
    ports integer[] NOT NULL,
    description character varying(200) NOT NULL,
    device_id bigint,
    virtual_machine_id bigint
);


ALTER TABLE public.ipam_service OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_id_seq OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_id_seq OWNED BY public.ipam_service.id;


--
-- Name: ipam_service_ipaddresses; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service_ipaddresses (
    id integer NOT NULL,
    service_id bigint NOT NULL,
    ipaddress_id bigint NOT NULL
);


ALTER TABLE public.ipam_service_ipaddresses OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_ipaddresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_ipaddresses_id_seq OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_ipaddresses_id_seq OWNED BY public.ipam_service_ipaddresses.id;


--
-- Name: ipam_vlan; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlan (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    vid smallint NOT NULL,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    description character varying(200) NOT NULL,
    group_id bigint,
    role_id bigint,
    site_id bigint,
    tenant_id bigint,
    CONSTRAINT ipam_vlan_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.ipam_vlan OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlan_id_seq OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlan_id_seq OWNED BY public.ipam_vlan.id;


--
-- Name: ipam_vlangroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlangroup (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    scope_id bigint,
    description character varying(200) NOT NULL,
    scope_type_id integer,
    CONSTRAINT ipam_vlangroup_scope_id_check CHECK ((scope_id >= 0))
);


ALTER TABLE public.ipam_vlangroup OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlangroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlangroup_id_seq OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlangroup_id_seq OWNED BY public.ipam_vlangroup.id;


--
-- Name: ipam_vrf; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    rd character varying(21),
    enforce_unique boolean NOT NULL,
    description character varying(200) NOT NULL,
    tenant_id bigint
);


ALTER TABLE public.ipam_vrf OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_export_targets (
    id integer NOT NULL,
    vrf_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_vrf_export_targets OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_export_targets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_export_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_export_targets_id_seq OWNED BY public.ipam_vrf_export_targets.id;


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_id_seq OWNED BY public.ipam_vrf.id;


--
-- Name: ipam_vrf_import_targets; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf_import_targets (
    id integer NOT NULL,
    vrf_id bigint NOT NULL,
    routetarget_id bigint NOT NULL
);


ALTER TABLE public.ipam_vrf_import_targets OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_import_targets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_import_targets_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_import_targets_id_seq OWNED BY public.ipam_vrf_import_targets.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: tenancy_tenant; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenant (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    comments text NOT NULL,
    group_id bigint
);


ALTER TABLE public.tenancy_tenant OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenant_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenant_id_seq OWNED BY public.tenancy_tenant.id;


--
-- Name: tenancy_tenantgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenantgroup (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id bigint,
    CONSTRAINT tenancy_tenantgroup_level_check CHECK ((level >= 0)),
    CONSTRAINT tenancy_tenantgroup_lft_check CHECK ((lft >= 0)),
    CONSTRAINT tenancy_tenantgroup_rght_check CHECK ((rght >= 0)),
    CONSTRAINT tenancy_tenantgroup_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.tenancy_tenantgroup OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenantgroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenantgroup_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenantgroup_id_seq OWNED BY public.tenancy_tenantgroup.id;


--
-- Name: users_objectpermission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    enabled boolean NOT NULL,
    actions character varying(30)[] NOT NULL,
    constraints jsonb
);


ALTER TABLE public.users_objectpermission OWNER TO netbox;

--
-- Name: users_objectpermission_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_groups (
    id integer NOT NULL,
    objectpermission_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_groups OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_groups_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_groups_id_seq OWNED BY public.users_objectpermission_groups.id;


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_id_seq OWNED BY public.users_objectpermission.id;


--
-- Name: users_objectpermission_object_types; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_object_types (
    id integer NOT NULL,
    objectpermission_id bigint NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_object_types OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_object_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_object_types_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_object_types_id_seq OWNED BY public.users_objectpermission_object_types.id;


--
-- Name: users_objectpermission_users; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_objectpermission_users (
    id integer NOT NULL,
    objectpermission_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_objectpermission_users OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_objectpermission_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_objectpermission_users_id_seq OWNER TO netbox;

--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_objectpermission_users_id_seq OWNED BY public.users_objectpermission_users.id;


--
-- Name: users_token; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_token (
    id bigint NOT NULL,
    created timestamp with time zone NOT NULL,
    expires timestamp with time zone,
    key character varying(40) NOT NULL,
    write_enabled boolean NOT NULL,
    description character varying(200) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_token OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_token_id_seq OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_token_id_seq OWNED BY public.users_token.id;


--
-- Name: users_userconfig; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_userconfig (
    id integer NOT NULL,
    data jsonb NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_userconfig OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_userconfig_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_userconfig_id_seq OWNER TO netbox;

--
-- Name: users_userconfig_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_userconfig_id_seq OWNED BY public.users_userconfig.id;


--
-- Name: virtualization_cluster; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_cluster (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id bigint,
    site_id bigint,
    tenant_id bigint,
    type_id bigint NOT NULL
);


ALTER TABLE public.virtualization_cluster OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_cluster_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_cluster_id_seq OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_cluster_id_seq OWNED BY public.virtualization_cluster.id;


--
-- Name: virtualization_clustergroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustergroup (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustergroup OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustergroup_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustergroup_id_seq OWNED BY public.virtualization_clustergroup.id;


--
-- Name: virtualization_clustertype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustertype (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.virtualization_clustertype OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustertype_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustertype_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustertype_id_seq OWNED BY public.virtualization_clustertype.id;


--
-- Name: virtualization_virtualmachine; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_virtualmachine (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    local_context_data jsonb,
    name character varying(64) NOT NULL,
    status character varying(50) NOT NULL,
    vcpus numeric(6,2),
    memory integer,
    disk integer,
    comments text NOT NULL,
    cluster_id bigint NOT NULL,
    platform_id bigint,
    primary_ip4_id bigint,
    primary_ip6_id bigint,
    role_id bigint,
    tenant_id bigint,
    _name character varying(100) NOT NULL,
    CONSTRAINT virtualization_virtualmachine_disk_check CHECK ((disk >= 0)),
    CONSTRAINT virtualization_virtualmachine_memory_check CHECK ((memory >= 0))
);


ALTER TABLE public.virtualization_virtualmachine OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_virtualmachine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_virtualmachine_id_seq OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_virtualmachine_id_seq OWNED BY public.virtualization_virtualmachine.id;


--
-- Name: virtualization_vminterface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface (
    created date,
    last_updated timestamp with time zone,
    custom_field_data jsonb NOT NULL,
    id bigint NOT NULL,
    enabled boolean NOT NULL,
    mac_address macaddr,
    mtu integer,
    mode character varying(50) NOT NULL,
    name character varying(64) NOT NULL,
    _name character varying(100) NOT NULL,
    description character varying(200) NOT NULL,
    parent_id bigint,
    untagged_vlan_id bigint,
    virtual_machine_id bigint NOT NULL,
    CONSTRAINT virtualization_vminterface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.virtualization_vminterface OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_id_seq OWNED BY public.virtualization_vminterface.id;


--
-- Name: virtualization_vminterface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_vminterface_tagged_vlans (
    id integer NOT NULL,
    vminterface_id bigint NOT NULL,
    vlan_id bigint NOT NULL
);


ALTER TABLE public.virtualization_vminterface_tagged_vlans OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_vminterface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_vminterface_tagged_vlans_id_seq OWNED BY public.virtualization_vminterface_tagged_vlans.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: circuits_circuit id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuit_id_seq'::regclass);


--
-- Name: circuits_circuittermination id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittermination_id_seq'::regclass);


--
-- Name: circuits_circuittype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittype_id_seq'::regclass);


--
-- Name: circuits_provider id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider ALTER COLUMN id SET DEFAULT nextval('public.circuits_provider_id_seq'::regclass);


--
-- Name: circuits_providernetwork id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork ALTER COLUMN id SET DEFAULT nextval('public.circuits_providernetwork_id_seq'::regclass);


--
-- Name: dcim_cable id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable ALTER COLUMN id SET DEFAULT nextval('public.dcim_cable_id_seq'::regclass);


--
-- Name: dcim_cablepath id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath ALTER COLUMN id SET DEFAULT nextval('public.dcim_cablepath_id_seq'::regclass);


--
-- Name: dcim_consoleport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleport_id_seq'::regclass);


--
-- Name: dcim_consoleporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleporttemplate_id_seq'::regclass);


--
-- Name: dcim_consoleserverport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverport_id_seq'::regclass);


--
-- Name: dcim_consoleserverporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverporttemplate_id_seq'::regclass);


--
-- Name: dcim_device id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device ALTER COLUMN id SET DEFAULT nextval('public.dcim_device_id_seq'::regclass);


--
-- Name: dcim_devicebay id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebay_id_seq'::regclass);


--
-- Name: dcim_devicebaytemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebaytemplate_id_seq'::regclass);


--
-- Name: dcim_devicerole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicerole_id_seq'::regclass);


--
-- Name: dcim_devicetype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicetype_id_seq'::regclass);


--
-- Name: dcim_frontport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontport_id_seq'::regclass);


--
-- Name: dcim_frontporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontporttemplate_id_seq'::regclass);


--
-- Name: dcim_interface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_id_seq'::regclass);


--
-- Name: dcim_interface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_tagged_vlans_id_seq'::regclass);


--
-- Name: dcim_interfacetemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_interfacetemplate_id_seq'::regclass);


--
-- Name: dcim_inventoryitem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem ALTER COLUMN id SET DEFAULT nextval('public.dcim_inventoryitem_id_seq'::regclass);


--
-- Name: dcim_location id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location ALTER COLUMN id SET DEFAULT nextval('public.dcim_location_id_seq'::regclass);


--
-- Name: dcim_manufacturer id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.dcim_manufacturer_id_seq'::regclass);


--
-- Name: dcim_platform id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform ALTER COLUMN id SET DEFAULT nextval('public.dcim_platform_id_seq'::regclass);


--
-- Name: dcim_powerfeed id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerfeed_id_seq'::regclass);


--
-- Name: dcim_poweroutlet id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlet_id_seq'::regclass);


--
-- Name: dcim_poweroutlettemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlettemplate_id_seq'::regclass);


--
-- Name: dcim_powerpanel id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerpanel_id_seq'::regclass);


--
-- Name: dcim_powerport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerport_id_seq'::regclass);


--
-- Name: dcim_powerporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerporttemplate_id_seq'::regclass);


--
-- Name: dcim_rack id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack ALTER COLUMN id SET DEFAULT nextval('public.dcim_rack_id_seq'::regclass);


--
-- Name: dcim_rackreservation id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackreservation_id_seq'::regclass);


--
-- Name: dcim_rackrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackrole_id_seq'::regclass);


--
-- Name: dcim_rearport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearport_id_seq'::regclass);


--
-- Name: dcim_rearporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearporttemplate_id_seq'::regclass);


--
-- Name: dcim_region id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region ALTER COLUMN id SET DEFAULT nextval('public.dcim_region_id_seq'::regclass);


--
-- Name: dcim_site id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site ALTER COLUMN id SET DEFAULT nextval('public.dcim_site_id_seq'::regclass);


--
-- Name: dcim_sitegroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup ALTER COLUMN id SET DEFAULT nextval('public.dcim_sitegroup_id_seq'::regclass);


--
-- Name: dcim_virtualchassis id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis ALTER COLUMN id SET DEFAULT nextval('public.dcim_virtualchassis_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: extras_configcontext id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_id_seq'::regclass);


--
-- Name: extras_configcontext_cluster_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_cluster_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_clusters id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_clusters_id_seq'::regclass);


--
-- Name: extras_configcontext_device_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_device_types_id_seq'::regclass);


--
-- Name: extras_configcontext_platforms id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_platforms_id_seq'::regclass);


--
-- Name: extras_configcontext_regions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_regions_id_seq'::regclass);


--
-- Name: extras_configcontext_roles id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_roles_id_seq'::regclass);


--
-- Name: extras_configcontext_site_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_site_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_sites id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_sites_id_seq'::regclass);


--
-- Name: extras_configcontext_tags id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tags_id_seq'::regclass);


--
-- Name: extras_configcontext_tenant_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenant_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_tenants id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenants_id_seq'::regclass);


--
-- Name: extras_customfield id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_id_seq'::regclass);


--
-- Name: extras_customfield_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_content_types_id_seq'::regclass);


--
-- Name: extras_customlink id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink ALTER COLUMN id SET DEFAULT nextval('public.extras_customlink_id_seq'::regclass);


--
-- Name: extras_exporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate ALTER COLUMN id SET DEFAULT nextval('public.extras_exporttemplate_id_seq'::regclass);


--
-- Name: extras_imageattachment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment ALTER COLUMN id SET DEFAULT nextval('public.extras_imageattachment_id_seq'::regclass);


--
-- Name: extras_jobresult id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult ALTER COLUMN id SET DEFAULT nextval('public.extras_jobresult_id_seq'::regclass);


--
-- Name: extras_journalentry id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry ALTER COLUMN id SET DEFAULT nextval('public.extras_journalentry_id_seq'::regclass);


--
-- Name: extras_objectchange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange ALTER COLUMN id SET DEFAULT nextval('public.extras_objectchange_id_seq'::regclass);


--
-- Name: extras_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag ALTER COLUMN id SET DEFAULT nextval('public.extras_tag_id_seq'::regclass);


--
-- Name: extras_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.extras_taggeditem_id_seq'::regclass);


--
-- Name: extras_webhook id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_id_seq'::regclass);


--
-- Name: extras_webhook_content_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_content_types_id_seq'::regclass);


--
-- Name: ipam_aggregate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate ALTER COLUMN id SET DEFAULT nextval('public.ipam_aggregate_id_seq'::regclass);


--
-- Name: ipam_ipaddress id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress ALTER COLUMN id SET DEFAULT nextval('public.ipam_ipaddress_id_seq'::regclass);


--
-- Name: ipam_iprange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange ALTER COLUMN id SET DEFAULT nextval('public.ipam_iprange_id_seq'::regclass);


--
-- Name: ipam_prefix id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix ALTER COLUMN id SET DEFAULT nextval('public.ipam_prefix_id_seq'::regclass);


--
-- Name: ipam_rir id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir ALTER COLUMN id SET DEFAULT nextval('public.ipam_rir_id_seq'::regclass);


--
-- Name: ipam_role id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role ALTER COLUMN id SET DEFAULT nextval('public.ipam_role_id_seq'::regclass);


--
-- Name: ipam_routetarget id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget ALTER COLUMN id SET DEFAULT nextval('public.ipam_routetarget_id_seq'::regclass);


--
-- Name: ipam_service id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_id_seq'::regclass);


--
-- Name: ipam_service_ipaddresses id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_ipaddresses_id_seq'::regclass);


--
-- Name: ipam_vlan id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlan_id_seq'::regclass);


--
-- Name: ipam_vlangroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlangroup_id_seq'::regclass);


--
-- Name: ipam_vrf id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_id_seq'::regclass);


--
-- Name: ipam_vrf_export_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_export_targets_id_seq'::regclass);


--
-- Name: ipam_vrf_import_targets id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_import_targets_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: tenancy_tenant id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenant_id_seq'::regclass);


--
-- Name: tenancy_tenantgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenantgroup_id_seq'::regclass);


--
-- Name: users_objectpermission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_id_seq'::regclass);


--
-- Name: users_objectpermission_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_groups_id_seq'::regclass);


--
-- Name: users_objectpermission_object_types id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_object_types_id_seq'::regclass);


--
-- Name: users_objectpermission_users id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users ALTER COLUMN id SET DEFAULT nextval('public.users_objectpermission_users_id_seq'::regclass);


--
-- Name: users_token id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token ALTER COLUMN id SET DEFAULT nextval('public.users_token_id_seq'::regclass);


--
-- Name: users_userconfig id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig ALTER COLUMN id SET DEFAULT nextval('public.users_userconfig_id_seq'::regclass);


--
-- Name: virtualization_cluster id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster ALTER COLUMN id SET DEFAULT nextval('public.virtualization_cluster_id_seq'::regclass);


--
-- Name: virtualization_clustergroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustergroup_id_seq'::regclass);


--
-- Name: virtualization_clustertype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustertype_id_seq'::regclass);


--
-- Name: virtualization_virtualmachine id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine ALTER COLUMN id SET DEFAULT nextval('public.virtualization_virtualmachine_id_seq'::regclass);


--
-- Name: virtualization_vminterface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_id_seq'::regclass);


--
-- Name: virtualization_vminterface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.virtualization_vminterface_tagged_vlans_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
333	Access admin page	84	view
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add tag	7	add_tag
26	Can change tag	7	change_tag
27	Can delete tag	7	delete_tag
28	Can view tag	7	view_tag
29	Can add tagged item	8	add_taggeditem
30	Can change tagged item	8	change_taggeditem
31	Can delete tagged item	8	delete_taggeditem
32	Can view tagged item	8	view_taggeditem
33	Can add circuit	9	add_circuit
34	Can change circuit	9	change_circuit
35	Can delete circuit	9	delete_circuit
36	Can view circuit	9	view_circuit
41	Can add circuit type	11	add_circuittype
42	Can change circuit type	11	change_circuittype
43	Can delete circuit type	11	delete_circuittype
44	Can view circuit type	11	view_circuittype
45	Can add provider	12	add_provider
46	Can change provider	12	change_provider
47	Can delete provider	12	delete_provider
48	Can view provider	12	view_provider
37	Can add circuit termination	10	add_circuittermination
38	Can change circuit termination	10	change_circuittermination
39	Can delete circuit termination	10	delete_circuittermination
40	Can view circuit termination	10	view_circuittermination
49	Can add provider network	13	add_providernetwork
50	Can change provider network	13	change_providernetwork
51	Can delete provider network	13	delete_providernetwork
52	Can view provider network	13	view_providernetwork
61	Can add console port	16	add_consoleport
62	Can change console port	16	change_consoleport
63	Can delete console port	16	delete_consoleport
64	Can view console port	16	view_consoleport
65	Can add console port template	17	add_consoleporttemplate
66	Can change console port template	17	change_consoleporttemplate
67	Can delete console port template	17	delete_consoleporttemplate
68	Can view console port template	17	view_consoleporttemplate
69	Can add console server port	18	add_consoleserverport
70	Can change console server port	18	change_consoleserverport
71	Can delete console server port	18	delete_consoleserverport
72	Can view console server port	18	view_consoleserverport
73	Can add console server port template	19	add_consoleserverporttemplate
74	Can change console server port template	19	change_consoleserverporttemplate
75	Can delete console server port template	19	delete_consoleserverporttemplate
76	Can view console server port template	19	view_consoleserverporttemplate
77	Can add device	20	add_device
78	Can change device	20	change_device
79	Can delete device	20	delete_device
80	Can view device	20	view_device
89	Can add device role	23	add_devicerole
90	Can change device role	23	change_devicerole
91	Can delete device role	23	delete_devicerole
92	Can view device role	23	view_devicerole
93	Can add device type	24	add_devicetype
94	Can change device type	24	change_devicetype
95	Can delete device type	24	delete_devicetype
96	Can view device type	24	view_devicetype
105	Can add interface	27	add_interface
106	Can change interface	27	change_interface
107	Can delete interface	27	delete_interface
108	Can view interface	27	view_interface
109	Can add interface template	28	add_interfacetemplate
110	Can change interface template	28	change_interfacetemplate
111	Can delete interface template	28	delete_interfacetemplate
112	Can view interface template	28	view_interfacetemplate
121	Can add manufacturer	31	add_manufacturer
122	Can change manufacturer	31	change_manufacturer
123	Can delete manufacturer	31	delete_manufacturer
124	Can view manufacturer	31	view_manufacturer
125	Can add platform	32	add_platform
126	Can change platform	32	change_platform
127	Can delete platform	32	delete_platform
128	Can view platform	32	view_platform
133	Can add power outlet	34	add_poweroutlet
134	Can change power outlet	34	change_poweroutlet
135	Can delete power outlet	34	delete_poweroutlet
136	Can view power outlet	34	view_poweroutlet
137	Can add power outlet template	35	add_poweroutlettemplate
138	Can change power outlet template	35	change_poweroutlettemplate
139	Can delete power outlet template	35	delete_poweroutlettemplate
140	Can view power outlet template	35	view_poweroutlettemplate
145	Can add power port	37	add_powerport
146	Can change power port	37	change_powerport
147	Can delete power port	37	delete_powerport
148	Can view power port	37	view_powerport
149	Can add power port template	38	add_powerporttemplate
150	Can change power port template	38	change_powerporttemplate
151	Can delete power port template	38	delete_powerporttemplate
152	Can view power port template	38	view_powerporttemplate
153	Can add rack	39	add_rack
154	Can change rack	39	change_rack
155	Can delete rack	39	delete_rack
156	Can view rack	39	view_rack
177	Can add site	45	add_site
178	Can change site	45	change_site
179	Can delete site	45	delete_site
180	Can view site	45	view_site
81	Can add device bay	21	add_devicebay
82	Can change device bay	21	change_devicebay
83	Can delete device bay	21	delete_devicebay
84	Can view device bay	21	view_devicebay
85	Can add device bay template	22	add_devicebaytemplate
86	Can change device bay template	22	change_devicebaytemplate
87	Can delete device bay template	22	delete_devicebaytemplate
88	Can view device bay template	22	view_devicebaytemplate
161	Can add rack role	41	add_rackrole
162	Can change rack role	41	change_rackrole
163	Can delete rack role	41	delete_rackrole
164	Can view rack role	41	view_rackrole
157	Can add rack reservation	40	add_rackreservation
158	Can change rack reservation	40	change_rackreservation
159	Can delete rack reservation	40	delete_rackreservation
160	Can view rack reservation	40	view_rackreservation
173	Can add region	44	add_region
174	Can change region	44	change_region
175	Can delete region	44	delete_region
176	Can view region	44	view_region
113	Can add inventory item	29	add_inventoryitem
114	Can change inventory item	29	change_inventoryitem
115	Can delete inventory item	29	delete_inventoryitem
116	Can view inventory item	29	view_inventoryitem
185	Can add virtual chassis	47	add_virtualchassis
186	Can change virtual chassis	47	change_virtualchassis
187	Can delete virtual chassis	47	delete_virtualchassis
188	Can view virtual chassis	47	view_virtualchassis
97	Can add front port	25	add_frontport
98	Can change front port	25	change_frontport
99	Can delete front port	25	delete_frontport
100	Can view front port	25	view_frontport
101	Can add front port template	26	add_frontporttemplate
102	Can change front port template	26	change_frontporttemplate
103	Can delete front port template	26	delete_frontporttemplate
104	Can view front port template	26	view_frontporttemplate
165	Can add rear port	42	add_rearport
166	Can change rear port	42	change_rearport
167	Can delete rear port	42	delete_rearport
168	Can view rear port	42	view_rearport
169	Can add rear port template	43	add_rearporttemplate
170	Can change rear port template	43	change_rearporttemplate
171	Can delete rear port template	43	delete_rearporttemplate
172	Can view rear port template	43	view_rearporttemplate
53	Can add cable	14	add_cable
54	Can change cable	14	change_cable
55	Can delete cable	14	delete_cable
56	Can view cable	14	view_cable
129	Can add power feed	33	add_powerfeed
130	Can change power feed	33	change_powerfeed
131	Can delete power feed	33	delete_powerfeed
132	Can view power feed	33	view_powerfeed
141	Can add power panel	36	add_powerpanel
142	Can change power panel	36	change_powerpanel
143	Can delete power panel	36	delete_powerpanel
144	Can view power panel	36	view_powerpanel
57	Can add cable path	15	add_cablepath
58	Can change cable path	15	change_cablepath
59	Can delete cable path	15	delete_cablepath
60	Can view cable path	15	view_cablepath
117	Can add location	30	add_location
118	Can change location	30	change_location
119	Can delete location	30	delete_location
120	Can view location	30	view_location
181	Can add site group	46	add_sitegroup
182	Can change site group	46	change_sitegroup
183	Can delete site group	46	delete_sitegroup
184	Can view site group	46	view_sitegroup
189	Can add aggregate	48	add_aggregate
190	Can change aggregate	48	change_aggregate
191	Can delete aggregate	48	delete_aggregate
192	Can view aggregate	48	view_aggregate
193	Can add IP address	49	add_ipaddress
194	Can change IP address	49	change_ipaddress
195	Can delete IP address	49	delete_ipaddress
196	Can view IP address	49	view_ipaddress
197	Can add prefix	50	add_prefix
198	Can change prefix	50	change_prefix
199	Can delete prefix	50	delete_prefix
200	Can view prefix	50	view_prefix
201	Can add RIR	51	add_rir
202	Can change RIR	51	change_rir
203	Can delete RIR	51	delete_rir
204	Can view RIR	51	view_rir
205	Can add role	52	add_role
206	Can change role	52	change_role
207	Can delete role	52	delete_role
208	Can view role	52	view_role
221	Can add VLAN	56	add_vlan
222	Can change VLAN	56	change_vlan
223	Can delete VLAN	56	delete_vlan
224	Can view VLAN	56	view_vlan
213	Can add VRF	54	add_vrf
214	Can change VRF	54	change_vrf
215	Can delete VRF	54	delete_vrf
216	Can view VRF	54	view_vrf
217	Can add VLAN group	55	add_vlangroup
218	Can change VLAN group	55	change_vlangroup
219	Can delete VLAN group	55	delete_vlangroup
220	Can view VLAN group	55	view_vlangroup
225	Can add service	57	add_service
226	Can change service	57	change_service
227	Can delete service	57	delete_service
228	Can view service	57	view_service
209	Can add route target	53	add_routetarget
210	Can change route target	53	change_routetarget
211	Can delete route target	53	delete_routetarget
212	Can view route target	53	view_routetarget
273	Can add export template	69	add_exporttemplate
274	Can change export template	69	change_exporttemplate
275	Can delete export template	69	delete_exporttemplate
276	Can view export template	69	view_exporttemplate
281	Can add custom field	71	add_customfield
282	Can change custom field	71	change_customfield
283	Can delete custom field	71	delete_customfield
284	Can view custom field	71	view_customfield
269	Can add image attachment	68	add_imageattachment
270	Can change image attachment	68	change_imageattachment
271	Can delete image attachment	68	delete_imageattachment
272	Can view image attachment	68	view_imageattachment
249	Can add webhook	63	add_webhook
250	Can change webhook	63	change_webhook
251	Can delete webhook	63	delete_webhook
252	Can view webhook	63	view_webhook
257	Can add object change	65	add_objectchange
258	Can change object change	65	change_objectchange
259	Can delete object change	65	delete_objectchange
260	Can view object change	65	view_objectchange
241	Can add config context	61	add_configcontext
242	Can change config context	61	change_configcontext
243	Can delete config context	61	delete_configcontext
244	Can view config context	61	view_configcontext
245	Can add tag	62	add_tag
246	Can change tag	62	change_tag
247	Can delete tag	62	delete_tag
248	Can view tag	62	view_tag
253	Can add tagged item	64	add_taggeditem
254	Can change tagged item	64	change_taggeditem
255	Can delete tagged item	64	delete_taggeditem
256	Can view tagged item	64	view_taggeditem
277	Can add custom link	70	add_customlink
278	Can change custom link	70	change_customlink
279	Can delete custom link	70	delete_customlink
280	Can view custom link	70	view_customlink
237	Can add script	60	add_script
238	Can change script	60	change_script
239	Can delete script	60	delete_script
240	Can view script	60	view_script
233	Can add report	59	add_report
234	Can change report	59	change_report
235	Can delete report	59	delete_report
236	Can view report	59	view_report
265	Can add job result	67	add_jobresult
266	Can change job result	67	change_jobresult
267	Can delete job result	67	delete_jobresult
268	Can view job result	67	view_jobresult
261	Can add journal entry	66	add_journalentry
262	Can change journal entry	66	change_journalentry
263	Can delete journal entry	66	delete_journalentry
264	Can view journal entry	66	view_journalentry
334	Can add secret	85	add_secret
335	Can change secret	85	change_secret
336	Can delete secret	85	delete_secret
337	Can view secret	85	view_secret
338	Can add secret role	86	add_secretrole
339	Can change secret role	86	change_secretrole
340	Can delete secret role	86	delete_secretrole
341	Can view secret role	86	view_secretrole
342	Can add user key	87	add_userkey
343	Can change user key	87	change_userkey
344	Can delete user key	87	delete_userkey
345	Can view user key	87	view_userkey
346	Can add session key	88	add_sessionkey
347	Can change session key	88	change_sessionkey
348	Can delete session key	88	delete_sessionkey
349	Can view session key	88	view_sessionkey
289	Can add tenant	73	add_tenant
290	Can change tenant	73	change_tenant
291	Can delete tenant	73	delete_tenant
292	Can view tenant	73	view_tenant
285	Can add tenant group	72	add_tenantgroup
286	Can change tenant group	72	change_tenantgroup
287	Can delete tenant group	72	delete_tenantgroup
288	Can view tenant group	72	view_tenantgroup
305	Can add token	77	add_token
306	Can change token	77	change_token
307	Can delete token	77	delete_token
308	Can view token	77	view_token
301	Can add User Preferences	76	add_userconfig
302	Can change User Preferences	76	change_userconfig
303	Can delete User Preferences	76	delete_userconfig
304	Can view User Preferences	76	view_userconfig
293	Can add Group	74	add_admingroup
294	Can change Group	74	change_admingroup
295	Can delete Group	74	delete_admingroup
296	Can view Group	74	view_admingroup
297	Can add User	75	add_adminuser
298	Can change User	75	change_adminuser
299	Can delete User	75	delete_adminuser
300	Can view User	75	view_adminuser
309	Can add permission	78	add_objectpermission
310	Can change permission	78	change_objectpermission
311	Can delete permission	78	delete_objectpermission
312	Can view permission	78	view_objectpermission
313	Can add cluster	79	add_cluster
314	Can change cluster	79	change_cluster
315	Can delete cluster	79	delete_cluster
316	Can view cluster	79	view_cluster
317	Can add cluster group	80	add_clustergroup
318	Can change cluster group	80	change_clustergroup
319	Can delete cluster group	80	delete_clustergroup
320	Can view cluster group	80	view_clustergroup
321	Can add cluster type	81	add_clustertype
322	Can change cluster type	81	change_clustertype
323	Can delete cluster type	81	delete_clustertype
324	Can view cluster type	81	view_clustertype
325	Can add virtual machine	82	add_virtualmachine
326	Can change virtual machine	82	change_virtualmachine
327	Can delete virtual machine	82	delete_virtualmachine
328	Can view virtual machine	82	view_virtualmachine
329	Can add interface	83	add_vminterface
330	Can change interface	83	change_vminterface
331	Can delete interface	83	delete_vminterface
332	Can view interface	83	view_vminterface
229	Can add IP range	58	add_iprange
230	Can change IP range	58	change_iprange
231	Can delete IP range	58	delete_iprange
232	Can view IP range	58	view_iprange
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$1HdcEs3AzIts5vF5VChEPI$3TfdxjKUJ6XXCXP/QtqeyBXrr1+JS90aHci9zIiENS0=	2021-09-09 10:46:46.973-04	t	admin				t	t	2020-12-17 21:07:15.359-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuit; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuit (created, last_updated, custom_field_data, id, cid, status, install_date, commit_rate, description, comments, provider_id, tenant_id, termination_a_id, termination_z_id, type_id) FROM stdin;
2020-12-30	2023-12-29 10:18:30.350925-05	{}	19	1002840283	active	\N	\N			2	5	\N	23	1
2020-12-30	2023-12-29 10:18:30.351983-05	{}	20	1002840457	active	\N	\N			2	5	\N	24	1
2020-12-30	2023-12-29 10:18:30.353051-05	{}	21	1002841093	active	\N	\N			2	5	\N	25	1
2020-12-30	2023-12-29 10:18:30.354088-05	{}	17	1002842917	active	\N	\N			2	5	\N	26	1
2020-12-30	2023-12-29 10:18:30.355312-05	{}	24	1002843016	active	\N	\N			2	5	\N	27	1
2020-12-30	2023-12-29 10:18:30.356451-05	{}	18	1002843350	active	\N	\N			2	5	\N	28	1
2020-12-30	2023-12-29 10:18:30.357589-05	{}	23	1002843428	active	\N	\N			2	5	\N	29	1
2020-12-30	2023-12-29 10:18:30.35868-05	{}	27	1002843688	active	\N	\N			2	5	\N	30	1
2020-12-30	2023-12-29 10:18:30.359758-05	{}	26	1002844901	active	\N	\N			2	5	\N	31	1
2020-12-30	2023-12-29 10:18:30.360832-05	{}	25	1002844927	active	\N	\N			2	5	\N	32	1
2020-12-30	2023-12-29 10:18:30.361921-05	{}	22	1002844978	active	\N	\N			2	5	\N	33	1
2020-12-30	2023-12-29 10:18:30.362998-05	{}	16	1002845894	active	\N	\N			2	5	\N	34	1
2020-12-30	2023-12-29 10:18:30.364104-05	{}	15	1002847289	active	\N	\N			2	5	\N	35	1
2021-04-02	2023-12-29 10:18:30.366231-05	{}	30	319031	active	\N	\N			9	13	36	37	4
2021-04-02	2023-12-29 10:18:30.368358-05	{}	29	350927	active	\N	\N			9	13	38	39	4
2021-04-02	2023-12-29 10:18:30.370464-05	{}	28	398282	active	\N	\N			9	13	40	41	4
2020-12-30	2023-12-29 10:18:30.371513-05	{}	14	DEOW4921	active	\N	\N			5	5	42	15	2
2020-12-30	2023-12-29 10:18:30.372576-05	{}	11	DJDP9577	active	\N	\N			5	5	43	12	2
2020-12-30	2023-12-29 10:18:30.373635-05	{}	10	DOQHD947	active	\N	\N			5	5	44	11	2
2020-12-30	2023-12-29 10:18:30.374684-05	{}	2	JHEW3951	active	\N	\N			5	5	45	2	2
2020-12-30	2023-12-29 10:18:30.375811-05	{}	5	KAGO3917	active	\N	\N			5	5	46	5	2
2020-12-30	2023-12-29 10:18:30.376869-05	{}	12	KDPO0597	active	\N	\N			5	5	47	13	2
2020-12-30	2023-12-29 10:18:30.377925-05	{}	1	KKDG4923	active	\N	\N			5	5	48	1	2
2020-12-30	2023-12-29 10:18:30.378981-05	{}	6	KLQU4018	active	\N	\N			5	5	49	6	2
2020-12-30	2023-12-29 10:18:30.380031-05	{}	9	KSIR0381	active	\N	\N			5	5	50	10	2
2020-12-30	2023-12-29 10:18:30.381086-05	{}	7	LQRT4981	active	\N	\N			5	5	51	8	2
2020-12-30	2023-12-29 10:18:30.382145-05	{}	3	PPJQ5091	active	\N	\N			5	5	52	3	2
2020-12-30	2023-12-29 10:18:30.383212-05	{}	13	QMKD2436	active	\N	\N			5	5	53	14	2
2020-12-30	2023-12-29 10:18:30.384258-05	{}	4	QPMA5027	active	\N	\N			5	5	54	4	2
\.


--
-- Data for Name: circuits_circuittermination; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittermination (created, last_updated, id, _cable_peer_id, mark_connected, term_side, port_speed, upstream_speed, xconnect_id, pp_info, description, _cable_peer_type_id, cable_id, circuit_id, provider_network_id, site_id) FROM stdin;
2021-04-14	2021-04-14 13:36:14.032-04	1	1	f	Z	\N	\N				27	7	1	\N	2
2021-04-14	2021-04-14 13:36:14.032-04	2	14	f	Z	\N	\N				27	4	2	\N	3
2021-04-14	2021-04-14 13:36:14.032-04	3	27	f	Z	\N	\N				27	12	3	\N	4
2021-04-14	2021-04-14 13:36:14.032-04	4	40	f	Z	\N	\N				27	14	4	\N	5
2021-04-14	2021-04-14 13:36:14.032-04	5	53	f	Z	\N	\N				27	5	5	\N	6
2021-04-14	2021-04-14 13:36:14.032-04	6	66	f	Z	\N	\N				27	8	6	\N	7
2021-04-14	2021-04-14 13:36:14.032-04	8	79	f	Z	\N	\N				27	10	7	\N	8
2021-04-14	2021-04-14 13:36:14.032-04	10	92	f	Z	\N	\N				27	9	9	\N	9
2021-04-14	2021-04-14 13:36:14.032-04	11	105	f	Z	\N	\N				27	3	10	\N	10
2021-04-14	2021-04-14 13:36:14.032-04	12	118	f	Z	\N	\N				27	2	11	\N	11
2021-04-14	2021-04-14 13:36:14.032-04	13	131	f	Z	\N	\N				27	6	12	\N	12
2021-04-14	2021-04-14 13:36:14.032-04	14	144	f	Z	\N	\N				27	13	13	\N	13
2021-04-14	2021-04-14 13:36:14.032-04	15	157	f	Z	\N	\N				27	1	14	\N	14
2021-04-14	2021-04-14 13:36:14.032-04	23	2	f	Z	\N	\N				27	21	19	\N	2
2021-04-14	2021-04-14 13:36:14.032-04	24	15	f	Z	\N	\N				27	22	20	\N	3
2021-04-14	2021-04-14 13:36:14.032-04	25	28	f	Z	\N	\N				27	23	21	\N	4
2021-04-14	2021-04-14 13:36:14.032-04	26	41	f	Z	\N	\N				27	24	17	\N	5
2021-04-14	2021-04-14 13:36:14.032-04	27	54	f	Z	\N	\N				27	25	24	\N	6
2021-04-14	2021-04-14 13:36:14.032-04	28	67	f	Z	\N	\N				27	26	18	\N	7
2021-04-14	2021-04-14 13:36:14.032-04	29	80	f	Z	\N	\N				27	27	23	\N	8
2021-04-14	2021-04-14 13:36:14.032-04	30	93	f	Z	\N	\N				27	28	27	\N	9
2021-04-14	2021-04-14 13:36:14.032-04	31	106	f	Z	\N	\N				27	29	26	\N	10
2021-04-14	2021-04-14 13:36:14.032-04	32	119	f	Z	\N	\N				27	30	25	\N	11
2021-04-14	2021-04-14 13:36:14.032-04	33	132	f	Z	\N	\N				27	31	22	\N	12
2021-04-14	2021-04-14 13:36:14.032-04	34	145	f	Z	\N	\N				27	32	16	\N	13
2021-04-14	2021-04-14 13:36:14.032-04	35	158	f	Z	\N	\N				27	33	15	\N	14
2021-04-14	2021-04-14 13:36:14.032-04	36	1249	f	A	\N	\N				42	87	30	\N	21
2021-04-14	2021-04-14 13:36:14.032-04	37	1252	f	Z	\N	\N				42	88	30	\N	24
2021-04-14	2021-04-14 13:36:14.032-04	38	1250	f	A	\N	\N				42	89	29	\N	21
2021-04-14	2021-04-14 13:36:14.032-04	39	1253	f	Z	\N	\N				42	90	29	\N	22
2021-04-14	2021-04-14 13:36:14.032-04	40	1251	f	A	\N	\N				42	91	28	\N	21
2021-04-14	2021-04-14 13:36:14.032-04	41	1254	f	Z	\N	\N				42	92	28	\N	23
2021-04-19	2021-04-19 12:05:36.916-04	42	\N	f	A	\N	\N				\N	\N	14	1	\N
2021-04-19	2021-04-19 12:06:21.936-04	43	\N	f	A	\N	\N				\N	\N	11	1	\N
2021-04-19	2021-04-19 12:06:27.633-04	44	\N	f	A	\N	\N				\N	\N	10	1	\N
2021-04-19	2021-04-19 12:06:33.115-04	45	\N	f	A	\N	\N				\N	\N	2	1	\N
2021-04-19	2021-04-19 12:06:38.186-04	46	\N	f	A	\N	\N				\N	\N	5	1	\N
2021-04-19	2021-04-19 12:06:43.361-04	47	\N	f	A	\N	\N				\N	\N	12	1	\N
2021-04-19	2021-04-19 12:06:48.802-04	48	\N	f	A	\N	\N				\N	\N	1	1	\N
2021-04-19	2021-04-19 12:06:53.505-04	49	\N	f	A	\N	\N				\N	\N	6	1	\N
2021-04-19	2021-04-19 12:06:57.998-04	50	\N	f	A	\N	\N				\N	\N	9	1	\N
2021-04-19	2021-04-19 12:07:02.781-04	51	\N	f	A	\N	\N				\N	\N	7	1	\N
2021-04-19	2021-04-19 12:07:07.566-04	52	\N	f	A	\N	\N				\N	\N	3	1	\N
2021-04-19	2021-04-19 12:07:12.485-04	53	\N	f	A	\N	\N				\N	\N	13	1	\N
2021-04-19	2021-04-19 12:07:18.241-04	54	\N	f	A	\N	\N				\N	\N	4	1	\N
\.


--
-- Data for Name: circuits_circuittype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittype (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
2020-12-30	2020-12-30 13:49:05.43-05	{}	1	Internet Access	internet	
2020-12-30	2020-12-30 13:49:05.484-05	{}	2	MPLS	mpls	
2020-12-30	2020-12-30 13:49:05.53-05	{}	3	Point-to-point	point-to-point	
2021-04-02	2021-04-02 13:04:48.228-04	{}	4	Dark Fiber	dark-fiber	
\.


--
-- Data for Name: circuits_provider; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_provider (created, last_updated, custom_field_data, id, name, slug, asn, account, portal_url, noc_contact, admin_contact, comments) FROM stdin;
2020-12-30	2020-12-30 13:47:38.202-05	{}	1	AT&T	att	\N					
2020-12-30	2020-12-30 13:47:38.259-05	{}	2	CenturyLink	centurylink	\N					
2020-12-30	2020-12-30 13:47:38.313-05	{}	3	Comcast	comcast	\N					
2020-12-30	2020-12-30 13:47:38.364-05	{}	4	GTT	gtt	\N					
2020-12-30	2020-12-30 13:47:38.415-05	{}	5	Level 3	level-3	\N					
2020-12-30	2020-12-30 13:47:38.472-05	{}	6	NTT	ntt	\N					
2020-12-30	2020-12-30 13:47:38.52-05	{}	7	Verizon	verizon	\N					
2020-12-30	2020-12-30 13:47:38.569-05	{}	8	Zayo	zayo	\N					
2021-04-02	2021-04-02 13:04:16.372-04	{}	9	NCSU Facilities	ncsu-facilities	\N					Local maintainer for NC State communications facilities
\.


--
-- Data for Name: circuits_providernetwork; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_providernetwork (created, last_updated, custom_field_data, id, name, description, comments, provider_id) FROM stdin;
2021-04-19	2021-04-19 12:05:17.385-04	{}	1	Level3 MPLS			5
\.


--
-- Data for Name: dcim_cable; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cable (created, last_updated, custom_field_data, id, termination_a_id, termination_b_id, type, status, label, color, length, length_unit, _abs_length, _termination_a_device_id, _termination_b_device_id, termination_a_type_id, termination_b_type_id) FROM stdin;
2020-12-30	2020-12-30 14:32:32.279-05	{}	1	15	157	smf	connected		ffeb3b	\N		\N	\N	13	10	27
2020-12-30	2020-12-30 14:32:32.387-05	{}	2	12	118	smf	connected		ffeb3b	\N		\N	\N	10	10	27
2020-12-30	2020-12-30 14:32:32.496-05	{}	3	11	105	smf	connected		ffeb3b	\N		\N	\N	9	10	27
2020-12-30	2020-12-30 14:32:32.641-05	{}	4	2	14	smf	connected		ffeb3b	\N		\N	\N	2	10	27
2020-12-30	2020-12-30 14:32:32.768-05	{}	5	5	53	smf	connected		ffeb3b	\N		\N	\N	5	10	27
2020-12-30	2020-12-30 14:32:32.872-05	{}	6	13	131	smf	connected		ffeb3b	\N		\N	\N	11	10	27
2020-12-30	2020-12-30 14:32:32.969-05	{}	7	1	1	smf	connected		ffeb3b	\N		\N	\N	1	10	27
2020-12-30	2020-12-30 14:32:33.066-05	{}	8	6	66	smf	connected		ffeb3b	\N		\N	\N	6	10	27
2020-12-30	2020-12-30 14:32:33.163-05	{}	9	10	92	smf	connected		ffeb3b	\N		\N	\N	8	10	27
2020-12-30	2020-12-30 14:32:33.262-05	{}	10	8	79	smf	connected		ffeb3b	\N		\N	\N	7	10	27
2020-12-30	2020-12-30 14:32:33.359-05	{}	12	3	27	smf	connected		ffeb3b	\N		\N	\N	3	10	27
2020-12-30	2020-12-30 14:32:33.456-05	{}	13	14	144	smf	connected		ffeb3b	\N		\N	\N	12	10	27
2020-12-30	2020-12-30 14:32:33.552-05	{}	14	4	40	smf	connected		ffeb3b	\N		\N	\N	4	10	27
2020-12-30	2020-12-30 14:32:57.398-05	{}	21	23	2	cat5e	connected		2196f3	\N		\N	\N	1	10	27
2020-12-30	2020-12-30 14:32:57.501-05	{}	22	24	15	cat5e	connected		2196f3	\N		\N	\N	2	10	27
2020-12-30	2020-12-30 14:32:57.603-05	{}	23	25	28	cat5e	connected		2196f3	\N		\N	\N	3	10	27
2020-12-30	2020-12-30 14:32:57.7-05	{}	24	26	41	cat5e	connected		2196f3	\N		\N	\N	4	10	27
2020-12-30	2020-12-30 14:32:57.796-05	{}	25	27	54	cat5e	connected		2196f3	\N		\N	\N	5	10	27
2020-12-30	2020-12-30 14:32:57.891-05	{}	26	28	67	cat5e	connected		2196f3	\N		\N	\N	6	10	27
2020-12-30	2020-12-30 14:32:58.047-05	{}	27	29	80	cat5e	connected		2196f3	\N		\N	\N	7	10	27
2020-12-30	2020-12-30 14:32:58.142-05	{}	28	30	93	cat5e	connected		2196f3	\N		\N	\N	8	10	27
2020-12-30	2020-12-30 14:32:58.239-05	{}	29	31	106	cat5e	connected		2196f3	\N		\N	\N	9	10	27
2020-12-30	2020-12-30 14:32:58.338-05	{}	30	32	119	cat5e	connected		2196f3	\N		\N	\N	10	10	27
2020-12-30	2020-12-30 14:32:58.435-05	{}	31	33	132	cat5e	connected		2196f3	\N		\N	\N	11	10	27
2020-12-30	2020-12-30 14:32:58.53-05	{}	32	34	145	cat5e	connected		2196f3	\N		\N	\N	12	10	27
2020-12-30	2020-12-30 14:32:58.627-05	{}	33	35	158	cat5e	connected		2196f3	\N		\N	\N	13	10	27
2020-12-30	2020-12-30 14:30:36.66-05	{}	35	3	170	cat5e	connected		ff5722	\N		\N	1	14	27	27
2020-12-30	2020-12-30 14:31:01.73-05	{}	36	4	171	cat5e	connected		ff5722	\N		\N	1	14	27	27
2020-12-30	2020-12-30 14:31:01.847-05	{}	37	16	221	cat5e	connected		ff5722	\N		\N	2	15	27	27
2020-12-30	2020-12-30 14:31:01.958-05	{}	38	17	222	cat5e	connected		ff5722	\N		\N	2	15	27	27
2020-12-30	2020-12-30 14:31:02.07-05	{}	39	29	272	cat5e	connected		ff5722	\N		\N	3	16	27	27
2020-12-30	2020-12-30 14:31:02.18-05	{}	40	30	273	cat5e	connected		ff5722	\N		\N	3	16	27	27
2020-12-30	2020-12-30 14:31:02.288-05	{}	41	42	323	cat5e	connected		ff5722	\N		\N	4	17	27	27
2020-12-30	2020-12-30 14:31:02.418-05	{}	42	43	324	cat5e	connected		ff5722	\N		\N	4	17	27	27
2020-12-30	2020-12-30 14:31:02.581-05	{}	43	55	374	cat5e	connected		ff5722	\N		\N	5	18	27	27
2020-12-30	2020-12-30 14:31:02.693-05	{}	44	56	375	cat5e	connected		ff5722	\N		\N	5	18	27	27
2020-12-30	2020-12-30 14:31:02.802-05	{}	45	68	425	cat5e	connected		ff5722	\N		\N	6	19	27	27
2020-12-30	2020-12-30 14:31:02.91-05	{}	46	69	426	cat5e	connected		ff5722	\N		\N	6	19	27	27
2020-12-30	2020-12-30 14:31:03.019-05	{}	47	81	476	cat5e	connected		ff5722	\N		\N	7	20	27	27
2020-12-30	2020-12-30 14:31:03.126-05	{}	48	82	477	cat5e	connected		ff5722	\N		\N	7	20	27	27
2020-12-30	2020-12-30 14:31:03.234-05	{}	49	94	527	cat5e	connected		ff5722	\N		\N	8	21	27	27
2020-12-30	2020-12-30 14:31:03.343-05	{}	50	95	528	cat5e	connected		ff5722	\N		\N	8	21	27	27
2020-12-30	2020-12-30 14:31:03.451-05	{}	51	107	578	cat5e	connected		ff5722	\N		\N	9	22	27	27
2020-12-30	2020-12-30 14:31:03.559-05	{}	52	108	579	cat5e	connected		ff5722	\N		\N	9	22	27	27
2020-12-30	2020-12-30 14:31:03.689-05	{}	53	120	629	cat5e	connected		ff5722	\N		\N	10	23	27	27
2020-12-30	2020-12-30 14:31:03.834-05	{}	54	121	630	cat5e	connected		ff5722	\N		\N	10	23	27	27
2020-12-30	2020-12-30 14:31:03.968-05	{}	55	133	680	cat5e	connected		ff5722	\N		\N	11	24	27	27
2020-12-30	2020-12-30 14:31:04.077-05	{}	56	134	681	cat5e	connected		ff5722	\N		\N	11	24	27	27
2020-12-30	2020-12-30 14:31:04.188-05	{}	57	146	731	cat5e	connected		ff5722	\N		\N	12	25	27	27
2020-12-30	2020-12-30 14:31:04.296-05	{}	58	147	732	cat5e	connected		ff5722	\N		\N	12	25	27	27
2020-12-30	2020-12-30 14:31:04.404-05	{}	59	159	782	cat5e	connected		ff5722	\N		\N	13	26	27	27
2020-12-30	2020-12-30 14:31:04.522-05	{}	60	160	783	cat5e	connected		ff5722	\N		\N	13	26	27	27
2020-12-30	2020-12-30 14:40:56.732-05	{}	61	1	1		connected		000000	\N		\N	1	27	37	34
2020-12-30	2020-12-30 14:40:56.742-05	{}	62	33	2		connected		000000	\N		\N	14	27	37	34
2020-12-30	2020-12-30 14:40:56.76-05	{}	63	2	57		connected		000000	\N		\N	2	34	37	34
2020-12-30	2020-12-30 14:40:56.77-05	{}	64	34	58		connected		000000	\N		\N	15	34	37	34
2020-12-30	2020-12-30 14:40:56.788-05	{}	65	3	65		connected		000000	\N		\N	3	35	37	34
2020-12-30	2020-12-30 14:40:56.797-05	{}	66	35	66		connected		000000	\N		\N	16	35	37	34
2020-12-30	2020-12-30 14:40:56.815-05	{}	67	4	73		connected		000000	\N		\N	4	36	37	34
2020-12-30	2020-12-30 14:40:56.824-05	{}	68	36	74		connected		000000	\N		\N	17	36	37	34
2020-12-30	2020-12-30 14:40:56.842-05	{}	69	5	81		connected		000000	\N		\N	5	37	37	34
2020-12-30	2020-12-30 14:40:56.851-05	{}	70	37	82		connected		000000	\N		\N	18	37	37	34
2020-12-30	2020-12-30 14:40:56.869-05	{}	71	6	89		connected		000000	\N		\N	6	38	37	34
2020-12-30	2020-12-30 14:40:56.878-05	{}	72	38	90		connected		000000	\N		\N	19	38	37	34
2020-12-30	2020-12-30 14:40:56.896-05	{}	73	7	97		connected		000000	\N		\N	7	39	37	34
2020-12-30	2020-12-30 14:40:56.905-05	{}	74	39	98		connected		000000	\N		\N	20	39	37	34
2020-12-30	2020-12-30 14:40:56.923-05	{}	75	8	105		connected		000000	\N		\N	8	40	37	34
2020-12-30	2020-12-30 14:40:56.932-05	{}	76	40	106		connected		000000	\N		\N	21	40	37	34
2020-12-30	2020-12-30 14:40:56.95-05	{}	77	9	113		connected		000000	\N		\N	9	41	37	34
2020-12-30	2020-12-30 14:40:56.96-05	{}	78	41	114		connected		000000	\N		\N	22	41	37	34
2020-12-30	2020-12-30 14:40:56.977-05	{}	79	10	121		connected		000000	\N		\N	10	42	37	34
2020-12-30	2020-12-30 14:40:56.987-05	{}	80	42	122		connected		000000	\N		\N	23	42	37	34
2020-12-30	2020-12-30 14:40:57.004-05	{}	81	11	129		connected		000000	\N		\N	11	43	37	34
2020-12-30	2020-12-30 14:40:57.014-05	{}	82	43	130		connected		000000	\N		\N	24	43	37	34
2020-12-30	2020-12-30 14:40:57.031-05	{}	83	12	137		connected		000000	\N		\N	12	44	37	34
2020-12-30	2020-12-30 14:40:57.041-05	{}	84	44	138		connected		000000	\N		\N	25	44	37	34
2020-12-30	2020-12-30 14:40:57.058-05	{}	85	13	145		connected		000000	\N		\N	13	45	37	34
2020-12-30	2020-12-30 14:40:57.068-05	{}	86	45	146		connected		000000	\N		\N	26	45	37	34
2021-04-02	2021-04-02 13:20:59.588-04	{}	87	36	1249		connected			\N		\N	\N	87	10	42
2021-04-02	2021-04-02 13:21:19.328-04	{}	88	37	1252		connected			\N		\N	\N	90	10	42
2021-04-02	2021-04-02 13:21:39.935-04	{}	89	38	1250		connected			\N		\N	\N	88	10	42
2021-04-02	2021-04-02 13:21:50.002-04	{}	90	39	1253		connected			\N		\N	\N	91	10	42
2021-04-02	2021-04-02 13:22:07.748-04	{}	91	40	1251		connected			\N		\N	\N	89	10	42
2021-04-02	2021-04-02 13:22:15.9-04	{}	92	41	1254		connected			\N		\N	\N	92	10	42
2021-04-02	2021-04-02 13:39:57.916-04	{}	104	1018	1297		connected			\N		\N	96	88	27	25
2021-04-02	2021-04-02 13:39:58.377-04	{}	105	1019	1298		connected			\N		\N	96	88	27	25
2021-04-02	2021-04-02 13:39:58.757-04	{}	106	1066	1299		connected			\N		\N	97	88	27	25
2021-04-02	2021-04-02 13:39:59.151-04	{}	107	1067	1300		connected			\N		\N	97	88	27	25
2021-04-02	2021-04-02 13:39:59.589-04	{}	108	1020	1345		connected			\N		\N	96	89	27	25
2021-04-02	2021-04-02 13:39:59.974-04	{}	109	1021	1346		connected			\N		\N	96	89	27	25
2021-04-02	2021-04-02 13:40:00.363-04	{}	110	1068	1347		connected			\N		\N	97	89	27	25
2021-04-02	2021-04-02 13:40:00.808-04	{}	111	1069	1348		connected			\N		\N	97	89	27	25
2021-04-02	2021-04-02 13:40:01.192-04	{}	112	1022	1249		connected			\N		\N	96	87	27	25
2021-04-02	2021-04-02 13:40:01.579-04	{}	113	1023	1250		connected			\N		\N	96	87	27	25
2021-04-02	2021-04-02 13:40:02.026-04	{}	114	1070	1251		connected			\N		\N	97	87	27	25
2021-04-02	2021-04-02 13:40:02.411-04	{}	115	1071	1252		connected			\N		\N	97	87	27	25
2021-04-02	2021-04-02 13:42:41.447-04	{}	116	916	1441		connected			\N		\N	94	91	27	25
2021-04-02	2021-04-02 13:42:41.896-04	{}	117	917	1442		connected			\N		\N	94	91	27	25
2021-04-02	2021-04-02 13:42:42.269-04	{}	118	918	1443		connected			\N		\N	94	91	27	25
2021-04-02	2021-04-02 13:42:42.659-04	{}	119	919	1444		connected			\N		\N	94	91	27	25
2021-04-02	2021-04-02 13:42:43.105-04	{}	120	969	1489		connected			\N		\N	95	92	27	25
2021-04-02	2021-04-02 13:42:43.486-04	{}	121	970	1490		connected			\N		\N	95	92	27	25
2021-04-02	2021-04-02 13:42:43.883-04	{}	122	971	1491		connected			\N		\N	95	92	27	25
2021-04-02	2021-04-02 13:42:44.327-04	{}	123	972	1492		connected			\N		\N	95	92	27	25
2021-04-02	2021-04-02 13:42:44.717-04	{}	124	863	1393		connected			\N		\N	93	90	27	25
2021-04-02	2021-04-02 13:42:45.141-04	{}	125	864	1394		connected			\N		\N	93	90	27	25
2021-04-02	2021-04-02 13:42:45.551-04	{}	126	865	1395		connected			\N		\N	93	90	27	25
2021-04-02	2021-04-02 13:42:45.935-04	{}	127	866	1396		connected			\N		\N	93	90	27	25
\.


--
-- Data for Name: dcim_cablepath; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cablepath (id, origin_id, destination_id, path, is_active, is_split, destination_type_id, origin_type_id) FROM stdin;
29	3	170	{46:35}	t	f	27	27
30	4	171	{46:36}	t	f	27	27
31	170	3	{46:35}	t	f	27	27
32	171	4	{46:36}	t	f	27	27
35	16	221	{46:37}	t	f	27	27
36	17	222	{46:38}	t	f	27	27
37	221	16	{46:37}	t	f	27	27
38	222	17	{46:38}	t	f	27	27
41	29	272	{46:39}	t	f	27	27
42	30	273	{46:40}	t	f	27	27
43	272	29	{46:39}	t	f	27	27
44	273	30	{46:40}	t	f	27	27
47	42	323	{46:41}	t	f	27	27
48	43	324	{46:42}	t	f	27	27
49	323	42	{46:41}	t	f	27	27
50	324	43	{46:42}	t	f	27	27
53	55	374	{46:43}	t	f	27	27
54	56	375	{46:44}	t	f	27	27
55	374	55	{46:43}	t	f	27	27
56	375	56	{46:44}	t	f	27	27
59	68	425	{46:45}	t	f	27	27
60	69	426	{46:46}	t	f	27	27
61	425	68	{46:45}	t	f	27	27
62	426	69	{46:46}	t	f	27	27
65	81	476	{46:47}	t	f	27	27
66	82	477	{46:48}	t	f	27	27
67	476	81	{46:47}	t	f	27	27
68	477	82	{46:48}	t	f	27	27
71	94	527	{46:49}	t	f	27	27
72	95	528	{46:50}	t	f	27	27
73	527	94	{46:49}	t	f	27	27
74	528	95	{46:50}	t	f	27	27
77	107	578	{46:51}	t	f	27	27
78	108	579	{46:52}	t	f	27	27
79	578	107	{46:51}	t	f	27	27
80	579	108	{46:52}	t	f	27	27
83	120	629	{46:53}	t	f	27	27
84	121	630	{46:54}	t	f	27	27
85	629	120	{46:53}	t	f	27	27
86	630	121	{46:54}	t	f	27	27
89	133	680	{46:55}	t	f	27	27
90	134	681	{46:56}	t	f	27	27
91	680	133	{46:55}	t	f	27	27
92	681	134	{46:56}	t	f	27	27
95	146	731	{46:57}	t	f	27	27
96	147	732	{46:58}	t	f	27	27
97	731	146	{46:57}	t	f	27	27
98	732	147	{46:58}	t	f	27	27
101	159	782	{46:59}	t	f	27	27
102	160	783	{46:60}	t	f	27	27
103	782	159	{46:59}	t	f	27	27
104	783	160	{46:60}	t	f	27	27
105	1	1	{46:61}	t	f	37	34
106	2	33	{46:62}	t	f	37	34
107	57	2	{46:63}	t	f	37	34
108	58	34	{46:64}	t	f	37	34
109	65	3	{46:65}	t	f	37	34
110	66	35	{46:66}	t	f	37	34
111	73	4	{46:67}	t	f	37	34
112	74	36	{46:68}	t	f	37	34
113	81	5	{46:69}	t	f	37	34
114	82	37	{46:70}	t	f	37	34
115	89	6	{46:71}	t	f	37	34
116	90	38	{46:72}	t	f	37	34
117	97	7	{46:73}	t	f	37	34
118	98	39	{46:74}	t	f	37	34
119	105	8	{46:75}	t	f	37	34
120	106	40	{46:76}	t	f	37	34
121	113	9	{46:77}	t	f	37	34
122	114	41	{46:78}	t	f	37	34
123	121	10	{46:79}	t	f	37	34
124	122	42	{46:80}	t	f	37	34
125	129	11	{46:81}	t	f	37	34
126	130	43	{46:82}	t	f	37	34
127	137	12	{46:83}	t	f	37	34
128	138	44	{46:84}	t	f	37	34
129	145	13	{46:85}	t	f	37	34
130	146	45	{46:86}	t	f	37	34
131	1	1	{46:61}	t	f	34	37
132	33	2	{46:62}	t	f	34	37
133	2	57	{46:63}	t	f	34	37
134	34	58	{46:64}	t	f	34	37
135	3	65	{46:65}	t	f	34	37
136	35	66	{46:66}	t	f	34	37
137	4	73	{46:67}	t	f	34	37
138	36	74	{46:68}	t	f	34	37
139	5	81	{46:69}	t	f	34	37
140	37	82	{46:70}	t	f	34	37
141	6	89	{46:71}	t	f	34	37
142	38	90	{46:72}	t	f	34	37
143	7	97	{46:73}	t	f	34	37
144	39	98	{46:74}	t	f	34	37
145	8	105	{46:75}	t	f	34	37
146	40	106	{46:76}	t	f	34	37
147	9	113	{46:77}	t	f	34	37
148	41	114	{46:78}	t	f	34	37
149	10	121	{46:79}	t	f	34	37
150	42	122	{46:80}	t	f	34	37
151	11	129	{46:81}	t	f	34	37
152	43	130	{46:82}	t	f	34	37
153	12	137	{46:83}	t	f	34	37
154	44	138	{46:84}	t	f	34	37
155	13	145	{46:85}	t	f	34	37
156	45	146	{46:86}	t	f	34	37
\.


--
-- Data for Name: dcim_consoleport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleport (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, speed, _cable_peer_type_id, _path_id, cable_id, device_id) FROM stdin;
2021-04-14	2021-04-14 13:36:00.262-04	{}	1	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	1
2021-04-14	2021-04-14 13:36:00.262-04	{}	2	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	1
2021-04-14	2021-04-14 13:36:00.262-04	{}	3	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	2
2021-04-14	2021-04-14 13:36:00.262-04	{}	4	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	2
2021-04-14	2021-04-14 13:36:00.262-04	{}	5	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	3
2021-04-14	2021-04-14 13:36:00.262-04	{}	6	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	3
2021-04-14	2021-04-14 13:36:00.262-04	{}	7	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	4
2021-04-14	2021-04-14 13:36:00.262-04	{}	8	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	4
2021-04-14	2021-04-14 13:36:00.262-04	{}	9	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	5
2021-04-14	2021-04-14 13:36:00.262-04	{}	10	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	5
2021-04-14	2021-04-14 13:36:00.262-04	{}	11	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	6
2021-04-14	2021-04-14 13:36:00.262-04	{}	12	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	6
2021-04-14	2021-04-14 13:36:00.262-04	{}	13	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	7
2021-04-14	2021-04-14 13:36:00.262-04	{}	14	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	7
2021-04-14	2021-04-14 13:36:00.262-04	{}	15	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	8
2021-04-14	2021-04-14 13:36:00.262-04	{}	16	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	8
2021-04-14	2021-04-14 13:36:00.262-04	{}	17	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	9
2021-04-14	2021-04-14 13:36:00.262-04	{}	18	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	9
2021-04-14	2021-04-14 13:36:00.262-04	{}	19	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	10
2021-04-14	2021-04-14 13:36:00.262-04	{}	20	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	10
2021-04-14	2021-04-14 13:36:00.262-04	{}	21	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	11
2021-04-14	2021-04-14 13:36:00.262-04	{}	22	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	11
2021-04-14	2021-04-14 13:36:00.262-04	{}	23	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	12
2021-04-14	2021-04-14 13:36:00.262-04	{}	24	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	12
2021-04-14	2021-04-14 13:36:00.262-04	{}	25	con 0	con 00000000			\N	f	rj-45	\N	\N	\N	\N	13
2021-04-14	2021-04-14 13:36:00.262-04	{}	26	usb	usb			\N	f	usb-mini-b	\N	\N	\N	\N	13
2021-04-14	2021-04-14 13:36:00.262-04	{}	27	Console	Console			\N	f	rj-45	\N	\N	\N	\N	93
2021-04-14	2021-04-14 13:36:00.262-04	{}	28	Console	Console			\N	f	rj-45	\N	\N	\N	\N	94
2021-04-14	2021-04-14 13:36:00.262-04	{}	29	Console	Console			\N	f	rj-45	\N	\N	\N	\N	95
2021-04-14	2021-04-14 13:36:00.262-04	{}	30	Console-RE0	Console-RE00000000			\N	f	rj-45	\N	\N	\N	\N	96
2021-04-14	2021-04-14 13:36:00.262-04	{}	31	Console-RE1	Console-RE00000001			\N	f	rj-45	\N	\N	\N	\N	96
2021-04-14	2021-04-14 13:36:00.262-04	{}	32	Console-RE0	Console-RE00000000			\N	f	rj-45	\N	\N	\N	\N	97
2021-04-14	2021-04-14 13:36:00.262-04	{}	33	Console-RE1	Console-RE00000001			\N	f	rj-45	\N	\N	\N	\N	97
\.


--
-- Data for Name: dcim_consoleporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleporttemplate (created, last_updated, id, name, _name, label, description, type, device_type_id) FROM stdin;
2021-04-14	2021-04-14 13:36:00.327-04	1	Console-RE0	Console-RE00000000			rj-45	1
2021-04-14	2021-04-14 13:36:00.327-04	2	Console-RE1	Console-RE00000001			rj-45	1
2021-04-14	2021-04-14 13:36:00.327-04	3	Console	Console			rj-45	2
2021-04-14	2021-04-14 13:36:00.327-04	4	Console-RE0	Console-RE00000000			rj-45	3
2021-04-14	2021-04-14 13:36:00.327-04	5	Console-RE1	Console-RE00000001			rj-45	3
2021-04-14	2021-04-14 13:36:00.327-04	6	Console	Console			rj-45	4
2021-04-14	2021-04-14 13:36:00.327-04	7	Console	Console			rj-45	5
2021-04-14	2021-04-14 13:36:00.327-04	8	con 0	con 00000000			rj-45	6
2021-04-14	2021-04-14 13:36:00.327-04	9	usb	usb			usb-mini-b	6
2021-04-14	2021-04-14 13:36:00.327-04	10	Console	Console			rj-45	12
2021-04-14	2021-04-14 13:36:00.327-04	11	Console	Console			rj-45	13
\.


--
-- Data for Name: dcim_consoleserverport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverport (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, speed, _cable_peer_type_id, _path_id, cable_id, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverporttemplate (created, last_updated, id, name, _name, label, description, type, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_device; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_device (created, last_updated, custom_field_data, id, local_context_data, name, _name, serial, asset_tag, "position", face, status, vc_position, vc_priority, comments, cluster_id, device_role_id, device_type_id, location_id, platform_id, primary_ip4_id, primary_ip6_id, rack_id, site_id, tenant_id, virtual_chassis_id) FROM stdin;
2020-12-20	2020-12-19 21:51:03.257-05	{}	1	\N	dmi01-akron-rtr01	dmi00000001-akron-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	1	2	5	\N
2020-12-20	2020-12-19 21:51:32.863-05	{}	2	\N	dmi01-albany-rtr01	dmi00000001-albany-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	2	3	5	\N
2020-12-20	2020-12-19 21:52:02.614-05	{}	3	\N	dmi01-binghamton-rtr01	dmi00000001-binghamton-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	3	4	5	\N
2020-12-20	2020-12-19 21:52:26.146-05	{}	4	\N	dmi01-buffalo-rtr01	dmi00000001-buffalo-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	4	5	5	\N
2020-12-20	2020-12-19 21:53:47.838-05	{}	5	\N	dmi01-camden-rtr01	dmi00000001-camden-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	5	6	5	\N
2020-12-20	2020-12-19 21:54:08.2-05	{}	6	\N	dmi01-nashua-rtr01	dmi00000001-nashua-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	6	7	5	\N
2020-12-20	2020-12-19 21:55:17.095-05	{}	7	\N	dmi01-pittsfield-rtr01	dmi00000001-pittsfield-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	7	8	5	\N
2020-12-20	2020-12-19 21:55:35.846-05	{}	8	\N	dmi01-rochester-rtr01	dmi00000001-rochester-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	8	9	5	\N
2020-12-20	2020-12-19 21:55:49.316-05	{}	9	\N	dmi01-scranton-rtr01	dmi00000001-scranton-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	9	10	5	\N
2020-12-20	2020-12-19 21:56:06.592-05	{}	10	\N	dmi01-stamford-rtr01	dmi00000001-stamford-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	10	11	5	\N
2020-12-20	2020-12-19 21:56:24.173-05	{}	11	\N	dmi01-syracuse-rtr01	dmi00000001-syracuse-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	11	12	5	\N
2020-12-20	2020-12-19 21:56:38.212-05	{}	12	\N	dmi01-utica-rtr01	dmi00000001-utica-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	12	13	5	\N
2020-12-20	2020-12-19 21:56:52.908-05	{}	13	\N	dmi01-yonkers-rtr01	dmi00000001-yonkers-rtr00000001		\N	4	front	active	\N	\N		\N	1	6	\N	1	\N	\N	13	14	5	\N
2020-12-22	2020-12-21 21:11:11.625-05	{}	14	\N	dmi01-akron-sw01	dmi00000001-akron-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	1	2	5	\N
2020-12-22	2020-12-21 21:11:11.714-05	{}	15	\N	dmi01-albany-sw01	dmi00000001-albany-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	2	3	5	\N
2020-12-22	2020-12-21 21:11:11.799-05	{}	16	\N	dmi01-binghamton-sw01	dmi00000001-binghamton-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	3	4	5	\N
2020-12-22	2020-12-21 21:11:11.883-05	{}	17	\N	dmi01-buffalo-sw01	dmi00000001-buffalo-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	4	5	5	\N
2020-12-22	2020-12-21 21:11:11.968-05	{}	18	\N	dmi01-camden-sw01	dmi00000001-camden-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	5	6	5	\N
2020-12-22	2020-12-21 21:11:12.071-05	{}	19	\N	dmi01-nashua-sw01	dmi00000001-nashua-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	6	7	5	\N
2020-12-22	2020-12-21 21:11:12.204-05	{}	20	\N	dmi01-pittsfield-sw01	dmi00000001-pittsfield-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	7	8	5	\N
2020-12-22	2020-12-21 21:11:12.287-05	{}	21	\N	dmi01-rochster-sw01	dmi00000001-rochster-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	8	9	5	\N
2020-12-22	2020-12-21 21:11:12.37-05	{}	22	\N	dmi01-scranton-sw01	dmi00000001-scranton-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	9	10	5	\N
2020-12-22	2020-12-21 21:11:12.454-05	{}	23	\N	dmi01-stamford-sw01	dmi00000001-stamford-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	10	11	5	\N
2020-12-22	2020-12-21 21:11:12.54-05	{}	24	\N	dmi01-syracuse-sw01	dmi00000001-syracuse-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	11	12	5	\N
2020-12-22	2020-12-21 21:11:12.622-05	{}	25	\N	dmi01-utica-sw01	dmi00000001-utica-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	12	13	5	\N
2020-12-22	2020-12-21 21:11:12.705-05	{}	26	\N	dmi01-yonkers-sw01	dmi00000001-yonkers-sw00000001		\N	10	front	active	\N	\N		\N	4	7	\N	\N	\N	\N	13	14	5	\N
2020-12-22	2020-12-30 14:02:55.76-05	{}	27	\N	dmi01-akron-pdu01	dmi00000001-akron-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	1	2	5	\N
2020-12-22	2020-12-30 14:02:55.909-05	{}	34	\N	dmi01-albany-pdu01	dmi00000001-albany-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	2	3	5	\N
2020-12-22	2020-12-30 14:02:56.038-05	{}	35	\N	dmi01-binghamton-pdu01	dmi00000001-binghamton-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	3	4	5	\N
2020-12-22	2020-12-30 14:02:56.155-05	{}	36	\N	dmi01-buffalo-pdu01	dmi00000001-buffalo-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	4	5	5	\N
2020-12-22	2020-12-30 14:02:56.256-05	{}	37	\N	dmi01-camden-pdu01	dmi00000001-camden-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	5	6	5	\N
2020-12-22	2020-12-30 14:02:56.357-05	{}	38	\N	dmi01-nashua-pdu01	dmi00000001-nashua-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	6	7	5	\N
2020-12-22	2020-12-30 14:02:56.46-05	{}	39	\N	dmi01-pittsfield-pdu01	dmi00000001-pittsfield-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	7	8	5	\N
2020-12-22	2020-12-30 14:02:56.562-05	{}	40	\N	dmi01-rochester-pdu01	dmi00000001-rochester-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	8	9	5	\N
2020-12-22	2020-12-30 14:02:56.664-05	{}	41	\N	dmi01-scranton-pdu01	dmi00000001-scranton-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	9	10	5	\N
2020-12-22	2020-12-30 14:02:56.767-05	{}	42	\N	dmi01-stamford-pdu01	dmi00000001-stamford-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	10	11	5	\N
2020-12-22	2020-12-30 14:02:56.87-05	{}	43	\N	dmi01-syracuse-pdu01	dmi00000001-syracuse-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	11	12	5	\N
2020-12-22	2020-12-30 14:02:56.973-05	{}	44	\N	dmi01-utica-pdu01	dmi00000001-utica-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	12	13	5	\N
2020-12-22	2020-12-30 14:02:57.075-05	{}	45	\N	dmi01-yonkers-pdu01	dmi00000001-yonkers-pdu00000001		\N	1	front	active	\N	\N		\N	5	8	\N	\N	\N	\N	13	14	5	\N
2020-12-30	2020-12-30 15:44:53.681-05	{}	74	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	1	2	\N	\N
2020-12-30	2020-12-30 15:44:53.808-05	{}	75	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	2	3	\N	\N
2020-12-30	2020-12-30 15:44:53.932-05	{}	76	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	3	4	\N	\N
2020-12-30	2020-12-30 15:44:54.054-05	{}	77	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	4	5	\N	\N
2020-12-30	2020-12-30 15:44:54.176-05	{}	78	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	5	6	\N	\N
2020-12-30	2020-12-30 15:44:54.297-05	{}	79	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	6	7	\N	\N
2020-12-30	2020-12-30 15:44:54.419-05	{}	80	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	7	8	\N	\N
2020-12-30	2020-12-30 15:44:54.541-05	{}	81	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	8	9	\N	\N
2020-12-30	2020-12-30 15:44:54.661-05	{}	82	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	9	10	\N	\N
2020-12-30	2020-12-30 15:44:54.785-05	{}	83	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	10	11	\N	\N
2020-12-30	2020-12-30 15:44:54.912-05	{}	84	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	11	12	\N	\N
2020-12-30	2020-12-30 15:44:55.035-05	{}	85	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	12	13	\N	\N
2020-12-30	2020-12-30 15:44:55.158-05	{}	86	\N	\N	\N		\N	11	front	active	\N	\N		\N	6	10	\N	\N	\N	\N	13	14	\N	\N
2021-04-02	2021-04-02 13:16:58.069-04	{}	87	\N	PP:B128	PP:B00000128		\N	39	front	active	\N	\N		\N	6	11	\N	\N	\N	\N	41	21	13	\N
2021-04-02	2021-04-02 13:17:28.425-04	{}	88	\N	PP:B117	PP:B00000117		\N	37	front	active	\N	\N		\N	6	11	\N	\N	\N	\N	41	21	13	\N
2021-04-02	2021-04-02 13:17:57.268-04	{}	89	\N	PP:B118	PP:B00000118		\N	35	front	active	\N	\N		\N	6	11	\N	\N	\N	\N	41	21	13	\N
2021-04-02	2021-04-02 13:19:12.87-04	{}	90	\N	PP:MDF	PP:MDF		\N	39	front	active	\N	\N		\N	6	11	\N	\N	\N	\N	39	24	13	\N
2021-04-02	2021-04-02 13:19:41.498-04	{}	91	\N	PP:MDF	PP:MDF		\N	39	front	active	\N	\N		\N	6	11	\N	\N	\N	\N	40	22	13	\N
2021-04-02	2021-04-02 13:20:15.226-04	{}	92	\N	PP:MDF	PP:MDF		\N	39	front	active	\N	\N		\N	6	11	\N	\N	\N	\N	38	23	13	\N
2021-04-02	2021-04-02 13:28:42.498-04	{}	93	\N	ncsu128-distswitch1	ncsu00000128-distswitch00000001		\N	32	front	active	\N	\N		\N	3	12	\N	\N	\N	\N	39	24	13	\N
2021-04-02	2021-04-02 13:29:22.719-04	{}	94	\N	ncsu117-distswitch1	ncsu00000117-distswitch00000001		\N	36	front	active	\N	\N		\N	3	12	\N	\N	\N	\N	40	22	13	\N
2021-04-02	2021-04-02 13:29:56.066-04	{}	95	\N	ncsu118-distswitch1	ncsu00000118-distswitch00000001		\N	36	front	active	\N	\N		\N	3	12	\N	\N	\N	\N	38	23	13	\N
2021-04-02	2021-04-02 13:31:41.398-04	{}	96	\N	ncsu-coreswitch1	ncsu-coreswitch00000001		\N	6	front	active	\N	\N		\N	2	3	1	\N	\N	\N	16	21	13	\N
2021-04-02	2021-04-02 13:31:56.519-04	{}	97	\N	ncsu-coreswitch2	ncsu-coreswitch00000002		\N	6	front	active	\N	\N		\N	2	3	1	\N	\N	\N	17	21	13	\N
\.


--
-- Data for Name: dcim_devicebay; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebay (created, last_updated, custom_field_data, id, name, _name, label, description, device_id, installed_device_id) FROM stdin;
2021-04-14	2021-04-14 13:36:00.964-04	{}	1	Linecard0	Linecard00000000			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	2	Linecard1	Linecard00000001			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	3	Linecard2	Linecard00000002			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	4	Linecard3	Linecard00000003			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	5	Linecard4	Linecard00000004			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	6	Linecard5	Linecard00000005			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	7	Linecard7	Linecard00000007			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	8	Linecard8	Linecard00000008			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	9	Linecard9	Linecard00000009			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	10	Linecard10	Linecard00000010			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	11	Linecard11	Linecard00000011			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	12	RE0/SF0	RE00000000/SF00000000			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	13	RE1/SF1	RE00000001/SF00000001			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	14	SF2/Linecard6	SF00000002/Linecard00000006			96	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	15	Linecard0	Linecard00000000			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	16	Linecard1	Linecard00000001			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	17	Linecard2	Linecard00000002			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	18	Linecard3	Linecard00000003			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	19	Linecard4	Linecard00000004			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	20	Linecard5	Linecard00000005			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	21	Linecard7	Linecard00000007			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	22	Linecard8	Linecard00000008			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	23	Linecard9	Linecard00000009			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	24	Linecard10	Linecard00000010			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	25	Linecard11	Linecard00000011			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	26	RE0/SF0	RE00000000/SF00000000			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	27	RE1/SF1	RE00000001/SF00000001			97	\N
2021-04-14	2021-04-14 13:36:00.964-04	{}	28	SF2/Linecard6	SF00000002/Linecard00000006			97	\N
\.


--
-- Data for Name: dcim_devicebaytemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebaytemplate (created, last_updated, id, name, _name, label, description, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicerole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicerole (created, last_updated, custom_field_data, id, name, slug, color, vm_role, description) FROM stdin;
2020-12-20	2020-12-19 21:35:49.028-05	{}	1	Router	router	4caf50	f	
2020-12-20	2020-12-19 21:36:13.233-05	{}	2	Core Switch	core-switch	3f51b5	f	
2020-12-20	2020-12-19 21:36:32.188-05	{}	3	Distribution Switch	distribution-switch	2196f3	f	
2020-12-20	2020-12-19 21:36:50.803-05	{}	4	Access Switch	access-switch	03a9f4	f	
2020-12-22	2020-12-21 21:41:52.606-05	{}	5	PDU	pdu	607d8b	f	
2020-12-30	2020-12-30 15:38:34.255-05	{}	6	Patch Panel	patch-panel	607d8b	f	
2021-04-05	2021-04-05 16:52:54.339-04	{}	7	Application Server	application-server	2f6a31	t	
2021-04-05	2021-04-05 16:53:04.759-04	{}	8	Database Server	database-server	cddc39	t	
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicetype (created, last_updated, custom_field_data, id, model, slug, part_number, u_height, is_full_depth, subdevice_role, front_image, rear_image, comments, manufacturer_id) FROM stdin;
2020-12-18	2020-12-17 22:23:09.308-05	{}	1	MX480	mx480		8	t	parent			[Juniper MX480 Data Sheet](https://www.juniper.net/us/en/products-services/routing/mx-series/mx480/)	7
2020-12-18	2020-12-17 22:24:13.186-05	{}	2	MX80	mx80		2	t					7
2020-12-18	2020-12-17 22:25:00.835-05	{}	3	EX9214	ex9214		16	t	parent			[Juniper EX9214 Data Sheet](https://www.juniper.net/us/en/local/pdf/datasheets/1000432-en.pdf)	7
2020-12-18	2020-12-17 22:25:47.972-05	{}	4	EX4200-48T	ex4200-48t		1	t				[Juniper EX4200 Data Sheet](https://www.juniper.net/assets/us/en/local/pdf/datasheets/1000215-en.pdf)	7
2020-12-18	2020-12-17 22:27:36.824-05	{}	5	QFX5100-48T-6Q	qfx5100-48t-6q		1	t				[Juniper QFX5100 Data Sheet](https://www.juniper.net/us/en/products-services/switching/qfx-series/qfx5100/)	7
2020-12-20	2020-12-19 21:08:50.431-05	{}	6	ISR 1111-8P	isr1111	C1111-8P	1	f					3
2020-12-22	2020-12-21 20:54:33.417-05	{}	7	C9200-48P	c9200-48p	C9200-48P	1	t				[Cisco Catalyst 9200 Series Switches Data Sheet](https://www.cisco.com/c/en/us/products/collateral/switches/catalyst-9200-series-switches/nb-06-cat9200-ser-data-sheet-cte-en.html)	3
2020-12-22	2020-12-21 21:26:08.093-05	{}	8	AP7901	ap7901	AP7901B	1	f					11
2020-12-30	2020-12-30 15:35:26.266-05	{}	9	24-Port Patch Panel	24-port-patch-panel		1	f					12
2020-12-30	2020-12-30 15:40:56.394-05	{}	10	48-Port Patch Panel	48-port-patch-panel		2	f					12
2021-04-02	2021-04-02 13:12:15.02-04	{}	11	48-Pair Fiber Panel	48-pair-fiber-panel		2	f					13
2021-04-02	2021-04-02 13:26:18.349-04	{}	12	QFX5110-48S-4C	qfx5110-48s-4c		1	t					7
2021-04-02	2021-04-02 13:27:20.684-04	{}	13	QFX10002-36Q	qfx10002-36q		2	t				[Juniper QFX10002 Data Sheet](https://www.juniper.net/assets/us/en/local/pdf/datasheets/1000531-en.pdf)	7
\.


--
-- Data for Name: dcim_frontport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontport (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, rear_port_position, _cable_peer_type_id, cable_id, device_id, rear_port_id, color) FROM stdin;
2021-04-14	2021-04-14 13:36:01.336-04	{}	625	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	74	625	
2021-04-14	2021-04-14 13:36:01.336-04	{}	626	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	74	626	
2021-04-14	2021-04-14 13:36:01.336-04	{}	627	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	74	627	
2021-04-14	2021-04-14 13:36:01.336-04	{}	628	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	74	628	
2021-04-14	2021-04-14 13:36:01.336-04	{}	629	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	74	629	
2021-04-14	2021-04-14 13:36:01.336-04	{}	630	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	74	630	
2021-04-14	2021-04-14 13:36:01.336-04	{}	631	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	74	631	
2021-04-14	2021-04-14 13:36:01.336-04	{}	632	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	74	632	
2021-04-14	2021-04-14 13:36:01.336-04	{}	633	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	74	633	
2021-04-14	2021-04-14 13:36:01.336-04	{}	634	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	74	634	
2021-04-14	2021-04-14 13:36:01.336-04	{}	635	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	74	635	
2021-04-14	2021-04-14 13:36:01.336-04	{}	636	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	74	636	
2021-04-14	2021-04-14 13:36:01.336-04	{}	637	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	74	637	
2021-04-14	2021-04-14 13:36:01.336-04	{}	638	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	74	638	
2021-04-14	2021-04-14 13:36:01.336-04	{}	639	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	74	639	
2021-04-14	2021-04-14 13:36:01.336-04	{}	640	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	74	640	
2021-04-14	2021-04-14 13:36:01.336-04	{}	641	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	74	641	
2021-04-14	2021-04-14 13:36:01.336-04	{}	642	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	74	642	
2021-04-14	2021-04-14 13:36:01.336-04	{}	643	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	74	643	
2021-04-14	2021-04-14 13:36:01.336-04	{}	644	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	74	644	
2021-04-14	2021-04-14 13:36:01.336-04	{}	645	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	74	645	
2021-04-14	2021-04-14 13:36:01.336-04	{}	646	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	74	646	
2021-04-14	2021-04-14 13:36:01.336-04	{}	647	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	74	647	
2021-04-14	2021-04-14 13:36:01.336-04	{}	648	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	74	648	
2021-04-14	2021-04-14 13:36:01.336-04	{}	649	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	74	649	
2021-04-14	2021-04-14 13:36:01.336-04	{}	650	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	74	650	
2021-04-14	2021-04-14 13:36:01.336-04	{}	651	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	74	651	
2021-04-14	2021-04-14 13:36:01.336-04	{}	652	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	74	652	
2021-04-14	2021-04-14 13:36:01.336-04	{}	653	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	74	653	
2021-04-14	2021-04-14 13:36:01.336-04	{}	654	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	74	654	
2021-04-14	2021-04-14 13:36:01.336-04	{}	655	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	74	655	
2021-04-14	2021-04-14 13:36:01.336-04	{}	656	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	74	656	
2021-04-14	2021-04-14 13:36:01.336-04	{}	657	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	74	657	
2021-04-14	2021-04-14 13:36:01.336-04	{}	658	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	74	658	
2021-04-14	2021-04-14 13:36:01.336-04	{}	659	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	74	659	
2021-04-14	2021-04-14 13:36:01.336-04	{}	660	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	74	660	
2021-04-14	2021-04-14 13:36:01.336-04	{}	661	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	74	661	
2021-04-14	2021-04-14 13:36:01.336-04	{}	662	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	74	662	
2021-04-14	2021-04-14 13:36:01.336-04	{}	663	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	74	663	
2021-04-14	2021-04-14 13:36:01.336-04	{}	664	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	74	664	
2021-04-14	2021-04-14 13:36:01.336-04	{}	665	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	74	665	
2021-04-14	2021-04-14 13:36:01.336-04	{}	666	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	74	666	
2021-04-14	2021-04-14 13:36:01.336-04	{}	667	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	74	667	
2021-04-14	2021-04-14 13:36:01.336-04	{}	668	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	74	668	
2021-04-14	2021-04-14 13:36:01.336-04	{}	669	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	74	669	
2021-04-14	2021-04-14 13:36:01.336-04	{}	670	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	74	670	
2021-04-14	2021-04-14 13:36:01.336-04	{}	671	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	74	671	
2021-04-14	2021-04-14 13:36:01.336-04	{}	672	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	74	672	
2021-04-14	2021-04-14 13:36:01.336-04	{}	673	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	75	673	
2021-04-14	2021-04-14 13:36:01.336-04	{}	674	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	75	674	
2021-04-14	2021-04-14 13:36:01.336-04	{}	675	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	75	675	
2021-04-14	2021-04-14 13:36:01.336-04	{}	676	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	75	676	
2021-04-14	2021-04-14 13:36:01.336-04	{}	677	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	75	677	
2021-04-14	2021-04-14 13:36:01.336-04	{}	678	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	75	678	
2021-04-14	2021-04-14 13:36:01.336-04	{}	679	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	75	679	
2021-04-14	2021-04-14 13:36:01.336-04	{}	680	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	75	680	
2021-04-14	2021-04-14 13:36:01.336-04	{}	681	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	75	681	
2021-04-14	2021-04-14 13:36:01.336-04	{}	682	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	75	682	
2021-04-14	2021-04-14 13:36:01.336-04	{}	683	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	75	683	
2021-04-14	2021-04-14 13:36:01.336-04	{}	684	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	75	684	
2021-04-14	2021-04-14 13:36:01.336-04	{}	685	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	75	685	
2021-04-14	2021-04-14 13:36:01.336-04	{}	686	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	75	686	
2021-04-14	2021-04-14 13:36:01.336-04	{}	687	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	75	687	
2021-04-14	2021-04-14 13:36:01.336-04	{}	688	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	75	688	
2021-04-14	2021-04-14 13:36:01.336-04	{}	689	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	75	689	
2021-04-14	2021-04-14 13:36:01.336-04	{}	690	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	75	690	
2021-04-14	2021-04-14 13:36:01.336-04	{}	691	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	75	691	
2021-04-14	2021-04-14 13:36:01.336-04	{}	692	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	75	692	
2021-04-14	2021-04-14 13:36:01.336-04	{}	693	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	75	693	
2021-04-14	2021-04-14 13:36:01.336-04	{}	694	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	75	694	
2021-04-14	2021-04-14 13:36:01.336-04	{}	695	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	75	695	
2021-04-14	2021-04-14 13:36:01.336-04	{}	696	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	75	696	
2021-04-14	2021-04-14 13:36:01.336-04	{}	697	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	75	697	
2021-04-14	2021-04-14 13:36:01.336-04	{}	698	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	75	698	
2021-04-14	2021-04-14 13:36:01.336-04	{}	699	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	75	699	
2021-04-14	2021-04-14 13:36:01.336-04	{}	700	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	75	700	
2021-04-14	2021-04-14 13:36:01.336-04	{}	701	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	75	701	
2021-04-14	2021-04-14 13:36:01.336-04	{}	702	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	75	702	
2021-04-14	2021-04-14 13:36:01.336-04	{}	703	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	75	703	
2021-04-14	2021-04-14 13:36:01.336-04	{}	704	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	75	704	
2021-04-14	2021-04-14 13:36:01.336-04	{}	705	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	75	705	
2021-04-14	2021-04-14 13:36:01.336-04	{}	706	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	75	706	
2021-04-14	2021-04-14 13:36:01.336-04	{}	707	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	75	707	
2021-04-14	2021-04-14 13:36:01.336-04	{}	708	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	75	708	
2021-04-14	2021-04-14 13:36:01.336-04	{}	709	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	75	709	
2021-04-14	2021-04-14 13:36:01.336-04	{}	710	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	75	710	
2021-04-14	2021-04-14 13:36:01.336-04	{}	711	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	75	711	
2021-04-14	2021-04-14 13:36:01.336-04	{}	712	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	75	712	
2021-04-14	2021-04-14 13:36:01.336-04	{}	713	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	75	713	
2021-04-14	2021-04-14 13:36:01.336-04	{}	714	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	75	714	
2021-04-14	2021-04-14 13:36:01.336-04	{}	715	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	75	715	
2021-04-14	2021-04-14 13:36:01.336-04	{}	716	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	75	716	
2021-04-14	2021-04-14 13:36:01.336-04	{}	717	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	75	717	
2021-04-14	2021-04-14 13:36:01.336-04	{}	718	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	75	718	
2021-04-14	2021-04-14 13:36:01.336-04	{}	719	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	75	719	
2021-04-14	2021-04-14 13:36:01.336-04	{}	720	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	75	720	
2021-04-14	2021-04-14 13:36:01.336-04	{}	721	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	76	721	
2021-04-14	2021-04-14 13:36:01.336-04	{}	722	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	76	722	
2021-04-14	2021-04-14 13:36:01.336-04	{}	723	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	76	723	
2021-04-14	2021-04-14 13:36:01.336-04	{}	724	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	76	724	
2021-04-14	2021-04-14 13:36:01.336-04	{}	725	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	76	725	
2021-04-14	2021-04-14 13:36:01.336-04	{}	726	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	76	726	
2021-04-14	2021-04-14 13:36:01.336-04	{}	727	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	76	727	
2021-04-14	2021-04-14 13:36:01.336-04	{}	728	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	76	728	
2021-04-14	2021-04-14 13:36:01.336-04	{}	729	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	76	729	
2021-04-14	2021-04-14 13:36:01.336-04	{}	730	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	76	730	
2021-04-14	2021-04-14 13:36:01.336-04	{}	731	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	76	731	
2021-04-14	2021-04-14 13:36:01.336-04	{}	732	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	76	732	
2021-04-14	2021-04-14 13:36:01.336-04	{}	733	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	76	733	
2021-04-14	2021-04-14 13:36:01.336-04	{}	734	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	76	734	
2021-04-14	2021-04-14 13:36:01.336-04	{}	735	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	76	735	
2021-04-14	2021-04-14 13:36:01.336-04	{}	736	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	76	736	
2021-04-14	2021-04-14 13:36:01.336-04	{}	737	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	76	737	
2021-04-14	2021-04-14 13:36:01.336-04	{}	738	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	76	738	
2021-04-14	2021-04-14 13:36:01.336-04	{}	739	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	76	739	
2021-04-14	2021-04-14 13:36:01.336-04	{}	740	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	76	740	
2021-04-14	2021-04-14 13:36:01.336-04	{}	741	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	76	741	
2021-04-14	2021-04-14 13:36:01.336-04	{}	742	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	76	742	
2021-04-14	2021-04-14 13:36:01.336-04	{}	743	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	76	743	
2021-04-14	2021-04-14 13:36:01.336-04	{}	744	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	76	744	
2021-04-14	2021-04-14 13:36:01.336-04	{}	745	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	76	745	
2021-04-14	2021-04-14 13:36:01.336-04	{}	746	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	76	746	
2021-04-14	2021-04-14 13:36:01.336-04	{}	747	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	76	747	
2021-04-14	2021-04-14 13:36:01.336-04	{}	748	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	76	748	
2021-04-14	2021-04-14 13:36:01.336-04	{}	749	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	76	749	
2021-04-14	2021-04-14 13:36:01.336-04	{}	750	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	76	750	
2021-04-14	2021-04-14 13:36:01.336-04	{}	751	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	76	751	
2021-04-14	2021-04-14 13:36:01.336-04	{}	752	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	76	752	
2021-04-14	2021-04-14 13:36:01.336-04	{}	753	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	76	753	
2021-04-14	2021-04-14 13:36:01.336-04	{}	754	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	76	754	
2021-04-14	2021-04-14 13:36:01.336-04	{}	755	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	76	755	
2021-04-14	2021-04-14 13:36:01.336-04	{}	756	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	76	756	
2021-04-14	2021-04-14 13:36:01.336-04	{}	757	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	76	757	
2021-04-14	2021-04-14 13:36:01.336-04	{}	758	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	76	758	
2021-04-14	2021-04-14 13:36:01.336-04	{}	759	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	76	759	
2021-04-14	2021-04-14 13:36:01.336-04	{}	760	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	76	760	
2021-04-14	2021-04-14 13:36:01.336-04	{}	761	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	76	761	
2021-04-14	2021-04-14 13:36:01.336-04	{}	762	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	76	762	
2021-04-14	2021-04-14 13:36:01.336-04	{}	763	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	76	763	
2021-04-14	2021-04-14 13:36:01.336-04	{}	764	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	76	764	
2021-04-14	2021-04-14 13:36:01.336-04	{}	765	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	76	765	
2021-04-14	2021-04-14 13:36:01.336-04	{}	766	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	76	766	
2021-04-14	2021-04-14 13:36:01.336-04	{}	767	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	76	767	
2021-04-14	2021-04-14 13:36:01.336-04	{}	768	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	76	768	
2021-04-14	2021-04-14 13:36:01.336-04	{}	769	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	77	769	
2021-04-14	2021-04-14 13:36:01.336-04	{}	770	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	77	770	
2021-04-14	2021-04-14 13:36:01.336-04	{}	771	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	77	771	
2021-04-14	2021-04-14 13:36:01.336-04	{}	772	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	77	772	
2021-04-14	2021-04-14 13:36:01.336-04	{}	773	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	77	773	
2021-04-14	2021-04-14 13:36:01.336-04	{}	774	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	77	774	
2021-04-14	2021-04-14 13:36:01.336-04	{}	775	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	77	775	
2021-04-14	2021-04-14 13:36:01.336-04	{}	776	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	77	776	
2021-04-14	2021-04-14 13:36:01.336-04	{}	777	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	77	777	
2021-04-14	2021-04-14 13:36:01.336-04	{}	778	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	77	778	
2021-04-14	2021-04-14 13:36:01.336-04	{}	779	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	77	779	
2021-04-14	2021-04-14 13:36:01.336-04	{}	780	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	77	780	
2021-04-14	2021-04-14 13:36:01.336-04	{}	781	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	77	781	
2021-04-14	2021-04-14 13:36:01.336-04	{}	782	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	77	782	
2021-04-14	2021-04-14 13:36:01.336-04	{}	783	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	77	783	
2021-04-14	2021-04-14 13:36:01.336-04	{}	784	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	77	784	
2021-04-14	2021-04-14 13:36:01.336-04	{}	785	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	77	785	
2021-04-14	2021-04-14 13:36:01.336-04	{}	786	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	77	786	
2021-04-14	2021-04-14 13:36:01.336-04	{}	787	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	77	787	
2021-04-14	2021-04-14 13:36:01.336-04	{}	788	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	77	788	
2021-04-14	2021-04-14 13:36:01.336-04	{}	789	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	77	789	
2021-04-14	2021-04-14 13:36:01.336-04	{}	790	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	77	790	
2021-04-14	2021-04-14 13:36:01.336-04	{}	791	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	77	791	
2021-04-14	2021-04-14 13:36:01.336-04	{}	792	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	77	792	
2021-04-14	2021-04-14 13:36:01.336-04	{}	793	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	77	793	
2021-04-14	2021-04-14 13:36:01.336-04	{}	794	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	77	794	
2021-04-14	2021-04-14 13:36:01.336-04	{}	795	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	77	795	
2021-04-14	2021-04-14 13:36:01.336-04	{}	796	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	77	796	
2021-04-14	2021-04-14 13:36:01.336-04	{}	797	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	77	797	
2021-04-14	2021-04-14 13:36:01.336-04	{}	798	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	77	798	
2021-04-14	2021-04-14 13:36:01.336-04	{}	799	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	77	799	
2021-04-14	2021-04-14 13:36:01.336-04	{}	800	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	77	800	
2021-04-14	2021-04-14 13:36:01.336-04	{}	801	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	77	801	
2021-04-14	2021-04-14 13:36:01.336-04	{}	802	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	77	802	
2021-04-14	2021-04-14 13:36:01.336-04	{}	803	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	77	803	
2021-04-14	2021-04-14 13:36:01.336-04	{}	804	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	77	804	
2021-04-14	2021-04-14 13:36:01.336-04	{}	805	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	77	805	
2021-04-14	2021-04-14 13:36:01.336-04	{}	806	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	77	806	
2021-04-14	2021-04-14 13:36:01.336-04	{}	807	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	77	807	
2021-04-14	2021-04-14 13:36:01.336-04	{}	808	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	77	808	
2021-04-14	2021-04-14 13:36:01.336-04	{}	809	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	77	809	
2021-04-14	2021-04-14 13:36:01.336-04	{}	810	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	77	810	
2021-04-14	2021-04-14 13:36:01.336-04	{}	811	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	77	811	
2021-04-14	2021-04-14 13:36:01.336-04	{}	812	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	77	812	
2021-04-14	2021-04-14 13:36:01.336-04	{}	813	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	77	813	
2021-04-14	2021-04-14 13:36:01.336-04	{}	814	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	77	814	
2021-04-14	2021-04-14 13:36:01.336-04	{}	815	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	77	815	
2021-04-14	2021-04-14 13:36:01.336-04	{}	816	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	77	816	
2021-04-14	2021-04-14 13:36:01.336-04	{}	817	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	78	817	
2021-04-14	2021-04-14 13:36:01.336-04	{}	818	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	78	818	
2021-04-14	2021-04-14 13:36:01.336-04	{}	819	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	78	819	
2021-04-14	2021-04-14 13:36:01.336-04	{}	820	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	78	820	
2021-04-14	2021-04-14 13:36:01.336-04	{}	821	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	78	821	
2021-04-14	2021-04-14 13:36:01.336-04	{}	822	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	78	822	
2021-04-14	2021-04-14 13:36:01.336-04	{}	823	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	78	823	
2021-04-14	2021-04-14 13:36:01.336-04	{}	824	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	78	824	
2021-04-14	2021-04-14 13:36:01.336-04	{}	825	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	78	825	
2021-04-14	2021-04-14 13:36:01.336-04	{}	826	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	78	826	
2021-04-14	2021-04-14 13:36:01.336-04	{}	827	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	78	827	
2021-04-14	2021-04-14 13:36:01.336-04	{}	828	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	78	828	
2021-04-14	2021-04-14 13:36:01.336-04	{}	829	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	78	829	
2021-04-14	2021-04-14 13:36:01.336-04	{}	830	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	78	830	
2021-04-14	2021-04-14 13:36:01.336-04	{}	831	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	78	831	
2021-04-14	2021-04-14 13:36:01.336-04	{}	832	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	78	832	
2021-04-14	2021-04-14 13:36:01.336-04	{}	833	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	78	833	
2021-04-14	2021-04-14 13:36:01.336-04	{}	834	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	78	834	
2021-04-14	2021-04-14 13:36:01.336-04	{}	835	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	78	835	
2021-04-14	2021-04-14 13:36:01.336-04	{}	836	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	78	836	
2021-04-14	2021-04-14 13:36:01.336-04	{}	837	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	78	837	
2021-04-14	2021-04-14 13:36:01.336-04	{}	838	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	78	838	
2021-04-14	2021-04-14 13:36:01.336-04	{}	839	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	78	839	
2021-04-14	2021-04-14 13:36:01.336-04	{}	840	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	78	840	
2021-04-14	2021-04-14 13:36:01.336-04	{}	841	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	78	841	
2021-04-14	2021-04-14 13:36:01.336-04	{}	842	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	78	842	
2021-04-14	2021-04-14 13:36:01.336-04	{}	843	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	78	843	
2021-04-14	2021-04-14 13:36:01.336-04	{}	844	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	78	844	
2021-04-14	2021-04-14 13:36:01.336-04	{}	845	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	78	845	
2021-04-14	2021-04-14 13:36:01.336-04	{}	846	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	78	846	
2021-04-14	2021-04-14 13:36:01.336-04	{}	847	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	78	847	
2021-04-14	2021-04-14 13:36:01.336-04	{}	848	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	78	848	
2021-04-14	2021-04-14 13:36:01.336-04	{}	849	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	78	849	
2021-04-14	2021-04-14 13:36:01.336-04	{}	850	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	78	850	
2021-04-14	2021-04-14 13:36:01.336-04	{}	851	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	78	851	
2021-04-14	2021-04-14 13:36:01.336-04	{}	852	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	78	852	
2021-04-14	2021-04-14 13:36:01.336-04	{}	853	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	78	853	
2021-04-14	2021-04-14 13:36:01.336-04	{}	854	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	78	854	
2021-04-14	2021-04-14 13:36:01.336-04	{}	855	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	78	855	
2021-04-14	2021-04-14 13:36:01.336-04	{}	856	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	78	856	
2021-04-14	2021-04-14 13:36:01.336-04	{}	857	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	78	857	
2021-04-14	2021-04-14 13:36:01.336-04	{}	858	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	78	858	
2021-04-14	2021-04-14 13:36:01.336-04	{}	859	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	78	859	
2021-04-14	2021-04-14 13:36:01.336-04	{}	860	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	78	860	
2021-04-14	2021-04-14 13:36:01.336-04	{}	861	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	78	861	
2021-04-14	2021-04-14 13:36:01.336-04	{}	862	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	78	862	
2021-04-14	2021-04-14 13:36:01.336-04	{}	863	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	78	863	
2021-04-14	2021-04-14 13:36:01.336-04	{}	864	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	78	864	
2021-04-14	2021-04-14 13:36:01.336-04	{}	865	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	79	865	
2021-04-14	2021-04-14 13:36:01.336-04	{}	866	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	79	866	
2021-04-14	2021-04-14 13:36:01.336-04	{}	867	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	79	867	
2021-04-14	2021-04-14 13:36:01.336-04	{}	868	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	79	868	
2021-04-14	2021-04-14 13:36:01.336-04	{}	869	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	79	869	
2021-04-14	2021-04-14 13:36:01.336-04	{}	870	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	79	870	
2021-04-14	2021-04-14 13:36:01.336-04	{}	871	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	79	871	
2021-04-14	2021-04-14 13:36:01.336-04	{}	872	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	79	872	
2021-04-14	2021-04-14 13:36:01.336-04	{}	873	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	79	873	
2021-04-14	2021-04-14 13:36:01.336-04	{}	874	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	79	874	
2021-04-14	2021-04-14 13:36:01.336-04	{}	875	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	79	875	
2021-04-14	2021-04-14 13:36:01.336-04	{}	876	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	79	876	
2021-04-14	2021-04-14 13:36:01.336-04	{}	877	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	79	877	
2021-04-14	2021-04-14 13:36:01.336-04	{}	878	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	79	878	
2021-04-14	2021-04-14 13:36:01.336-04	{}	879	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	79	879	
2021-04-14	2021-04-14 13:36:01.336-04	{}	880	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	79	880	
2021-04-14	2021-04-14 13:36:01.336-04	{}	881	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	79	881	
2021-04-14	2021-04-14 13:36:01.336-04	{}	882	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	79	882	
2021-04-14	2021-04-14 13:36:01.336-04	{}	883	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	79	883	
2021-04-14	2021-04-14 13:36:01.336-04	{}	884	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	79	884	
2021-04-14	2021-04-14 13:36:01.336-04	{}	885	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	79	885	
2021-04-14	2021-04-14 13:36:01.336-04	{}	886	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	79	886	
2021-04-14	2021-04-14 13:36:01.336-04	{}	887	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	79	887	
2021-04-14	2021-04-14 13:36:01.336-04	{}	888	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	79	888	
2021-04-14	2021-04-14 13:36:01.336-04	{}	889	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	79	889	
2021-04-14	2021-04-14 13:36:01.336-04	{}	890	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	79	890	
2021-04-14	2021-04-14 13:36:01.336-04	{}	891	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	79	891	
2021-04-14	2021-04-14 13:36:01.336-04	{}	892	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	79	892	
2021-04-14	2021-04-14 13:36:01.336-04	{}	893	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	79	893	
2021-04-14	2021-04-14 13:36:01.336-04	{}	894	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	79	894	
2021-04-14	2021-04-14 13:36:01.336-04	{}	895	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	79	895	
2021-04-14	2021-04-14 13:36:01.336-04	{}	896	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	79	896	
2021-04-14	2021-04-14 13:36:01.336-04	{}	897	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	79	897	
2021-04-14	2021-04-14 13:36:01.336-04	{}	898	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	79	898	
2021-04-14	2021-04-14 13:36:01.336-04	{}	899	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	79	899	
2021-04-14	2021-04-14 13:36:01.336-04	{}	900	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	79	900	
2021-04-14	2021-04-14 13:36:01.336-04	{}	901	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	79	901	
2021-04-14	2021-04-14 13:36:01.336-04	{}	902	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	79	902	
2021-04-14	2021-04-14 13:36:01.336-04	{}	903	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	79	903	
2021-04-14	2021-04-14 13:36:01.336-04	{}	904	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	79	904	
2021-04-14	2021-04-14 13:36:01.336-04	{}	905	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	79	905	
2021-04-14	2021-04-14 13:36:01.336-04	{}	906	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	79	906	
2021-04-14	2021-04-14 13:36:01.336-04	{}	907	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	79	907	
2021-04-14	2021-04-14 13:36:01.336-04	{}	908	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	79	908	
2021-04-14	2021-04-14 13:36:01.336-04	{}	909	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	79	909	
2021-04-14	2021-04-14 13:36:01.336-04	{}	910	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	79	910	
2021-04-14	2021-04-14 13:36:01.336-04	{}	911	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	79	911	
2021-04-14	2021-04-14 13:36:01.336-04	{}	912	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	79	912	
2021-04-14	2021-04-14 13:36:01.336-04	{}	913	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	80	913	
2021-04-14	2021-04-14 13:36:01.336-04	{}	914	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	80	914	
2021-04-14	2021-04-14 13:36:01.336-04	{}	915	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	80	915	
2021-04-14	2021-04-14 13:36:01.336-04	{}	916	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	80	916	
2021-04-14	2021-04-14 13:36:01.336-04	{}	917	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	80	917	
2021-04-14	2021-04-14 13:36:01.336-04	{}	918	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	80	918	
2021-04-14	2021-04-14 13:36:01.336-04	{}	919	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	80	919	
2021-04-14	2021-04-14 13:36:01.336-04	{}	920	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	80	920	
2021-04-14	2021-04-14 13:36:01.336-04	{}	921	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	80	921	
2021-04-14	2021-04-14 13:36:01.336-04	{}	922	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	80	922	
2021-04-14	2021-04-14 13:36:01.336-04	{}	923	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	80	923	
2021-04-14	2021-04-14 13:36:01.336-04	{}	924	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	80	924	
2021-04-14	2021-04-14 13:36:01.336-04	{}	925	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	80	925	
2021-04-14	2021-04-14 13:36:01.336-04	{}	926	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	80	926	
2021-04-14	2021-04-14 13:36:01.336-04	{}	927	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	80	927	
2021-04-14	2021-04-14 13:36:01.336-04	{}	928	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	80	928	
2021-04-14	2021-04-14 13:36:01.336-04	{}	929	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	80	929	
2021-04-14	2021-04-14 13:36:01.336-04	{}	930	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	80	930	
2021-04-14	2021-04-14 13:36:01.336-04	{}	931	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	80	931	
2021-04-14	2021-04-14 13:36:01.336-04	{}	932	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	80	932	
2021-04-14	2021-04-14 13:36:01.336-04	{}	933	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	80	933	
2021-04-14	2021-04-14 13:36:01.336-04	{}	934	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	80	934	
2021-04-14	2021-04-14 13:36:01.336-04	{}	935	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	80	935	
2021-04-14	2021-04-14 13:36:01.336-04	{}	936	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	80	936	
2021-04-14	2021-04-14 13:36:01.336-04	{}	937	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	80	937	
2021-04-14	2021-04-14 13:36:01.336-04	{}	938	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	80	938	
2021-04-14	2021-04-14 13:36:01.336-04	{}	939	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	80	939	
2021-04-14	2021-04-14 13:36:01.336-04	{}	940	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	80	940	
2021-04-14	2021-04-14 13:36:01.336-04	{}	941	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	80	941	
2021-04-14	2021-04-14 13:36:01.336-04	{}	942	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	80	942	
2021-04-14	2021-04-14 13:36:01.336-04	{}	943	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	80	943	
2021-04-14	2021-04-14 13:36:01.336-04	{}	944	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	80	944	
2021-04-14	2021-04-14 13:36:01.336-04	{}	945	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	80	945	
2021-04-14	2021-04-14 13:36:01.336-04	{}	946	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	80	946	
2021-04-14	2021-04-14 13:36:01.336-04	{}	947	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	80	947	
2021-04-14	2021-04-14 13:36:01.336-04	{}	948	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	80	948	
2021-04-14	2021-04-14 13:36:01.336-04	{}	949	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	80	949	
2021-04-14	2021-04-14 13:36:01.336-04	{}	950	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	80	950	
2021-04-14	2021-04-14 13:36:01.336-04	{}	951	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	80	951	
2021-04-14	2021-04-14 13:36:01.336-04	{}	952	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	80	952	
2021-04-14	2021-04-14 13:36:01.336-04	{}	953	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	80	953	
2021-04-14	2021-04-14 13:36:01.336-04	{}	954	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	80	954	
2021-04-14	2021-04-14 13:36:01.336-04	{}	955	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	80	955	
2021-04-14	2021-04-14 13:36:01.336-04	{}	956	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	80	956	
2021-04-14	2021-04-14 13:36:01.336-04	{}	957	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	80	957	
2021-04-14	2021-04-14 13:36:01.336-04	{}	958	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	80	958	
2021-04-14	2021-04-14 13:36:01.336-04	{}	959	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	80	959	
2021-04-14	2021-04-14 13:36:01.336-04	{}	960	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	80	960	
2021-04-14	2021-04-14 13:36:01.336-04	{}	961	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	81	961	
2021-04-14	2021-04-14 13:36:01.336-04	{}	962	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	81	962	
2021-04-14	2021-04-14 13:36:01.336-04	{}	963	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	81	963	
2021-04-14	2021-04-14 13:36:01.336-04	{}	964	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	81	964	
2021-04-14	2021-04-14 13:36:01.336-04	{}	965	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	81	965	
2021-04-14	2021-04-14 13:36:01.336-04	{}	966	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	81	966	
2021-04-14	2021-04-14 13:36:01.336-04	{}	967	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	81	967	
2021-04-14	2021-04-14 13:36:01.336-04	{}	968	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	81	968	
2021-04-14	2021-04-14 13:36:01.336-04	{}	969	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	81	969	
2021-04-14	2021-04-14 13:36:01.336-04	{}	970	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	81	970	
2021-04-14	2021-04-14 13:36:01.336-04	{}	971	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	81	971	
2021-04-14	2021-04-14 13:36:01.336-04	{}	972	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	81	972	
2021-04-14	2021-04-14 13:36:01.336-04	{}	973	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	81	973	
2021-04-14	2021-04-14 13:36:01.336-04	{}	974	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	81	974	
2021-04-14	2021-04-14 13:36:01.336-04	{}	975	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	81	975	
2021-04-14	2021-04-14 13:36:01.336-04	{}	976	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	81	976	
2021-04-14	2021-04-14 13:36:01.336-04	{}	977	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	81	977	
2021-04-14	2021-04-14 13:36:01.336-04	{}	978	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	81	978	
2021-04-14	2021-04-14 13:36:01.336-04	{}	979	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	81	979	
2021-04-14	2021-04-14 13:36:01.336-04	{}	980	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	81	980	
2021-04-14	2021-04-14 13:36:01.336-04	{}	981	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	81	981	
2021-04-14	2021-04-14 13:36:01.336-04	{}	982	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	81	982	
2021-04-14	2021-04-14 13:36:01.336-04	{}	983	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	81	983	
2021-04-14	2021-04-14 13:36:01.336-04	{}	984	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	81	984	
2021-04-14	2021-04-14 13:36:01.336-04	{}	985	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	81	985	
2021-04-14	2021-04-14 13:36:01.336-04	{}	986	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	81	986	
2021-04-14	2021-04-14 13:36:01.336-04	{}	987	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	81	987	
2021-04-14	2021-04-14 13:36:01.336-04	{}	988	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	81	988	
2021-04-14	2021-04-14 13:36:01.336-04	{}	989	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	81	989	
2021-04-14	2021-04-14 13:36:01.336-04	{}	990	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	81	990	
2021-04-14	2021-04-14 13:36:01.336-04	{}	991	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	81	991	
2021-04-14	2021-04-14 13:36:01.336-04	{}	992	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	81	992	
2021-04-14	2021-04-14 13:36:01.336-04	{}	993	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	81	993	
2021-04-14	2021-04-14 13:36:01.336-04	{}	994	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	81	994	
2021-04-14	2021-04-14 13:36:01.336-04	{}	995	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	81	995	
2021-04-14	2021-04-14 13:36:01.336-04	{}	996	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	81	996	
2021-04-14	2021-04-14 13:36:01.336-04	{}	997	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	81	997	
2021-04-14	2021-04-14 13:36:01.336-04	{}	998	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	81	998	
2021-04-14	2021-04-14 13:36:01.336-04	{}	999	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	81	999	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1000	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	81	1000	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1001	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	81	1001	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1002	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	81	1002	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1003	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	81	1003	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1004	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	81	1004	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1005	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	81	1005	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1006	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	81	1006	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1007	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	81	1007	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1008	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	81	1008	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1009	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	82	1009	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1010	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	82	1010	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1011	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	82	1011	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1012	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	82	1012	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1013	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	82	1013	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1014	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	82	1014	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1015	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	82	1015	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1016	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	82	1016	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1017	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	82	1017	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1018	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	82	1018	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1019	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	82	1019	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1020	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	82	1020	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1021	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	82	1021	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1022	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	82	1022	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1023	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	82	1023	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1024	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	82	1024	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1025	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	82	1025	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1026	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	82	1026	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1027	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	82	1027	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1028	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	82	1028	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1029	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	82	1029	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1030	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	82	1030	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1031	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	82	1031	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1032	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	82	1032	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1033	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	82	1033	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1034	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	82	1034	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1035	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	82	1035	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1036	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	82	1036	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1037	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	82	1037	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1038	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	82	1038	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1039	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	82	1039	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1040	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	82	1040	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1041	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	82	1041	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1042	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	82	1042	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1043	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	82	1043	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1044	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	82	1044	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1045	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	82	1045	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1046	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	82	1046	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1047	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	82	1047	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1048	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	82	1048	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1049	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	82	1049	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1050	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	82	1050	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1051	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	82	1051	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1052	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	82	1052	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1053	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	82	1053	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1054	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	82	1054	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1055	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	82	1055	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1056	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	82	1056	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1057	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	83	1057	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1058	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	83	1058	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1059	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	83	1059	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1060	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	83	1060	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1061	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	83	1061	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1062	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	83	1062	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1063	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	83	1063	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1064	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	83	1064	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1065	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	83	1065	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1066	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	83	1066	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1067	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	83	1067	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1068	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	83	1068	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1069	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	83	1069	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1070	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	83	1070	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1071	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	83	1071	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1072	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	83	1072	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1073	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	83	1073	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1074	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	83	1074	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1075	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	83	1075	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1076	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	83	1076	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1077	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	83	1077	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1078	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	83	1078	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1079	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	83	1079	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1080	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	83	1080	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1081	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	83	1081	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1082	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	83	1082	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1083	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	83	1083	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1084	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	83	1084	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1085	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	83	1085	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1086	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	83	1086	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1087	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	83	1087	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1088	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	83	1088	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1089	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	83	1089	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1090	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	83	1090	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1091	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	83	1091	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1092	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	83	1092	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1093	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	83	1093	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1094	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	83	1094	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1095	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	83	1095	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1096	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	83	1096	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1097	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	83	1097	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1098	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	83	1098	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1099	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	83	1099	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1100	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	83	1100	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1101	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	83	1101	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1102	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	83	1102	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1103	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	83	1103	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1104	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	83	1104	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1105	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	84	1105	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1106	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	84	1106	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1107	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	84	1107	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1108	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	84	1108	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1109	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	84	1109	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1110	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	84	1110	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1111	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	84	1111	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1112	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	84	1112	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1113	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	84	1113	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1114	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	84	1114	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1115	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	84	1115	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1116	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	84	1116	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1117	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	84	1117	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1118	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	84	1118	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1119	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	84	1119	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1120	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	84	1120	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1121	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	84	1121	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1122	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	84	1122	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1123	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	84	1123	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1124	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	84	1124	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1125	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	84	1125	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1126	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	84	1126	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1127	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	84	1127	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1128	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	84	1128	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1129	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	84	1129	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1130	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	84	1130	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1131	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	84	1131	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1132	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	84	1132	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1133	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	84	1133	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1134	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	84	1134	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1135	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	84	1135	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1136	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	84	1136	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1137	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	84	1137	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1138	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	84	1138	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1139	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	84	1139	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1140	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	84	1140	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1141	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	84	1141	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1142	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	84	1142	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1143	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	84	1143	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1144	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	84	1144	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1145	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	84	1145	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1146	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	84	1146	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1147	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	84	1147	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1148	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	84	1148	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1149	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	84	1149	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1150	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	84	1150	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1151	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	84	1151	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1152	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	84	1152	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1153	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	85	1153	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1154	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	85	1154	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1155	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	85	1155	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1156	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	85	1156	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1157	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	85	1157	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1158	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	85	1158	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1159	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	85	1159	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1160	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	85	1160	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1161	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	85	1161	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1162	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	85	1162	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1163	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	85	1163	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1164	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	85	1164	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1165	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	85	1165	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1166	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	85	1166	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1167	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	85	1167	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1168	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	85	1168	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1169	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	85	1169	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1170	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	85	1170	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1171	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	85	1171	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1172	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	85	1172	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1173	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	85	1173	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1174	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	85	1174	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1175	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	85	1175	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1176	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	85	1176	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1177	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	85	1177	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1178	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	85	1178	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1179	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	85	1179	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1180	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	85	1180	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1181	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	85	1181	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1182	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	85	1182	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1183	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	85	1183	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1184	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	85	1184	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1185	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	85	1185	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1186	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	85	1186	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1187	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	85	1187	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1188	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	85	1188	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1189	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	85	1189	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1190	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	85	1190	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1191	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	85	1191	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1192	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	85	1192	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1193	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	85	1193	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1194	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	85	1194	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1195	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	85	1195	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1196	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	85	1196	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1197	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	85	1197	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1198	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	85	1198	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1199	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	85	1199	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1200	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	85	1200	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1201	Port 1	Port 00000001			\N	f	8p8c	1	\N	\N	86	1201	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1202	Port 2	Port 00000002			\N	f	8p8c	1	\N	\N	86	1202	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1203	Port 3	Port 00000003			\N	f	8p8c	1	\N	\N	86	1203	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1204	Port 4	Port 00000004			\N	f	8p8c	1	\N	\N	86	1204	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1205	Port 5	Port 00000005			\N	f	8p8c	1	\N	\N	86	1205	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1206	Port 6	Port 00000006			\N	f	8p8c	1	\N	\N	86	1206	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1207	Port 7	Port 00000007			\N	f	8p8c	1	\N	\N	86	1207	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1208	Port 8	Port 00000008			\N	f	8p8c	1	\N	\N	86	1208	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1209	Port 9	Port 00000009			\N	f	8p8c	1	\N	\N	86	1209	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1210	Port 10	Port 00000010			\N	f	8p8c	1	\N	\N	86	1210	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1211	Port 11	Port 00000011			\N	f	8p8c	1	\N	\N	86	1211	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1212	Port 12	Port 00000012			\N	f	8p8c	1	\N	\N	86	1212	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1213	Port 13	Port 00000013			\N	f	8p8c	1	\N	\N	86	1213	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1214	Port 14	Port 00000014			\N	f	8p8c	1	\N	\N	86	1214	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1215	Port 15	Port 00000015			\N	f	8p8c	1	\N	\N	86	1215	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1216	Port 16	Port 00000016			\N	f	8p8c	1	\N	\N	86	1216	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1217	Port 17	Port 00000017			\N	f	8p8c	1	\N	\N	86	1217	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1218	Port 18	Port 00000018			\N	f	8p8c	1	\N	\N	86	1218	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1219	Port 19	Port 00000019			\N	f	8p8c	1	\N	\N	86	1219	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1220	Port 20	Port 00000020			\N	f	8p8c	1	\N	\N	86	1220	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1221	Port 21	Port 00000021			\N	f	8p8c	1	\N	\N	86	1221	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1222	Port 22	Port 00000022			\N	f	8p8c	1	\N	\N	86	1222	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1223	Port 23	Port 00000023			\N	f	8p8c	1	\N	\N	86	1223	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1224	Port 24	Port 00000024			\N	f	8p8c	1	\N	\N	86	1224	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1225	Port 25	Port 00000025			\N	f	8p8c	1	\N	\N	86	1225	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1226	Port 26	Port 00000026			\N	f	8p8c	1	\N	\N	86	1226	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1227	Port 27	Port 00000027			\N	f	8p8c	1	\N	\N	86	1227	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1228	Port 28	Port 00000028			\N	f	8p8c	1	\N	\N	86	1228	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1229	Port 29	Port 00000029			\N	f	8p8c	1	\N	\N	86	1229	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1230	Port 30	Port 00000030			\N	f	8p8c	1	\N	\N	86	1230	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1231	Port 31	Port 00000031			\N	f	8p8c	1	\N	\N	86	1231	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1232	Port 32	Port 00000032			\N	f	8p8c	1	\N	\N	86	1232	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1233	Port 33	Port 00000033			\N	f	8p8c	1	\N	\N	86	1233	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1234	Port 34	Port 00000034			\N	f	8p8c	1	\N	\N	86	1234	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1235	Port 35	Port 00000035			\N	f	8p8c	1	\N	\N	86	1235	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1236	Port 36	Port 00000036			\N	f	8p8c	1	\N	\N	86	1236	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1237	Port 37	Port 00000037			\N	f	8p8c	1	\N	\N	86	1237	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1238	Port 38	Port 00000038			\N	f	8p8c	1	\N	\N	86	1238	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1239	Port 39	Port 00000039			\N	f	8p8c	1	\N	\N	86	1239	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1240	Port 40	Port 00000040			\N	f	8p8c	1	\N	\N	86	1240	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1241	Port 41	Port 00000041			\N	f	8p8c	1	\N	\N	86	1241	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1242	Port 42	Port 00000042			\N	f	8p8c	1	\N	\N	86	1242	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1243	Port 43	Port 00000043			\N	f	8p8c	1	\N	\N	86	1243	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1244	Port 44	Port 00000044			\N	f	8p8c	1	\N	\N	86	1244	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1245	Port 45	Port 00000045			\N	f	8p8c	1	\N	\N	86	1245	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1246	Port 46	Port 00000046			\N	f	8p8c	1	\N	\N	86	1246	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1247	Port 47	Port 00000047			\N	f	8p8c	1	\N	\N	86	1247	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1248	Port 48	Port 00000048			\N	f	8p8c	1	\N	\N	86	1248	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1249	Port 1	Port 00000001			1022	f	sc	1	27	112	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1250	Port 2	Port 00000002			1023	f	sc	2	27	113	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1251	Port 3	Port 00000003			1070	f	sc	3	27	114	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1252	Port 4	Port 00000004			1071	f	sc	4	27	115	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1253	Port 5	Port 00000005			\N	f	sc	5	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1254	Port 6	Port 00000006			\N	f	sc	6	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1255	Port 7	Port 00000007			\N	f	sc	7	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1256	Port 8	Port 00000008			\N	f	sc	8	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1257	Port 9	Port 00000009			\N	f	sc	9	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1258	Port 10	Port 00000010			\N	f	sc	10	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1259	Port 11	Port 00000011			\N	f	sc	11	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1260	Port 12	Port 00000012			\N	f	sc	12	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1261	Port 13	Port 00000013			\N	f	sc	13	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1262	Port 14	Port 00000014			\N	f	sc	14	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1263	Port 15	Port 00000015			\N	f	sc	15	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1264	Port 16	Port 00000016			\N	f	sc	16	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1265	Port 17	Port 00000017			\N	f	sc	17	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1266	Port 18	Port 00000018			\N	f	sc	18	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1267	Port 19	Port 00000019			\N	f	sc	19	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1268	Port 20	Port 00000020			\N	f	sc	20	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1269	Port 21	Port 00000021			\N	f	sc	21	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1270	Port 22	Port 00000022			\N	f	sc	22	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1271	Port 23	Port 00000023			\N	f	sc	23	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1272	Port 24	Port 00000024			\N	f	sc	24	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1273	Port 25	Port 00000025			\N	f	sc	25	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1274	Port 26	Port 00000026			\N	f	sc	26	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1275	Port 27	Port 00000027			\N	f	sc	27	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1276	Port 28	Port 00000028			\N	f	sc	28	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1277	Port 29	Port 00000029			\N	f	sc	29	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1278	Port 30	Port 00000030			\N	f	sc	30	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1279	Port 31	Port 00000031			\N	f	sc	31	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1280	Port 32	Port 00000032			\N	f	sc	32	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1281	Port 33	Port 00000033			\N	f	sc	33	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1282	Port 34	Port 00000034			\N	f	sc	34	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1283	Port 35	Port 00000035			\N	f	sc	35	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1284	Port 36	Port 00000036			\N	f	sc	36	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1285	Port 37	Port 00000037			\N	f	sc	37	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1286	Port 38	Port 00000038			\N	f	sc	38	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1287	Port 39	Port 00000039			\N	f	sc	39	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1288	Port 40	Port 00000040			\N	f	sc	40	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1289	Port 41	Port 00000041			\N	f	sc	41	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1290	Port 42	Port 00000042			\N	f	sc	42	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1291	Port 43	Port 00000043			\N	f	sc	43	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1292	Port 44	Port 00000044			\N	f	sc	44	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1293	Port 45	Port 00000045			\N	f	sc	45	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1294	Port 46	Port 00000046			\N	f	sc	46	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1295	Port 47	Port 00000047			\N	f	sc	47	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1296	Port 48	Port 00000048			\N	f	sc	48	\N	\N	87	1249	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1297	Port 1	Port 00000001			1018	f	sc	1	27	104	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1298	Port 2	Port 00000002			1019	f	sc	2	27	105	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1299	Port 3	Port 00000003			1066	f	sc	3	27	106	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1300	Port 4	Port 00000004			1067	f	sc	4	27	107	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1301	Port 5	Port 00000005			\N	f	sc	5	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1302	Port 6	Port 00000006			\N	f	sc	6	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1303	Port 7	Port 00000007			\N	f	sc	7	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1304	Port 8	Port 00000008			\N	f	sc	8	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1305	Port 9	Port 00000009			\N	f	sc	9	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1306	Port 10	Port 00000010			\N	f	sc	10	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1307	Port 11	Port 00000011			\N	f	sc	11	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1308	Port 12	Port 00000012			\N	f	sc	12	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1309	Port 13	Port 00000013			\N	f	sc	13	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1310	Port 14	Port 00000014			\N	f	sc	14	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1311	Port 15	Port 00000015			\N	f	sc	15	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1312	Port 16	Port 00000016			\N	f	sc	16	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1313	Port 17	Port 00000017			\N	f	sc	17	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1314	Port 18	Port 00000018			\N	f	sc	18	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1315	Port 19	Port 00000019			\N	f	sc	19	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1316	Port 20	Port 00000020			\N	f	sc	20	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1317	Port 21	Port 00000021			\N	f	sc	21	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1318	Port 22	Port 00000022			\N	f	sc	22	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1319	Port 23	Port 00000023			\N	f	sc	23	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1320	Port 24	Port 00000024			\N	f	sc	24	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1321	Port 25	Port 00000025			\N	f	sc	25	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1322	Port 26	Port 00000026			\N	f	sc	26	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1323	Port 27	Port 00000027			\N	f	sc	27	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1324	Port 28	Port 00000028			\N	f	sc	28	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1325	Port 29	Port 00000029			\N	f	sc	29	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1326	Port 30	Port 00000030			\N	f	sc	30	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1327	Port 31	Port 00000031			\N	f	sc	31	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1328	Port 32	Port 00000032			\N	f	sc	32	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1329	Port 33	Port 00000033			\N	f	sc	33	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1330	Port 34	Port 00000034			\N	f	sc	34	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1331	Port 35	Port 00000035			\N	f	sc	35	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1332	Port 36	Port 00000036			\N	f	sc	36	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1333	Port 37	Port 00000037			\N	f	sc	37	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1334	Port 38	Port 00000038			\N	f	sc	38	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1335	Port 39	Port 00000039			\N	f	sc	39	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1336	Port 40	Port 00000040			\N	f	sc	40	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1337	Port 41	Port 00000041			\N	f	sc	41	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1338	Port 42	Port 00000042			\N	f	sc	42	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1339	Port 43	Port 00000043			\N	f	sc	43	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1340	Port 44	Port 00000044			\N	f	sc	44	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1341	Port 45	Port 00000045			\N	f	sc	45	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1342	Port 46	Port 00000046			\N	f	sc	46	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1343	Port 47	Port 00000047			\N	f	sc	47	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1344	Port 48	Port 00000048			\N	f	sc	48	\N	\N	88	1250	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1345	Port 1	Port 00000001			1020	f	sc	1	27	108	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1346	Port 2	Port 00000002			1021	f	sc	2	27	109	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1347	Port 3	Port 00000003			1068	f	sc	3	27	110	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1348	Port 4	Port 00000004			1069	f	sc	4	27	111	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1349	Port 5	Port 00000005			\N	f	sc	5	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1350	Port 6	Port 00000006			\N	f	sc	6	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1351	Port 7	Port 00000007			\N	f	sc	7	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1352	Port 8	Port 00000008			\N	f	sc	8	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1353	Port 9	Port 00000009			\N	f	sc	9	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1354	Port 10	Port 00000010			\N	f	sc	10	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1355	Port 11	Port 00000011			\N	f	sc	11	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1356	Port 12	Port 00000012			\N	f	sc	12	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1357	Port 13	Port 00000013			\N	f	sc	13	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1358	Port 14	Port 00000014			\N	f	sc	14	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1359	Port 15	Port 00000015			\N	f	sc	15	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1360	Port 16	Port 00000016			\N	f	sc	16	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1361	Port 17	Port 00000017			\N	f	sc	17	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1362	Port 18	Port 00000018			\N	f	sc	18	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1363	Port 19	Port 00000019			\N	f	sc	19	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1364	Port 20	Port 00000020			\N	f	sc	20	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1365	Port 21	Port 00000021			\N	f	sc	21	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1366	Port 22	Port 00000022			\N	f	sc	22	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1367	Port 23	Port 00000023			\N	f	sc	23	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1368	Port 24	Port 00000024			\N	f	sc	24	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1369	Port 25	Port 00000025			\N	f	sc	25	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1370	Port 26	Port 00000026			\N	f	sc	26	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1371	Port 27	Port 00000027			\N	f	sc	27	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1372	Port 28	Port 00000028			\N	f	sc	28	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1373	Port 29	Port 00000029			\N	f	sc	29	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1374	Port 30	Port 00000030			\N	f	sc	30	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1375	Port 31	Port 00000031			\N	f	sc	31	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1376	Port 32	Port 00000032			\N	f	sc	32	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1377	Port 33	Port 00000033			\N	f	sc	33	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1378	Port 34	Port 00000034			\N	f	sc	34	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1379	Port 35	Port 00000035			\N	f	sc	35	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1380	Port 36	Port 00000036			\N	f	sc	36	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1381	Port 37	Port 00000037			\N	f	sc	37	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1382	Port 38	Port 00000038			\N	f	sc	38	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1383	Port 39	Port 00000039			\N	f	sc	39	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1384	Port 40	Port 00000040			\N	f	sc	40	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1385	Port 41	Port 00000041			\N	f	sc	41	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1386	Port 42	Port 00000042			\N	f	sc	42	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1387	Port 43	Port 00000043			\N	f	sc	43	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1388	Port 44	Port 00000044			\N	f	sc	44	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1389	Port 45	Port 00000045			\N	f	sc	45	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1390	Port 46	Port 00000046			\N	f	sc	46	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1391	Port 47	Port 00000047			\N	f	sc	47	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1392	Port 48	Port 00000048			\N	f	sc	48	\N	\N	89	1251	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1393	Port 1	Port 00000001			863	f	sc	1	27	124	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1394	Port 2	Port 00000002			864	f	sc	2	27	125	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1395	Port 3	Port 00000003			865	f	sc	3	27	126	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1396	Port 4	Port 00000004			866	f	sc	4	27	127	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1397	Port 5	Port 00000005			\N	f	sc	5	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1398	Port 6	Port 00000006			\N	f	sc	6	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1399	Port 7	Port 00000007			\N	f	sc	7	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1400	Port 8	Port 00000008			\N	f	sc	8	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1401	Port 9	Port 00000009			\N	f	sc	9	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1402	Port 10	Port 00000010			\N	f	sc	10	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1403	Port 11	Port 00000011			\N	f	sc	11	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1404	Port 12	Port 00000012			\N	f	sc	12	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1405	Port 13	Port 00000013			\N	f	sc	13	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1406	Port 14	Port 00000014			\N	f	sc	14	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1407	Port 15	Port 00000015			\N	f	sc	15	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1408	Port 16	Port 00000016			\N	f	sc	16	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1409	Port 17	Port 00000017			\N	f	sc	17	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1410	Port 18	Port 00000018			\N	f	sc	18	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1411	Port 19	Port 00000019			\N	f	sc	19	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1412	Port 20	Port 00000020			\N	f	sc	20	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1413	Port 21	Port 00000021			\N	f	sc	21	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1414	Port 22	Port 00000022			\N	f	sc	22	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1415	Port 23	Port 00000023			\N	f	sc	23	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1416	Port 24	Port 00000024			\N	f	sc	24	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1417	Port 25	Port 00000025			\N	f	sc	25	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1418	Port 26	Port 00000026			\N	f	sc	26	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1419	Port 27	Port 00000027			\N	f	sc	27	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1420	Port 28	Port 00000028			\N	f	sc	28	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1421	Port 29	Port 00000029			\N	f	sc	29	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1422	Port 30	Port 00000030			\N	f	sc	30	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1423	Port 31	Port 00000031			\N	f	sc	31	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1424	Port 32	Port 00000032			\N	f	sc	32	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1425	Port 33	Port 00000033			\N	f	sc	33	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1426	Port 34	Port 00000034			\N	f	sc	34	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1427	Port 35	Port 00000035			\N	f	sc	35	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1428	Port 36	Port 00000036			\N	f	sc	36	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1429	Port 37	Port 00000037			\N	f	sc	37	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1430	Port 38	Port 00000038			\N	f	sc	38	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1431	Port 39	Port 00000039			\N	f	sc	39	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1432	Port 40	Port 00000040			\N	f	sc	40	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1433	Port 41	Port 00000041			\N	f	sc	41	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1434	Port 42	Port 00000042			\N	f	sc	42	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1435	Port 43	Port 00000043			\N	f	sc	43	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1436	Port 44	Port 00000044			\N	f	sc	44	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1437	Port 45	Port 00000045			\N	f	sc	45	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1438	Port 46	Port 00000046			\N	f	sc	46	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1439	Port 47	Port 00000047			\N	f	sc	47	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1440	Port 48	Port 00000048			\N	f	sc	48	\N	\N	90	1252	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1441	Port 1	Port 00000001			916	f	sc	1	27	116	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1442	Port 2	Port 00000002			917	f	sc	2	27	117	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1443	Port 3	Port 00000003			918	f	sc	3	27	118	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1444	Port 4	Port 00000004			919	f	sc	4	27	119	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1445	Port 5	Port 00000005			\N	f	sc	5	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1446	Port 6	Port 00000006			\N	f	sc	6	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1447	Port 7	Port 00000007			\N	f	sc	7	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1448	Port 8	Port 00000008			\N	f	sc	8	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1449	Port 9	Port 00000009			\N	f	sc	9	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1450	Port 10	Port 00000010			\N	f	sc	10	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1451	Port 11	Port 00000011			\N	f	sc	11	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1452	Port 12	Port 00000012			\N	f	sc	12	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1453	Port 13	Port 00000013			\N	f	sc	13	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1454	Port 14	Port 00000014			\N	f	sc	14	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1455	Port 15	Port 00000015			\N	f	sc	15	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1456	Port 16	Port 00000016			\N	f	sc	16	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1457	Port 17	Port 00000017			\N	f	sc	17	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1458	Port 18	Port 00000018			\N	f	sc	18	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1459	Port 19	Port 00000019			\N	f	sc	19	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1460	Port 20	Port 00000020			\N	f	sc	20	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1461	Port 21	Port 00000021			\N	f	sc	21	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1462	Port 22	Port 00000022			\N	f	sc	22	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1463	Port 23	Port 00000023			\N	f	sc	23	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1464	Port 24	Port 00000024			\N	f	sc	24	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1465	Port 25	Port 00000025			\N	f	sc	25	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1466	Port 26	Port 00000026			\N	f	sc	26	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1467	Port 27	Port 00000027			\N	f	sc	27	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1468	Port 28	Port 00000028			\N	f	sc	28	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1469	Port 29	Port 00000029			\N	f	sc	29	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1470	Port 30	Port 00000030			\N	f	sc	30	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1471	Port 31	Port 00000031			\N	f	sc	31	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1472	Port 32	Port 00000032			\N	f	sc	32	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1473	Port 33	Port 00000033			\N	f	sc	33	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1474	Port 34	Port 00000034			\N	f	sc	34	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1475	Port 35	Port 00000035			\N	f	sc	35	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1476	Port 36	Port 00000036			\N	f	sc	36	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1477	Port 37	Port 00000037			\N	f	sc	37	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1478	Port 38	Port 00000038			\N	f	sc	38	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1479	Port 39	Port 00000039			\N	f	sc	39	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1480	Port 40	Port 00000040			\N	f	sc	40	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1481	Port 41	Port 00000041			\N	f	sc	41	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1482	Port 42	Port 00000042			\N	f	sc	42	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1483	Port 43	Port 00000043			\N	f	sc	43	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1484	Port 44	Port 00000044			\N	f	sc	44	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1485	Port 45	Port 00000045			\N	f	sc	45	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1486	Port 46	Port 00000046			\N	f	sc	46	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1487	Port 47	Port 00000047			\N	f	sc	47	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1488	Port 48	Port 00000048			\N	f	sc	48	\N	\N	91	1253	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1489	Port 1	Port 00000001			969	f	sc	1	27	120	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1490	Port 2	Port 00000002			970	f	sc	2	27	121	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1491	Port 3	Port 00000003			971	f	sc	3	27	122	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1492	Port 4	Port 00000004			972	f	sc	4	27	123	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1493	Port 5	Port 00000005			\N	f	sc	5	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1494	Port 6	Port 00000006			\N	f	sc	6	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1495	Port 7	Port 00000007			\N	f	sc	7	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1496	Port 8	Port 00000008			\N	f	sc	8	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1497	Port 9	Port 00000009			\N	f	sc	9	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1498	Port 10	Port 00000010			\N	f	sc	10	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1499	Port 11	Port 00000011			\N	f	sc	11	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1500	Port 12	Port 00000012			\N	f	sc	12	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1501	Port 13	Port 00000013			\N	f	sc	13	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1502	Port 14	Port 00000014			\N	f	sc	14	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1503	Port 15	Port 00000015			\N	f	sc	15	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1504	Port 16	Port 00000016			\N	f	sc	16	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1505	Port 17	Port 00000017			\N	f	sc	17	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1506	Port 18	Port 00000018			\N	f	sc	18	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1507	Port 19	Port 00000019			\N	f	sc	19	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1508	Port 20	Port 00000020			\N	f	sc	20	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1509	Port 21	Port 00000021			\N	f	sc	21	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1510	Port 22	Port 00000022			\N	f	sc	22	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1511	Port 23	Port 00000023			\N	f	sc	23	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1512	Port 24	Port 00000024			\N	f	sc	24	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1513	Port 25	Port 00000025			\N	f	sc	25	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1514	Port 26	Port 00000026			\N	f	sc	26	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1515	Port 27	Port 00000027			\N	f	sc	27	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1516	Port 28	Port 00000028			\N	f	sc	28	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1517	Port 29	Port 00000029			\N	f	sc	29	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1518	Port 30	Port 00000030			\N	f	sc	30	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1519	Port 31	Port 00000031			\N	f	sc	31	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1520	Port 32	Port 00000032			\N	f	sc	32	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1521	Port 33	Port 00000033			\N	f	sc	33	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1522	Port 34	Port 00000034			\N	f	sc	34	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1523	Port 35	Port 00000035			\N	f	sc	35	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1524	Port 36	Port 00000036			\N	f	sc	36	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1525	Port 37	Port 00000037			\N	f	sc	37	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1526	Port 38	Port 00000038			\N	f	sc	38	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1527	Port 39	Port 00000039			\N	f	sc	39	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1528	Port 40	Port 00000040			\N	f	sc	40	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1529	Port 41	Port 00000041			\N	f	sc	41	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1530	Port 42	Port 00000042			\N	f	sc	42	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1531	Port 43	Port 00000043			\N	f	sc	43	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1532	Port 44	Port 00000044			\N	f	sc	44	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1533	Port 45	Port 00000045			\N	f	sc	45	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1534	Port 46	Port 00000046			\N	f	sc	46	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1535	Port 47	Port 00000047			\N	f	sc	47	\N	\N	92	1254	
2021-04-14	2021-04-14 13:36:01.336-04	{}	1536	Port 48	Port 00000048			\N	f	sc	48	\N	\N	92	1254	
\.


--
-- Data for Name: dcim_frontporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontporttemplate (created, last_updated, id, name, _name, label, description, type, rear_port_position, device_type_id, rear_port_id, color) FROM stdin;
2021-04-14	2021-04-14 13:36:01.42-04	1	Port 1	Port 00000001			8p8c	1	9	1	
2021-04-14	2021-04-14 13:36:01.42-04	2	Port 2	Port 00000002			8p8c	1	9	2	
2021-04-14	2021-04-14 13:36:01.42-04	3	Port 3	Port 00000003			8p8c	1	9	3	
2021-04-14	2021-04-14 13:36:01.42-04	4	Port 4	Port 00000004			8p8c	1	9	4	
2021-04-14	2021-04-14 13:36:01.42-04	5	Port 5	Port 00000005			8p8c	1	9	5	
2021-04-14	2021-04-14 13:36:01.42-04	6	Port 6	Port 00000006			8p8c	1	9	6	
2021-04-14	2021-04-14 13:36:01.42-04	7	Port 7	Port 00000007			8p8c	1	9	7	
2021-04-14	2021-04-14 13:36:01.42-04	8	Port 8	Port 00000008			8p8c	1	9	8	
2021-04-14	2021-04-14 13:36:01.42-04	9	Port 9	Port 00000009			8p8c	1	9	9	
2021-04-14	2021-04-14 13:36:01.42-04	10	Port 10	Port 00000010			8p8c	1	9	10	
2021-04-14	2021-04-14 13:36:01.42-04	11	Port 11	Port 00000011			8p8c	1	9	11	
2021-04-14	2021-04-14 13:36:01.42-04	12	Port 12	Port 00000012			8p8c	1	9	12	
2021-04-14	2021-04-14 13:36:01.42-04	13	Port 13	Port 00000013			8p8c	1	9	13	
2021-04-14	2021-04-14 13:36:01.42-04	14	Port 14	Port 00000014			8p8c	1	9	14	
2021-04-14	2021-04-14 13:36:01.42-04	15	Port 15	Port 00000015			8p8c	1	9	15	
2021-04-14	2021-04-14 13:36:01.42-04	16	Port 16	Port 00000016			8p8c	1	9	16	
2021-04-14	2021-04-14 13:36:01.42-04	17	Port 17	Port 00000017			8p8c	1	9	17	
2021-04-14	2021-04-14 13:36:01.42-04	18	Port 18	Port 00000018			8p8c	1	9	18	
2021-04-14	2021-04-14 13:36:01.42-04	19	Port 19	Port 00000019			8p8c	1	9	19	
2021-04-14	2021-04-14 13:36:01.42-04	20	Port 20	Port 00000020			8p8c	1	9	20	
2021-04-14	2021-04-14 13:36:01.42-04	21	Port 21	Port 00000021			8p8c	1	9	21	
2021-04-14	2021-04-14 13:36:01.42-04	22	Port 22	Port 00000022			8p8c	1	9	22	
2021-04-14	2021-04-14 13:36:01.42-04	23	Port 23	Port 00000023			8p8c	1	9	23	
2021-04-14	2021-04-14 13:36:01.42-04	24	Port 24	Port 00000024			8p8c	1	9	24	
2021-04-14	2021-04-14 13:36:01.42-04	25	Port 1	Port 00000001			8p8c	1	10	25	
2021-04-14	2021-04-14 13:36:01.42-04	26	Port 2	Port 00000002			8p8c	1	10	26	
2021-04-14	2021-04-14 13:36:01.42-04	27	Port 3	Port 00000003			8p8c	1	10	27	
2021-04-14	2021-04-14 13:36:01.42-04	28	Port 4	Port 00000004			8p8c	1	10	28	
2021-04-14	2021-04-14 13:36:01.42-04	29	Port 5	Port 00000005			8p8c	1	10	29	
2021-04-14	2021-04-14 13:36:01.42-04	30	Port 6	Port 00000006			8p8c	1	10	30	
2021-04-14	2021-04-14 13:36:01.42-04	31	Port 7	Port 00000007			8p8c	1	10	31	
2021-04-14	2021-04-14 13:36:01.42-04	32	Port 8	Port 00000008			8p8c	1	10	32	
2021-04-14	2021-04-14 13:36:01.42-04	33	Port 9	Port 00000009			8p8c	1	10	33	
2021-04-14	2021-04-14 13:36:01.42-04	34	Port 10	Port 00000010			8p8c	1	10	34	
2021-04-14	2021-04-14 13:36:01.42-04	35	Port 11	Port 00000011			8p8c	1	10	35	
2021-04-14	2021-04-14 13:36:01.42-04	36	Port 12	Port 00000012			8p8c	1	10	36	
2021-04-14	2021-04-14 13:36:01.42-04	37	Port 13	Port 00000013			8p8c	1	10	37	
2021-04-14	2021-04-14 13:36:01.42-04	38	Port 14	Port 00000014			8p8c	1	10	38	
2021-04-14	2021-04-14 13:36:01.42-04	39	Port 15	Port 00000015			8p8c	1	10	39	
2021-04-14	2021-04-14 13:36:01.42-04	40	Port 16	Port 00000016			8p8c	1	10	40	
2021-04-14	2021-04-14 13:36:01.42-04	41	Port 17	Port 00000017			8p8c	1	10	41	
2021-04-14	2021-04-14 13:36:01.42-04	42	Port 18	Port 00000018			8p8c	1	10	42	
2021-04-14	2021-04-14 13:36:01.42-04	43	Port 19	Port 00000019			8p8c	1	10	43	
2021-04-14	2021-04-14 13:36:01.42-04	44	Port 20	Port 00000020			8p8c	1	10	44	
2021-04-14	2021-04-14 13:36:01.42-04	45	Port 21	Port 00000021			8p8c	1	10	45	
2021-04-14	2021-04-14 13:36:01.42-04	46	Port 22	Port 00000022			8p8c	1	10	46	
2021-04-14	2021-04-14 13:36:01.42-04	47	Port 23	Port 00000023			8p8c	1	10	47	
2021-04-14	2021-04-14 13:36:01.42-04	48	Port 24	Port 00000024			8p8c	1	10	48	
2021-04-14	2021-04-14 13:36:01.42-04	49	Port 25	Port 00000025			8p8c	1	10	49	
2021-04-14	2021-04-14 13:36:01.42-04	50	Port 26	Port 00000026			8p8c	1	10	50	
2021-04-14	2021-04-14 13:36:01.42-04	51	Port 27	Port 00000027			8p8c	1	10	51	
2021-04-14	2021-04-14 13:36:01.42-04	52	Port 28	Port 00000028			8p8c	1	10	52	
2021-04-14	2021-04-14 13:36:01.42-04	53	Port 29	Port 00000029			8p8c	1	10	53	
2021-04-14	2021-04-14 13:36:01.42-04	54	Port 30	Port 00000030			8p8c	1	10	54	
2021-04-14	2021-04-14 13:36:01.42-04	55	Port 31	Port 00000031			8p8c	1	10	55	
2021-04-14	2021-04-14 13:36:01.42-04	56	Port 32	Port 00000032			8p8c	1	10	56	
2021-04-14	2021-04-14 13:36:01.42-04	57	Port 33	Port 00000033			8p8c	1	10	57	
2021-04-14	2021-04-14 13:36:01.42-04	58	Port 34	Port 00000034			8p8c	1	10	58	
2021-04-14	2021-04-14 13:36:01.42-04	59	Port 35	Port 00000035			8p8c	1	10	59	
2021-04-14	2021-04-14 13:36:01.42-04	60	Port 36	Port 00000036			8p8c	1	10	60	
2021-04-14	2021-04-14 13:36:01.42-04	61	Port 37	Port 00000037			8p8c	1	10	61	
2021-04-14	2021-04-14 13:36:01.42-04	62	Port 38	Port 00000038			8p8c	1	10	62	
2021-04-14	2021-04-14 13:36:01.42-04	63	Port 39	Port 00000039			8p8c	1	10	63	
2021-04-14	2021-04-14 13:36:01.42-04	64	Port 40	Port 00000040			8p8c	1	10	64	
2021-04-14	2021-04-14 13:36:01.42-04	65	Port 41	Port 00000041			8p8c	1	10	65	
2021-04-14	2021-04-14 13:36:01.42-04	66	Port 42	Port 00000042			8p8c	1	10	66	
2021-04-14	2021-04-14 13:36:01.42-04	67	Port 43	Port 00000043			8p8c	1	10	67	
2021-04-14	2021-04-14 13:36:01.42-04	68	Port 44	Port 00000044			8p8c	1	10	68	
2021-04-14	2021-04-14 13:36:01.42-04	69	Port 45	Port 00000045			8p8c	1	10	69	
2021-04-14	2021-04-14 13:36:01.42-04	70	Port 46	Port 00000046			8p8c	1	10	70	
2021-04-14	2021-04-14 13:36:01.42-04	71	Port 47	Port 00000047			8p8c	1	10	71	
2021-04-14	2021-04-14 13:36:01.42-04	72	Port 48	Port 00000048			8p8c	1	10	72	
2021-04-14	2021-04-14 13:36:01.42-04	73	Port 1	Port 00000001			sc	1	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	74	Port 2	Port 00000002			sc	2	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	75	Port 3	Port 00000003			sc	3	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	76	Port 4	Port 00000004			sc	4	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	77	Port 5	Port 00000005			sc	5	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	78	Port 6	Port 00000006			sc	6	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	79	Port 7	Port 00000007			sc	7	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	80	Port 8	Port 00000008			sc	8	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	81	Port 9	Port 00000009			sc	9	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	82	Port 10	Port 00000010			sc	10	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	83	Port 11	Port 00000011			sc	11	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	84	Port 12	Port 00000012			sc	12	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	85	Port 13	Port 00000013			sc	13	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	86	Port 14	Port 00000014			sc	14	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	87	Port 15	Port 00000015			sc	15	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	88	Port 16	Port 00000016			sc	16	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	89	Port 17	Port 00000017			sc	17	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	90	Port 18	Port 00000018			sc	18	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	91	Port 19	Port 00000019			sc	19	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	92	Port 20	Port 00000020			sc	20	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	93	Port 21	Port 00000021			sc	21	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	94	Port 22	Port 00000022			sc	22	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	95	Port 23	Port 00000023			sc	23	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	96	Port 24	Port 00000024			sc	24	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	97	Port 25	Port 00000025			sc	25	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	98	Port 26	Port 00000026			sc	26	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	99	Port 27	Port 00000027			sc	27	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	100	Port 28	Port 00000028			sc	28	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	101	Port 29	Port 00000029			sc	29	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	102	Port 30	Port 00000030			sc	30	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	103	Port 31	Port 00000031			sc	31	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	104	Port 32	Port 00000032			sc	32	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	105	Port 33	Port 00000033			sc	33	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	106	Port 34	Port 00000034			sc	34	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	107	Port 35	Port 00000035			sc	35	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	108	Port 36	Port 00000036			sc	36	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	109	Port 37	Port 00000037			sc	37	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	110	Port 38	Port 00000038			sc	38	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	111	Port 39	Port 00000039			sc	39	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	112	Port 40	Port 00000040			sc	40	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	113	Port 41	Port 00000041			sc	41	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	114	Port 42	Port 00000042			sc	42	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	115	Port 43	Port 00000043			sc	43	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	116	Port 44	Port 00000044			sc	44	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	117	Port 45	Port 00000045			sc	45	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	118	Port 46	Port 00000046			sc	46	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	119	Port 47	Port 00000047			sc	47	11	73	
2021-04-14	2021-04-14 13:36:01.42-04	120	Port 48	Port 00000048			sc	48	11	73	
\.


--
-- Data for Name: dcim_interface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface (created, last_updated, custom_field_data, id, name, label, description, _cable_peer_id, mark_connected, enabled, mac_address, mtu, mode, _name, type, mgmt_only, _cable_peer_type_id, _path_id, cable_id, device_id, lag_id, parent_id, untagged_vlan_id) FROM stdin;
2021-04-14	2021-04-14 13:36:01.841-04	{}	1	GigabitEthernet0/0/0			1	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	7	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	2	GigabitEthernet0/0/1			23	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	21	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	3	GigabitEthernet0/1/0			170	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	29	35	1	833	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	4	GigabitEthernet0/1/1			171	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	30	36	1	833	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	5	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	6	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	7	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	8	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	9	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	10	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	11	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	12	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	13	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	14	GigabitEthernet0/0/0			2	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	4	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	15	GigabitEthernet0/0/1			24	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	22	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	16	GigabitEthernet0/1/0			221	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	35	37	2	835	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	17	GigabitEthernet0/1/1			222	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	36	38	2	835	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	18	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	19	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	20	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	21	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	22	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	23	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	24	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	25	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	26	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	27	GigabitEthernet0/0/0			3	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	12	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	28	GigabitEthernet0/0/1			25	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	23	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	29	GigabitEthernet0/1/0			272	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	41	39	3	837	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	30	GigabitEthernet0/1/1			273	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	42	40	3	837	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	31	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	32	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	33	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	34	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	35	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	36	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	37	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	38	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	39	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	40	GigabitEthernet0/0/0			4	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	14	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	41	GigabitEthernet0/0/1			26	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	24	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	42	GigabitEthernet0/1/0			323	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	47	41	4	839	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	43	GigabitEthernet0/1/1			324	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	48	42	4	839	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	44	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	45	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	46	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	47	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	48	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	49	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	50	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	51	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	52	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	53	GigabitEthernet0/0/0			5	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	5	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	54	GigabitEthernet0/0/1			27	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	25	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	55	GigabitEthernet0/1/0			374	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	53	43	5	841	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	56	GigabitEthernet0/1/1			375	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	54	44	5	841	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	57	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	58	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	59	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	60	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	61	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	62	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	63	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	64	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	65	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	66	GigabitEthernet0/0/0			6	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	8	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	67	GigabitEthernet0/0/1			28	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	26	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	68	GigabitEthernet0/1/0			425	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	59	45	6	843	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	69	GigabitEthernet0/1/1			426	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	60	46	6	843	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	70	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	71	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	72	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	73	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	74	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	75	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	76	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	77	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	78	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	79	GigabitEthernet0/0/0			8	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	10	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	80	GigabitEthernet0/0/1			29	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	27	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	81	GigabitEthernet0/1/0			476	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	65	47	7	845	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	82	GigabitEthernet0/1/1			477	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	66	48	7	845	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	83	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	84	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	85	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	86	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	87	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	88	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	89	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	90	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	91	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	92	GigabitEthernet0/0/0			10	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	9	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	93	GigabitEthernet0/0/1			30	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	28	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	94	GigabitEthernet0/1/0			527	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	71	49	8	847	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	95	GigabitEthernet0/1/1			528	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	72	50	8	847	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	96	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	97	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	98	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	99	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	100	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	101	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	102	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	103	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	104	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	105	GigabitEthernet0/0/0			11	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	3	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	106	GigabitEthernet0/0/1			31	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	29	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	107	GigabitEthernet0/1/0			578	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	77	51	9	849	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	108	GigabitEthernet0/1/1			579	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	78	52	9	849	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	109	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	110	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	111	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	112	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	113	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	114	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	115	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	116	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	117	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	118	GigabitEthernet0/0/0			12	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	2	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	119	GigabitEthernet0/0/1			32	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	30	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	120	GigabitEthernet0/1/0			629	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	83	53	10	851	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	121	GigabitEthernet0/1/1			630	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	84	54	10	851	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	122	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	123	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	124	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	125	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	126	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	127	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	128	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	129	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	130	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	131	GigabitEthernet0/0/0			13	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	6	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	132	GigabitEthernet0/0/1			33	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	31	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	133	GigabitEthernet0/1/0			680	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	89	55	11	853	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	134	GigabitEthernet0/1/1			681	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	90	56	11	853	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	135	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	136	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	137	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	138	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	139	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	849	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	9	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	140	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	141	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	142	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	143	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	144	GigabitEthernet0/0/0			14	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	13	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	145	GigabitEthernet0/0/1			34	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	32	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	146	GigabitEthernet0/1/0			731	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	95	57	12	855	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	147	GigabitEthernet0/1/1			732	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	96	58	12	855	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	148	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	149	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	150	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	151	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	152	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	153	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	154	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	155	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	156	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	157	GigabitEthernet0/0/0			15	f	t	\N	\N		0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	10	\N	1	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	158	GigabitEthernet0/0/1			35	f	t	\N	\N		0000000099999999GigabitEthernet000001............	1000base-t	f	10	\N	33	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	159	GigabitEthernet0/1/0			782	f	t	\N	\N		0000000199999999GigabitEthernet000000............	1000base-t	f	27	101	59	13	857	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	160	GigabitEthernet0/1/1			783	f	t	\N	\N		0000000199999999GigabitEthernet000001............	1000base-t	f	27	102	60	13	857	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	161	GigabitEthernet0/1/2			\N	f	t	\N	\N		0000000199999999GigabitEthernet000002............	1000base-t	f	\N	\N	\N	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	162	GigabitEthernet0/1/3			\N	f	t	\N	\N		0000000199999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	163	GigabitEthernet0/1/4			\N	f	t	\N	\N		0000000199999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	164	GigabitEthernet0/1/5			\N	f	t	\N	\N		0000000199999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	165	GigabitEthernet0/1/6			\N	f	t	\N	\N		0000000199999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	166	GigabitEthernet0/1/7			\N	f	t	\N	\N		0000000199999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	167	GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	168	Wlan-GigabitEthernet0/1/8			\N	f	t	\N	\N		0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	\N	\N	\N	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	169	Cellular0/2/0			\N	f	t	\N	\N		0000000299999999Cellular000000............	lte	f	\N	\N	\N	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	170	GigabitEthernet1/0/1			3	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	31	35	14	834	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	171	GigabitEthernet1/0/2			4	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	32	36	14	834	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	172	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	173	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	174	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	175	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	176	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	177	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	178	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	179	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	180	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	181	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	182	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	183	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	184	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	185	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	186	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	187	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	188	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	189	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	190	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	191	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	192	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	193	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	194	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	195	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	196	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	197	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	198	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	199	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	200	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	201	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	202	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	203	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	204	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	205	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	206	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	207	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	208	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	209	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	210	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	211	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	212	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	213	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	214	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	215	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	216	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	217	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	218	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	219	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	220	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	221	GigabitEthernet1/0/1			16	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	37	37	15	836	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	222	GigabitEthernet1/0/2			17	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	38	38	15	836	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	223	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	224	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	225	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	226	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	227	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	228	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	229	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	230	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	231	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	232	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	233	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	850	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	234	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	235	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	236	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	237	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	238	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	239	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	240	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	241	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	242	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	243	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	244	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	245	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	246	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	247	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	248	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	249	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	250	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	251	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	252	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	253	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	254	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	255	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	256	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	257	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	258	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	259	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	260	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	261	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	262	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	263	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	264	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	265	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	266	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	267	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	268	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	269	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	270	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	271	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	272	GigabitEthernet1/0/1			29	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	43	39	16	838	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	273	GigabitEthernet1/0/2			30	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	44	40	16	838	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	274	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	275	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	276	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	277	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	278	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	279	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	280	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	851	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	10	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	281	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	282	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	283	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	284	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	285	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	286	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	287	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	288	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	289	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	290	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	291	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	292	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	293	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	294	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	295	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	296	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	297	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	298	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	299	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	300	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	301	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	302	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	303	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	304	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	305	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	306	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	307	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	308	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	309	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	310	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	311	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	312	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	313	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	314	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	315	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	316	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	317	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	318	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	319	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	320	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	321	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	322	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	323	GigabitEthernet1/0/1			42	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	49	41	17	840	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	324	GigabitEthernet1/0/2			43	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	50	42	17	840	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	325	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	326	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	327	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	328	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	329	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	330	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	331	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	332	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	333	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	334	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	335	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	336	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	337	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	338	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	339	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	340	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	341	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	342	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	343	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	344	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	345	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	346	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	347	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	348	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	349	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	350	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	351	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	352	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	353	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	354	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	355	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	356	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	357	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	358	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	359	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	360	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	361	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	362	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	363	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	364	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	365	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	366	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	367	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	368	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	369	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	370	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	371	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	372	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	373	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	374	GigabitEthernet1/0/1			55	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	55	43	18	842	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	852	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	375	GigabitEthernet1/0/2			56	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	56	44	18	842	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	376	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	377	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	378	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	379	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	380	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	381	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	382	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	383	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	384	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	385	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	386	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	387	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	388	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	389	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	390	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	391	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	392	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	393	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	394	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	395	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	396	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	397	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	398	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	399	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	400	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	401	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	402	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	403	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	404	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	405	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	406	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	407	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	408	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	409	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	410	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	411	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	412	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	413	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	414	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	415	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	416	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	417	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	418	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	419	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	420	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	421	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	422	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	423	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	424	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	425	GigabitEthernet1/0/1			68	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	61	45	19	844	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	426	GigabitEthernet1/0/2			69	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	62	46	19	844	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	427	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	428	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	429	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	430	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	431	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	432	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	433	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	434	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	435	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	436	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	437	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	438	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	439	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	440	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	441	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	442	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	443	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	444	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	445	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	446	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	447	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	448	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	449	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	450	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	451	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	452	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	453	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	454	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	455	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	456	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	457	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	458	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	459	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	460	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	461	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	462	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	463	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	464	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	465	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	466	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	467	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	468	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	853	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	11	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	469	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	470	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	471	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	472	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	473	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	474	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	475	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	476	GigabitEthernet1/0/1			81	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	67	47	20	846	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	477	GigabitEthernet1/0/2			82	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	68	48	20	846	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	478	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	479	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	480	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	481	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	482	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	483	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	484	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	485	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	486	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	487	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	488	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	489	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	490	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	491	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	492	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	493	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	494	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	495	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	496	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	497	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	498	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	499	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	500	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	501	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	502	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	503	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	504	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	505	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	506	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	507	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	508	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	509	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	510	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	511	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	512	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	513	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	514	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	515	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	854	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	516	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	517	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	518	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	519	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	520	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	521	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	522	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	523	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	524	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	525	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	526	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	527	GigabitEthernet1/0/1			94	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	73	49	21	848	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	528	GigabitEthernet1/0/2			95	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	74	50	21	848	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	529	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	530	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	531	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	532	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	533	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	534	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	535	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	536	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	537	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	538	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	539	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	540	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	541	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	542	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	543	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	544	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	545	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	546	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	547	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	548	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	549	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	550	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	551	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	552	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	553	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	554	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	555	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	556	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	557	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	558	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	559	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	560	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	561	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	562	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	855	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	12	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	563	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	564	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	565	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	566	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	567	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	568	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	569	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	570	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	571	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	572	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	573	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	574	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	575	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	576	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	577	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	578	GigabitEthernet1/0/1			107	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	79	51	22	850	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	579	GigabitEthernet1/0/2			108	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	80	52	22	850	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	580	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	581	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	582	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	583	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	584	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	585	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	586	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	587	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	588	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	589	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	590	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	591	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	592	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	593	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	594	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	595	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	596	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	597	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	598	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	599	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	600	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	601	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	602	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	603	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	604	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	605	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	606	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	607	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	608	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	609	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	856	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	610	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	611	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	612	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	613	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	614	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	615	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	616	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	617	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	618	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	619	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	620	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	621	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	622	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	623	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	624	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	625	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	626	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	627	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	628	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	22	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	629	GigabitEthernet1/0/1			120	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	85	53	23	852	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	630	GigabitEthernet1/0/2			121	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	86	54	23	852	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	631	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	632	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	633	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	634	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	635	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	636	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	637	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	638	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	639	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	640	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	641	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	642	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	643	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	644	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	645	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	646	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	647	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	648	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	649	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	650	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	651	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	652	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	653	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	654	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	655	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	656	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	857	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	13	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	657	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	658	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	659	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	660	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	661	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	662	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	663	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	664	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	665	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	666	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	667	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	668	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	669	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	670	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	671	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	672	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	673	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	674	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	675	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	676	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	677	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	678	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	679	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	23	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	680	GigabitEthernet1/0/1			133	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	91	55	24	854	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	681	GigabitEthernet1/0/2			134	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	92	56	24	854	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	682	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	683	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	684	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	685	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	686	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	687	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	688	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	689	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	690	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	691	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	692	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	693	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	694	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	695	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	696	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	697	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	698	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	699	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	700	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	701	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	702	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	703	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	858	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	704	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	705	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	706	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	707	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	708	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	709	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	710	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	711	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	712	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	713	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	714	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	715	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	716	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	717	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	718	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	719	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	720	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	721	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	722	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	723	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	724	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	725	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	726	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	727	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	728	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	729	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	730	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	24	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	731	GigabitEthernet1/0/1			146	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	97	57	25	856	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	732	GigabitEthernet1/0/2			147	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	98	58	25	856	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	733	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	734	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	735	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	736	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	737	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	738	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	739	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	740	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	741	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	742	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	743	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	744	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	745	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	746	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	747	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	748	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	749	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	750	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	751	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	752	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	753	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	754	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	755	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	756	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	757	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	758	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	759	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	760	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	761	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	762	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	763	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	764	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	765	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	766	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	767	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	768	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	769	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	770	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	771	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	772	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	773	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	774	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	775	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	776	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	777	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	778	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	779	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	780	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	781	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	25	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	782	GigabitEthernet1/0/1			159	f	t	\N	\N		0001000099999999GigabitEthernet000001............	1000base-t	f	27	103	59	26	858	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	783	GigabitEthernet1/0/2			160	f	t	\N	\N		0001000099999999GigabitEthernet000002............	1000base-t	f	27	104	60	26	858	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	784	GigabitEthernet1/0/3			\N	f	t	\N	\N		0001000099999999GigabitEthernet000003............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	785	GigabitEthernet1/0/4			\N	f	t	\N	\N		0001000099999999GigabitEthernet000004............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	786	GigabitEthernet1/0/5			\N	f	t	\N	\N		0001000099999999GigabitEthernet000005............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	787	GigabitEthernet1/0/6			\N	f	t	\N	\N		0001000099999999GigabitEthernet000006............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	788	GigabitEthernet1/0/7			\N	f	t	\N	\N		0001000099999999GigabitEthernet000007............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	789	GigabitEthernet1/0/8			\N	f	t	\N	\N		0001000099999999GigabitEthernet000008............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	790	GigabitEthernet1/0/9			\N	f	t	\N	\N		0001000099999999GigabitEthernet000009............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	791	GigabitEthernet1/0/10			\N	f	t	\N	\N		0001000099999999GigabitEthernet000010............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	792	GigabitEthernet1/0/11			\N	f	t	\N	\N		0001000099999999GigabitEthernet000011............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	793	GigabitEthernet1/0/12			\N	f	t	\N	\N		0001000099999999GigabitEthernet000012............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	794	GigabitEthernet1/0/13			\N	f	t	\N	\N		0001000099999999GigabitEthernet000013............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	795	GigabitEthernet1/0/14			\N	f	t	\N	\N		0001000099999999GigabitEthernet000014............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	796	GigabitEthernet1/0/15			\N	f	t	\N	\N		0001000099999999GigabitEthernet000015............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	797	GigabitEthernet1/0/16			\N	f	t	\N	\N		0001000099999999GigabitEthernet000016............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	798	GigabitEthernet1/0/17			\N	f	t	\N	\N		0001000099999999GigabitEthernet000017............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	799	GigabitEthernet1/0/18			\N	f	t	\N	\N		0001000099999999GigabitEthernet000018............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	800	GigabitEthernet1/0/19			\N	f	t	\N	\N		0001000099999999GigabitEthernet000019............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	801	GigabitEthernet1/0/20			\N	f	t	\N	\N		0001000099999999GigabitEthernet000020............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	802	GigabitEthernet1/0/21			\N	f	t	\N	\N		0001000099999999GigabitEthernet000021............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	803	GigabitEthernet1/0/22			\N	f	t	\N	\N		0001000099999999GigabitEthernet000022............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	804	GigabitEthernet1/0/23			\N	f	t	\N	\N		0001000099999999GigabitEthernet000023............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	805	GigabitEthernet1/0/24			\N	f	t	\N	\N		0001000099999999GigabitEthernet000024............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	806	GigabitEthernet1/0/25			\N	f	t	\N	\N		0001000099999999GigabitEthernet000025............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	807	GigabitEthernet1/0/26			\N	f	t	\N	\N		0001000099999999GigabitEthernet000026............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	808	GigabitEthernet1/0/27			\N	f	t	\N	\N		0001000099999999GigabitEthernet000027............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	809	GigabitEthernet1/0/28			\N	f	t	\N	\N		0001000099999999GigabitEthernet000028............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	810	GigabitEthernet1/0/29			\N	f	t	\N	\N		0001000099999999GigabitEthernet000029............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	811	GigabitEthernet1/0/30			\N	f	t	\N	\N		0001000099999999GigabitEthernet000030............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	812	GigabitEthernet1/0/31			\N	f	t	\N	\N		0001000099999999GigabitEthernet000031............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	813	GigabitEthernet1/0/32			\N	f	t	\N	\N		0001000099999999GigabitEthernet000032............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	814	GigabitEthernet1/0/33			\N	f	t	\N	\N		0001000099999999GigabitEthernet000033............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	815	GigabitEthernet1/0/34			\N	f	t	\N	\N		0001000099999999GigabitEthernet000034............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	816	GigabitEthernet1/0/35			\N	f	t	\N	\N		0001000099999999GigabitEthernet000035............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	817	GigabitEthernet1/0/36			\N	f	t	\N	\N		0001000099999999GigabitEthernet000036............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	818	GigabitEthernet1/0/37			\N	f	t	\N	\N		0001000099999999GigabitEthernet000037............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	819	GigabitEthernet1/0/38			\N	f	t	\N	\N		0001000099999999GigabitEthernet000038............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	820	GigabitEthernet1/0/39			\N	f	t	\N	\N		0001000099999999GigabitEthernet000039............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	821	GigabitEthernet1/0/40			\N	f	t	\N	\N		0001000099999999GigabitEthernet000040............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	822	GigabitEthernet1/0/41			\N	f	t	\N	\N		0001000099999999GigabitEthernet000041............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	823	GigabitEthernet1/0/42			\N	f	t	\N	\N		0001000099999999GigabitEthernet000042............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	824	GigabitEthernet1/0/43			\N	f	t	\N	\N		0001000099999999GigabitEthernet000043............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	825	GigabitEthernet1/0/44			\N	f	t	\N	\N		0001000099999999GigabitEthernet000044............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	826	GigabitEthernet1/0/45			\N	f	t	\N	\N		0001000099999999GigabitEthernet000045............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	827	GigabitEthernet1/0/46			\N	f	t	\N	\N		0001000099999999GigabitEthernet000046............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	828	GigabitEthernet1/0/47			\N	f	t	\N	\N		0001000099999999GigabitEthernet000047............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	829	GigabitEthernet1/0/48			\N	f	t	\N	\N		0001000099999999GigabitEthernet000048............	1000base-t	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	830	GigabitEthernet0			\N	f	t	\N	\N		9999999999999999GigabitEthernet000000............	1000base-t	t	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	831	STACK0			\N	f	t	\N	\N		9999999999999999STACK000000............	cisco-stackwise	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	832	STACK1			\N	f	t	\N	\N		9999999999999999STACK000001............	cisco-stackwise	f	\N	\N	\N	26	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	833	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	1	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	834	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	14	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	835	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	2	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	836	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	15	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	837	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	3	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	838	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	16	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	839	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	4	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	840	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	17	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	841	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	5	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	842	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	18	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	843	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	6	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	844	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	19	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	845	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	7	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	846	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	20	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	847	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	8	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	848	Po1			\N	f	t	\N	\N		9999999999999999Po000001............	lag	f	\N	\N	\N	21	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	859	et-0/0/48			\N	f	t	\N	\N		0000000099999999et-000048............	100gbase-x-qsfp28	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	860	et-0/0/49			\N	f	t	\N	\N		0000000099999999et-000049............	100gbase-x-qsfp28	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	861	et-0/0/50			\N	f	t	\N	\N		0000000099999999et-000050............	100gbase-x-qsfp28	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	862	et-0/0/51			\N	f	t	\N	\N		0000000099999999et-000051............	100gbase-x-qsfp28	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	863	xe-0/0/0			1393	f	t	\N	\N		0000000099999999xe-000000............	10gbase-x-sfpp	f	25	\N	124	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	864	xe-0/0/1			1394	f	t	\N	\N		0000000099999999xe-000001............	10gbase-x-sfpp	f	25	\N	125	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	865	xe-0/0/2			1395	f	t	\N	\N		0000000099999999xe-000002............	10gbase-x-sfpp	f	25	\N	126	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	866	xe-0/0/3			1396	f	t	\N	\N		0000000099999999xe-000003............	10gbase-x-sfpp	f	25	\N	127	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	867	xe-0/0/4			\N	f	t	\N	\N		0000000099999999xe-000004............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	868	xe-0/0/5			\N	f	t	\N	\N		0000000099999999xe-000005............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	869	xe-0/0/6			\N	f	t	\N	\N		0000000099999999xe-000006............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	870	xe-0/0/7			\N	f	t	\N	\N		0000000099999999xe-000007............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	871	xe-0/0/8			\N	f	t	\N	\N		0000000099999999xe-000008............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	872	xe-0/0/9			\N	f	t	\N	\N		0000000099999999xe-000009............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	873	xe-0/0/10			\N	f	t	\N	\N		0000000099999999xe-000010............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	874	xe-0/0/11			\N	f	t	\N	\N		0000000099999999xe-000011............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	875	xe-0/0/12			\N	f	t	\N	\N		0000000099999999xe-000012............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	876	xe-0/0/13			\N	f	t	\N	\N		0000000099999999xe-000013............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	877	xe-0/0/14			\N	f	t	\N	\N		0000000099999999xe-000014............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	878	xe-0/0/15			\N	f	t	\N	\N		0000000099999999xe-000015............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	879	xe-0/0/16			\N	f	t	\N	\N		0000000099999999xe-000016............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	880	xe-0/0/17			\N	f	t	\N	\N		0000000099999999xe-000017............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	881	xe-0/0/18			\N	f	t	\N	\N		0000000099999999xe-000018............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	882	xe-0/0/19			\N	f	t	\N	\N		0000000099999999xe-000019............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	883	xe-0/0/20			\N	f	t	\N	\N		0000000099999999xe-000020............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	884	xe-0/0/21			\N	f	t	\N	\N		0000000099999999xe-000021............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	885	xe-0/0/22			\N	f	t	\N	\N		0000000099999999xe-000022............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	886	xe-0/0/23			\N	f	t	\N	\N		0000000099999999xe-000023............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	887	xe-0/0/24			\N	f	t	\N	\N		0000000099999999xe-000024............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	888	xe-0/0/25			\N	f	t	\N	\N		0000000099999999xe-000025............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	889	xe-0/0/26			\N	f	t	\N	\N		0000000099999999xe-000026............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	890	xe-0/0/27			\N	f	t	\N	\N		0000000099999999xe-000027............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	891	xe-0/0/28			\N	f	t	\N	\N		0000000099999999xe-000028............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	892	xe-0/0/29			\N	f	t	\N	\N		0000000099999999xe-000029............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	893	xe-0/0/30			\N	f	t	\N	\N		0000000099999999xe-000030............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	894	xe-0/0/31			\N	f	t	\N	\N		0000000099999999xe-000031............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	895	xe-0/0/32			\N	f	t	\N	\N		0000000099999999xe-000032............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	896	xe-0/0/33			\N	f	t	\N	\N		0000000099999999xe-000033............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	897	xe-0/0/34			\N	f	t	\N	\N		0000000099999999xe-000034............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	898	xe-0/0/35			\N	f	t	\N	\N		0000000099999999xe-000035............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	899	xe-0/0/36			\N	f	t	\N	\N		0000000099999999xe-000036............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	900	xe-0/0/37			\N	f	t	\N	\N		0000000099999999xe-000037............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	901	xe-0/0/38			\N	f	t	\N	\N		0000000099999999xe-000038............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	902	xe-0/0/39			\N	f	t	\N	\N		0000000099999999xe-000039............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	903	xe-0/0/40			\N	f	t	\N	\N		0000000099999999xe-000040............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	904	xe-0/0/41			\N	f	t	\N	\N		0000000099999999xe-000041............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	905	xe-0/0/42			\N	f	t	\N	\N		0000000099999999xe-000042............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	906	xe-0/0/43			\N	f	t	\N	\N		0000000099999999xe-000043............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	907	xe-0/0/44			\N	f	t	\N	\N		0000000099999999xe-000044............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	908	xe-0/0/45			\N	f	t	\N	\N		0000000099999999xe-000045............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	909	xe-0/0/46			\N	f	t	\N	\N		0000000099999999xe-000046............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	910	xe-0/0/47			\N	f	t	\N	\N		0000000099999999xe-000047............	10gbase-x-sfpp	f	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	911	fxp0			\N	f	t	\N	\N		9999999999999999fxp000000............	1000base-t	t	\N	\N	\N	93	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	912	et-0/0/48			\N	f	t	\N	\N		0000000099999999et-000048............	100gbase-x-qsfp28	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	913	et-0/0/49			\N	f	t	\N	\N		0000000099999999et-000049............	100gbase-x-qsfp28	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	914	et-0/0/50			\N	f	t	\N	\N		0000000099999999et-000050............	100gbase-x-qsfp28	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	915	et-0/0/51			\N	f	t	\N	\N		0000000099999999et-000051............	100gbase-x-qsfp28	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	916	xe-0/0/0			1441	f	t	\N	\N		0000000099999999xe-000000............	10gbase-x-sfpp	f	25	\N	116	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	917	xe-0/0/1			1442	f	t	\N	\N		0000000099999999xe-000001............	10gbase-x-sfpp	f	25	\N	117	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	918	xe-0/0/2			1443	f	t	\N	\N		0000000099999999xe-000002............	10gbase-x-sfpp	f	25	\N	118	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	919	xe-0/0/3			1444	f	t	\N	\N		0000000099999999xe-000003............	10gbase-x-sfpp	f	25	\N	119	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	920	xe-0/0/4			\N	f	t	\N	\N		0000000099999999xe-000004............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	921	xe-0/0/5			\N	f	t	\N	\N		0000000099999999xe-000005............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	922	xe-0/0/6			\N	f	t	\N	\N		0000000099999999xe-000006............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	923	xe-0/0/7			\N	f	t	\N	\N		0000000099999999xe-000007............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	924	xe-0/0/8			\N	f	t	\N	\N		0000000099999999xe-000008............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	925	xe-0/0/9			\N	f	t	\N	\N		0000000099999999xe-000009............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	926	xe-0/0/10			\N	f	t	\N	\N		0000000099999999xe-000010............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	927	xe-0/0/11			\N	f	t	\N	\N		0000000099999999xe-000011............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	928	xe-0/0/12			\N	f	t	\N	\N		0000000099999999xe-000012............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	929	xe-0/0/13			\N	f	t	\N	\N		0000000099999999xe-000013............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	930	xe-0/0/14			\N	f	t	\N	\N		0000000099999999xe-000014............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	931	xe-0/0/15			\N	f	t	\N	\N		0000000099999999xe-000015............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	932	xe-0/0/16			\N	f	t	\N	\N		0000000099999999xe-000016............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	933	xe-0/0/17			\N	f	t	\N	\N		0000000099999999xe-000017............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	934	xe-0/0/18			\N	f	t	\N	\N		0000000099999999xe-000018............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	935	xe-0/0/19			\N	f	t	\N	\N		0000000099999999xe-000019............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	936	xe-0/0/20			\N	f	t	\N	\N		0000000099999999xe-000020............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	937	xe-0/0/21			\N	f	t	\N	\N		0000000099999999xe-000021............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	938	xe-0/0/22			\N	f	t	\N	\N		0000000099999999xe-000022............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	939	xe-0/0/23			\N	f	t	\N	\N		0000000099999999xe-000023............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	940	xe-0/0/24			\N	f	t	\N	\N		0000000099999999xe-000024............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	941	xe-0/0/25			\N	f	t	\N	\N		0000000099999999xe-000025............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	942	xe-0/0/26			\N	f	t	\N	\N		0000000099999999xe-000026............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	943	xe-0/0/27			\N	f	t	\N	\N		0000000099999999xe-000027............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	944	xe-0/0/28			\N	f	t	\N	\N		0000000099999999xe-000028............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	945	xe-0/0/29			\N	f	t	\N	\N		0000000099999999xe-000029............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	946	xe-0/0/30			\N	f	t	\N	\N		0000000099999999xe-000030............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	947	xe-0/0/31			\N	f	t	\N	\N		0000000099999999xe-000031............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	948	xe-0/0/32			\N	f	t	\N	\N		0000000099999999xe-000032............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	949	xe-0/0/33			\N	f	t	\N	\N		0000000099999999xe-000033............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	950	xe-0/0/34			\N	f	t	\N	\N		0000000099999999xe-000034............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	951	xe-0/0/35			\N	f	t	\N	\N		0000000099999999xe-000035............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	952	xe-0/0/36			\N	f	t	\N	\N		0000000099999999xe-000036............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	953	xe-0/0/37			\N	f	t	\N	\N		0000000099999999xe-000037............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	954	xe-0/0/38			\N	f	t	\N	\N		0000000099999999xe-000038............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	955	xe-0/0/39			\N	f	t	\N	\N		0000000099999999xe-000039............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	956	xe-0/0/40			\N	f	t	\N	\N		0000000099999999xe-000040............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	957	xe-0/0/41			\N	f	t	\N	\N		0000000099999999xe-000041............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	958	xe-0/0/42			\N	f	t	\N	\N		0000000099999999xe-000042............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	959	xe-0/0/43			\N	f	t	\N	\N		0000000099999999xe-000043............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	960	xe-0/0/44			\N	f	t	\N	\N		0000000099999999xe-000044............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	961	xe-0/0/45			\N	f	t	\N	\N		0000000099999999xe-000045............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	962	xe-0/0/46			\N	f	t	\N	\N		0000000099999999xe-000046............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	963	xe-0/0/47			\N	f	t	\N	\N		0000000099999999xe-000047............	10gbase-x-sfpp	f	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	964	fxp0			\N	f	t	\N	\N		9999999999999999fxp000000............	1000base-t	t	\N	\N	\N	94	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	965	et-0/0/48			\N	f	t	\N	\N		0000000099999999et-000048............	100gbase-x-qsfp28	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	966	et-0/0/49			\N	f	t	\N	\N		0000000099999999et-000049............	100gbase-x-qsfp28	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	967	et-0/0/50			\N	f	t	\N	\N		0000000099999999et-000050............	100gbase-x-qsfp28	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	968	et-0/0/51			\N	f	t	\N	\N		0000000099999999et-000051............	100gbase-x-qsfp28	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	969	xe-0/0/0			1489	f	t	\N	\N		0000000099999999xe-000000............	10gbase-x-sfpp	f	25	\N	120	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	970	xe-0/0/1			1490	f	t	\N	\N		0000000099999999xe-000001............	10gbase-x-sfpp	f	25	\N	121	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	971	xe-0/0/2			1491	f	t	\N	\N		0000000099999999xe-000002............	10gbase-x-sfpp	f	25	\N	122	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	972	xe-0/0/3			1492	f	t	\N	\N		0000000099999999xe-000003............	10gbase-x-sfpp	f	25	\N	123	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	973	xe-0/0/4			\N	f	t	\N	\N		0000000099999999xe-000004............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	974	xe-0/0/5			\N	f	t	\N	\N		0000000099999999xe-000005............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	975	xe-0/0/6			\N	f	t	\N	\N		0000000099999999xe-000006............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	976	xe-0/0/7			\N	f	t	\N	\N		0000000099999999xe-000007............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	977	xe-0/0/8			\N	f	t	\N	\N		0000000099999999xe-000008............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	978	xe-0/0/9			\N	f	t	\N	\N		0000000099999999xe-000009............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	979	xe-0/0/10			\N	f	t	\N	\N		0000000099999999xe-000010............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	980	xe-0/0/11			\N	f	t	\N	\N		0000000099999999xe-000011............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	981	xe-0/0/12			\N	f	t	\N	\N		0000000099999999xe-000012............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	982	xe-0/0/13			\N	f	t	\N	\N		0000000099999999xe-000013............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	983	xe-0/0/14			\N	f	t	\N	\N		0000000099999999xe-000014............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	984	xe-0/0/15			\N	f	t	\N	\N		0000000099999999xe-000015............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	985	xe-0/0/16			\N	f	t	\N	\N		0000000099999999xe-000016............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	986	xe-0/0/17			\N	f	t	\N	\N		0000000099999999xe-000017............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	987	xe-0/0/18			\N	f	t	\N	\N		0000000099999999xe-000018............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	988	xe-0/0/19			\N	f	t	\N	\N		0000000099999999xe-000019............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	989	xe-0/0/20			\N	f	t	\N	\N		0000000099999999xe-000020............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	990	xe-0/0/21			\N	f	t	\N	\N		0000000099999999xe-000021............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	991	xe-0/0/22			\N	f	t	\N	\N		0000000099999999xe-000022............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	992	xe-0/0/23			\N	f	t	\N	\N		0000000099999999xe-000023............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	993	xe-0/0/24			\N	f	t	\N	\N		0000000099999999xe-000024............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	994	xe-0/0/25			\N	f	t	\N	\N		0000000099999999xe-000025............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	995	xe-0/0/26			\N	f	t	\N	\N		0000000099999999xe-000026............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	996	xe-0/0/27			\N	f	t	\N	\N		0000000099999999xe-000027............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	997	xe-0/0/28			\N	f	t	\N	\N		0000000099999999xe-000028............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	998	xe-0/0/29			\N	f	t	\N	\N		0000000099999999xe-000029............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	999	xe-0/0/30			\N	f	t	\N	\N		0000000099999999xe-000030............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1000	xe-0/0/31			\N	f	t	\N	\N		0000000099999999xe-000031............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1001	xe-0/0/32			\N	f	t	\N	\N		0000000099999999xe-000032............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1002	xe-0/0/33			\N	f	t	\N	\N		0000000099999999xe-000033............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1003	xe-0/0/34			\N	f	t	\N	\N		0000000099999999xe-000034............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1004	xe-0/0/35			\N	f	t	\N	\N		0000000099999999xe-000035............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1005	xe-0/0/36			\N	f	t	\N	\N		0000000099999999xe-000036............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1006	xe-0/0/37			\N	f	t	\N	\N		0000000099999999xe-000037............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1007	xe-0/0/38			\N	f	t	\N	\N		0000000099999999xe-000038............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1008	xe-0/0/39			\N	f	t	\N	\N		0000000099999999xe-000039............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1009	xe-0/0/40			\N	f	t	\N	\N		0000000099999999xe-000040............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1010	xe-0/0/41			\N	f	t	\N	\N		0000000099999999xe-000041............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1011	xe-0/0/42			\N	f	t	\N	\N		0000000099999999xe-000042............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1012	xe-0/0/43			\N	f	t	\N	\N		0000000099999999xe-000043............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1013	xe-0/0/44			\N	f	t	\N	\N		0000000099999999xe-000044............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1014	xe-0/0/45			\N	f	t	\N	\N		0000000099999999xe-000045............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1015	xe-0/0/46			\N	f	t	\N	\N		0000000099999999xe-000046............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1016	xe-0/0/47			\N	f	t	\N	\N		0000000099999999xe-000047............	10gbase-x-sfpp	f	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1017	fxp0			\N	f	t	\N	\N		9999999999999999fxp000000............	1000base-t	t	\N	\N	\N	95	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1018	xe-0/0/0			1297	f	t	\N	\N		0000000099999999xe-000000............	10gbase-x-sfpp	f	25	\N	104	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1019	xe-0/0/1			1298	f	t	\N	\N		0000000099999999xe-000001............	10gbase-x-sfpp	f	25	\N	105	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1020	xe-0/0/2			1345	f	t	\N	\N		0000000099999999xe-000002............	10gbase-x-sfpp	f	25	\N	108	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1021	xe-0/0/3			1346	f	t	\N	\N		0000000099999999xe-000003............	10gbase-x-sfpp	f	25	\N	109	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1022	xe-0/0/4			1249	f	t	\N	\N		0000000099999999xe-000004............	10gbase-x-sfpp	f	25	\N	112	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1023	xe-0/0/5			1250	f	t	\N	\N		0000000099999999xe-000005............	10gbase-x-sfpp	f	25	\N	113	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1024	xe-0/0/6			\N	f	t	\N	\N		0000000099999999xe-000006............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1025	xe-0/0/7			\N	f	t	\N	\N		0000000099999999xe-000007............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1026	xe-0/0/8			\N	f	t	\N	\N		0000000099999999xe-000008............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1027	xe-0/0/9			\N	f	t	\N	\N		0000000099999999xe-000009............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1028	xe-0/0/10			\N	f	t	\N	\N		0000000099999999xe-000010............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1029	xe-0/0/11			\N	f	t	\N	\N		0000000099999999xe-000011............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1030	xe-0/0/12			\N	f	t	\N	\N		0000000099999999xe-000012............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1031	xe-0/0/13			\N	f	t	\N	\N		0000000099999999xe-000013............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1032	xe-0/0/14			\N	f	t	\N	\N		0000000099999999xe-000014............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1033	xe-0/0/15			\N	f	t	\N	\N		0000000099999999xe-000015............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1034	xe-0/0/16			\N	f	t	\N	\N		0000000099999999xe-000016............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1035	xe-0/0/17			\N	f	t	\N	\N		0000000099999999xe-000017............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1036	xe-0/0/18			\N	f	t	\N	\N		0000000099999999xe-000018............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1037	xe-0/0/19			\N	f	t	\N	\N		0000000099999999xe-000019............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1038	xe-0/0/20			\N	f	t	\N	\N		0000000099999999xe-000020............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1039	xe-0/0/21			\N	f	t	\N	\N		0000000099999999xe-000021............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1040	xe-0/0/22			\N	f	t	\N	\N		0000000099999999xe-000022............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1041	xe-0/0/23			\N	f	t	\N	\N		0000000099999999xe-000023............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1042	xe-0/0/24			\N	f	t	\N	\N		0000000099999999xe-000024............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1043	xe-0/0/25			\N	f	t	\N	\N		0000000099999999xe-000025............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1044	xe-0/0/26			\N	f	t	\N	\N		0000000099999999xe-000026............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1045	xe-0/0/27			\N	f	t	\N	\N		0000000099999999xe-000027............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1046	xe-0/0/28			\N	f	t	\N	\N		0000000099999999xe-000028............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1047	xe-0/0/29			\N	f	t	\N	\N		0000000099999999xe-000029............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1048	xe-0/0/30			\N	f	t	\N	\N		0000000099999999xe-000030............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1049	xe-0/0/31			\N	f	t	\N	\N		0000000099999999xe-000031............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1050	xe-0/0/32			\N	f	t	\N	\N		0000000099999999xe-000032............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1051	xe-0/0/33			\N	f	t	\N	\N		0000000099999999xe-000033............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1052	xe-0/0/34			\N	f	t	\N	\N		0000000099999999xe-000034............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1053	xe-0/0/35			\N	f	t	\N	\N		0000000099999999xe-000035............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1054	xe-0/0/36			\N	f	t	\N	\N		0000000099999999xe-000036............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1055	xe-0/0/37			\N	f	t	\N	\N		0000000099999999xe-000037............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1056	xe-0/0/38			\N	f	t	\N	\N		0000000099999999xe-000038............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1057	xe-0/0/39			\N	f	t	\N	\N		0000000099999999xe-000039............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1058	xe-0/0/40			\N	f	t	\N	\N		0000000099999999xe-000040............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1059	xe-0/0/41			\N	f	t	\N	\N		0000000099999999xe-000041............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1060	xe-0/0/42			\N	f	t	\N	\N		0000000099999999xe-000042............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1061	xe-0/0/43			\N	f	t	\N	\N		0000000099999999xe-000043............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1062	xe-0/0/44			\N	f	t	\N	\N		0000000099999999xe-000044............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1063	xe-0/0/45			\N	f	t	\N	\N		0000000099999999xe-000045............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1064	xe-0/0/46			\N	f	t	\N	\N		0000000099999999xe-000046............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1065	xe-0/0/47			\N	f	t	\N	\N		0000000099999999xe-000047............	10gbase-x-sfpp	f	\N	\N	\N	96	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1066	xe-0/0/0			1299	f	t	\N	\N		0000000099999999xe-000000............	10gbase-x-sfpp	f	25	\N	106	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1067	xe-0/0/1			1300	f	t	\N	\N		0000000099999999xe-000001............	10gbase-x-sfpp	f	25	\N	107	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1068	xe-0/0/2			1347	f	t	\N	\N		0000000099999999xe-000002............	10gbase-x-sfpp	f	25	\N	110	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1069	xe-0/0/3			1348	f	t	\N	\N		0000000099999999xe-000003............	10gbase-x-sfpp	f	25	\N	111	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1070	xe-0/0/4			1251	f	t	\N	\N		0000000099999999xe-000004............	10gbase-x-sfpp	f	25	\N	114	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1071	xe-0/0/5			1252	f	t	\N	\N		0000000099999999xe-000005............	10gbase-x-sfpp	f	25	\N	115	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1072	xe-0/0/6			\N	f	t	\N	\N		0000000099999999xe-000006............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1073	xe-0/0/7			\N	f	t	\N	\N		0000000099999999xe-000007............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1074	xe-0/0/8			\N	f	t	\N	\N		0000000099999999xe-000008............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1075	xe-0/0/9			\N	f	t	\N	\N		0000000099999999xe-000009............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1076	xe-0/0/10			\N	f	t	\N	\N		0000000099999999xe-000010............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1077	xe-0/0/11			\N	f	t	\N	\N		0000000099999999xe-000011............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1078	xe-0/0/12			\N	f	t	\N	\N		0000000099999999xe-000012............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1079	xe-0/0/13			\N	f	t	\N	\N		0000000099999999xe-000013............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1080	xe-0/0/14			\N	f	t	\N	\N		0000000099999999xe-000014............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1081	xe-0/0/15			\N	f	t	\N	\N		0000000099999999xe-000015............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1082	xe-0/0/16			\N	f	t	\N	\N		0000000099999999xe-000016............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1083	xe-0/0/17			\N	f	t	\N	\N		0000000099999999xe-000017............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1084	xe-0/0/18			\N	f	t	\N	\N		0000000099999999xe-000018............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1085	xe-0/0/19			\N	f	t	\N	\N		0000000099999999xe-000019............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1086	xe-0/0/20			\N	f	t	\N	\N		0000000099999999xe-000020............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1087	xe-0/0/21			\N	f	t	\N	\N		0000000099999999xe-000021............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1088	xe-0/0/22			\N	f	t	\N	\N		0000000099999999xe-000022............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1089	xe-0/0/23			\N	f	t	\N	\N		0000000099999999xe-000023............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1090	xe-0/0/24			\N	f	t	\N	\N		0000000099999999xe-000024............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1091	xe-0/0/25			\N	f	t	\N	\N		0000000099999999xe-000025............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1092	xe-0/0/26			\N	f	t	\N	\N		0000000099999999xe-000026............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1093	xe-0/0/27			\N	f	t	\N	\N		0000000099999999xe-000027............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1094	xe-0/0/28			\N	f	t	\N	\N		0000000099999999xe-000028............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1095	xe-0/0/29			\N	f	t	\N	\N		0000000099999999xe-000029............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1096	xe-0/0/30			\N	f	t	\N	\N		0000000099999999xe-000030............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1097	xe-0/0/31			\N	f	t	\N	\N		0000000099999999xe-000031............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1098	xe-0/0/32			\N	f	t	\N	\N		0000000099999999xe-000032............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1099	xe-0/0/33			\N	f	t	\N	\N		0000000099999999xe-000033............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1100	xe-0/0/34			\N	f	t	\N	\N		0000000099999999xe-000034............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1101	xe-0/0/35			\N	f	t	\N	\N		0000000099999999xe-000035............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1102	xe-0/0/36			\N	f	t	\N	\N		0000000099999999xe-000036............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1103	xe-0/0/37			\N	f	t	\N	\N		0000000099999999xe-000037............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1104	xe-0/0/38			\N	f	t	\N	\N		0000000099999999xe-000038............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1105	xe-0/0/39			\N	f	t	\N	\N		0000000099999999xe-000039............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1106	xe-0/0/40			\N	f	t	\N	\N		0000000099999999xe-000040............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1107	xe-0/0/41			\N	f	t	\N	\N		0000000099999999xe-000041............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1108	xe-0/0/42			\N	f	t	\N	\N		0000000099999999xe-000042............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1109	xe-0/0/43			\N	f	t	\N	\N		0000000099999999xe-000043............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1110	xe-0/0/44			\N	f	t	\N	\N		0000000099999999xe-000044............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1111	xe-0/0/45			\N	f	t	\N	\N		0000000099999999xe-000045............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1112	xe-0/0/46			\N	f	t	\N	\N		0000000099999999xe-000046............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
2021-04-14	2021-04-14 13:36:01.841-04	{}	1113	xe-0/0/47			\N	f	t	\N	\N		0000000099999999xe-000047............	10gbase-x-sfpp	f	\N	\N	\N	97	\N	\N	\N
\.


--
-- Data for Name: dcim_interface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_tagged_vlans (id, interface_id, vlan_id) FROM stdin;
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interfacetemplate (created, last_updated, id, name, label, description, _name, type, mgmt_only, device_type_id) FROM stdin;
2021-04-14	2021-04-14 13:36:01.926-04	1	fxp0			9999999999999999fxp000000............	1000base-t	t	2
2021-04-14	2021-04-14 13:36:01.926-04	2	xe-0/0/0			0000000099999999xe-000000............	10gbase-x-xfp	f	2
2021-04-14	2021-04-14 13:36:01.926-04	3	xe-0/0/1			0000000099999999xe-000001............	10gbase-x-xfp	f	2
2021-04-14	2021-04-14 13:36:01.926-04	4	xe-0/0/2			0000000099999999xe-000002............	10gbase-x-xfp	f	2
2021-04-14	2021-04-14 13:36:01.926-04	5	xe-0/0/3			0000000099999999xe-000003............	10gbase-x-xfp	f	2
2021-04-14	2021-04-14 13:36:01.926-04	6	ge-0/0/0			0000000099999999ge-000000............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	7	ge-0/0/1			0000000099999999ge-000001............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	8	ge-0/0/2			0000000099999999ge-000002............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	9	ge-0/0/3			0000000099999999ge-000003............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	10	ge-0/0/4			0000000099999999ge-000004............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	11	ge-0/0/5			0000000099999999ge-000005............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	12	ge-0/0/6			0000000099999999ge-000006............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	13	ge-0/0/7			0000000099999999ge-000007............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	14	ge-0/0/8			0000000099999999ge-000008............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	15	ge-0/0/9			0000000099999999ge-000009............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	16	ge-0/0/10			0000000099999999ge-000010............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	17	ge-0/0/11			0000000099999999ge-000011............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	18	ge-0/0/12			0000000099999999ge-000012............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	19	ge-0/0/13			0000000099999999ge-000013............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	20	ge-0/0/14			0000000099999999ge-000014............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	21	ge-0/0/15			0000000099999999ge-000015............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	22	ge-0/0/16			0000000099999999ge-000016............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	23	ge-0/0/17			0000000099999999ge-000017............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	24	ge-0/0/18			0000000099999999ge-000018............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	25	ge-0/0/19			0000000099999999ge-000019............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	26	ge-0/0/20			0000000099999999ge-000020............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	27	ge-0/0/21			0000000099999999ge-000021............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	28	ge-0/0/22			0000000099999999ge-000022............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	29	ge-0/0/23			0000000099999999ge-000023............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	30	ge-0/0/24			0000000099999999ge-000024............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	31	ge-0/0/25			0000000099999999ge-000025............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	32	ge-0/0/26			0000000099999999ge-000026............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	33	ge-0/0/27			0000000099999999ge-000027............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	34	ge-0/0/28			0000000099999999ge-000028............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	35	ge-0/0/29			0000000099999999ge-000029............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	36	ge-0/0/30			0000000099999999ge-000030............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	37	ge-0/0/31			0000000099999999ge-000031............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	38	ge-0/0/32			0000000099999999ge-000032............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	39	ge-0/0/33			0000000099999999ge-000033............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	40	ge-0/0/34			0000000099999999ge-000034............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	41	ge-0/0/35			0000000099999999ge-000035............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	42	ge-0/0/36			0000000099999999ge-000036............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	43	ge-0/0/37			0000000099999999ge-000037............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	44	ge-0/0/38			0000000099999999ge-000038............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	45	ge-0/0/39			0000000099999999ge-000039............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	46	ge-0/0/40			0000000099999999ge-000040............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	47	ge-0/0/41			0000000099999999ge-000041............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	48	ge-0/0/42			0000000099999999ge-000042............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	49	ge-0/0/43			0000000099999999ge-000043............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	50	ge-0/0/44			0000000099999999ge-000044............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	51	ge-0/0/45			0000000099999999ge-000045............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	52	ge-0/0/46			0000000099999999ge-000046............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	53	ge-0/0/47			0000000099999999ge-000047............	1000base-t	f	4
2021-04-14	2021-04-14 13:36:01.926-04	54	et-0/1/0			0000000199999999et-000000............	40gbase-x-qsfpp	f	4
2021-04-14	2021-04-14 13:36:01.926-04	55	et-0/1/1			0000000199999999et-000001............	40gbase-x-qsfpp	f	4
2021-04-14	2021-04-14 13:36:01.926-04	56	et-0/1/2			0000000199999999et-000002............	40gbase-x-qsfpp	f	4
2021-04-14	2021-04-14 13:36:01.926-04	57	et-0/1/3			0000000199999999et-000003............	40gbase-x-qsfpp	f	4
2021-04-14	2021-04-14 13:36:01.926-04	58	vme			9999999999999999vme..................	1000base-t	t	5
2021-04-14	2021-04-14 13:36:01.926-04	59	xe-0/0/0			0000000099999999xe-000000............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	60	xe-0/0/1			0000000099999999xe-000001............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	61	xe-0/0/2			0000000099999999xe-000002............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	62	xe-0/0/3			0000000099999999xe-000003............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	63	xe-0/0/4			0000000099999999xe-000004............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	64	xe-0/0/5			0000000099999999xe-000005............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	65	xe-0/0/6			0000000099999999xe-000006............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	66	xe-0/0/7			0000000099999999xe-000007............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	67	xe-0/0/8			0000000099999999xe-000008............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	68	xe-0/0/9			0000000099999999xe-000009............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	69	xe-0/0/10			0000000099999999xe-000010............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	70	xe-0/0/11			0000000099999999xe-000011............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	71	xe-0/0/12			0000000099999999xe-000012............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	72	xe-0/0/13			0000000099999999xe-000013............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	73	xe-0/0/14			0000000099999999xe-000014............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	74	xe-0/0/15			0000000099999999xe-000015............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	75	xe-0/0/16			0000000099999999xe-000016............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	76	xe-0/0/17			0000000099999999xe-000017............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	77	xe-0/0/18			0000000099999999xe-000018............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	78	xe-0/0/19			0000000099999999xe-000019............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	79	xe-0/0/20			0000000099999999xe-000020............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	80	xe-0/0/21			0000000099999999xe-000021............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	81	xe-0/0/22			0000000099999999xe-000022............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	82	xe-0/0/23			0000000099999999xe-000023............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	83	xe-0/0/24			0000000099999999xe-000024............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	84	xe-0/0/25			0000000099999999xe-000025............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	85	xe-0/0/26			0000000099999999xe-000026............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	86	xe-0/0/27			0000000099999999xe-000027............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	87	xe-0/0/28			0000000099999999xe-000028............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	88	xe-0/0/29			0000000099999999xe-000029............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	89	xe-0/0/30			0000000099999999xe-000030............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	90	xe-0/0/31			0000000099999999xe-000031............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	91	xe-0/0/32			0000000099999999xe-000032............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	92	xe-0/0/33			0000000099999999xe-000033............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	93	xe-0/0/34			0000000099999999xe-000034............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	94	xe-0/0/35			0000000099999999xe-000035............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	95	xe-0/0/36			0000000099999999xe-000036............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	96	xe-0/0/37			0000000099999999xe-000037............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	97	xe-0/0/38			0000000099999999xe-000038............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	98	xe-0/0/39			0000000099999999xe-000039............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	99	xe-0/0/40			0000000099999999xe-000040............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	100	xe-0/0/41			0000000099999999xe-000041............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	101	xe-0/0/42			0000000099999999xe-000042............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	102	xe-0/0/43			0000000099999999xe-000043............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	103	xe-0/0/44			0000000099999999xe-000044............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	104	xe-0/0/45			0000000099999999xe-000045............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	105	xe-0/0/46			0000000099999999xe-000046............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	106	xe-0/0/47			0000000099999999xe-000047............	10gbase-t	f	5
2021-04-14	2021-04-14 13:36:01.926-04	107	et-0/0/48			0000000099999999et-000048............	40gbase-x-qsfpp	f	5
2021-04-14	2021-04-14 13:36:01.926-04	108	et-0/0/49			0000000099999999et-000049............	40gbase-x-qsfpp	f	5
2021-04-14	2021-04-14 13:36:01.926-04	109	et-0/0/50			0000000099999999et-000050............	40gbase-x-qsfpp	f	5
2021-04-14	2021-04-14 13:36:01.926-04	110	et-0/0/51			0000000099999999et-000051............	40gbase-x-qsfpp	f	5
2021-04-14	2021-04-14 13:36:01.926-04	111	et-0/0/52			0000000099999999et-000052............	40gbase-x-qsfpp	f	5
2021-04-14	2021-04-14 13:36:01.926-04	112	et-0/0/53			0000000099999999et-000053............	40gbase-x-qsfpp	f	5
2021-04-14	2021-04-14 13:36:01.926-04	113	GigabitEthernet0/0/0			0000000099999999GigabitEthernet000000............	1000base-x-sfp	f	6
2021-04-14	2021-04-14 13:36:01.926-04	114	GigabitEthernet0/0/1			0000000099999999GigabitEthernet000001............	1000base-t	f	6
2021-04-14	2021-04-14 13:36:01.926-04	115	GigabitEthernet0/1/0			0000000199999999GigabitEthernet000000............	1000base-t	f	6
2021-04-14	2021-04-14 13:36:01.926-04	116	GigabitEthernet0/1/1			0000000199999999GigabitEthernet000001............	1000base-t	f	6
2021-04-14	2021-04-14 13:36:01.926-04	117	GigabitEthernet0/1/2			0000000199999999GigabitEthernet000002............	1000base-t	f	6
2021-04-14	2021-04-14 13:36:01.926-04	118	GigabitEthernet0/1/3			0000000199999999GigabitEthernet000003............	1000base-t	f	6
2021-04-14	2021-04-14 13:36:01.926-04	119	GigabitEthernet0/1/4			0000000199999999GigabitEthernet000004............	1000base-t	f	6
2021-04-14	2021-04-14 13:36:01.926-04	120	GigabitEthernet0/1/5			0000000199999999GigabitEthernet000005............	1000base-t	f	6
2021-04-14	2021-04-14 13:36:01.926-04	121	GigabitEthernet0/1/6			0000000199999999GigabitEthernet000006............	1000base-t	f	6
2021-04-14	2021-04-14 13:36:01.926-04	122	GigabitEthernet0/1/7			0000000199999999GigabitEthernet000007............	1000base-t	f	6
2021-04-14	2021-04-14 13:36:01.926-04	123	GigabitEthernet0/1/8			0000000199999999GigabitEthernet000008............	1000base-t	f	6
2021-04-14	2021-04-14 13:36:01.926-04	124	Wlan-GigabitEthernet0/1/8			0000000199999999Wlan-GigabitEthernet000008............	ieee802.11ac	f	6
2021-04-14	2021-04-14 13:36:01.926-04	125	Cellular0/2/0			0000000299999999Cellular000000............	lte	f	6
2021-04-14	2021-04-14 13:36:01.926-04	126	GigabitEthernet1/0/1			0001000099999999GigabitEthernet000001............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	127	GigabitEthernet1/0/2			0001000099999999GigabitEthernet000002............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	128	GigabitEthernet1/0/3			0001000099999999GigabitEthernet000003............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	129	GigabitEthernet1/0/4			0001000099999999GigabitEthernet000004............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	130	GigabitEthernet1/0/5			0001000099999999GigabitEthernet000005............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	131	GigabitEthernet1/0/6			0001000099999999GigabitEthernet000006............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	132	GigabitEthernet1/0/7			0001000099999999GigabitEthernet000007............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	133	GigabitEthernet1/0/8			0001000099999999GigabitEthernet000008............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	134	GigabitEthernet1/0/9			0001000099999999GigabitEthernet000009............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	135	GigabitEthernet1/0/10			0001000099999999GigabitEthernet000010............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	136	GigabitEthernet1/0/11			0001000099999999GigabitEthernet000011............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	137	GigabitEthernet1/0/12			0001000099999999GigabitEthernet000012............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	138	GigabitEthernet1/0/13			0001000099999999GigabitEthernet000013............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	139	GigabitEthernet1/0/14			0001000099999999GigabitEthernet000014............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	140	GigabitEthernet1/0/15			0001000099999999GigabitEthernet000015............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	141	GigabitEthernet1/0/16			0001000099999999GigabitEthernet000016............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	142	GigabitEthernet1/0/17			0001000099999999GigabitEthernet000017............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	143	GigabitEthernet1/0/18			0001000099999999GigabitEthernet000018............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	144	GigabitEthernet1/0/19			0001000099999999GigabitEthernet000019............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	145	GigabitEthernet1/0/20			0001000099999999GigabitEthernet000020............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	146	GigabitEthernet1/0/21			0001000099999999GigabitEthernet000021............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	147	GigabitEthernet1/0/22			0001000099999999GigabitEthernet000022............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	148	GigabitEthernet1/0/23			0001000099999999GigabitEthernet000023............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	149	GigabitEthernet1/0/24			0001000099999999GigabitEthernet000024............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	150	GigabitEthernet1/0/25			0001000099999999GigabitEthernet000025............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	151	GigabitEthernet1/0/26			0001000099999999GigabitEthernet000026............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	152	GigabitEthernet1/0/27			0001000099999999GigabitEthernet000027............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	153	GigabitEthernet1/0/28			0001000099999999GigabitEthernet000028............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	154	GigabitEthernet1/0/29			0001000099999999GigabitEthernet000029............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	155	GigabitEthernet1/0/30			0001000099999999GigabitEthernet000030............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	156	GigabitEthernet1/0/31			0001000099999999GigabitEthernet000031............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	157	GigabitEthernet1/0/32			0001000099999999GigabitEthernet000032............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	158	GigabitEthernet1/0/33			0001000099999999GigabitEthernet000033............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	159	GigabitEthernet1/0/34			0001000099999999GigabitEthernet000034............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	160	GigabitEthernet1/0/35			0001000099999999GigabitEthernet000035............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	161	GigabitEthernet1/0/36			0001000099999999GigabitEthernet000036............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	162	GigabitEthernet1/0/37			0001000099999999GigabitEthernet000037............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	163	GigabitEthernet1/0/38			0001000099999999GigabitEthernet000038............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	164	GigabitEthernet1/0/39			0001000099999999GigabitEthernet000039............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	165	GigabitEthernet1/0/40			0001000099999999GigabitEthernet000040............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	166	GigabitEthernet1/0/41			0001000099999999GigabitEthernet000041............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	167	GigabitEthernet1/0/42			0001000099999999GigabitEthernet000042............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	168	GigabitEthernet1/0/43			0001000099999999GigabitEthernet000043............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	169	GigabitEthernet1/0/44			0001000099999999GigabitEthernet000044............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	170	GigabitEthernet1/0/45			0001000099999999GigabitEthernet000045............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	171	GigabitEthernet1/0/46			0001000099999999GigabitEthernet000046............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	172	GigabitEthernet1/0/47			0001000099999999GigabitEthernet000047............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	173	GigabitEthernet1/0/48			0001000099999999GigabitEthernet000048............	1000base-t	f	7
2021-04-14	2021-04-14 13:36:01.926-04	174	STACK0			9999999999999999STACK000000............	cisco-stackwise	f	7
2021-04-14	2021-04-14 13:36:01.926-04	175	STACK1			9999999999999999STACK000001............	cisco-stackwise	f	7
2021-04-14	2021-04-14 13:36:01.926-04	176	GigabitEthernet0			9999999999999999GigabitEthernet000000............	1000base-t	t	7
2021-04-14	2021-04-14 13:36:01.926-04	177	fxp0			9999999999999999fxp000000............	1000base-t	t	12
2021-04-14	2021-04-14 13:36:01.926-04	178	xe-0/0/0			0000000099999999xe-000000............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	179	xe-0/0/1			0000000099999999xe-000001............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	180	xe-0/0/2			0000000099999999xe-000002............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	181	xe-0/0/3			0000000099999999xe-000003............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	182	xe-0/0/4			0000000099999999xe-000004............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	183	xe-0/0/5			0000000099999999xe-000005............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	184	xe-0/0/6			0000000099999999xe-000006............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	185	xe-0/0/7			0000000099999999xe-000007............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	186	xe-0/0/8			0000000099999999xe-000008............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	187	xe-0/0/9			0000000099999999xe-000009............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	188	xe-0/0/10			0000000099999999xe-000010............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	189	xe-0/0/11			0000000099999999xe-000011............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	190	xe-0/0/12			0000000099999999xe-000012............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	191	xe-0/0/13			0000000099999999xe-000013............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	192	xe-0/0/14			0000000099999999xe-000014............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	193	xe-0/0/15			0000000099999999xe-000015............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	194	xe-0/0/16			0000000099999999xe-000016............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	195	xe-0/0/17			0000000099999999xe-000017............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	196	xe-0/0/18			0000000099999999xe-000018............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	197	xe-0/0/19			0000000099999999xe-000019............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	198	xe-0/0/20			0000000099999999xe-000020............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	199	xe-0/0/21			0000000099999999xe-000021............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	200	xe-0/0/22			0000000099999999xe-000022............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	201	xe-0/0/23			0000000099999999xe-000023............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	202	xe-0/0/24			0000000099999999xe-000024............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	203	xe-0/0/25			0000000099999999xe-000025............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	204	xe-0/0/26			0000000099999999xe-000026............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	205	xe-0/0/27			0000000099999999xe-000027............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	206	xe-0/0/28			0000000099999999xe-000028............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	207	xe-0/0/29			0000000099999999xe-000029............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	208	xe-0/0/30			0000000099999999xe-000030............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	209	xe-0/0/31			0000000099999999xe-000031............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	210	xe-0/0/32			0000000099999999xe-000032............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	211	xe-0/0/33			0000000099999999xe-000033............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	212	xe-0/0/34			0000000099999999xe-000034............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	213	xe-0/0/35			0000000099999999xe-000035............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	214	xe-0/0/36			0000000099999999xe-000036............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	215	xe-0/0/37			0000000099999999xe-000037............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	216	xe-0/0/38			0000000099999999xe-000038............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	217	xe-0/0/39			0000000099999999xe-000039............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	218	xe-0/0/40			0000000099999999xe-000040............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	219	xe-0/0/41			0000000099999999xe-000041............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	220	xe-0/0/42			0000000099999999xe-000042............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	221	xe-0/0/43			0000000099999999xe-000043............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	222	xe-0/0/44			0000000099999999xe-000044............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	223	xe-0/0/45			0000000099999999xe-000045............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	224	xe-0/0/46			0000000099999999xe-000046............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	225	xe-0/0/47			0000000099999999xe-000047............	10gbase-x-sfpp	f	12
2021-04-14	2021-04-14 13:36:01.926-04	226	et-0/0/48			0000000099999999et-000048............	100gbase-x-qsfp28	f	12
2021-04-14	2021-04-14 13:36:01.926-04	227	et-0/0/49			0000000099999999et-000049............	100gbase-x-qsfp28	f	12
2021-04-14	2021-04-14 13:36:01.926-04	228	et-0/0/50			0000000099999999et-000050............	100gbase-x-qsfp28	f	12
2021-04-14	2021-04-14 13:36:01.926-04	229	et-0/0/51			0000000099999999et-000051............	100gbase-x-qsfp28	f	12
2021-04-14	2021-04-14 13:36:01.926-04	230	em0			9999999999999999em000000............	1000base-t	t	13
2021-04-14	2021-04-14 13:36:01.926-04	231	em1			9999999999999999em000001............	1000base-x-sfp	t	13
2021-04-14	2021-04-14 13:36:01.926-04	232	et-0/0/0			0000000099999999et-000000............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	233	et-0/0/1			0000000099999999et-000001............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	234	et-0/0/2			0000000099999999et-000002............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	235	et-0/0/3			0000000099999999et-000003............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	236	et-0/0/4			0000000099999999et-000004............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	237	et-0/0/5			0000000099999999et-000005............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	238	et-0/0/6			0000000099999999et-000006............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	239	et-0/0/7			0000000099999999et-000007............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	240	et-0/0/8			0000000099999999et-000008............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	241	et-0/0/9			0000000099999999et-000009............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	242	et-0/0/10			0000000099999999et-000010............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	243	et-0/0/11			0000000099999999et-000011............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	244	et-0/0/12			0000000099999999et-000012............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	245	et-0/0/13			0000000099999999et-000013............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	246	et-0/0/14			0000000099999999et-000014............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	247	et-0/0/15			0000000099999999et-000015............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	248	et-0/0/16			0000000099999999et-000016............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	249	et-0/0/17			0000000099999999et-000017............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	250	et-0/0/18			0000000099999999et-000018............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	251	et-0/0/19			0000000099999999et-000019............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	252	et-0/0/20			0000000099999999et-000020............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	253	et-0/0/21			0000000099999999et-000021............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	254	et-0/0/22			0000000099999999et-000022............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	255	et-0/0/23			0000000099999999et-000023............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	256	et-0/0/24			0000000099999999et-000024............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	257	et-0/0/25			0000000099999999et-000025............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	258	et-0/0/26			0000000099999999et-000026............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	259	et-0/0/27			0000000099999999et-000027............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	260	et-0/0/28			0000000099999999et-000028............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	261	et-0/0/29			0000000099999999et-000029............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	262	et-0/0/30			0000000099999999et-000030............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	263	et-0/0/31			0000000099999999et-000031............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	264	et-0/0/32			0000000099999999et-000032............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	265	et-0/0/33			0000000099999999et-000033............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	266	et-0/0/34			0000000099999999et-000034............	40gbase-x-qsfpp	f	13
2021-04-14	2021-04-14 13:36:01.926-04	267	et-0/0/35			0000000099999999et-000035............	40gbase-x-qsfpp	f	13
\.


--
-- Data for Name: dcim_inventoryitem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitem (created, last_updated, custom_field_data, id, name, _name, label, description, part_id, serial, asset_tag, discovered, lft, rght, tree_id, level, device_id, manufacturer_id, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_location; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_location (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id, site_id) FROM stdin;
2021-04-02	2021-04-02 12:57:17.398-04	{}	1	Row 1	row-1		1	2	1	0	\N	21
2021-04-02	2021-04-02 12:57:24.629-04	{}	2	Row 2	row-2		1	2	2	0	\N	21
2021-04-02	2021-04-02 12:57:31.713-04	{}	3	Row 3	row-3		1	2	3	0	\N	21
2021-04-02	2021-04-02 12:57:37.732-04	{}	4	Row 4	row-4		1	2	4	0	\N	21
\.


--
-- Data for Name: dcim_manufacturer; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_manufacturer (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
2020-12-18	2020-12-17 22:17:05.204-05	{}	1	Arista	arista	
2020-12-18	2020-12-17 22:17:05.246-05	{}	2	Brocade	brocade	
2020-12-18	2020-12-17 22:17:05.28-05	{}	3	Cisco	cisco	
2020-12-18	2020-12-17 22:17:05.307-05	{}	4	Dell	dell	
2020-12-18	2020-12-17 22:17:05.335-05	{}	5	Extreme	extreme	
2020-12-18	2020-12-17 22:17:05.359-05	{}	6	F5	f5	
2020-12-18	2020-12-17 22:17:05.383-05	{}	7	Juniper	juniper	
2020-12-18	2020-12-17 22:17:05.407-05	{}	8	Opengear	opengear	
2020-12-18	2020-12-17 22:17:05.431-05	{}	9	Palo Alto	palo-alto	
2020-12-18	2020-12-17 22:17:05.47-05	{}	10	Ubiquiti	ubiquiti	
2020-12-22	2020-12-21 21:25:37.151-05	{}	11	APC	apc	
2020-12-30	2020-12-30 15:35:02.867-05	{}	12	Panduit	panduit	
2021-04-02	2021-04-02 13:11:48.34-04	{}	13	Generic	generic	
\.


--
-- Data for Name: dcim_platform; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_platform (created, last_updated, custom_field_data, id, name, slug, napalm_driver, napalm_args, description, manufacturer_id) FROM stdin;
2020-12-20	2020-12-19 21:46:34.394-05	{}	1	Cisco IOS	cisco-ios		\N		3
2021-04-05	2021-04-05 16:51:17.101-04	{}	2	Ubuntu Linux 18.04	ubuntu-linux-18-04		\N		\N
2021-04-05	2021-04-05 16:51:24.573-04	{}	3	Ubuntu Linux 20.04	ubuntu-linux-20-04		\N		\N
\.


--
-- Data for Name: dcim_powerfeed; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerfeed (created, last_updated, custom_field_data, id, _cable_peer_id, mark_connected, name, status, type, supply, phase, voltage, amperage, max_utilization, available_power, comments, _cable_peer_type_id, _path_id, cable_id, power_panel_id, rack_id) FROM stdin;
2021-04-05	2021-04-05 16:26:09.61-04	{}	1	\N	f	P1-1A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	14
2021-04-05	2021-04-05 16:26:09.668-04	{}	2	\N	f	P2-1B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	14
2021-04-05	2021-04-05 16:26:09.614-04	{}	3	\N	f	P1-2A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	15
2021-04-05	2021-04-05 16:26:09.671-04	{}	4	\N	f	P2-2B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	15
2021-04-05	2021-04-05 16:26:09.617-04	{}	5	\N	f	P1-3A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	16
2021-04-05	2021-04-05 16:26:09.675-04	{}	6	\N	f	P2-3B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	16
2021-04-05	2021-04-05 16:26:09.621-04	{}	7	\N	f	P1-4A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	17
2021-04-05	2021-04-05 16:26:09.678-04	{}	8	\N	f	P2-4B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	17
2021-04-05	2021-04-05 16:26:09.624-04	{}	9	\N	f	P1-5A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	18
2021-04-05	2021-04-05 16:26:09.682-04	{}	10	\N	f	P2-5B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	18
2021-04-05	2021-04-05 16:26:09.627-04	{}	11	\N	f	P1-6A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	19
2021-04-05	2021-04-05 16:26:09.685-04	{}	12	\N	f	P2-6B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	19
2021-04-05	2021-04-05 16:26:09.631-04	{}	13	\N	f	P1-7A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	20
2021-04-05	2021-04-05 16:26:09.688-04	{}	14	\N	f	P2-7B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	20
2021-04-05	2021-04-05 16:26:09.634-04	{}	15	\N	f	P1-8A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	21
2021-04-05	2021-04-05 16:26:09.692-04	{}	16	\N	f	P2-8B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	21
2021-04-05	2021-04-05 16:26:09.638-04	{}	17	\N	f	P1-9A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	22
2021-04-05	2021-04-05 16:26:09.695-04	{}	18	\N	f	P2-9B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	22
2021-04-05	2021-04-05 16:26:09.581-04	{}	19	\N	f	P1-10A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	23
2021-04-05	2021-04-05 16:26:09.641-04	{}	20	\N	f	P2-10B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	23
2021-04-05	2021-04-05 16:26:09.586-04	{}	21	\N	f	P1-11A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	24
2021-04-05	2021-04-05 16:26:09.645-04	{}	22	\N	f	P2-11B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	24
2021-04-05	2021-04-05 16:26:09.59-04	{}	23	\N	f	P1-12A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	25
2021-04-05	2021-04-05 16:26:09.648-04	{}	24	\N	f	P2-12B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	25
2021-04-05	2021-04-05 16:26:09.594-04	{}	25	\N	f	P1-13A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	26
2021-04-05	2021-04-05 16:26:09.653-04	{}	26	\N	f	P2-13B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	26
2021-04-05	2021-04-05 16:26:09.599-04	{}	27	\N	f	P1-14A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	27
2021-04-05	2021-04-05 16:26:09.657-04	{}	28	\N	f	P2-14B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	27
2021-04-05	2021-04-05 16:26:09.603-04	{}	29	\N	f	P1-15A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	28
2021-04-05	2021-04-05 16:26:09.661-04	{}	30	\N	f	P2-15B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	28
2021-04-05	2021-04-05 16:26:09.607-04	{}	31	\N	f	P1-16A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	1	29
2021-04-05	2021-04-05 16:26:09.664-04	{}	32	\N	f	P2-16B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	2	29
2021-04-05	2021-04-05 16:26:09.699-04	{}	33	\N	f	P3-1A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	3	30
2021-04-05	2021-04-05 16:26:09.726-04	{}	34	\N	f	P4-1B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	4	30
2021-04-05	2021-04-05 16:26:09.702-04	{}	35	\N	f	P3-2A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	3	31
2021-04-05	2021-04-05 16:26:09.73-04	{}	36	\N	f	P4-2B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	4	31
2021-04-05	2021-04-05 16:26:09.705-04	{}	37	\N	f	P3-3A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	3	32
2021-04-05	2021-04-05 16:26:09.733-04	{}	38	\N	f	P4-3B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	4	32
2021-04-05	2021-04-05 16:26:09.709-04	{}	39	\N	f	P3-4A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	3	33
2021-04-05	2021-04-05 16:26:09.737-04	{}	40	\N	f	P4-4B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	4	33
2021-04-05	2021-04-05 16:26:09.713-04	{}	41	\N	f	P3-5A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	3	34
2021-04-05	2021-04-05 16:26:09.74-04	{}	42	\N	f	P4-5B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	4	34
2021-04-05	2021-04-05 16:26:09.716-04	{}	43	\N	f	P3-6A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	3	35
2021-04-05	2021-04-05 16:26:09.743-04	{}	44	\N	f	P4-6B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	4	35
2021-04-05	2021-04-05 16:26:09.72-04	{}	45	\N	f	P3-7A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	3	36
2021-04-05	2021-04-05 16:26:09.747-04	{}	46	\N	f	P4-7B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	4	36
2021-04-05	2021-04-05 16:26:09.723-04	{}	47	\N	f	P3-8A	active	primary	ac	single-phase	220	20	80	3520		\N	\N	\N	3	37
2021-04-05	2021-04-05 16:26:09.75-04	{}	48	\N	f	P4-8B	active	redundant	ac	single-phase	220	20	80	3520		\N	\N	\N	4	37
\.


--
-- Data for Name: dcim_poweroutlet; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlet (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, feed_leg, _cable_peer_type_id, _path_id, cable_id, device_id, power_port_id) FROM stdin;
2021-04-14	2021-04-14 13:36:02.534-04	{}	1	Outlet 1	Outlet 00000001			1	f	nema-5-20r		37	105	61	27	14
2021-04-14	2021-04-14 13:36:02.534-04	{}	2	Outlet 2	Outlet 00000002			33	f	nema-5-20r		37	106	62	27	14
2021-04-14	2021-04-14 13:36:02.534-04	{}	3	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	27	14
2021-04-14	2021-04-14 13:36:02.534-04	{}	4	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	27	14
2021-04-14	2021-04-14 13:36:02.534-04	{}	5	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	27	14
2021-04-14	2021-04-14 13:36:02.534-04	{}	6	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	27	14
2021-04-14	2021-04-14 13:36:02.534-04	{}	7	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	27	14
2021-04-14	2021-04-14 13:36:02.534-04	{}	8	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	27	14
2021-04-14	2021-04-14 13:36:02.534-04	{}	57	Outlet 1	Outlet 00000001			2	f	nema-5-20r		37	107	63	34	21
2021-04-14	2021-04-14 13:36:02.534-04	{}	58	Outlet 2	Outlet 00000002			34	f	nema-5-20r		37	108	64	34	21
2021-04-14	2021-04-14 13:36:02.534-04	{}	59	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	34	21
2021-04-14	2021-04-14 13:36:02.534-04	{}	60	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	34	21
2021-04-14	2021-04-14 13:36:02.534-04	{}	61	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	34	21
2021-04-14	2021-04-14 13:36:02.534-04	{}	62	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	34	21
2021-04-14	2021-04-14 13:36:02.534-04	{}	63	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	34	21
2021-04-14	2021-04-14 13:36:02.534-04	{}	64	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	34	21
2021-04-14	2021-04-14 13:36:02.534-04	{}	65	Outlet 1	Outlet 00000001			3	f	nema-5-20r		37	109	65	35	22
2021-04-14	2021-04-14 13:36:02.534-04	{}	66	Outlet 2	Outlet 00000002			35	f	nema-5-20r		37	110	66	35	22
2021-04-14	2021-04-14 13:36:02.534-04	{}	67	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	35	22
2021-04-14	2021-04-14 13:36:02.534-04	{}	68	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	35	22
2021-04-14	2021-04-14 13:36:02.534-04	{}	69	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	35	22
2021-04-14	2021-04-14 13:36:02.534-04	{}	70	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	35	22
2021-04-14	2021-04-14 13:36:02.534-04	{}	71	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	35	22
2021-04-14	2021-04-14 13:36:02.534-04	{}	72	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	35	22
2021-04-14	2021-04-14 13:36:02.534-04	{}	73	Outlet 1	Outlet 00000001			4	f	nema-5-20r		37	111	67	36	23
2021-04-14	2021-04-14 13:36:02.534-04	{}	74	Outlet 2	Outlet 00000002			36	f	nema-5-20r		37	112	68	36	23
2021-04-14	2021-04-14 13:36:02.534-04	{}	75	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	36	23
2021-04-14	2021-04-14 13:36:02.534-04	{}	76	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	36	23
2021-04-14	2021-04-14 13:36:02.534-04	{}	77	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	36	23
2021-04-14	2021-04-14 13:36:02.534-04	{}	78	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	36	23
2021-04-14	2021-04-14 13:36:02.534-04	{}	79	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	36	23
2021-04-14	2021-04-14 13:36:02.534-04	{}	80	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	36	23
2021-04-14	2021-04-14 13:36:02.534-04	{}	81	Outlet 1	Outlet 00000001			5	f	nema-5-20r		37	113	69	37	24
2021-04-14	2021-04-14 13:36:02.534-04	{}	82	Outlet 2	Outlet 00000002			37	f	nema-5-20r		37	114	70	37	24
2021-04-14	2021-04-14 13:36:02.534-04	{}	83	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	37	24
2021-04-14	2021-04-14 13:36:02.534-04	{}	84	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	37	24
2021-04-14	2021-04-14 13:36:02.534-04	{}	85	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	37	24
2021-04-14	2021-04-14 13:36:02.534-04	{}	86	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	37	24
2021-04-14	2021-04-14 13:36:02.534-04	{}	87	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	37	24
2021-04-14	2021-04-14 13:36:02.534-04	{}	88	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	37	24
2021-04-14	2021-04-14 13:36:02.534-04	{}	89	Outlet 1	Outlet 00000001			6	f	nema-5-20r		37	115	71	38	25
2021-04-14	2021-04-14 13:36:02.534-04	{}	90	Outlet 2	Outlet 00000002			38	f	nema-5-20r		37	116	72	38	25
2021-04-14	2021-04-14 13:36:02.534-04	{}	91	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	38	25
2021-04-14	2021-04-14 13:36:02.534-04	{}	92	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	38	25
2021-04-14	2021-04-14 13:36:02.534-04	{}	93	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	38	25
2021-04-14	2021-04-14 13:36:02.534-04	{}	94	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	38	25
2021-04-14	2021-04-14 13:36:02.534-04	{}	95	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	38	25
2021-04-14	2021-04-14 13:36:02.534-04	{}	96	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	38	25
2021-04-14	2021-04-14 13:36:02.534-04	{}	97	Outlet 1	Outlet 00000001			7	f	nema-5-20r		37	117	73	39	26
2021-04-14	2021-04-14 13:36:02.534-04	{}	98	Outlet 2	Outlet 00000002			39	f	nema-5-20r		37	118	74	39	26
2021-04-14	2021-04-14 13:36:02.534-04	{}	99	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	39	26
2021-04-14	2021-04-14 13:36:02.534-04	{}	100	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	39	26
2021-04-14	2021-04-14 13:36:02.534-04	{}	101	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	39	26
2021-04-14	2021-04-14 13:36:02.534-04	{}	102	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	39	26
2021-04-14	2021-04-14 13:36:02.534-04	{}	103	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	39	26
2021-04-14	2021-04-14 13:36:02.534-04	{}	104	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	39	26
2021-04-14	2021-04-14 13:36:02.534-04	{}	105	Outlet 1	Outlet 00000001			8	f	nema-5-20r		37	119	75	40	27
2021-04-14	2021-04-14 13:36:02.534-04	{}	106	Outlet 2	Outlet 00000002			40	f	nema-5-20r		37	120	76	40	27
2021-04-14	2021-04-14 13:36:02.534-04	{}	107	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	40	27
2021-04-14	2021-04-14 13:36:02.534-04	{}	108	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	40	27
2021-04-14	2021-04-14 13:36:02.534-04	{}	109	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	40	27
2021-04-14	2021-04-14 13:36:02.534-04	{}	110	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	40	27
2021-04-14	2021-04-14 13:36:02.534-04	{}	111	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	40	27
2021-04-14	2021-04-14 13:36:02.534-04	{}	112	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	40	27
2021-04-14	2021-04-14 13:36:02.534-04	{}	113	Outlet 1	Outlet 00000001			9	f	nema-5-20r		37	121	77	41	28
2021-04-14	2021-04-14 13:36:02.534-04	{}	114	Outlet 2	Outlet 00000002			41	f	nema-5-20r		37	122	78	41	28
2021-04-14	2021-04-14 13:36:02.534-04	{}	115	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	41	28
2021-04-14	2021-04-14 13:36:02.534-04	{}	116	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	41	28
2021-04-14	2021-04-14 13:36:02.534-04	{}	117	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	41	28
2021-04-14	2021-04-14 13:36:02.534-04	{}	118	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	41	28
2021-04-14	2021-04-14 13:36:02.534-04	{}	119	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	41	28
2021-04-14	2021-04-14 13:36:02.534-04	{}	120	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	41	28
2021-04-14	2021-04-14 13:36:02.534-04	{}	121	Outlet 1	Outlet 00000001			10	f	nema-5-20r		37	123	79	42	29
2021-04-14	2021-04-14 13:36:02.534-04	{}	122	Outlet 2	Outlet 00000002			42	f	nema-5-20r		37	124	80	42	29
2021-04-14	2021-04-14 13:36:02.534-04	{}	123	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	42	29
2021-04-14	2021-04-14 13:36:02.534-04	{}	124	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	42	29
2021-04-14	2021-04-14 13:36:02.534-04	{}	125	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	42	29
2021-04-14	2021-04-14 13:36:02.534-04	{}	126	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	42	29
2021-04-14	2021-04-14 13:36:02.534-04	{}	127	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	42	29
2021-04-14	2021-04-14 13:36:02.534-04	{}	128	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	42	29
2021-04-14	2021-04-14 13:36:02.534-04	{}	129	Outlet 1	Outlet 00000001			11	f	nema-5-20r		37	125	81	43	30
2021-04-14	2021-04-14 13:36:02.534-04	{}	130	Outlet 2	Outlet 00000002			43	f	nema-5-20r		37	126	82	43	30
2021-04-14	2021-04-14 13:36:02.534-04	{}	131	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	43	30
2021-04-14	2021-04-14 13:36:02.534-04	{}	132	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	43	30
2021-04-14	2021-04-14 13:36:02.534-04	{}	133	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	43	30
2021-04-14	2021-04-14 13:36:02.534-04	{}	134	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	43	30
2021-04-14	2021-04-14 13:36:02.534-04	{}	135	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	43	30
2021-04-14	2021-04-14 13:36:02.534-04	{}	136	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	43	30
2021-04-14	2021-04-14 13:36:02.534-04	{}	137	Outlet 1	Outlet 00000001			12	f	nema-5-20r		37	127	83	44	31
2021-04-14	2021-04-14 13:36:02.534-04	{}	138	Outlet 2	Outlet 00000002			44	f	nema-5-20r		37	128	84	44	31
2021-04-14	2021-04-14 13:36:02.534-04	{}	139	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	44	31
2021-04-14	2021-04-14 13:36:02.534-04	{}	140	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	44	31
2021-04-14	2021-04-14 13:36:02.534-04	{}	141	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	44	31
2021-04-14	2021-04-14 13:36:02.534-04	{}	142	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	44	31
2021-04-14	2021-04-14 13:36:02.534-04	{}	143	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	44	31
2021-04-14	2021-04-14 13:36:02.534-04	{}	144	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	44	31
2021-04-14	2021-04-14 13:36:02.534-04	{}	145	Outlet 1	Outlet 00000001			13	f	nema-5-20r		37	129	85	45	32
2021-04-14	2021-04-14 13:36:02.534-04	{}	146	Outlet 2	Outlet 00000002			45	f	nema-5-20r		37	130	86	45	32
2021-04-14	2021-04-14 13:36:02.534-04	{}	147	Outlet 3	Outlet 00000003			\N	f	nema-5-20r		\N	\N	\N	45	32
2021-04-14	2021-04-14 13:36:02.534-04	{}	148	Outlet 4	Outlet 00000004			\N	f	nema-5-20r		\N	\N	\N	45	32
2021-04-14	2021-04-14 13:36:02.534-04	{}	149	Outlet 5	Outlet 00000005			\N	f	nema-5-20r		\N	\N	\N	45	32
2021-04-14	2021-04-14 13:36:02.534-04	{}	150	Outlet 6	Outlet 00000006			\N	f	nema-5-20r		\N	\N	\N	45	32
2021-04-14	2021-04-14 13:36:02.534-04	{}	151	Outlet 7	Outlet 00000007			\N	f	nema-5-20r		\N	\N	\N	45	32
2021-04-14	2021-04-14 13:36:02.534-04	{}	152	Outlet 8	Outlet 00000008			\N	f	nema-5-20r		\N	\N	\N	45	32
\.


--
-- Data for Name: dcim_poweroutlettemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlettemplate (created, last_updated, id, name, _name, label, description, type, feed_leg, device_type_id, power_port_id) FROM stdin;
2021-04-14	2021-04-14 13:36:02.634-04	1	Outlet 1	Outlet 00000001			nema-5-20r		8	16
2021-04-14	2021-04-14 13:36:02.634-04	2	Outlet 2	Outlet 00000002			nema-5-20r		8	16
2021-04-14	2021-04-14 13:36:02.634-04	3	Outlet 3	Outlet 00000003			nema-5-20r		8	16
2021-04-14	2021-04-14 13:36:02.634-04	4	Outlet 4	Outlet 00000004			nema-5-20r		8	16
2021-04-14	2021-04-14 13:36:02.634-04	5	Outlet 5	Outlet 00000005			nema-5-20r		8	16
2021-04-14	2021-04-14 13:36:02.634-04	6	Outlet 6	Outlet 00000006			nema-5-20r		8	16
2021-04-14	2021-04-14 13:36:02.634-04	7	Outlet 7	Outlet 00000007			nema-5-20r		8	16
2021-04-14	2021-04-14 13:36:02.634-04	8	Outlet 8	Outlet 00000008			nema-5-20r		8	16
\.


--
-- Data for Name: dcim_powerpanel; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerpanel (created, last_updated, custom_field_data, id, name, location_id, site_id) FROM stdin;
2021-04-05	2021-04-05 16:06:49.713-04	{}	1	Panel 1	\N	21
2021-04-05	2021-04-05 16:06:57.56-04	{}	2	Panel 2	\N	21
2021-04-05	2021-04-05 16:17:41.885-04	{}	3	Panel 3	\N	21
2021-04-05	2021-04-05 16:17:32.852-04	{}	4	Panel 4	\N	21
\.


--
-- Data for Name: dcim_powerport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerport (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, maximum_draw, allocated_draw, _cable_peer_type_id, _path_id, cable_id, device_id) FROM stdin;
2021-04-14	2021-04-14 13:36:03.055-04	{}	1	PSU0	PSU00000000			1	f	iec-60320-c14	150	\N	34	131	61	1
2021-04-14	2021-04-14 13:36:03.055-04	{}	2	PSU0	PSU00000000			57	f	iec-60320-c14	150	\N	34	133	63	2
2021-04-14	2021-04-14 13:36:03.055-04	{}	3	PSU0	PSU00000000			65	f	iec-60320-c14	150	\N	34	135	65	3
2021-04-14	2021-04-14 13:36:03.055-04	{}	4	PSU0	PSU00000000			73	f	iec-60320-c14	150	\N	34	137	67	4
2021-04-14	2021-04-14 13:36:03.055-04	{}	5	PSU0	PSU00000000			81	f	iec-60320-c14	150	\N	34	139	69	5
2021-04-14	2021-04-14 13:36:03.055-04	{}	6	PSU0	PSU00000000			89	f	iec-60320-c14	150	\N	34	141	71	6
2021-04-14	2021-04-14 13:36:03.055-04	{}	7	PSU0	PSU00000000			97	f	iec-60320-c14	150	\N	34	143	73	7
2021-04-14	2021-04-14 13:36:03.055-04	{}	8	PSU0	PSU00000000			105	f	iec-60320-c14	150	\N	34	145	75	8
2021-04-14	2021-04-14 13:36:03.055-04	{}	9	PSU0	PSU00000000			113	f	iec-60320-c14	150	\N	34	147	77	9
2021-04-14	2021-04-14 13:36:03.055-04	{}	10	PSU0	PSU00000000			121	f	iec-60320-c14	150	\N	34	149	79	10
2021-04-14	2021-04-14 13:36:03.055-04	{}	11	PSU0	PSU00000000			129	f	iec-60320-c14	150	\N	34	151	81	11
2021-04-14	2021-04-14 13:36:03.055-04	{}	12	PSU0	PSU00000000			137	f	iec-60320-c14	150	\N	34	153	83	12
2021-04-14	2021-04-14 13:36:03.055-04	{}	13	PSU0	PSU00000000			145	f	iec-60320-c14	150	\N	34	155	85	13
2021-04-14	2021-04-14 13:36:03.055-04	{}	14	Input	Input			\N	f		\N	\N	\N	\N	\N	27
2021-04-14	2021-04-14 13:36:03.055-04	{}	21	Input	Input			\N	f		\N	\N	\N	\N	\N	34
2021-04-14	2021-04-14 13:36:03.055-04	{}	22	Input	Input			\N	f		\N	\N	\N	\N	\N	35
2021-04-14	2021-04-14 13:36:03.055-04	{}	23	Input	Input			\N	f		\N	\N	\N	\N	\N	36
2021-04-14	2021-04-14 13:36:03.055-04	{}	24	Input	Input			\N	f		\N	\N	\N	\N	\N	37
2021-04-14	2021-04-14 13:36:03.055-04	{}	25	Input	Input			\N	f		\N	\N	\N	\N	\N	38
2021-04-14	2021-04-14 13:36:03.055-04	{}	26	Input	Input			\N	f		\N	\N	\N	\N	\N	39
2021-04-14	2021-04-14 13:36:03.055-04	{}	27	Input	Input			\N	f		\N	\N	\N	\N	\N	40
2021-04-14	2021-04-14 13:36:03.055-04	{}	28	Input	Input			\N	f		\N	\N	\N	\N	\N	41
2021-04-14	2021-04-14 13:36:03.055-04	{}	29	Input	Input			\N	f		\N	\N	\N	\N	\N	42
2021-04-14	2021-04-14 13:36:03.055-04	{}	30	Input	Input			\N	f		\N	\N	\N	\N	\N	43
2021-04-14	2021-04-14 13:36:03.055-04	{}	31	Input	Input			\N	f		\N	\N	\N	\N	\N	44
2021-04-14	2021-04-14 13:36:03.055-04	{}	32	Input	Input			\N	f		\N	\N	\N	\N	\N	45
2021-04-14	2021-04-14 13:36:03.055-04	{}	33	Power Port	Power Port			2	f	iec-60320-c14	\N	\N	34	132	62	14
2021-04-14	2021-04-14 13:36:03.055-04	{}	34	Power Port	Power Port			58	f	iec-60320-c14	\N	\N	34	134	64	15
2021-04-14	2021-04-14 13:36:03.055-04	{}	35	Power Port	Power Port			66	f	iec-60320-c14	\N	\N	34	136	66	16
2021-04-14	2021-04-14 13:36:03.055-04	{}	36	Power Port	Power Port			74	f	iec-60320-c14	\N	\N	34	138	68	17
2021-04-14	2021-04-14 13:36:03.055-04	{}	37	Power Port	Power Port			82	f	iec-60320-c14	\N	\N	34	140	70	18
2021-04-14	2021-04-14 13:36:03.055-04	{}	38	Power Port	Power Port			90	f	iec-60320-c14	\N	\N	34	142	72	19
2021-04-14	2021-04-14 13:36:03.055-04	{}	39	Power Port	Power Port			98	f	iec-60320-c14	\N	\N	34	144	74	20
2021-04-14	2021-04-14 13:36:03.055-04	{}	40	Power Port	Power Port			106	f	iec-60320-c14	\N	\N	34	146	76	21
2021-04-14	2021-04-14 13:36:03.055-04	{}	41	Power Port	Power Port			114	f	iec-60320-c14	\N	\N	34	148	78	22
2021-04-14	2021-04-14 13:36:03.055-04	{}	42	Power Port	Power Port			122	f	iec-60320-c14	\N	\N	34	150	80	23
2021-04-14	2021-04-14 13:36:03.055-04	{}	43	Power Port	Power Port			130	f	iec-60320-c14	\N	\N	34	152	82	24
2021-04-14	2021-04-14 13:36:03.055-04	{}	44	Power Port	Power Port			138	f	iec-60320-c14	\N	\N	34	154	84	25
2021-04-14	2021-04-14 13:36:03.055-04	{}	45	Power Port	Power Port			146	f	iec-60320-c14	\N	\N	34	156	86	26
2021-04-14	2021-04-14 13:36:03.055-04	{}	46	PSU0	PSU00000000			\N	f	iec-60320-c14	650	\N	\N	\N	\N	93
2021-04-14	2021-04-14 13:36:03.055-04	{}	47	PSU1	PSU00000001			\N	f	iec-60320-c14	650	\N	\N	\N	\N	93
2021-04-14	2021-04-14 13:36:03.055-04	{}	48	PSU0	PSU00000000			\N	f	iec-60320-c14	650	\N	\N	\N	\N	94
2021-04-14	2021-04-14 13:36:03.055-04	{}	49	PSU1	PSU00000001			\N	f	iec-60320-c14	650	\N	\N	\N	\N	94
2021-04-14	2021-04-14 13:36:03.055-04	{}	50	PSU0	PSU00000000			\N	f	iec-60320-c14	650	\N	\N	\N	\N	95
2021-04-14	2021-04-14 13:36:03.055-04	{}	51	PSU1	PSU00000001			\N	f	iec-60320-c14	650	\N	\N	\N	\N	95
2021-04-14	2021-04-14 13:36:03.055-04	{}	52	PSU0	PSU00000000			\N	f	iec-60320-c20	\N	\N	\N	\N	\N	96
2021-04-14	2021-04-14 13:36:03.055-04	{}	53	PSU1	PSU00000001			\N	f	iec-60320-c20	\N	\N	\N	\N	\N	96
2021-04-14	2021-04-14 13:36:03.055-04	{}	54	PSU2	PSU00000002			\N	f	iec-60320-c20	\N	\N	\N	\N	\N	96
2021-04-14	2021-04-14 13:36:03.055-04	{}	55	PSU3	PSU00000003			\N	f	iec-60320-c20	\N	\N	\N	\N	\N	96
2021-04-14	2021-04-14 13:36:03.055-04	{}	56	PSU0	PSU00000000			\N	f	iec-60320-c20	\N	\N	\N	\N	\N	97
2021-04-14	2021-04-14 13:36:03.055-04	{}	57	PSU1	PSU00000001			\N	f	iec-60320-c20	\N	\N	\N	\N	\N	97
2021-04-14	2021-04-14 13:36:03.055-04	{}	58	PSU2	PSU00000002			\N	f	iec-60320-c20	\N	\N	\N	\N	\N	97
2021-04-14	2021-04-14 13:36:03.055-04	{}	59	PSU3	PSU00000003			\N	f	iec-60320-c20	\N	\N	\N	\N	\N	97
\.


--
-- Data for Name: dcim_powerporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerporttemplate (created, last_updated, id, name, _name, label, description, type, maximum_draw, allocated_draw, device_type_id) FROM stdin;
2021-04-14	2021-04-14 13:36:03.122-04	1	PSU0	PSU00000000			iec-60320-c20	\N	\N	1
2021-04-14	2021-04-14 13:36:03.122-04	2	PSU1	PSU00000001			iec-60320-c20	\N	\N	1
2021-04-14	2021-04-14 13:36:03.122-04	3	PSU2	PSU00000002			iec-60320-c20	\N	\N	1
2021-04-14	2021-04-14 13:36:03.122-04	4	PSU3	PSU00000003			iec-60320-c20	\N	\N	1
2021-04-14	2021-04-14 13:36:03.122-04	5	PEM0	PEM00000000			iec-60320-c14	500	365	2
2021-04-14	2021-04-14 13:36:03.122-04	6	PEM1	PEM00000001			iec-60320-c14	500	365	2
2021-04-14	2021-04-14 13:36:03.122-04	7	PSU0	PSU00000000			iec-60320-c20	\N	\N	3
2021-04-14	2021-04-14 13:36:03.122-04	8	PSU1	PSU00000001			iec-60320-c20	\N	\N	3
2021-04-14	2021-04-14 13:36:03.122-04	9	PSU2	PSU00000002			iec-60320-c20	\N	\N	3
2021-04-14	2021-04-14 13:36:03.122-04	10	PSU3	PSU00000003			iec-60320-c20	\N	\N	3
2021-04-14	2021-04-14 13:36:03.122-04	11	PSU0	PSU00000000			iec-60320-c14	350	\N	4
2021-04-14	2021-04-14 13:36:03.122-04	12	PSU1	PSU00000001			iec-60320-c14	350	\N	4
2021-04-14	2021-04-14 13:36:03.122-04	13	PSU0	PSU00000000			iec-60320-c14	\N	\N	5
2021-04-14	2021-04-14 13:36:03.122-04	14	PSU1	PSU00000001			iec-60320-c14	\N	\N	5
2021-04-14	2021-04-14 13:36:03.122-04	15	PSU0	PSU00000000			iec-60320-c14	150	\N	6
2021-04-14	2021-04-14 13:36:03.122-04	16	Input	Input				\N	\N	8
2021-04-14	2021-04-14 13:36:03.122-04	17	PSU0	PSU00000000			iec-60320-c14	650	\N	12
2021-04-14	2021-04-14 13:36:03.122-04	18	PSU1	PSU00000001			iec-60320-c14	650	\N	12
2021-04-14	2021-04-14 13:36:03.122-04	19	PSU0	PSU00000000			iec-60320-c14	\N	\N	13
2021-04-14	2021-04-14 13:36:03.122-04	20	PSU1	PSU00000001			iec-60320-c14	\N	\N	13
\.


--
-- Data for Name: dcim_rack; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rack (created, last_updated, custom_field_data, id, name, _name, facility_id, status, serial, asset_tag, type, width, u_height, desc_units, outer_width, outer_depth, outer_unit, comments, location_id, role_id, site_id, tenant_id) FROM stdin;
2020-12-20	2020-12-19 21:24:51.056-05	{}	1	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	2	5
2020-12-20	2020-12-19 21:24:51.159-05	{}	2	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	3	5
2020-12-20	2020-12-19 21:24:51.211-05	{}	3	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	4	5
2020-12-20	2020-12-19 21:24:51.263-05	{}	4	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	5	5
2020-12-20	2020-12-19 21:24:51.314-05	{}	5	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	6	5
2020-12-20	2020-12-19 21:24:51.389-05	{}	6	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	7	5
2020-12-20	2020-12-19 21:24:51.47-05	{}	7	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	8	5
2020-12-20	2020-12-19 21:24:51.524-05	{}	8	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	9	5
2020-12-20	2020-12-19 21:24:51.575-05	{}	9	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	10	5
2020-12-20	2020-12-19 21:24:51.624-05	{}	10	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	11	5
2020-12-20	2020-12-19 21:24:51.674-05	{}	11	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	12	5
2020-12-20	2020-12-19 21:24:51.725-05	{}	12	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	13	5
2020-12-20	2020-12-19 21:24:51.776-05	{}	13	Comms closet	Comms closet	\N	active		\N	wall-cabinet	19	12	f	\N	\N			\N	\N	14	5
2021-04-02	2021-04-02 13:01:12.931-04	{}	14	R101	R00000101	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			1	1	21	13
2021-04-02	2021-04-02 13:01:13.022-04	{}	15	R102	R00000102	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			1	1	21	13
2021-04-02	2021-04-02 13:01:13.112-04	{}	16	R103	R00000103	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			1	1	21	13
2021-04-02	2021-04-02 13:01:13.202-04	{}	17	R104	R00000104	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			1	1	21	13
2021-04-02	2021-04-02 13:01:35.986-04	{}	18	R105	R00000105	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			1	2	21	13
2021-04-02	2021-04-02 13:01:36.12-04	{}	19	R106	R00000106	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			1	2	21	13
2021-04-02	2021-04-02 13:01:36.232-04	{}	20	R107	R00000107	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			1	2	21	13
2021-04-02	2021-04-02 13:01:36.318-04	{}	21	R108	R00000108	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			1	2	21	13
2021-04-02	2021-04-05 16:20:56.328-04	{}	22	R201	R00000201	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			2	2	21	13
2021-04-02	2021-04-05 16:20:56.336-04	{}	23	R202	R00000202	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			2	2	21	13
2021-04-02	2021-04-05 16:20:56.341-04	{}	24	R203	R00000203	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			2	2	21	13
2021-04-02	2021-04-05 16:20:56.346-04	{}	25	R204	R00000204	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			2	2	21	13
2021-04-02	2021-04-05 16:20:56.352-04	{}	26	R205	R00000205	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			2	2	21	13
2021-04-02	2021-04-05 16:20:56.357-04	{}	27	R206	R00000206	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			2	2	21	13
2021-04-02	2021-04-05 16:20:56.362-04	{}	28	R207	R00000207	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			2	2	21	13
2021-04-02	2021-04-05 16:20:56.367-04	{}	29	R208	R00000208	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			2	2	21	13
2021-04-02	2021-04-05 16:21:19.145-04	{}	30	R301	R00000301	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			3	3	21	13
2021-04-02	2021-04-05 16:21:19.159-04	{}	31	R302	R00000302	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			3	3	21	13
2021-04-02	2021-04-05 16:21:19.165-04	{}	32	R303	R00000303	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			3	3	21	13
2021-04-02	2021-04-05 16:21:19.171-04	{}	33	R304	R00000304	\N	active		\N	4-post-cabinet	19	48	f	\N	\N			3	3	21	13
2021-04-02	2021-04-05 16:21:19.177-04	{}	34	R305	R00000305	\N	available		\N	4-post-cabinet	19	48	f	\N	\N			3	\N	21	13
2021-04-02	2021-04-05 16:21:19.183-04	{}	35	R306	R00000306	\N	available		\N	4-post-cabinet	19	48	f	\N	\N			3	\N	21	13
2021-04-02	2021-04-05 16:21:19.189-04	{}	36	R307	R00000307	\N	available		\N	4-post-cabinet	19	48	f	\N	\N			3	\N	21	13
2021-04-02	2021-04-05 16:21:19.195-04	{}	37	R308	R00000308	\N	available		\N	4-post-cabinet	19	48	f	\N	\N			3	\N	21	13
2021-04-02	2021-04-02 13:11:05.846-04	{}	38	IDF118	IDF00000118	\N	active		\N	4-post-frame	19	42	f	\N	\N			\N	4	23	13
2021-04-02	2021-04-02 13:11:05.692-04	{}	39	IDF128	IDF00000128	\N	active		\N	4-post-frame	19	42	f	\N	\N			\N	4	24	13
2021-04-02	2021-04-02 13:11:05.768-04	{}	40	IDF117	IDF00000117	\N	active		\N	4-post-frame	19	42	f	\N	\N			\N	4	22	13
2021-04-02	2021-04-02 13:15:48.788-04	{}	41	Plant 1	Plant 00000001	\N	active		\N	2-post-frame	19	42	f	\N	\N			\N	4	21	13
2021-04-02	2021-04-02 13:15:56.794-04	{}	42	Plant 2	Plant 00000002	\N	active		\N	2-post-frame	19	42	f	\N	\N			\N	4	21	13
\.


--
-- Data for Name: dcim_rackreservation; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackreservation (created, last_updated, custom_field_data, id, units, description, rack_id, tenant_id, user_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackrole (created, last_updated, custom_field_data, id, name, slug, color, description) FROM stdin;
2021-04-02	2021-04-02 13:00:14.579-04	{}	1	Infrastructure	infrastructure	00bcd4	
2021-04-02	2021-04-02 13:00:22.623-04	{}	2	Compute	compute	2196f3	
2021-04-02	2021-04-02 13:00:38.355-04	{}	3	Storage	storage	ffc107	
2021-04-02	2021-04-02 13:10:54.59-04	{}	4	IDF	idf	9e9e9e	
\.


--
-- Data for Name: dcim_rearport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearport (created, last_updated, custom_field_data, id, name, _name, label, description, _cable_peer_id, mark_connected, type, positions, _cable_peer_type_id, cable_id, device_id, color) FROM stdin;
2021-04-14	2021-04-14 13:36:03.479-04	{}	625	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	626	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	627	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	628	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	629	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	630	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	631	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	632	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	633	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	634	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	635	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	636	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	637	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	638	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	639	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	640	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	641	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	642	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	643	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	644	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	645	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	646	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	647	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	648	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	649	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	650	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	651	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	652	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	653	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	654	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	655	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	656	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	657	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	658	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	659	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	660	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	661	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	662	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	663	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	664	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	665	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	666	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	667	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	668	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	669	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	670	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	671	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	672	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	74	
2021-04-14	2021-04-14 13:36:03.479-04	{}	673	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	674	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	675	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	676	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	677	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	678	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	679	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	680	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	681	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	682	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	683	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	684	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	685	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	686	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	687	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	688	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	689	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	690	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	691	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	692	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	693	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	694	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	695	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	696	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	697	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	698	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	699	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	700	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	701	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	702	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	703	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	704	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	705	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	706	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	707	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	708	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	709	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	710	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	711	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	712	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	713	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	714	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	715	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	716	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	717	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	718	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	719	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	720	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	75	
2021-04-14	2021-04-14 13:36:03.479-04	{}	721	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	722	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	723	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	724	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	725	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	726	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	727	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	728	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	729	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	730	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	731	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	732	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	733	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	734	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	735	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	736	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	737	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	738	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	739	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	740	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	741	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	742	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	743	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	744	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	745	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	746	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	747	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	748	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	749	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	750	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	751	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	752	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	753	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	754	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	755	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	756	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	757	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	758	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	759	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	760	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	761	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	762	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	763	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	764	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	765	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	766	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	767	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	768	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	76	
2021-04-14	2021-04-14 13:36:03.479-04	{}	769	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	770	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	771	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	772	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	773	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	774	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	775	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	776	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	777	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	778	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	779	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	780	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	781	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	782	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	783	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	784	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	785	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	786	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	787	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	788	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	789	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	790	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	791	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	792	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	793	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	794	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	795	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	796	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	797	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	798	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	799	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	800	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	801	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	802	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	803	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	804	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	805	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	806	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	807	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	808	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	809	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	810	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	811	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	812	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	813	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	814	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	815	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	816	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	77	
2021-04-14	2021-04-14 13:36:03.479-04	{}	817	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	818	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	819	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	820	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	821	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	822	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	823	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	824	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	825	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	826	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	827	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	828	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	829	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	830	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	831	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	832	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	833	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	834	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	835	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	836	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	837	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	838	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	839	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	840	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	841	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	842	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	843	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	844	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	845	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	846	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	847	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	848	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	849	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	850	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	851	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	852	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	853	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	854	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	855	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	856	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	857	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	858	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	859	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	860	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	861	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	862	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	863	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	864	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	78	
2021-04-14	2021-04-14 13:36:03.479-04	{}	865	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	866	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	867	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	868	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	869	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	870	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	871	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	872	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	873	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	874	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	875	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	876	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	877	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	878	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	879	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	880	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	881	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	882	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	883	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	884	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	885	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	886	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	887	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	888	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	889	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	890	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	891	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	892	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	893	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	894	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	895	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	896	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	897	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	898	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	899	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	900	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	901	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	902	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	903	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	904	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	905	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	906	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	907	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	908	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	909	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	910	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	911	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	912	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	79	
2021-04-14	2021-04-14 13:36:03.479-04	{}	913	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	914	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	915	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	916	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	917	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	918	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	919	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	920	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	921	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	922	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	923	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	924	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	925	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	926	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	927	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	928	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	929	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	930	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	931	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	932	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	933	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	934	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	935	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	936	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	937	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	938	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	939	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	940	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	941	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	942	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	943	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	944	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	945	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	946	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	947	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	948	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	949	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	950	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	951	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	952	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	953	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	954	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	955	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	956	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	957	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	958	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	959	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	960	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	80	
2021-04-14	2021-04-14 13:36:03.479-04	{}	961	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	962	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	963	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	964	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	965	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	966	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	967	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	968	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	969	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	970	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	971	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	972	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	973	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	974	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	975	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	976	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	977	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	978	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	979	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	980	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	981	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	982	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	983	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	984	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	985	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	986	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	987	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	988	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	989	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	990	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	991	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	992	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	993	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	994	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	995	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	996	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	997	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	998	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	999	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1000	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1001	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1002	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1003	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1004	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1005	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1006	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1007	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1008	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	81	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1009	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1010	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1011	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1012	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1013	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1014	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1015	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1016	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1017	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1018	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1019	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1020	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1021	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1022	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1023	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1024	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1025	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1026	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1027	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1028	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1029	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1030	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1031	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1032	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1033	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1034	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1035	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1036	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1037	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1038	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1039	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1040	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1041	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1042	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1043	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1044	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1045	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1046	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1047	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1048	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1049	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1050	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1051	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1052	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1053	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1054	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1055	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1056	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	82	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1057	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1058	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1059	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1060	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1061	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1062	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1063	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1064	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1065	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1066	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1067	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1068	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1069	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1070	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1071	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1072	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1073	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1074	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1075	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1076	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1077	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1078	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1079	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1080	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1081	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1082	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1083	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1084	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1085	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1086	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1087	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1088	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1089	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1090	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1091	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1092	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1093	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1094	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1095	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1096	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1097	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1098	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1099	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1100	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1101	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1102	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1103	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1104	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	83	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1105	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1106	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1107	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1108	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1109	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1110	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1111	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1112	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1113	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1114	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1115	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1116	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1117	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1118	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1119	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1120	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1121	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1122	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1123	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1124	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1125	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1126	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1127	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1128	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1129	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1130	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1131	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1132	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1133	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1134	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1135	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1136	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1137	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1138	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1139	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1140	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1141	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1142	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1143	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1144	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1145	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1146	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1147	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1148	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1149	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1150	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1151	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1152	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	84	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1153	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1154	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1155	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1156	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1157	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1158	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1159	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1160	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1161	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1162	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1163	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1164	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1165	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1166	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1167	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1168	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1169	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1170	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1171	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1172	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1173	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1174	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1175	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1176	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1177	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1178	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1179	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1180	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1181	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1182	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1183	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1184	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1185	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1186	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1187	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1188	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1189	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1190	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1191	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1192	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1193	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1194	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1195	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1196	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1197	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1198	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1199	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1200	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	85	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1201	Port 1	Port 00000001			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1202	Port 2	Port 00000002			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1203	Port 3	Port 00000003			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1204	Port 4	Port 00000004			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1205	Port 5	Port 00000005			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1206	Port 6	Port 00000006			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1207	Port 7	Port 00000007			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1208	Port 8	Port 00000008			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1209	Port 9	Port 00000009			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1210	Port 10	Port 00000010			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1211	Port 11	Port 00000011			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1212	Port 12	Port 00000012			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1213	Port 13	Port 00000013			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1214	Port 14	Port 00000014			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1215	Port 15	Port 00000015			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1216	Port 16	Port 00000016			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1217	Port 17	Port 00000017			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1218	Port 18	Port 00000018			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1219	Port 19	Port 00000019			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1220	Port 20	Port 00000020			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1221	Port 21	Port 00000021			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1222	Port 22	Port 00000022			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1223	Port 23	Port 00000023			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1224	Port 24	Port 00000024			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1225	Port 25	Port 00000025			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1226	Port 26	Port 00000026			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1227	Port 27	Port 00000027			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1228	Port 28	Port 00000028			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1229	Port 29	Port 00000029			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1230	Port 30	Port 00000030			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1231	Port 31	Port 00000031			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1232	Port 32	Port 00000032			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1233	Port 33	Port 00000033			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1234	Port 34	Port 00000034			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1235	Port 35	Port 00000035			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1236	Port 36	Port 00000036			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1237	Port 37	Port 00000037			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1238	Port 38	Port 00000038			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1239	Port 39	Port 00000039			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1240	Port 40	Port 00000040			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1241	Port 41	Port 00000041			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1242	Port 42	Port 00000042			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1243	Port 43	Port 00000043			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1244	Port 44	Port 00000044			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1245	Port 45	Port 00000045			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1246	Port 46	Port 00000046			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1247	Port 47	Port 00000047			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1248	Port 48	Port 00000048			\N	f	110-punch	1	\N	\N	86	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1249	Rear Splice	Rear Splice			36	f	splice	48	10	87	87	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1250	Rear Splice	Rear Splice			38	f	splice	48	10	89	88	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1251	Rear Splice	Rear Splice			40	f	splice	48	10	91	89	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1252	Rear Splice	Rear Splice			37	f	splice	48	10	88	90	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1253	Rear Splice	Rear Splice			39	f	splice	48	10	90	91	
2021-04-14	2021-04-14 13:36:03.479-04	{}	1254	Rear Splice	Rear Splice			41	f	splice	48	10	92	92	
\.


--
-- Data for Name: dcim_rearporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearporttemplate (created, last_updated, id, name, _name, label, description, type, positions, device_type_id, color) FROM stdin;
2021-04-14	2021-04-14 13:36:03.55-04	1	Port 1	Port 00000001			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	2	Port 2	Port 00000002			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	3	Port 3	Port 00000003			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	4	Port 4	Port 00000004			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	5	Port 5	Port 00000005			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	6	Port 6	Port 00000006			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	7	Port 7	Port 00000007			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	8	Port 8	Port 00000008			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	9	Port 9	Port 00000009			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	10	Port 10	Port 00000010			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	11	Port 11	Port 00000011			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	12	Port 12	Port 00000012			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	13	Port 13	Port 00000013			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	14	Port 14	Port 00000014			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	15	Port 15	Port 00000015			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	16	Port 16	Port 00000016			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	17	Port 17	Port 00000017			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	18	Port 18	Port 00000018			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	19	Port 19	Port 00000019			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	20	Port 20	Port 00000020			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	21	Port 21	Port 00000021			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	22	Port 22	Port 00000022			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	23	Port 23	Port 00000023			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	24	Port 24	Port 00000024			110-punch	1	9	
2021-04-14	2021-04-14 13:36:03.55-04	25	Port 1	Port 00000001			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	26	Port 2	Port 00000002			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	27	Port 3	Port 00000003			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	28	Port 4	Port 00000004			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	29	Port 5	Port 00000005			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	30	Port 6	Port 00000006			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	31	Port 7	Port 00000007			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	32	Port 8	Port 00000008			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	33	Port 9	Port 00000009			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	34	Port 10	Port 00000010			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	35	Port 11	Port 00000011			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	36	Port 12	Port 00000012			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	37	Port 13	Port 00000013			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	38	Port 14	Port 00000014			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	39	Port 15	Port 00000015			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	40	Port 16	Port 00000016			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	41	Port 17	Port 00000017			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	42	Port 18	Port 00000018			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	43	Port 19	Port 00000019			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	44	Port 20	Port 00000020			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	45	Port 21	Port 00000021			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	46	Port 22	Port 00000022			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	47	Port 23	Port 00000023			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	48	Port 24	Port 00000024			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	49	Port 25	Port 00000025			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	50	Port 26	Port 00000026			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	51	Port 27	Port 00000027			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	52	Port 28	Port 00000028			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	53	Port 29	Port 00000029			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	54	Port 30	Port 00000030			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	55	Port 31	Port 00000031			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	56	Port 32	Port 00000032			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	57	Port 33	Port 00000033			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	58	Port 34	Port 00000034			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	59	Port 35	Port 00000035			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	60	Port 36	Port 00000036			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	61	Port 37	Port 00000037			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	62	Port 38	Port 00000038			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	63	Port 39	Port 00000039			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	64	Port 40	Port 00000040			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	65	Port 41	Port 00000041			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	66	Port 42	Port 00000042			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	67	Port 43	Port 00000043			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	68	Port 44	Port 00000044			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	69	Port 45	Port 00000045			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	70	Port 46	Port 00000046			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	71	Port 47	Port 00000047			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	72	Port 48	Port 00000048			110-punch	1	10	
2021-04-14	2021-04-14 13:36:03.55-04	73	Rear Splice	Rear Splice			splice	48	11	
\.


--
-- Data for Name: dcim_region; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_region (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
2020-12-18	2020-12-17 21:10:30.195-05	{}	1	North America	north-america		1	110	4	0	\N
2020-12-18	2020-12-17 21:10:30.261-05	{}	2	South America	south-america		1	2	6	0	\N
2020-12-18	2020-12-17 21:10:30.298-05	{}	3	Europe	europe		1	10	3	0	\N
2020-12-18	2020-12-17 21:10:30.332-05	{}	4	Africa	africa		1	2	1	0	\N
2020-12-18	2020-12-17 21:10:30.367-05	{}	5	Asia	asia		1	8	2	0	\N
2020-12-18	2020-12-17 21:10:30.401-05	{}	6	Oceania	oceania		1	2	5	0	\N
2020-12-18	2020-12-17 21:17:10.906-05	{}	7	United States	us		6	109	4	1	1
2020-12-18	2020-12-17 21:17:10.994-05	{}	8	Canada	ca		2	3	4	1	1
2020-12-18	2020-12-17 21:17:11.071-05	{}	9	Mexico	mx		4	5	4	1	1
2020-12-18	2020-12-17 21:17:11.121-05	{}	10	Netherlands	nl		6	7	3	1	3
2020-12-18	2020-12-17 21:17:11.17-05	{}	11	United Kingdon	gb		8	9	3	1	3
2020-12-18	2020-12-17 21:17:11.219-05	{}	12	France	fr		2	3	3	1	3
2020-12-18	2020-12-17 21:17:11.272-05	{}	13	Germany	de		4	5	3	1	3
2020-12-18	2020-12-17 21:17:11.318-05	{}	14	Singapore	sg		6	7	2	1	5
2020-12-18	2020-12-17 21:17:11.368-05	{}	15	China	cn		2	3	2	1	5
2020-12-18	2020-12-17 21:17:11.423-05	{}	16	India	in		4	5	2	1	5
2020-12-18	2020-12-17 21:29:27.266-05	{}	32	Washington	us-wa		101	102	4	2	7
2020-12-18	2020-12-17 21:29:27.35-05	{}	33	Wisconsin	us-wi		105	106	4	2	7
2020-12-18	2020-12-17 21:29:27.432-05	{}	34	West Virginia	us-wv		103	104	4	2	7
2020-12-18	2020-12-17 21:29:27.48-05	{}	35	Florida	us-fl		25	26	4	2	7
2020-12-18	2020-12-17 21:29:27.529-05	{}	36	Wyoming	us-wy		107	108	4	2	7
2020-12-18	2020-12-17 21:29:27.578-05	{}	37	New Hampshire	us-nh		65	66	4	2	7
2020-12-18	2020-12-17 21:29:27.626-05	{}	38	New Jersey	us-nj		67	68	4	2	7
2020-12-18	2020-12-17 21:29:27.676-05	{}	39	New Mexico	us-nm		69	70	4	2	7
2020-12-18	2020-12-17 21:29:27.725-05	{}	40	North Carolina	us-nc		73	74	4	2	7
2020-12-18	2020-12-17 21:29:27.772-05	{}	41	North Dakota	us-nd		75	76	4	2	7
2020-12-18	2020-12-17 21:29:27.82-05	{}	42	Nebraska	us-ne		61	62	4	2	7
2020-12-18	2020-12-17 21:29:27.867-05	{}	43	New York	us-ny		71	72	4	2	7
2020-12-18	2020-12-17 21:29:27.916-05	{}	44	Rhode Island	us-ri		85	86	4	2	7
2020-12-18	2020-12-17 21:29:27.964-05	{}	45	Nevada	us-nv		63	64	4	2	7
2020-12-18	2020-12-17 21:29:28.012-05	{}	46	Colorado	us-co		17	18	4	2	7
2020-12-18	2020-12-17 21:29:28.06-05	{}	47	California	us-ca		15	16	4	2	7
2020-12-18	2020-12-17 21:29:28.108-05	{}	48	Georgia	us-ga		27	28	4	2	7
2020-12-18	2020-12-17 21:29:28.157-05	{}	49	Connecticut	us-ct		19	20	4	2	7
2020-12-18	2020-12-17 21:29:28.207-05	{}	50	Oklahoma	us-ok		79	80	4	2	7
2020-12-18	2020-12-17 21:29:28.255-05	{}	51	Ohio	us-oh		77	78	4	2	7
2020-12-18	2020-12-17 21:29:28.303-05	{}	52	Kansas	us-ks		39	40	4	2	7
2020-12-18	2020-12-17 21:29:28.35-05	{}	53	South Carolina	us-sc		87	88	4	2	7
2020-12-18	2020-12-17 21:29:28.398-05	{}	54	Kentucky	us-ky		41	42	4	2	7
2020-12-18	2020-12-17 21:29:28.457-05	{}	55	Oregon	us-or		81	82	4	2	7
2020-12-18	2020-12-17 21:29:28.532-05	{}	56	South Dakota	us-sd		89	90	4	2	7
2020-12-18	2020-12-17 21:29:28.596-05	{}	57	Delaware	us-de		21	22	4	2	7
2020-12-18	2020-12-17 21:29:28.647-05	{}	58	District of Columbia	us-dc		23	24	4	2	7
2020-12-18	2020-12-17 21:29:28.695-05	{}	59	Hawaii	us-hi		29	30	4	2	7
2020-12-18	2020-12-17 21:29:28.742-05	{}	60	Texas	us-tx		93	94	4	2	7
2020-12-18	2020-12-17 21:29:28.789-05	{}	61	Louisiana	us-la		43	44	4	2	7
2020-12-18	2020-12-17 21:29:28.836-05	{}	62	Tennessee	us-tn		91	92	4	2	7
2020-12-18	2020-12-17 21:29:28.884-05	{}	63	Pennsylvania	us-pa		83	84	4	2	7
2020-12-18	2020-12-17 21:29:28.932-05	{}	64	Virginia	us-va		99	100	4	2	7
2020-12-18	2020-12-17 21:29:28.979-05	{}	65	Alaska	us-ak		9	10	4	2	7
2020-12-18	2020-12-17 21:29:29.027-05	{}	66	Alabama	us-al		7	8	4	2	7
2020-12-18	2020-12-17 21:29:29.075-05	{}	67	Arkansas	us-ar		13	14	4	2	7
2020-12-18	2020-12-17 21:29:29.123-05	{}	68	Vermont	us-vt		97	98	4	2	7
2020-12-18	2020-12-17 21:29:29.171-05	{}	69	Illinois	us-il		33	34	4	2	7
2020-12-18	2020-12-17 21:29:29.219-05	{}	70	Indiana	us-in		35	36	4	2	7
2020-12-18	2020-12-17 21:29:29.267-05	{}	71	Iowa	us-ia		37	38	4	2	7
2020-12-18	2020-12-17 21:29:29.316-05	{}	72	Arizona	us-az		11	12	4	2	7
2020-12-18	2020-12-17 21:29:29.364-05	{}	73	Idaho	us-id		31	32	4	2	7
2020-12-18	2020-12-17 21:29:29.411-05	{}	74	Maine	us-me		45	46	4	2	7
2020-12-18	2020-12-17 21:29:29.46-05	{}	75	Maryland	us-md		47	48	4	2	7
2020-12-18	2020-12-17 21:29:29.508-05	{}	76	Massachusetts	us-ma		49	50	4	2	7
2020-12-18	2020-12-17 21:29:29.556-05	{}	77	Utah	us-ut		95	96	4	2	7
2020-12-18	2020-12-17 21:29:29.624-05	{}	78	Missouri	us-mo		57	58	4	2	7
2020-12-18	2020-12-17 21:29:29.697-05	{}	79	Minnesota	us-mn		53	54	4	2	7
2020-12-18	2020-12-17 21:29:29.752-05	{}	80	Michigan	us-mi		51	52	4	2	7
2020-12-18	2020-12-17 21:29:29.8-05	{}	81	Montana	us-mt		59	60	4	2	7
2020-12-18	2020-12-17 21:29:29.848-05	{}	82	Mississippi	us-ms		55	56	4	2	7
\.


--
-- Data for Name: dcim_site; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_site (created, last_updated, custom_field_data, id, name, _name, slug, status, facility, asn, time_zone, description, physical_address, shipping_address, latitude, longitude, contact_name, contact_phone, contact_email, comments, group_id, region_id, tenant_id) FROM stdin;
2020-12-19	2020-12-18 22:16:05.372-05	{}	1	DM-NYC	DM-NYC	dm-nyc	active		\N					\N	\N					\N	43	5
2020-12-19	2020-12-18 22:16:05.453-05	{}	2	DM-Akron	DM-Akron	dm-akron	active		\N					\N	\N					\N	51	5
2020-12-19	2020-12-18 22:16:05.519-05	{}	3	DM-Albany	DM-Albany	dm-albany	active		\N					\N	\N					\N	43	5
2020-12-19	2020-12-18 22:16:05.591-05	{}	4	DM-Binghamton	DM-Binghamton	dm-binghamton	active		\N					\N	\N					\N	43	5
2020-12-19	2020-12-18 22:16:05.687-05	{}	5	DM-Buffalo	DM-Buffalo	dm-buffalo	active		\N					\N	\N					\N	43	5
2020-12-19	2020-12-18 22:16:05.765-05	{}	6	DM-Camden	DM-Camden	dm-camden	active		\N					\N	\N					\N	38	5
2020-12-19	2020-12-18 22:16:05.829-05	{}	7	DM-Nashua	DM-Nashua	dm-nashua	active		\N					\N	\N					\N	37	5
2020-12-19	2020-12-18 22:16:05.892-05	{}	8	DM-Pittsfield	DM-Pittsfield	dm-pittsfield	active		\N					\N	\N					\N	76	5
2020-12-19	2020-12-18 22:16:05.955-05	{}	9	DM-Rochester	DM-Rochester	dm-rochester	active		\N					\N	\N					\N	43	5
2020-12-19	2020-12-18 22:16:06.019-05	{}	10	DM-Scranton	DM-Scranton	dm-scranton	active		\N					\N	\N					\N	63	5
2020-12-19	2020-12-18 22:16:06.083-05	{}	11	DM-Stamford	DM-Stamford	dm-stamford	active		\N					\N	\N					\N	49	5
2020-12-19	2020-12-18 22:16:06.147-05	{}	12	DM-Syracuse	DM-Syracuse	dm-syracuse	active		\N					\N	\N					\N	43	5
2020-12-19	2020-12-18 22:16:06.211-05	{}	13	DM-Utica	DM-Utica	dm-utica	active		\N					\N	\N					\N	43	5
2020-12-19	2020-12-18 22:16:06.275-05	{}	14	DM-Yonkers	DM-Yonkers	dm-yonkers	active		\N					\N	\N					\N	43	5
2021-03-10	2021-03-10 15:45:05.869-05	{}	15	JBB Branch 104	JBB Branch 00000104	jbb-branch-104	active		\N			7 Indian Spring Lane\r\nMenasha, WI 54952		\N	\N					\N	33	10
2021-03-10	2021-03-10 15:45:34.944-05	{}	16	JBB Branch 109	JBB Branch 00000109	jbb-branch-109	active		\N			14 South Mill Pond Ave.\r\nAnnandale, VA 22003		\N	\N					\N	64	10
2021-03-10	2021-03-10 15:45:59.009-05	{}	17	JBB Branch 115	JBB Branch 00000115	jbb-branch-115	active		\N			44 Blue Spring Dr.\r\nWest Warwick, RI 02893		\N	\N					\N	44	10
2021-03-10	2021-03-10 15:46:20.631-05	{}	18	JBB Branch 120	JBB Branch 00000120	jbb-branch-120	active		\N			682 Marlborough Street\r\nHicksville, NY 11801		\N	\N					\N	43	10
2021-03-10	2021-03-10 15:46:37.444-05	{}	19	JBB Branch 127	JBB Branch 00000127	jbb-branch-127	active		\N			7730 Summerhouse St.\r\nOrange Park, FL 32065		\N	\N					\N	35	10
2021-03-10	2021-03-10 15:46:56.353-05	{}	20	JBB Branch 133	JBB Branch 00000133	jbb-branch-133	active		\N			1 Old Union Ave.\r\nTroy, NY 12180		\N	\N					\N	43	10
2021-04-02	2021-04-02 12:55:15.385-04	{}	21	MDF	MDF	ncsu-065	active	065	\N		Main Distribution Frame	401 Dan Allen Dr., Raleigh, NC 27607		\N	\N					\N	40	13
2021-04-02	2021-04-02 12:52:33.644-04	{}	22	D. S. Weaver Labs	D. S. Weaver Labs	ncsu-117	active	DSW	\N			3110 Faucette Dr., Raleigh, NC 27607		\N	\N					\N	40	13
2021-04-02	2021-04-02 12:53:44.735-04	{}	23	Grinnells Lab	Grinnells Lab	ncsu-118	active	GRL	\N			3200 Faucette Dr., Raleigh, NC 27607		\N	\N					\N	40	13
2021-04-02	2021-04-02 12:54:17.83-04	{}	24	Butler Communications	Butler Communications	ncsu-128	active	BUT	\N			3210 Faucette Dr., Raleigh, NC 27607		\N	\N					\N	40	13
\.


--
-- Data for Name: dcim_sitegroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_sitegroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_virtualchassis; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_virtualchassis (created, last_updated, custom_field_data, id, name, domain, master_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-12-19 21:28:30.033-05	1	Customer ID	1	[{"added": {}}]	71	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
84	django_rq	queue
16	dcim	consoleport
18	dcim	consoleserverport
37	dcim	powerport
34	dcim	poweroutlet
27	dcim	interface
10	circuits	circuittermination
83	virtualization	vminterface
59	extras	report
25	dcim	frontport
42	dcim	rearport
33	dcim	powerfeed
45	dcim	site
20	dcim	device
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	taggit	tag
8	taggit	taggeditem
9	circuits	circuit
11	circuits	circuittype
12	circuits	provider
13	circuits	providernetwork
17	dcim	consoleporttemplate
19	dcim	consoleserverporttemplate
23	dcim	devicerole
24	dcim	devicetype
28	dcim	interfacetemplate
31	dcim	manufacturer
32	dcim	platform
35	dcim	poweroutlettemplate
38	dcim	powerporttemplate
39	dcim	rack
21	dcim	devicebay
22	dcim	devicebaytemplate
41	dcim	rackrole
40	dcim	rackreservation
44	dcim	region
29	dcim	inventoryitem
47	dcim	virtualchassis
26	dcim	frontporttemplate
43	dcim	rearporttemplate
14	dcim	cable
36	dcim	powerpanel
15	dcim	cablepath
30	dcim	location
46	dcim	sitegroup
48	ipam	aggregate
49	ipam	ipaddress
50	ipam	prefix
51	ipam	rir
52	ipam	role
56	ipam	vlan
54	ipam	vrf
55	ipam	vlangroup
57	ipam	service
53	ipam	routetarget
69	extras	exporttemplate
71	extras	customfield
68	extras	imageattachment
63	extras	webhook
65	extras	objectchange
61	extras	configcontext
62	extras	tag
64	extras	taggeditem
70	extras	customlink
60	extras	script
67	extras	jobresult
66	extras	journalentry
85	secrets	secret
86	secrets	secretrole
87	secrets	userkey
88	secrets	sessionkey
73	tenancy	tenant
72	tenancy	tenantgroup
77	users	token
76	users	userconfig
74	users	admingroup
75	users	adminuser
78	users	objectpermission
79	virtualization	cluster
80	virtualization	clustergroup
81	virtualization	clustertype
82	virtualization	virtualmachine
58	ipam	iprange
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-12-29 10:17:24.353887-05
2	auth	0001_initial	2023-12-29 10:17:24.47687-05
3	admin	0001_initial	2023-12-29 10:17:24.504211-05
4	admin	0002_logentry_remove_auto_add	2023-12-29 10:17:24.509256-05
5	admin	0003_logentry_add_action_flag_choices	2023-12-29 10:17:24.513208-05
6	contenttypes	0002_remove_content_type_name	2023-12-29 10:17:24.520278-05
7	auth	0002_alter_permission_name_max_length	2023-12-29 10:17:24.524258-05
8	auth	0003_alter_user_email_max_length	2023-12-29 10:17:24.529701-05
9	auth	0004_alter_user_username_opts	2023-12-29 10:17:24.571886-05
10	auth	0005_alter_user_last_login_null	2023-12-29 10:17:24.577096-05
11	auth	0006_require_contenttypes_0002	2023-12-29 10:17:24.579259-05
12	auth	0007_alter_validators_add_error_messages	2023-12-29 10:17:24.584546-05
13	auth	0008_alter_user_username_max_length	2023-12-29 10:17:24.593632-05
14	auth	0009_alter_user_last_name_max_length	2023-12-29 10:17:24.598415-05
15	auth	0010_alter_group_name_max_length	2023-12-29 10:17:24.602653-05
16	auth	0011_update_proxy_permissions	2023-12-29 10:17:24.60681-05
17	auth	0012_alter_user_first_name_max_length	2023-12-29 10:17:24.610429-05
18	extras	0001_initial	2023-12-29 10:17:24.947871-05
19	tenancy	0001_initial	2023-12-29 10:17:25.040777-05
20	tenancy	0002_tenant_group_optional	2023-12-29 10:17:25.042267-05
21	tenancy	0003_unicode_literals	2023-12-29 10:17:25.04474-05
22	tenancy	0004_tags	2023-12-29 10:17:25.046161-05
23	tenancy	0005_change_logging	2023-12-29 10:17:25.047577-05
24	tenancy	0006_custom_tag_models	2023-12-29 10:17:25.049019-05
25	tenancy	0007_nested_tenantgroups	2023-12-29 10:17:25.051312-05
26	tenancy	0008_nested_tenantgroups_rebuild	2023-12-29 10:17:25.052641-05
27	tenancy	0009_standardize_description	2023-12-29 10:17:25.053962-05
28	tenancy	0010_custom_field_data	2023-12-29 10:17:25.055227-05
29	tenancy	0011_standardize_name_length	2023-12-29 10:17:25.057526-05
30	tenancy	0012_standardize_models	2023-12-29 10:17:25.05869-05
31	dcim	0001_initial	2023-12-29 10:17:25.6614-05
32	circuits	0001_initial	2023-12-29 10:17:25.763668-05
33	circuits	0002_auto_20160622_1821	2023-12-29 10:17:25.968866-05
34	circuits	0003_provider_32bit_asn_support	2023-12-29 10:17:25.970316-05
35	circuits	0004_circuit_add_tenant	2023-12-29 10:17:25.971549-05
36	circuits	0005_circuit_add_upstream_speed	2023-12-29 10:17:25.972815-05
37	circuits	0006_terminations	2023-12-29 10:17:25.975024-05
38	circuits	0007_circuit_add_description	2023-12-29 10:17:25.976283-05
39	circuits	0008_circuittermination_interface_protect_on_delete	2023-12-29 10:17:25.977503-05
40	circuits	0009_unicode_literals	2023-12-29 10:17:25.978722-05
41	circuits	0010_circuit_status	2023-12-29 10:17:25.980999-05
42	circuits	0011_tags	2023-12-29 10:17:25.982202-05
43	circuits	0012_change_logging	2023-12-29 10:17:25.983371-05
44	circuits	0013_cables	2023-12-29 10:17:25.984566-05
45	circuits	0014_circuittermination_description	2023-12-29 10:17:25.986844-05
46	circuits	0015_custom_tag_models	2023-12-29 10:17:25.988058-05
47	circuits	0016_3569_circuit_fields	2023-12-29 10:17:25.989292-05
48	circuits	0017_circuittype_description	2023-12-29 10:17:25.990493-05
49	circuits	0018_standardize_description	2023-12-29 10:17:25.992992-05
50	circuits	0019_nullbooleanfield_to_booleanfield	2023-12-29 10:17:25.994255-05
51	circuits	0020_custom_field_data	2023-12-29 10:17:25.995442-05
52	circuits	0021_cache_cable_peer	2023-12-29 10:17:25.996603-05
53	circuits	0022_cablepath	2023-12-29 10:17:25.998781-05
54	circuits	0023_circuittermination_port_speed_optional	2023-12-29 10:17:25.999997-05
55	circuits	0024_standardize_name_length	2023-12-29 10:17:26.001183-05
56	circuits	0025_standardize_models	2023-12-29 10:17:26.00239-05
57	circuits	0026_mark_connected	2023-12-29 10:17:26.004718-05
58	circuits	0027_providernetwork	2023-12-29 10:17:26.006134-05
59	circuits	0028_cache_circuit_terminations	2023-12-29 10:17:26.010686-05
60	circuits	0029_circuit_tracing	2023-12-29 10:17:26.013643-05
61	dcim	0002_auto_20160622_1821	2023-12-29 10:17:27.122125-05
62	ipam	0001_initial	2023-12-29 10:17:27.556624-05
63	virtualization	0001_virtualization	2023-12-29 10:17:27.972533-05
64	virtualization	0002_virtualmachine_add_status	2023-12-29 10:17:27.974085-05
65	virtualization	0003_cluster_add_site	2023-12-29 10:17:27.975482-05
66	virtualization	0004_virtualmachine_add_role	2023-12-29 10:17:27.97772-05
67	virtualization	0005_django2	2023-12-29 10:17:27.979077-05
68	virtualization	0006_tags	2023-12-29 10:17:27.980346-05
69	virtualization	0007_change_logging	2023-12-29 10:17:27.981586-05
70	virtualization	0008_virtualmachine_local_context_data	2023-12-29 10:17:27.983756-05
71	virtualization	0009_custom_tag_models	2023-12-29 10:17:27.984983-05
72	virtualization	0010_cluster_add_tenant	2023-12-29 10:17:27.986187-05
73	virtualization	0011_3569_virtualmachine_fields	2023-12-29 10:17:27.987443-05
74	virtualization	0012_vm_name_nonunique	2023-12-29 10:17:27.989724-05
75	virtualization	0013_deterministic_ordering	2023-12-29 10:17:27.991074-05
76	virtualization	0014_standardize_description	2023-12-29 10:17:27.992314-05
77	virtualization	0015_vminterface	2023-12-29 10:17:27.993558-05
78	virtualization	0016_replicate_interfaces	2023-12-29 10:17:27.995725-05
79	virtualization	0017_update_jsonfield	2023-12-29 10:17:27.996965-05
80	virtualization	0018_custom_field_data	2023-12-29 10:17:27.998202-05
81	virtualization	0019_standardize_name_length	2023-12-29 10:17:27.999397-05
82	virtualization	0020_standardize_models	2023-12-29 10:17:28.001706-05
83	virtualization	0021_virtualmachine_vcpus_decimal	2023-12-29 10:17:28.002964-05
84	virtualization	0022_vminterface_parent	2023-12-29 10:17:28.004224-05
85	extras	0002_custom_fields	2023-12-29 10:17:28.627751-05
86	extras	0003_exporttemplate_add_description	2023-12-29 10:17:28.629457-05
87	extras	0004_topologymap_change_comma_to_semicolon	2023-12-29 10:17:28.631028-05
88	extras	0005_useraction_add_bulk_create	2023-12-29 10:17:28.633564-05
89	extras	0006_add_imageattachments	2023-12-29 10:17:28.635-05
90	extras	0007_unicode_literals	2023-12-29 10:17:28.63648-05
91	extras	0008_reports	2023-12-29 10:17:28.637941-05
92	extras	0009_topologymap_type	2023-12-29 10:17:28.640499-05
93	extras	0010_customfield_filter_logic	2023-12-29 10:17:28.64179-05
94	extras	0011_django2	2023-12-29 10:17:28.643071-05
95	extras	0012_webhooks	2023-12-29 10:17:28.644321-05
96	extras	0013_objectchange	2023-12-29 10:17:28.646681-05
97	extras	0014_configcontexts	2023-12-29 10:17:28.648035-05
98	extras	0015_remove_useraction	2023-12-29 10:17:28.649259-05
99	extras	0016_exporttemplate_add_cable	2023-12-29 10:17:28.650466-05
100	extras	0017_exporttemplate_mime_type_length	2023-12-29 10:17:28.652678-05
101	extras	0018_exporttemplate_add_jinja2	2023-12-29 10:17:28.653943-05
102	extras	0019_tag_taggeditem	2023-12-29 10:17:28.655152-05
103	extras	0020_tag_data	2023-12-29 10:17:28.656579-05
104	extras	0021_add_color_comments_changelog_to_tag	2023-12-29 10:17:28.658878-05
105	extras	0022_custom_links	2023-12-29 10:17:28.660166-05
106	extras	0023_fix_tag_sequences	2023-12-29 10:17:28.661509-05
107	extras	0024_scripts	2023-12-29 10:17:28.662742-05
108	extras	0025_objectchange_time_index	2023-12-29 10:17:28.66505-05
109	extras	0026_webhook_ca_file_path	2023-12-29 10:17:28.666247-05
110	extras	0027_webhook_additional_headers	2023-12-29 10:17:28.667413-05
111	extras	0028_remove_topology_maps	2023-12-29 10:17:28.668603-05
112	extras	0029_3569_customfield_fields	2023-12-29 10:17:28.670764-05
113	extras	0030_3569_objectchange_fields	2023-12-29 10:17:28.671968-05
114	extras	0031_3569_exporttemplate_fields	2023-12-29 10:17:28.673126-05
115	extras	0032_3569_webhook_fields	2023-12-29 10:17:28.674329-05
116	extras	0033_graph_type_template_language	2023-12-29 10:17:28.676582-05
117	extras	0034_configcontext_tags	2023-12-29 10:17:28.6778-05
118	extras	0035_deterministic_ordering	2023-12-29 10:17:28.679011-05
119	extras	0036_contenttype_filters_to_q_objects	2023-12-29 10:17:28.680208-05
120	extras	0037_configcontexts_clusters	2023-12-29 10:17:28.682383-05
121	extras	0038_webhook_template_support	2023-12-29 10:17:28.683588-05
122	extras	0039_update_features_content_types	2023-12-29 10:17:28.684754-05
123	extras	0040_standardize_description	2023-12-29 10:17:28.685932-05
124	extras	0041_tag_description	2023-12-29 10:17:28.688066-05
125	extras	0042_customfield_manager	2023-12-29 10:17:28.689266-05
126	extras	0043_report	2023-12-29 10:17:28.69044-05
127	extras	0044_jobresult	2023-12-29 10:17:28.691645-05
128	extras	0045_configcontext_changelog	2023-12-29 10:17:28.693774-05
129	extras	0046_update_jsonfield	2023-12-29 10:17:28.694985-05
130	extras	0047_tag_ordering	2023-12-29 10:17:28.696193-05
131	extras	0048_exporttemplate_remove_template_language	2023-12-29 10:17:28.697388-05
132	extras	0049_remove_graph	2023-12-29 10:17:28.699523-05
133	extras	0050_customfield_changes	2023-12-29 10:17:28.700692-05
134	extras	0051_migrate_customfields	2023-12-29 10:17:28.701877-05
135	extras	0052_customfield_cleanup	2023-12-29 10:17:28.703047-05
136	extras	0053_rename_webhook_obj_type	2023-12-29 10:17:28.705314-05
137	extras	0054_standardize_models	2023-12-29 10:17:28.706494-05
138	extras	0055_objectchange_data	2023-12-29 10:17:28.707688-05
139	extras	0056_extend_configcontext	2023-12-29 10:17:28.708899-05
140	extras	0057_customlink_rename_fields	2023-12-29 10:17:28.71105-05
141	extras	0058_journalentry	2023-12-29 10:17:28.712224-05
142	extras	0059_exporttemplate_as_attachment	2023-12-29 10:17:28.713392-05
143	dcim	0003_auto_20160628_1721	2023-12-29 10:17:31.326008-05
144	dcim	0004_auto_20160701_2049	2023-12-29 10:17:31.328637-05
145	dcim	0005_auto_20160706_1722	2023-12-29 10:17:31.330159-05
146	dcim	0006_add_device_primary_ip4_ip6	2023-12-29 10:17:31.331621-05
147	dcim	0007_device_copy_primary_ip	2023-12-29 10:17:31.333108-05
148	dcim	0008_device_remove_primary_ip	2023-12-29 10:17:31.335465-05
149	dcim	0009_site_32bit_asn_support	2023-12-29 10:17:31.336935-05
150	dcim	0010_devicebay_installed_device_set_null	2023-12-29 10:17:31.338377-05
151	dcim	0011_devicetype_part_number	2023-12-29 10:17:31.339775-05
152	dcim	0012_site_rack_device_add_tenant	2023-12-29 10:17:31.342164-05
153	dcim	0013_add_interface_form_factors	2023-12-29 10:17:31.343422-05
154	dcim	0014_rack_add_type_width	2023-12-29 10:17:31.344741-05
155	dcim	0015_rack_add_u_height_validator	2023-12-29 10:17:31.346049-05
156	dcim	0016_module_add_manufacturer	2023-12-29 10:17:31.34835-05
157	dcim	0017_rack_add_role	2023-12-29 10:17:31.349627-05
158	dcim	0018_device_add_asset_tag	2023-12-29 10:17:31.350857-05
159	dcim	0019_new_iface_form_factors	2023-12-29 10:17:31.352115-05
160	dcim	0020_rack_desc_units	2023-12-29 10:17:31.354401-05
161	dcim	0021_add_ff_flexstack	2023-12-29 10:17:31.355645-05
162	dcim	0022_color_names_to_rgb	2023-12-29 10:17:31.356971-05
163	dcim	0023_devicetype_comments	2023-12-29 10:17:31.358215-05
164	dcim	0024_site_add_contact_fields	2023-12-29 10:17:31.360513-05
165	dcim	0025_devicetype_add_interface_ordering	2023-12-29 10:17:31.361762-05
166	dcim	0026_add_rack_reservations	2023-12-29 10:17:31.363003-05
167	dcim	0027_device_add_site	2023-12-29 10:17:31.364254-05
168	dcim	0028_device_copy_rack_to_site	2023-12-29 10:17:31.366507-05
169	dcim	0029_allow_rackless_devices	2023-12-29 10:17:31.36776-05
170	dcim	0030_interface_add_lag	2023-12-29 10:17:31.368986-05
171	dcim	0031_regions	2023-12-29 10:17:31.370189-05
172	dcim	0032_device_increase_name_length	2023-12-29 10:17:31.372343-05
173	dcim	0033_rackreservation_rack_editable	2023-12-29 10:17:31.373593-05
174	dcim	0034_rename_module_to_inventoryitem	2023-12-29 10:17:31.37479-05
175	dcim	0035_device_expand_status_choices	2023-12-29 10:17:31.376003-05
176	dcim	0036_add_ff_juniper_vcp	2023-12-29 10:17:31.378304-05
177	dcim	0037_unicode_literals	2023-12-29 10:17:31.379531-05
178	dcim	0038_wireless_interfaces	2023-12-29 10:17:31.380773-05
179	dcim	0039_interface_add_enabled_mtu	2023-12-29 10:17:31.382119-05
180	dcim	0040_inventoryitem_add_asset_tag_description	2023-12-29 10:17:31.384381-05
181	dcim	0041_napalm_integration	2023-12-29 10:17:31.385616-05
182	dcim	0042_interface_ff_10ge_cx4	2023-12-29 10:17:31.38685-05
183	dcim	0043_device_component_name_lengths	2023-12-29 10:17:31.388092-05
184	dcim	0044_virtualization	2023-12-29 10:17:31.390466-05
185	dcim	0045_devicerole_vm_role	2023-12-29 10:17:31.392042-05
186	dcim	0046_rack_lengthen_facility_id	2023-12-29 10:17:31.393495-05
187	dcim	0047_more_100ge_form_factors	2023-12-29 10:17:31.394923-05
188	dcim	0048_rack_serial	2023-12-29 10:17:31.397491-05
189	dcim	0049_rackreservation_change_user	2023-12-29 10:17:31.399009-05
190	dcim	0050_interface_vlan_tagging	2023-12-29 10:17:31.400481-05
191	dcim	0051_rackreservation_tenant	2023-12-29 10:17:31.401843-05
192	dcim	0052_virtual_chassis	2023-12-29 10:17:31.404423-05
193	dcim	0053_platform_manufacturer	2023-12-29 10:17:31.405964-05
194	dcim	0054_site_status_timezone_description	2023-12-29 10:17:31.407542-05
195	dcim	0055_virtualchassis_ordering	2023-12-29 10:17:31.409044-05
196	dcim	0056_django2	2023-12-29 10:17:31.41146-05
197	dcim	0057_tags	2023-12-29 10:17:31.412906-05
198	dcim	0058_relax_rack_naming_constraints	2023-12-29 10:17:31.414369-05
199	dcim	0059_site_latitude_longitude	2023-12-29 10:17:31.415955-05
200	dcim	0060_change_logging	2023-12-29 10:17:31.418203-05
201	dcim	0061_platform_napalm_args	2023-12-29 10:17:31.419493-05
202	dcim	0062_interface_mtu	2023-12-29 10:17:31.420764-05
203	dcim	0063_device_local_context_data	2023-12-29 10:17:31.422034-05
204	dcim	0064_remove_platform_rpc_client	2023-12-29 10:17:31.424206-05
205	dcim	0065_front_rear_ports	2023-12-29 10:17:31.425445-05
206	dcim	0066_cables	2023-12-29 10:17:31.426687-05
207	dcim	0067_device_type_remove_qualifiers	2023-12-29 10:17:31.427938-05
208	dcim	0068_rack_new_fields	2023-12-29 10:17:31.430098-05
209	dcim	0069_deprecate_nullablecharfield	2023-12-29 10:17:31.431327-05
210	dcim	0070_custom_tag_models	2023-12-29 10:17:31.432576-05
211	dcim	0071_device_components_add_description	2023-12-29 10:17:31.433812-05
212	dcim	0072_powerfeeds	2023-12-29 10:17:31.435977-05
213	dcim	0073_interface_form_factor_to_type	2023-12-29 10:17:31.437259-05
214	dcim	0074_increase_field_length_platform_name_slug	2023-12-29 10:17:31.438492-05
215	dcim	0075_cable_devices	2023-12-29 10:17:31.439777-05
216	dcim	0076_console_port_types	2023-12-29 10:17:31.442332-05
217	dcim	0077_power_types	2023-12-29 10:17:31.443822-05
218	dcim	0078_3569_site_fields	2023-12-29 10:17:31.445291-05
219	dcim	0079_3569_rack_fields	2023-12-29 10:17:31.446658-05
220	dcim	0080_3569_devicetype_fields	2023-12-29 10:17:31.449002-05
221	dcim	0081_3569_device_fields	2023-12-29 10:17:31.450325-05
222	dcim	0082_3569_interface_fields	2023-12-29 10:17:31.451622-05
223	dcim	0082_3569_port_fields	2023-12-29 10:17:31.452918-05
224	dcim	0083_3569_cable_fields	2023-12-29 10:17:31.455115-05
225	dcim	0084_3569_powerfeed_fields	2023-12-29 10:17:31.456391-05
226	dcim	0085_3569_poweroutlet_fields	2023-12-29 10:17:31.457684-05
227	dcim	0086_device_name_nonunique	2023-12-29 10:17:31.458904-05
228	dcim	0087_role_descriptions	2023-12-29 10:17:31.461205-05
229	dcim	0088_powerfeed_available_power	2023-12-29 10:17:31.462392-05
230	dcim	0089_deterministic_ordering	2023-12-29 10:17:31.463601-05
231	dcim	0090_cable_termination_models	2023-12-29 10:17:31.464788-05
232	dcim	0091_interface_type_other	2023-12-29 10:17:31.466893-05
233	dcim	0092_fix_rack_outer_unit	2023-12-29 10:17:31.468108-05
234	dcim	0093_device_component_ordering	2023-12-29 10:17:31.469304-05
235	dcim	0094_device_component_template_ordering	2023-12-29 10:17:31.470509-05
236	dcim	0095_primary_model_ordering	2023-12-29 10:17:31.472661-05
237	dcim	0096_interface_ordering	2023-12-29 10:17:31.473945-05
238	dcim	0097_interfacetemplate_type_other	2023-12-29 10:17:31.475166-05
239	dcim	0098_devicetype_images	2023-12-29 10:17:31.476393-05
240	dcim	0099_powerfeed_negative_voltage	2023-12-29 10:17:31.478532-05
241	dcim	0100_mptt_remove_indexes	2023-12-29 10:17:31.479731-05
242	dcim	0101_nested_rackgroups	2023-12-29 10:17:31.480924-05
243	dcim	0102_nested_rackgroups_rebuild	2023-12-29 10:17:31.482232-05
244	dcim	0103_standardize_description	2023-12-29 10:17:31.484351-05
245	dcim	0104_correct_infiniband_types	2023-12-29 10:17:31.485549-05
246	dcim	0105_interface_name_collation	2023-12-29 10:17:31.486729-05
247	dcim	0106_role_default_color	2023-12-29 10:17:31.487933-05
248	dcim	0107_component_labels	2023-12-29 10:17:31.490077-05
249	dcim	0108_add_tags	2023-12-29 10:17:31.491293-05
250	dcim	0109_interface_remove_vm	2023-12-29 10:17:31.492506-05
251	dcim	0110_virtualchassis_name	2023-12-29 10:17:31.493708-05
252	dcim	0111_component_template_description	2023-12-29 10:17:31.495828-05
253	dcim	0112_standardize_components	2023-12-29 10:17:31.497041-05
254	dcim	0113_nullbooleanfield_to_booleanfield	2023-12-29 10:17:31.498232-05
255	dcim	0114_update_jsonfield	2023-12-29 10:17:31.499461-05
256	dcim	0115_rackreservation_order	2023-12-29 10:17:31.50173-05
257	dcim	0116_rearport_max_positions	2023-12-29 10:17:31.502914-05
258	dcim	0117_custom_field_data	2023-12-29 10:17:31.504082-05
259	dcim	0118_inventoryitem_mptt	2023-12-29 10:17:31.505231-05
260	dcim	0119_inventoryitem_mptt_rebuild	2023-12-29 10:17:31.507336-05
261	dcim	0120_cache_cable_peer	2023-12-29 10:17:31.508538-05
262	dcim	0121_cablepath	2023-12-29 10:17:31.509732-05
263	dcim	0122_standardize_name_length	2023-12-29 10:17:31.510935-05
264	dcim	0123_standardize_models	2023-12-29 10:17:31.51317-05
265	dcim	0124_mark_connected	2023-12-29 10:17:31.514382-05
266	dcim	0125_console_port_speed	2023-12-29 10:17:31.515581-05
267	dcim	0126_rename_rackgroup_location	2023-12-29 10:17:31.516766-05
268	dcim	0127_device_location	2023-12-29 10:17:31.51888-05
269	dcim	0128_device_location_populate	2023-12-29 10:17:31.520071-05
270	dcim	0129_interface_parent	2023-12-29 10:17:31.521262-05
271	dcim	0130_sitegroup	2023-12-29 10:17:31.522416-05
272	dcim	0131_consoleport_speed	2023-12-29 10:17:31.647056-05
273	dcim	0132_cable_length	2023-12-29 10:17:31.717678-05
274	dcim	0133_port_colors	2023-12-29 10:17:31.872147-05
275	django_rq	0001_initial	2023-12-29 10:17:31.875044-05
276	extras	0060_customlink_button_class	2023-12-29 10:17:31.886224-05
277	extras	0061_extras_change_logging	2023-12-29 10:17:31.967831-05
278	extras	0062_clear_secrets_changelog	2023-12-29 10:17:31.998813-05
279	ipam	0002_vrf_add_enforce_unique	2023-12-29 10:17:32.831216-05
280	ipam	0003_ipam_add_vlangroups	2023-12-29 10:17:32.832788-05
281	ipam	0004_ipam_vlangroup_uniqueness	2023-12-29 10:17:32.83526-05
282	ipam	0005_auto_20160725_1842	2023-12-29 10:17:32.836735-05
283	ipam	0006_vrf_vlan_add_tenant	2023-12-29 10:17:32.838211-05
284	ipam	0007_prefix_ipaddress_add_tenant	2023-12-29 10:17:32.8397-05
285	ipam	0008_prefix_change_order	2023-12-29 10:17:32.842074-05
286	ipam	0009_ipaddress_add_status	2023-12-29 10:17:32.843314-05
287	ipam	0010_ipaddress_help_texts	2023-12-29 10:17:32.844574-05
288	ipam	0011_rir_add_is_private	2023-12-29 10:17:32.845788-05
289	ipam	0012_services	2023-12-29 10:17:32.847955-05
290	ipam	0013_prefix_add_is_pool	2023-12-29 10:17:32.849243-05
291	ipam	0014_ipaddress_status_add_deprecated	2023-12-29 10:17:32.850572-05
292	ipam	0015_global_vlans	2023-12-29 10:17:32.851887-05
293	ipam	0016_unicode_literals	2023-12-29 10:17:32.854179-05
294	ipam	0017_ipaddress_roles	2023-12-29 10:17:32.85539-05
295	ipam	0018_remove_service_uniqueness_constraint	2023-12-29 10:17:32.856662-05
296	ipam	0019_virtualization	2023-12-29 10:17:32.857863-05
297	ipam	0020_ipaddress_add_role_carp	2023-12-29 10:17:32.860149-05
298	ipam	0021_vrf_ordering	2023-12-29 10:17:32.86136-05
299	ipam	0022_tags	2023-12-29 10:17:32.862562-05
300	ipam	0023_change_logging	2023-12-29 10:17:32.863777-05
301	ipam	0024_vrf_allow_null_rd	2023-12-29 10:17:32.866081-05
302	ipam	0025_custom_tag_models	2023-12-29 10:17:32.867277-05
303	ipam	0026_prefix_ordering_vrf_nulls_first	2023-12-29 10:17:32.868488-05
304	ipam	0027_ipaddress_add_dns_name	2023-12-29 10:17:32.869699-05
305	ipam	0028_3569_prefix_fields	2023-12-29 10:17:32.871995-05
306	ipam	0029_3569_ipaddress_fields	2023-12-29 10:17:32.873222-05
307	ipam	0030_3569_vlan_fields	2023-12-29 10:17:32.874455-05
308	ipam	0031_3569_service_fields	2023-12-29 10:17:32.875668-05
309	ipam	0032_role_description	2023-12-29 10:17:32.877985-05
310	ipam	0033_deterministic_ordering	2023-12-29 10:17:32.879246-05
311	ipam	0034_fix_ipaddress_status_dhcp	2023-12-29 10:17:32.880459-05
312	ipam	0035_drop_ip_family	2023-12-29 10:17:32.881668-05
313	ipam	0036_standardize_description	2023-12-29 10:17:32.883827-05
314	ipam	0037_ipaddress_assignment	2023-12-29 10:17:32.885007-05
315	ipam	0038_custom_field_data	2023-12-29 10:17:32.88617-05
316	ipam	0039_service_ports_array	2023-12-29 10:17:32.887356-05
317	ipam	0040_service_drop_port	2023-12-29 10:17:32.889646-05
318	ipam	0041_routetarget	2023-12-29 10:17:32.890841-05
319	ipam	0042_standardize_name_length	2023-12-29 10:17:32.89206-05
320	ipam	0043_add_tenancy_to_aggregates	2023-12-29 10:17:32.893266-05
321	ipam	0044_standardize_models	2023-12-29 10:17:32.895415-05
322	ipam	0045_vlangroup_scope	2023-12-29 10:17:32.896625-05
323	ipam	0046_set_vlangroup_scope_types	2023-12-29 10:17:32.897864-05
324	ipam	0047_prefix_depth_children	2023-12-29 10:17:32.941307-05
325	ipam	0048_prefix_populate_depth_children	2023-12-29 10:17:32.974437-05
326	ipam	0049_prefix_mark_utilized	2023-12-29 10:17:32.99654-05
327	ipam	0050_iprange	2023-12-29 10:17:33.124035-05
328	sessions	0001_initial	2023-12-29 10:17:33.149656-05
329	taggit	0001_initial	2023-12-29 10:17:33.235372-05
330	taggit	0002_auto_20150616_2121	2023-12-29 10:17:33.254784-05
331	taggit	0003_taggeditem_add_unique_index	2023-12-29 10:17:33.273915-05
332	tenancy	0002_tenant_ordering	2023-12-29 10:17:33.30029-05
333	users	0001_api_tokens	2023-12-29 10:17:33.51762-05
334	users	0002_unicode_literals	2023-12-29 10:17:33.520287-05
335	users	0003_token_permissions	2023-12-29 10:17:33.521813-05
336	users	0004_standardize_description	2023-12-29 10:17:33.523288-05
337	users	0005_userconfig	2023-12-29 10:17:33.524664-05
338	users	0006_create_userconfigs	2023-12-29 10:17:33.526957-05
339	users	0007_proxy_group_user	2023-12-29 10:17:33.528284-05
340	users	0008_objectpermission	2023-12-29 10:17:33.529541-05
341	users	0009_replicate_permissions	2023-12-29 10:17:33.530787-05
342	users	0010_update_jsonfield	2023-12-29 10:17:33.532988-05
343	users	0011_standardize_models	2023-12-29 10:17:33.53426-05
344	virtualization	0023_virtualmachine_natural_ordering	2023-12-29 10:17:33.67525-05
345	circuits	0002_squashed_0029	2023-12-29 10:17:33.678552-05
346	circuits	0001_squashed	2023-12-29 10:17:33.68014-05
347	dcim	0003_squashed_0130	2023-12-29 10:17:33.682817-05
348	dcim	0001_squashed	2023-12-29 10:17:33.684361-05
349	dcim	0002_squashed	2023-12-29 10:17:33.685911-05
350	ipam	0001_squashed	2023-12-29 10:17:33.687336-05
351	ipam	0002_squashed_0046	2023-12-29 10:17:33.689817-05
352	extras	0001_squashed	2023-12-29 10:17:33.691199-05
353	extras	0002_squashed_0059	2023-12-29 10:17:33.692573-05
354	tenancy	0001_squashed_0012	2023-12-29 10:17:33.693936-05
355	users	0001_squashed_0011	2023-12-29 10:17:33.696269-05
356	virtualization	0001_squashed_0022	2023-12-29 10:17:33.697653-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
5hs4q8q0nq5ty0uutneg8319031y9ool	.eJxVjEsKwjAUAO-StRST5leXXkBvEN7LeyFRTKFJQRDvbgsudDszzEsEWHsOa-MlFBInIcXhlyHEO9ddVO44P4ddce0lQi9zHS5449ivvDxKaxs4f_u_SYaWt4NN2qhkwPnorCOvJdMIKBWSJ2cn5bRHCyZacp6i8SAnSpLYshqPRor3Bz4ZOjs:1lS4QB:yF8hsSlX6bXtCNdIfQh-np4xpNX1zEFoRsDStBroVWs	2021-04-15 17:00:07.705-04
cy7midjsslbcth9utq4a1gp6pqqna5gc	.eJxVjEsKwjAUAO-StRST5leXXkBvEN7LeyFRTKFJQRDvbgsudDszzEsEWHsOa-MlFBInIcXhlyHEO9ddVO44P4ddce0lQi9zHS5449ivvDxKaxs4f_u_SYaWt4NN2qhkwPnorCOvJdMIKBWSJ2cn5bRHCyZacp6i8SAnSpLYshqPRor3Bz4ZOjs:1lTVTa:ztDpsDoYAGe4FXDhQnQN6igTM1gXr12-pjKIXdeheig	2021-04-19 16:05:34.963-04
jzghkrf05djj09l1q9nx1av9dckf7s44	.eJxVjEEKwjAQRe-StZSUmE7i0gvoDcLMZEKimEKTgiDe3RZc6OJv3vu8lwq49hzWJksoUZ3UqA6_jJDvUndRpdP8HHYltRfGXuY6XOgm3K-yPEprGzh__3-RjC1vhYltOppJwz4g74Ed2YSY2EantfaYNIyGo5HkTQQLhsgZP3IE0aLeHy-XOjQ:1mOLKA:09DVMAwSHPtbK7KzkJ3lrTxq5dv9zsWjbZ7vyvevBUo	2021-09-23 10:46:46.983-04
lar983rcymiz2cybb2nj8rg5jd17j3gj	.eJxVjEsKwjAUAO-StRST5leXXkBvEN7LeyFRTKFJQRDvbgsudDszzEsEWHsOa-MlFBInIcXhlyHEO9ddVO44P4ddce0lQi9zHS5449ivvDxKaxs4f_u_SYaWt4NN2qhkwPnorCOvJdMIKBWSJ2cn5bRHCyZacp6i8SAnSpLYshqPRor3Bz4ZOjs:1kugNK:X-TLXvNbihbM70WOQ7Mj5TH88w-eAq5wK7KJ73iZ1nY	2021-01-13 13:39:10.475-05
v9ev1vzj3eu79saavvtfmdahhh6molun	.eJxVjEsKwjAUAO-StRST5leXXkBvEN7LeyFRTKFJQRDvbgsudDszzEsEWHsOa-MlFBInIcXhlyHEO9ddVO44P4ddce0lQi9zHS5449ivvDxKaxs4f_u_SYaWt4NN2qhkwPnorCOvJdMIKBWSJ2cn5bRHCyZacp6i8SAnSpLYshqPRor3Bz4ZOjs:1lK5es:E2OULJPX0gKGbXp7wrkBOnowgem7Y9-zN7S0Ax8ozSM	2021-03-24 16:42:18.086-04
y5ynkgn01snj4pihm1mt7aygydkqt9m1	.eJxVjEEKwyAQRe_iuoTRJBq77AXSG4RxHNGWGogGCqV3r4Eu2s2H_9_nvcSCe43LXnhbkhdnIcXpd3NId84HyFzd-uwOxLkmwprW3M3uxlSvvD1SKW24fP9_koglNsPIwWgNYBUEw71zelDsQRHh4LEVQosTK5oCmNFKGUiqFixhAku9eH8AQZg6QQ:1kq5B2:BPPKzzGORMlmL5bNBr1NAT0Vq7y7Sy8auiaTM25LdLM	2020-12-31 21:07:28.941-05
\.


--
-- Data for Name: extras_configcontext; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext (created, last_updated, id, name, weight, description, is_active, data) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_cluster_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_cluster_groups (id, configcontext_id, clustergroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_clusters; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_clusters (id, configcontext_id, cluster_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_device_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_device_types (id, configcontext_id, devicetype_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_platforms; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_platforms (id, configcontext_id, platform_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_regions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_regions (id, configcontext_id, region_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_roles; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_roles (id, configcontext_id, devicerole_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_site_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_site_groups (id, configcontext_id, sitegroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_sites; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_sites (id, configcontext_id, site_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tags; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tags (id, configcontext_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenant_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenant_groups (id, configcontext_id, tenantgroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenants; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenants (id, configcontext_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: extras_customfield; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield (id, type, name, label, description, required, filter_logic, "default", weight, validation_minimum, validation_maximum, validation_regex, choices, created, last_updated) FROM stdin;
1	text	cust_id	Customer ID		f	exact	\N	100	\N	\N	^[A-Z]{3}\\d{2}$	{}	2021-09-09	2021-09-09 10:52:44.516-04
\.


--
-- Data for Name: extras_customfield_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield_content_types (id, customfield_id, contenttype_id) FROM stdin;
1	1	73
\.


--
-- Data for Name: extras_customlink; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customlink (id, name, link_text, link_url, weight, group_name, button_class, new_window, content_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_exporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_exporttemplate (id, name, description, template_code, mime_type, file_extension, as_attachment, content_type_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_imageattachment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_imageattachment (id, object_id, image, image_height, image_width, name, created, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_jobresult; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_jobresult (id, name, created, completed, status, data, job_id, obj_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: extras_journalentry; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_journalentry (last_updated, id, assigned_object_id, created, kind, comments, assigned_object_type_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: extras_objectchange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_objectchange (id, "time", user_name, request_id, action, changed_object_id, related_object_id, object_repr, prechange_data, postchange_data, changed_object_type_id, related_object_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: extras_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_tag (name, slug, created, last_updated, id, color, description) FROM stdin;
\.


--
-- Data for Name: extras_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_taggeditem (object_id, id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_webhook; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook (id, name, type_create, type_update, type_delete, payload_url, enabled, http_method, http_content_type, additional_headers, body_template, secret, ssl_verification, ca_file_path, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_webhook_content_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook_content_types (id, webhook_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: ipam_aggregate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_aggregate (created, last_updated, custom_field_data, id, prefix, date_added, description, rir_id, tenant_id) FROM stdin;
2020-12-19	2020-12-18 21:10:23.829-05	{}	1	10.0.0.0/8	\N		6	\N
2020-12-19	2020-12-18 21:10:23.899-05	{}	2	172.16.0.0/12	\N		6	\N
2020-12-19	2020-12-18 21:10:23.961-05	{}	3	192.168.0.0/16	\N		6	\N
2020-12-19	2020-12-18 21:10:24.039-05	{}	4	100.64.0.0/10	\N		7	\N
\.


--
-- Data for Name: ipam_ipaddress; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_ipaddress (created, last_updated, custom_field_data, id, address, status, role, assigned_object_id, dns_name, description, assigned_object_type_id, nat_inside_id, tenant_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: ipam_iprange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_iprange (created, last_updated, custom_field_data, id, start_address, end_address, size, status, description, role_id, tenant_id, vrf_id) FROM stdin;
\.


--
-- Data for Name: ipam_prefix; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_prefix (created, last_updated, custom_field_data, id, prefix, status, is_pool, description, role_id, site_id, tenant_id, vlan_id, vrf_id, _children, _depth, mark_utilized) FROM stdin;
2020-12-30	2020-12-30 15:00:02.45-05	{}	2	10.112.0.0/17	container	f	DM HQ	\N	\N	5	\N	\N	0	1	f
2020-12-30	2020-12-30 15:13:41.316-05	{}	7	10.112.128.0/28	active	f		4	2	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:41.429-05	{}	8	10.112.129.0/24	active	f		1	2	5	1	\N	0	3	f
2020-12-30	2020-12-30 15:13:41.551-05	{}	9	10.112.130.0/24	active	f		2	2	5	2	\N	0	3	f
2020-12-30	2020-12-30 15:13:41.639-05	{}	10	10.112.131.0/24	active	f		3	2	5	27	\N	0	3	f
2020-12-30	2020-12-30 15:19:10.958-05	{}	60	10.112.128.0/22	container	f		\N	2	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:13:41.714-05	{}	11	10.112.132.0/28	active	f		4	3	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:41.801-05	{}	12	10.112.133.0/24	active	f		1	3	5	3	\N	0	3	f
2020-12-30	2020-12-30 15:13:41.891-05	{}	13	10.112.134.0/24	active	f		2	3	5	4	\N	0	3	f
2020-12-30	2020-12-30 15:13:41.975-05	{}	14	10.112.135.0/24	active	f		3	3	5	28	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.024-05	{}	61	10.112.132.0/22	container	f		\N	3	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:13:42.049-05	{}	15	10.112.136.0/28	active	f		4	4	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:42.134-05	{}	16	10.112.137.0/24	active	f		1	4	5	5	\N	0	3	f
2020-12-30	2020-12-30 15:13:42.22-05	{}	17	10.112.138.0/24	active	f		2	4	5	6	\N	0	3	f
2020-12-30	2020-12-30 15:13:42.307-05	{}	18	10.112.139.0/24	active	f		3	4	5	29	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.089-05	{}	62	10.112.136.0/22	container	f		\N	4	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:13:42.382-05	{}	19	10.112.140.0/28	active	f		4	5	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:42.467-05	{}	20	10.112.141.0/24	active	f		1	5	5	7	\N	0	3	f
2020-12-30	2020-12-30 15:13:42.61-05	{}	21	10.112.142.0/24	active	f		2	5	5	8	\N	0	3	f
2020-12-30	2020-12-30 15:13:42.696-05	{}	22	10.112.143.0/24	active	f		3	5	5	30	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.154-05	{}	63	10.112.140.0/22	container	f		\N	5	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:13:42.776-05	{}	23	10.112.144.0/28	active	f		4	6	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:42.863-05	{}	24	10.112.145.0/24	active	f		1	6	5	9	\N	0	3	f
2020-12-30	2020-12-30 15:13:42.95-05	{}	25	10.112.146.0/24	active	f		2	6	5	10	\N	0	3	f
2020-12-30	2020-12-30 15:13:43.037-05	{}	26	10.112.147.0/24	active	f		3	6	5	31	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.221-05	{}	64	10.112.144.0/22	container	f		\N	6	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:13:43.111-05	{}	27	10.112.148.0/28	active	f		4	7	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:43.196-05	{}	28	10.112.149.0/24	active	f		1	7	5	11	\N	0	3	f
2020-12-30	2020-12-30 15:13:43.282-05	{}	29	10.112.150.0/24	active	f		2	7	5	12	\N	0	3	f
2020-12-30	2020-12-30 15:13:43.368-05	{}	30	10.112.151.0/24	active	f		3	7	5	32	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.288-05	{}	65	10.112.148.0/22	container	f		\N	7	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:13:43.441-05	{}	31	10.112.152.0/28	active	f		4	8	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:43.527-05	{}	32	10.112.153.0/24	active	f		1	8	5	13	\N	0	3	f
2020-12-30	2020-12-30 15:13:43.637-05	{}	33	10.112.154.0/24	active	f		2	8	5	14	\N	0	3	f
2020-12-30	2020-12-30 15:13:43.76-05	{}	34	10.112.155.0/24	active	f		3	8	5	33	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.355-05	{}	66	10.112.152.0/22	container	f		\N	8	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:13:43.834-05	{}	35	10.112.156.0/28	active	f		4	9	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:43.926-05	{}	36	10.112.157.0/24	active	f		1	9	5	15	\N	0	3	f
2020-12-30	2020-12-30 15:13:44.013-05	{}	37	10.112.158.0/24	active	f		2	9	5	16	\N	0	3	f
2020-12-30	2020-12-30 15:13:44.099-05	{}	38	10.112.159.0/24	active	f		3	9	5	34	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.419-05	{}	67	10.112.156.0/22	container	f		\N	9	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:13:44.173-05	{}	39	10.112.160.0/28	active	f		4	10	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:44.259-05	{}	40	10.112.161.0/24	active	f		1	10	5	17	\N	0	3	f
2020-12-30	2020-12-30 15:13:44.345-05	{}	41	10.112.162.0/24	active	f		2	10	5	18	\N	0	3	f
2020-12-30	2020-12-30 15:13:44.431-05	{}	42	10.112.163.0/24	active	f		3	10	5	35	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.481-05	{}	68	10.112.160.0/22	container	f		\N	10	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:13:44.504-05	{}	43	10.112.164.0/28	active	f		4	11	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:44.59-05	{}	44	10.112.165.0/24	active	f		1	11	5	19	\N	0	3	f
2020-12-30	2020-12-30 15:13:44.675-05	{}	45	10.112.166.0/24	active	f		2	11	5	20	\N	0	3	f
2020-12-30	2020-12-30 15:13:44.827-05	{}	46	10.112.167.0/24	active	f		3	11	5	36	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.543-05	{}	69	10.112.164.0/22	container	f		\N	11	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:13:44.902-05	{}	47	10.112.168.0/28	active	f		4	12	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:44.996-05	{}	48	10.112.169.0/24	active	f		1	12	5	21	\N	0	3	f
2020-12-30	2020-12-30 15:13:45.084-05	{}	49	10.112.170.0/24	active	f		2	12	5	22	\N	0	3	f
2020-12-30	2020-12-30 15:13:45.171-05	{}	50	10.112.171.0/24	active	f		3	12	5	37	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.606-05	{}	70	10.112.168.0/22	container	f		\N	12	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:13:45.246-05	{}	51	10.112.172.0/28	active	f		4	13	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:45.332-05	{}	52	10.112.173.0/24	active	f		1	13	5	23	\N	0	3	f
2020-12-30	2020-12-30 15:13:45.418-05	{}	53	10.112.174.0/24	active	f		2	13	5	24	\N	0	3	f
2020-12-30	2020-12-30 15:13:45.505-05	{}	54	10.112.175.0/24	active	f		3	13	5	38	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.669-05	{}	71	10.112.172.0/22	container	f		\N	13	5	\N	\N	4	2	f
2020-12-30	2020-12-30 15:00:17.126-05	{}	1	10.112.0.0/15	container	f		\N	\N	5	\N	\N	67	0	f
2020-12-30	2020-12-30 15:01:26.618-05	{}	3	10.112.128.0/17	container	f	DM branch offices	\N	\N	5	\N	\N	65	1	f
2020-12-30	2020-12-30 15:13:45.58-05	{}	55	10.112.176.0/28	active	f		4	14	5	\N	\N	0	3	f
2020-12-30	2020-12-30 15:13:45.668-05	{}	56	10.112.177.0/24	active	f		1	14	5	25	\N	0	3	f
2020-12-30	2020-12-30 15:13:45.755-05	{}	57	10.112.178.0/24	active	f		2	14	5	26	\N	0	3	f
2020-12-30	2020-12-30 15:13:45.87-05	{}	58	10.112.179.0/24	active	f		3	14	5	39	\N	0	3	f
2020-12-30	2020-12-30 15:19:11.772-05	{}	72	10.112.176.0/22	container	f		\N	14	5	\N	\N	4	2	f
\.


--
-- Data for Name: ipam_rir; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_rir (created, last_updated, custom_field_data, id, name, slug, is_private, description) FROM stdin;
2020-12-19	2020-12-18 21:04:34.029-05	{}	1	ARIN	arin	f	American Registry for Internet Numbers
2020-12-19	2020-12-18 21:04:34.072-05	{}	2	RIPE NCC	ripe-ncc	f	Réseaux IP Européens Network Coordination Centre
2020-12-19	2020-12-18 21:04:34.095-05	{}	3	APNIC	apnic	f	Asia Pacific Network Information Centre
2020-12-19	2020-12-18 21:04:34.115-05	{}	4	LACNIC	lacnic	f	Latin America and Caribbean Network Information Centre
2020-12-19	2020-12-18 21:04:34.135-05	{}	5	AFRINIC	afrinic	f	African Network Information Centre
2020-12-19	2020-12-18 21:06:05.677-05	{}	6	RFC 1918	rfc-1918	t	
2020-12-19	2020-12-18 21:09:56.683-05	{}	7	RFC 6598	rfc-6598	t	
\.


--
-- Data for Name: ipam_role; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_role (created, last_updated, custom_field_data, id, name, slug, weight, description) FROM stdin;
2020-12-30	2020-12-30 14:47:11.9-05	{}	1	Access - Data	access-data	1000	
2020-12-30	2020-12-30 14:47:17.021-05	{}	2	Access - Voice	access-voice	1000	
2020-12-30	2020-12-30 15:03:42.725-05	{}	3	Access - Wireless	access-wireless	1000	
2020-12-30	2020-12-30 15:12:19.612-05	{}	4	Management	management	1000	
\.


--
-- Data for Name: ipam_routetarget; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_routetarget (created, last_updated, custom_field_data, id, name, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_service; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service (created, last_updated, custom_field_data, id, name, protocol, ports, description, device_id, virtual_machine_id) FROM stdin;
\.


--
-- Data for Name: ipam_service_ipaddresses; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service_ipaddresses (id, service_id, ipaddress_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlan; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlan (created, last_updated, custom_field_data, id, vid, name, status, description, group_id, role_id, site_id, tenant_id) FROM stdin;
2020-12-30	2021-03-10 15:55:36.697-05	{}	1	100	Data	active		\N	1	2	5
2020-12-30	2021-03-10 15:55:36.763-05	{}	2	200	Voice	active		\N	2	2	5
2020-12-30	2021-03-10 15:55:36.882-05	{}	3	100	Data	active		\N	1	3	5
2020-12-30	2021-03-10 15:55:36.943-05	{}	4	200	Voice	active		\N	2	3	5
2020-12-30	2021-03-10 15:55:37.063-05	{}	5	100	Data	active		\N	1	4	5
2020-12-30	2021-03-10 15:55:37.123-05	{}	6	200	Voice	active		\N	2	4	5
2020-12-30	2021-03-10 15:55:37.309-05	{}	7	100	Data	active		\N	1	5	5
2020-12-30	2021-03-10 15:55:37.366-05	{}	8	200	Voice	active		\N	2	5	5
2020-12-30	2021-03-10 15:55:37.483-05	{}	9	100	Data	active		\N	1	6	5
2020-12-30	2021-03-10 15:55:37.54-05	{}	10	200	Voice	active		\N	2	6	5
2020-12-30	2021-03-10 15:55:37.655-05	{}	11	100	Data	active		\N	1	7	5
2020-12-30	2021-03-10 15:55:37.713-05	{}	12	200	Voice	active		\N	2	7	5
2020-12-30	2021-03-10 15:55:37.828-05	{}	13	100	Data	active		\N	1	8	5
2020-12-30	2021-03-10 15:55:37.885-05	{}	14	200	Voice	active		\N	2	8	5
2020-12-30	2021-03-10 15:55:38-05	{}	15	100	Data	active		\N	1	9	5
2020-12-30	2021-03-10 15:55:38.057-05	{}	16	200	Voice	active		\N	2	9	5
2020-12-30	2021-03-10 15:55:38.171-05	{}	17	100	Data	active		\N	1	10	5
2020-12-30	2021-03-10 15:55:38.229-05	{}	18	200	Voice	active		\N	2	10	5
2020-12-30	2021-03-10 15:55:38.4-05	{}	19	100	Data	active		\N	1	11	5
2020-12-30	2021-03-10 15:55:38.462-05	{}	20	200	Voice	active		\N	2	11	5
2020-12-30	2021-03-10 15:55:38.577-05	{}	21	100	Data	active		\N	1	12	5
2020-12-30	2021-03-10 15:55:38.634-05	{}	22	200	Voice	active		\N	2	12	5
2020-12-30	2021-03-10 15:55:38.748-05	{}	23	100	Data	active		\N	1	13	5
2020-12-30	2021-03-10 15:55:38.806-05	{}	24	200	Voice	active		\N	2	13	5
2020-12-30	2021-03-10 15:55:38.922-05	{}	25	100	Data	active		\N	1	14	5
2020-12-30	2021-03-10 15:55:38.979-05	{}	26	200	Voice	active		\N	2	14	5
2020-12-30	2021-03-10 15:55:36.823-05	{}	27	300	Wireless	active		\N	3	2	5
2020-12-30	2021-03-10 15:55:37.003-05	{}	28	300	Wireless	active		\N	3	3	5
2020-12-30	2021-03-10 15:55:37.234-05	{}	29	300	Wireless	active		\N	3	4	5
2020-12-30	2021-03-10 15:55:37.424-05	{}	30	300	Wireless	active		\N	3	5	5
2020-12-30	2021-03-10 15:55:37.598-05	{}	31	300	Wireless	active		\N	3	6	5
2020-12-30	2021-03-10 15:55:37.771-05	{}	32	300	Wireless	active		\N	3	7	5
2020-12-30	2021-03-10 15:55:37.942-05	{}	33	300	Wireless	active		\N	3	8	5
2020-12-30	2021-03-10 15:55:38.114-05	{}	34	300	Wireless	active		\N	3	9	5
2020-12-30	2021-03-10 15:55:38.309-05	{}	35	300	Wireless	active		\N	3	10	5
2020-12-30	2021-03-10 15:55:38.519-05	{}	36	300	Wireless	active		\N	3	11	5
2020-12-30	2021-03-10 15:55:38.691-05	{}	37	300	Wireless	active		\N	3	12	5
2020-12-30	2021-03-10 15:55:38.864-05	{}	38	300	Wireless	active		\N	3	13	5
2020-12-30	2021-03-10 15:55:39.036-05	{}	39	300	Wireless	active		\N	3	14	5
2021-03-10	2021-03-10 15:53:14.701-05	{}	40	201	Data	active		2	\N	15	10
2021-03-10	2021-03-10 15:53:14.848-05	{}	41	202	Voice	active		2	\N	15	10
2021-03-10	2021-03-10 15:53:14.934-05	{}	42	203	Wireless	active		2	\N	15	10
2021-03-10	2021-03-10 15:53:15.02-05	{}	43	204	Admin	active		2	\N	15	10
2021-03-10	2021-03-10 15:53:15.108-05	{}	44	201	Data	active		3	\N	16	10
2021-03-10	2021-03-10 15:53:15.193-05	{}	45	202	Voice	active		3	\N	16	10
2021-03-10	2021-03-10 15:53:15.278-05	{}	46	203	Wireless	active		3	\N	16	10
2021-03-10	2021-03-10 15:53:15.363-05	{}	47	204	Admin	active		3	\N	16	10
2021-03-10	2021-03-10 15:53:15.449-05	{}	48	201	Data	active		4	\N	17	10
2021-03-10	2021-03-10 15:53:15.534-05	{}	49	202	Voice	active		4	\N	17	10
2021-03-10	2021-03-10 15:53:15.621-05	{}	50	203	Wireless	active		4	\N	17	10
2021-03-10	2021-03-10 15:53:15.706-05	{}	51	204	Admin	active		4	\N	17	10
2021-03-10	2021-03-10 15:53:15.792-05	{}	52	201	Data	active		5	\N	18	10
2021-03-10	2021-03-10 15:53:15.924-05	{}	53	202	Voice	active		5	\N	18	10
2021-03-10	2021-03-10 15:53:16.025-05	{}	54	203	Wireless	active		5	\N	18	10
2021-03-10	2021-03-10 15:53:16.111-05	{}	55	204	Admin	active		5	\N	18	10
2021-03-10	2021-03-10 15:53:16.197-05	{}	56	201	Data	active		6	\N	19	10
2021-03-10	2021-03-10 15:53:16.281-05	{}	57	202	Voice	active		6	\N	19	10
2021-03-10	2021-03-10 15:53:16.367-05	{}	58	203	Wireless	active		6	\N	19	10
2021-03-10	2021-03-10 15:53:16.451-05	{}	59	204	Admin	active		6	\N	19	10
2021-03-10	2021-03-10 15:53:16.539-05	{}	60	201	Data	active		7	\N	20	10
2021-03-10	2021-03-10 15:53:16.625-05	{}	61	202	Voice	active		7	\N	20	10
2021-03-10	2021-03-10 15:53:16.711-05	{}	62	203	Wireless	active		7	\N	20	10
2021-03-10	2021-03-10 15:53:16.796-05	{}	63	204	Admin	active		7	\N	20	10
\.


--
-- Data for Name: ipam_vlangroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlangroup (created, last_updated, custom_field_data, id, name, slug, scope_id, description, scope_type_id) FROM stdin;
2021-03-10	2021-03-10 15:48:20.211-05	{}	2	JBB104	jbb104	15		45
2021-03-10	2021-03-10 15:48:28.004-05	{}	3	JBB109	jbb109	16		45
2021-03-10	2021-03-10 15:49:26.367-05	{}	4	JBB115	jb115	17		45
2021-03-10	2021-03-10 15:48:44.057-05	{}	5	JBB120	jbb120	18		45
2021-03-10	2021-03-10 15:48:50.853-05	{}	6	JBB127	jbb127	19		45
2021-03-10	2021-03-10 15:48:59.874-05	{}	7	JBB133	jbb133	20		45
2021-03-10	2021-03-10 15:49:04.765-05	{}	8	JBB-Global	jbb-global	\N		\N
\.


--
-- Data for Name: ipam_vrf; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf (created, last_updated, custom_field_data, id, name, rd, enforce_unique, description, tenant_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_export_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_export_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf_import_targets; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf_import_targets (id, vrf_id, routetarget_id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenant; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenant (created, last_updated, custom_field_data, id, name, slug, description, comments, group_id) FROM stdin;
2020-12-19	2020-12-30 13:43:27.571-05	{"cust_id": "INI04"}	1	Initech	initech			1
2020-12-19	2020-12-30 13:43:28.013-05	{"cust_id": "STR01"}	2	Strickland Propane	strickland-propane			1
2020-12-19	2020-12-30 13:43:27.776-05	{"cust_id": "PPI02"}	3	Pied Piper	pied-piper			1
2020-12-19	2020-12-30 13:43:27.927-05	{"cust_id": "STA03"}	4	Stark Industries	stark-industries			1
2020-12-19	2020-12-30 13:43:27.515-05	{"cust_id": "DMI01"}	5	Dunder-Mifflin, Inc.	dunder-mifflin			1
2020-12-19	2020-12-30 13:43:28.158-05	{"cust_id": "WAY01"}	6	Wayne Enterprises	wayne-enterprises			1
2020-12-19	2020-12-30 13:43:27.449-05	{"cust_id": "CYB01"}	7	Cyberdyne Systems	cyberdyne			1
2020-12-19	2020-12-30 13:43:28.103-05	{"cust_id": "UMB01"}	8	Umbrella Corporation	umbrella			1
2020-12-19	2020-12-30 13:43:27.631-05	{"cust_id": "YKY01"}	9	Nakatomi Corportation	nakatomi			1
2021-03-10	2021-03-10 15:44:16.078-05	{"cust_id": ""}	10	Jimbob's Banking & Trust	jimbobs-banking-trust			1
2021-04-02	2021-04-02 12:46:50.851-04	{"cust_id": ""}	13	NC State University	nc-state			1
\.


--
-- Data for Name: tenancy_tenantgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenantgroup (created, last_updated, custom_field_data, id, name, slug, description, lft, rght, tree_id, level, parent_id) FROM stdin;
2020-12-19	2020-12-18 21:43:53.309-05	{}	1	Customers	customers		1	2	1	0	\N
\.


--
-- Data for Name: users_objectpermission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission (id, name, description, enabled, actions, constraints) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_groups (id, objectpermission_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_object_types; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_object_types (id, objectpermission_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: users_objectpermission_users; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_objectpermission_users (id, objectpermission_id, user_id) FROM stdin;
\.


--
-- Data for Name: users_token; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_token (id, created, expires, key, write_enabled, description, user_id) FROM stdin;
\.


--
-- Data for Name: users_userconfig; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_userconfig (id, data, user_id) FROM stdin;
1	{"tables": {"SiteTable": {"columns": ["name", "status", "facility", "region", "tenant", "description", "physical_address"]}, "CableTable": {"columns": ["id", "label", "termination_a_parent", "termination_a", "termination_b_parent", "termination_b", "status", "type", "color"]}, "RackDetailTable": {"columns": ["name", "site", "group", "status", "facility_id", "tenant", "role", "u_height", "device_count"]}}}	1
\.


--
-- Data for Name: virtualization_cluster; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_cluster (created, last_updated, custom_field_data, id, name, comments, group_id, site_id, tenant_id, type_id) FROM stdin;
2021-04-02	2021-04-02 11:53:41.323-04	{}	1	DO-NYC1		1	\N	\N	4
2021-04-02	2021-04-02 11:53:47.949-04	{}	2	DO-NYC3		1	\N	\N	4
2021-04-02	2021-04-02 12:01:35.774-04	{}	3	DO-SFO3		1	\N	\N	4
2021-04-02	2021-04-02 12:02:09.962-04	{}	4	DO-TOR1		1	\N	\N	4
2021-04-02	2021-04-02 12:02:37.662-04	{}	5	DO-SGP1		4	\N	\N	4
2021-04-02	2021-04-02 12:02:55.049-04	{}	6	DO-LON1		3	\N	\N	4
2021-04-02	2021-04-02 12:03:04.254-04	{}	7	DO-FRA1		3	\N	\N	4
2021-04-02	2021-04-02 12:03:29.825-04	{}	8	DO-BLR1		4	\N	\N	4
2021-04-02	2021-04-02 12:03:57.309-04	{}	9	DO-AMS3		3	\N	\N	4
2021-04-02	2021-04-02 12:34:22.537-04	{}	10	gc-us-west1		1	\N	\N	2
2021-04-02	2021-04-02 12:36:26.999-04	{}	11	gc-us-west2		1	\N	\N	2
2021-04-02	2021-04-02 12:36:27.084-04	{}	12	gc-us-west3		1	\N	\N	2
2021-04-02	2021-04-02 12:36:27.16-04	{}	13	gc-us-west4		1	\N	\N	2
2021-04-02	2021-04-02 12:36:27.284-04	{}	14	gc-us-central1		1	\N	\N	2
2021-04-02	2021-04-02 12:36:27.373-04	{}	15	gc-us-east1		1	\N	\N	2
2021-04-02	2021-04-02 12:36:27.447-04	{}	16	gc-us-east4		1	\N	\N	2
2021-04-02	2021-04-02 12:36:27.52-04	{}	17	gc-northamerica-northeast1		1	\N	\N	2
2021-04-02	2021-04-02 12:36:27.593-04	{}	18	gc-southamerica-southeast1		5	\N	\N	2
2021-04-02	2021-04-02 12:37:11.951-04	{}	19	gc-europe-west1		3	\N	\N	2
2021-04-02	2021-04-02 12:37:12.026-04	{}	20	gc-europe-west2		3	\N	\N	2
2021-04-02	2021-04-02 12:37:12.102-04	{}	21	gc-europe-west3		3	\N	\N	2
2021-04-02	2021-04-02 12:37:12.176-04	{}	22	gc-europe-west4		3	\N	\N	2
2021-04-02	2021-04-02 12:37:12.256-04	{}	23	gc-europe-west6		3	\N	\N	2
2021-04-02	2021-04-02 12:37:12.335-04	{}	24	gc-europe-north1		3	\N	\N	2
2021-04-02	2021-04-02 12:39:05.807-04	{}	33	gc-asia-south1		4	\N	\N	2
2021-04-02	2021-04-02 12:39:05.878-04	{}	34	gc-asia-southeast1		4	\N	\N	2
2021-04-02	2021-04-02 12:39:05.95-04	{}	35	gc-asia-southeast2		4	\N	\N	2
2021-04-02	2021-04-02 12:39:06.022-04	{}	36	gc-asia-east1		4	\N	\N	2
2021-04-02	2021-04-02 12:39:06.093-04	{}	37	gc-asia-east2		4	\N	\N	2
2021-04-02	2021-04-02 12:39:06.164-04	{}	38	gc-asia-northeast1		4	\N	\N	2
2021-04-02	2021-04-02 12:39:06.236-04	{}	39	gc-asia-northeast2		4	\N	\N	2
2021-04-02	2021-04-02 12:39:06.308-04	{}	40	gc-asia-northeast3		4	\N	\N	2
\.


--
-- Data for Name: virtualization_clustergroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustergroup (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
2021-04-02	2021-04-02 12:01:25.618-04	{}	1	North America	north-america	
2021-04-02	2021-04-02 11:58:27.437-04	{}	3	EMEA	emea	
2021-04-02	2021-04-02 12:01:49.188-04	{}	4	Asia Pacific	asia-pacific	
2021-04-02	2021-04-02 12:06:22.848-04	{}	5	South America	south-america	
\.


--
-- Data for Name: virtualization_clustertype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustertype (created, last_updated, custom_field_data, id, name, slug, description) FROM stdin;
2021-04-02	2021-04-02 11:49:11.877-04	{}	1	Amazon Web Services	amazon-web-services	
2021-04-02	2021-04-02 11:49:30.272-04	{}	2	Google Cloud	google-cloud	
2021-04-02	2021-04-02 11:49:37.168-04	{}	3	Microsoft Azure	microsoft-azure	
2021-04-02	2021-04-02 11:49:43.339-04	{}	4	DigitalOcean	digitalocean	
2021-04-02	2021-04-02 12:00:23.581-04	{}	5	VMware	vmware	
2021-04-02	2021-04-02 12:05:02.51-04	{}	6	KVM	kvm	
\.


--
-- Data for Name: virtualization_virtualmachine; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_virtualmachine (created, last_updated, custom_field_data, id, local_context_data, name, status, vcpus, memory, disk, comments, cluster_id, platform_id, primary_ip4_id, primary_ip6_id, role_id, tenant_id, _name) FROM stdin;
2021-04-05	2021-04-05 17:15:56.301-04	{}	361	\N	vm1	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.309-04	{}	362	\N	vm2	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.311-04	{}	363	\N	vm3	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.312-04	{}	364	\N	vm4	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.314-04	{}	365	\N	vm5	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.316-04	{}	366	\N	vm6	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.317-04	{}	367	\N	vm7	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.319-04	{}	368	\N	vm8	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.321-04	{}	369	\N	vm9	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.322-04	{}	370	\N	vm10	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.324-04	{}	371	\N	vm11	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.325-04	{}	372	\N	vm12	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.327-04	{}	373	\N	vm13	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.328-04	{}	374	\N	vm14	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.33-04	{}	375	\N	vm15	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.331-04	{}	376	\N	vm16	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.333-04	{}	377	\N	vm17	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.334-04	{}	378	\N	vm18	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.336-04	{}	379	\N	vm19	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.338-04	{}	380	\N	vm20	active	\N	\N	\N		9	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.339-04	{}	381	\N	vm21	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.341-04	{}	382	\N	vm22	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.343-04	{}	383	\N	vm23	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.344-04	{}	384	\N	vm24	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.346-04	{}	385	\N	vm25	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.347-04	{}	386	\N	vm26	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.349-04	{}	387	\N	vm27	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.35-04	{}	388	\N	vm28	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.352-04	{}	389	\N	vm29	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.353-04	{}	390	\N	vm30	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.355-04	{}	391	\N	vm31	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.357-04	{}	392	\N	vm32	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.359-04	{}	393	\N	vm33	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.36-04	{}	394	\N	vm34	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.362-04	{}	395	\N	vm35	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.363-04	{}	396	\N	vm36	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.365-04	{}	397	\N	vm37	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.366-04	{}	398	\N	vm38	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.367-04	{}	399	\N	vm39	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.369-04	{}	400	\N	vm40	active	\N	\N	\N		8	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.37-04	{}	401	\N	vm41	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.372-04	{}	402	\N	vm42	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.374-04	{}	403	\N	vm43	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.375-04	{}	404	\N	vm44	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.377-04	{}	405	\N	vm45	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.379-04	{}	406	\N	vm46	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.38-04	{}	407	\N	vm47	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.382-04	{}	408	\N	vm48	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.383-04	{}	409	\N	vm49	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.385-04	{}	410	\N	vm50	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.386-04	{}	411	\N	vm51	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.387-04	{}	412	\N	vm52	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.389-04	{}	413	\N	vm53	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.39-04	{}	414	\N	vm54	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.392-04	{}	415	\N	vm55	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.393-04	{}	416	\N	vm56	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.394-04	{}	417	\N	vm57	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.396-04	{}	418	\N	vm58	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.397-04	{}	419	\N	vm59	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.399-04	{}	420	\N	vm60	active	\N	\N	\N		7	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.4-04	{}	421	\N	vm61	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.402-04	{}	422	\N	vm62	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.404-04	{}	423	\N	vm63	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.406-04	{}	424	\N	vm64	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.407-04	{}	425	\N	vm65	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.409-04	{}	426	\N	vm66	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.411-04	{}	427	\N	vm67	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.412-04	{}	428	\N	vm68	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.414-04	{}	429	\N	vm69	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.416-04	{}	430	\N	vm70	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.417-04	{}	431	\N	vm71	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.419-04	{}	432	\N	vm72	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.42-04	{}	433	\N	vm73	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.422-04	{}	434	\N	vm74	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.424-04	{}	435	\N	vm75	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.425-04	{}	436	\N	vm76	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.427-04	{}	437	\N	vm77	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.428-04	{}	438	\N	vm78	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.429-04	{}	439	\N	vm79	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.431-04	{}	440	\N	vm80	active	\N	\N	\N		6	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.433-04	{}	441	\N	vm81	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.434-04	{}	442	\N	vm82	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.436-04	{}	443	\N	vm83	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.437-04	{}	444	\N	vm84	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.439-04	{}	445	\N	vm85	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.441-04	{}	446	\N	vm86	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.442-04	{}	447	\N	vm87	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.444-04	{}	448	\N	vm88	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.445-04	{}	449	\N	vm89	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.447-04	{}	450	\N	vm90	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.448-04	{}	451	\N	vm91	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.449-04	{}	452	\N	vm92	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.451-04	{}	453	\N	vm93	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.453-04	{}	454	\N	vm94	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.455-04	{}	455	\N	vm95	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.456-04	{}	456	\N	vm96	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.458-04	{}	457	\N	vm97	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.459-04	{}	458	\N	vm98	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.461-04	{}	459	\N	vm99	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.462-04	{}	460	\N	vm100	active	\N	\N	\N		1	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.464-04	{}	461	\N	vm101	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.465-04	{}	462	\N	vm102	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.467-04	{}	463	\N	vm103	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.468-04	{}	464	\N	vm104	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.47-04	{}	465	\N	vm105	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.472-04	{}	466	\N	vm106	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.473-04	{}	467	\N	vm107	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.475-04	{}	468	\N	vm108	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.476-04	{}	469	\N	vm109	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.478-04	{}	470	\N	vm110	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.479-04	{}	471	\N	vm111	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.481-04	{}	472	\N	vm112	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.482-04	{}	473	\N	vm113	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.484-04	{}	474	\N	vm114	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.485-04	{}	475	\N	vm115	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.487-04	{}	476	\N	vm116	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.488-04	{}	477	\N	vm117	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.49-04	{}	478	\N	vm118	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.491-04	{}	479	\N	vm119	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.493-04	{}	480	\N	vm120	active	\N	\N	\N		2	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.495-04	{}	481	\N	vm121	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.496-04	{}	482	\N	vm122	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.498-04	{}	483	\N	vm123	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.499-04	{}	484	\N	vm124	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.501-04	{}	485	\N	vm125	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.502-04	{}	486	\N	vm126	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.504-04	{}	487	\N	vm127	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.505-04	{}	488	\N	vm128	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.507-04	{}	489	\N	vm129	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.508-04	{}	490	\N	vm130	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.51-04	{}	491	\N	vm131	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.511-04	{}	492	\N	vm132	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.513-04	{}	493	\N	vm133	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.515-04	{}	494	\N	vm134	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.516-04	{}	495	\N	vm135	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.518-04	{}	496	\N	vm136	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.519-04	{}	497	\N	vm137	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.521-04	{}	498	\N	vm138	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.522-04	{}	499	\N	vm139	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.524-04	{}	500	\N	vm140	active	\N	\N	\N		3	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.525-04	{}	501	\N	vm141	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.527-04	{}	502	\N	vm142	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.528-04	{}	503	\N	vm143	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.53-04	{}	504	\N	vm144	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.531-04	{}	505	\N	vm145	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.533-04	{}	506	\N	vm146	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.535-04	{}	507	\N	vm147	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.537-04	{}	508	\N	vm148	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.538-04	{}	509	\N	vm149	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.54-04	{}	510	\N	vm150	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.541-04	{}	511	\N	vm151	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.543-04	{}	512	\N	vm152	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.544-04	{}	513	\N	vm153	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.546-04	{}	514	\N	vm154	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.547-04	{}	515	\N	vm155	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.549-04	{}	516	\N	vm156	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.55-04	{}	517	\N	vm157	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.552-04	{}	518	\N	vm158	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.554-04	{}	519	\N	vm159	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.555-04	{}	520	\N	vm160	active	\N	\N	\N		5	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.557-04	{}	521	\N	vm161	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.559-04	{}	522	\N	vm162	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.56-04	{}	523	\N	vm163	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.562-04	{}	524	\N	vm164	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.563-04	{}	525	\N	vm165	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.565-04	{}	526	\N	vm166	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.566-04	{}	527	\N	vm167	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.568-04	{}	528	\N	vm168	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.569-04	{}	529	\N	vm169	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.571-04	{}	530	\N	vm170	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.572-04	{}	531	\N	vm171	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.574-04	{}	532	\N	vm172	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.576-04	{}	533	\N	vm173	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.577-04	{}	534	\N	vm174	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.579-04	{}	535	\N	vm175	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.58-04	{}	536	\N	vm176	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.582-04	{}	537	\N	vm177	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.583-04	{}	538	\N	vm178	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.585-04	{}	539	\N	vm179	active	\N	\N	\N		4	3	\N	\N	7	\N	
2021-04-05	2021-04-05 17:15:56.586-04	{}	540	\N	vm180	active	\N	\N	\N		4	3	\N	\N	7	\N	
\.


--
-- Data for Name: virtualization_vminterface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface (created, last_updated, custom_field_data, id, enabled, mac_address, mtu, mode, name, _name, description, parent_id, untagged_vlan_id, virtual_machine_id) FROM stdin;
2021-04-14	2021-04-14 13:36:20.845-04	{}	901	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	361
2021-04-14	2021-04-14 13:36:20.845-04	{}	902	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	361
2021-04-14	2021-04-14 13:36:20.845-04	{}	903	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	361
2021-04-14	2021-04-14 13:36:20.845-04	{}	904	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	361
2021-04-14	2021-04-14 13:36:20.845-04	{}	905	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	370
2021-04-14	2021-04-14 13:36:20.845-04	{}	906	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	370
2021-04-14	2021-04-14 13:36:20.845-04	{}	907	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	370
2021-04-14	2021-04-14 13:36:20.845-04	{}	908	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	370
2021-04-14	2021-04-14 13:36:20.845-04	{}	909	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	460
2021-04-14	2021-04-14 13:36:20.845-04	{}	910	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	460
2021-04-14	2021-04-14 13:36:20.845-04	{}	911	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	460
2021-04-14	2021-04-14 13:36:20.845-04	{}	912	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	460
2021-04-14	2021-04-14 13:36:20.845-04	{}	913	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	461
2021-04-14	2021-04-14 13:36:20.845-04	{}	914	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	461
2021-04-14	2021-04-14 13:36:20.845-04	{}	915	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	461
2021-04-14	2021-04-14 13:36:20.845-04	{}	916	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	461
2021-04-14	2021-04-14 13:36:20.845-04	{}	917	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	462
2021-04-14	2021-04-14 13:36:20.845-04	{}	918	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	462
2021-04-14	2021-04-14 13:36:20.845-04	{}	919	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	462
2021-04-14	2021-04-14 13:36:20.845-04	{}	920	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	462
2021-04-14	2021-04-14 13:36:20.845-04	{}	921	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	463
2021-04-14	2021-04-14 13:36:20.845-04	{}	922	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	463
2021-04-14	2021-04-14 13:36:20.845-04	{}	923	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	463
2021-04-14	2021-04-14 13:36:20.845-04	{}	924	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	463
2021-04-14	2021-04-14 13:36:20.845-04	{}	925	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	464
2021-04-14	2021-04-14 13:36:20.845-04	{}	926	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	464
2021-04-14	2021-04-14 13:36:20.845-04	{}	927	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	464
2021-04-14	2021-04-14 13:36:20.845-04	{}	928	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	464
2021-04-14	2021-04-14 13:36:20.845-04	{}	929	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	465
2021-04-14	2021-04-14 13:36:20.845-04	{}	930	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	465
2021-04-14	2021-04-14 13:36:20.845-04	{}	931	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	465
2021-04-14	2021-04-14 13:36:20.845-04	{}	932	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	465
2021-04-14	2021-04-14 13:36:20.845-04	{}	933	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	466
2021-04-14	2021-04-14 13:36:20.845-04	{}	934	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	466
2021-04-14	2021-04-14 13:36:20.845-04	{}	935	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	466
2021-04-14	2021-04-14 13:36:20.845-04	{}	936	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	466
2021-04-14	2021-04-14 13:36:20.845-04	{}	937	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	467
2021-04-14	2021-04-14 13:36:20.845-04	{}	938	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	467
2021-04-14	2021-04-14 13:36:20.845-04	{}	939	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	467
2021-04-14	2021-04-14 13:36:20.845-04	{}	940	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	467
2021-04-14	2021-04-14 13:36:20.845-04	{}	941	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	468
2021-04-14	2021-04-14 13:36:20.845-04	{}	942	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	468
2021-04-14	2021-04-14 13:36:20.845-04	{}	943	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	468
2021-04-14	2021-04-14 13:36:20.845-04	{}	944	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	468
2021-04-14	2021-04-14 13:36:20.845-04	{}	945	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	469
2021-04-14	2021-04-14 13:36:20.845-04	{}	946	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	469
2021-04-14	2021-04-14 13:36:20.845-04	{}	947	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	469
2021-04-14	2021-04-14 13:36:20.845-04	{}	948	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	469
2021-04-14	2021-04-14 13:36:20.845-04	{}	949	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	371
2021-04-14	2021-04-14 13:36:20.845-04	{}	950	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	371
2021-04-14	2021-04-14 13:36:20.845-04	{}	951	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	371
2021-04-14	2021-04-14 13:36:20.845-04	{}	952	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	371
2021-04-14	2021-04-14 13:36:20.845-04	{}	953	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	470
2021-04-14	2021-04-14 13:36:20.845-04	{}	954	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	470
2021-04-14	2021-04-14 13:36:20.845-04	{}	955	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	470
2021-04-14	2021-04-14 13:36:20.845-04	{}	956	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	470
2021-04-14	2021-04-14 13:36:20.845-04	{}	957	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	471
2021-04-14	2021-04-14 13:36:20.845-04	{}	958	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	471
2021-04-14	2021-04-14 13:36:20.845-04	{}	959	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	471
2021-04-14	2021-04-14 13:36:20.845-04	{}	960	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	471
2021-04-14	2021-04-14 13:36:20.845-04	{}	961	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	472
2021-04-14	2021-04-14 13:36:20.845-04	{}	962	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	472
2021-04-14	2021-04-14 13:36:20.845-04	{}	963	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	472
2021-04-14	2021-04-14 13:36:20.845-04	{}	964	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	472
2021-04-14	2021-04-14 13:36:20.845-04	{}	965	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	473
2021-04-14	2021-04-14 13:36:20.845-04	{}	966	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	473
2021-04-14	2021-04-14 13:36:20.845-04	{}	967	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	473
2021-04-14	2021-04-14 13:36:20.845-04	{}	968	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	473
2021-04-14	2021-04-14 13:36:20.845-04	{}	969	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	474
2021-04-14	2021-04-14 13:36:20.845-04	{}	970	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	474
2021-04-14	2021-04-14 13:36:20.845-04	{}	971	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	474
2021-04-14	2021-04-14 13:36:20.845-04	{}	972	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	474
2021-04-14	2021-04-14 13:36:20.845-04	{}	973	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	475
2021-04-14	2021-04-14 13:36:20.845-04	{}	974	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	475
2021-04-14	2021-04-14 13:36:20.845-04	{}	975	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	475
2021-04-14	2021-04-14 13:36:20.845-04	{}	976	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	475
2021-04-14	2021-04-14 13:36:20.845-04	{}	977	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	476
2021-04-14	2021-04-14 13:36:20.845-04	{}	978	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	476
2021-04-14	2021-04-14 13:36:20.845-04	{}	979	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	476
2021-04-14	2021-04-14 13:36:20.845-04	{}	980	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	476
2021-04-14	2021-04-14 13:36:20.845-04	{}	981	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	477
2021-04-14	2021-04-14 13:36:20.845-04	{}	982	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	477
2021-04-14	2021-04-14 13:36:20.845-04	{}	983	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	477
2021-04-14	2021-04-14 13:36:20.845-04	{}	984	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	477
2021-04-14	2021-04-14 13:36:20.845-04	{}	985	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	478
2021-04-14	2021-04-14 13:36:20.845-04	{}	986	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	478
2021-04-14	2021-04-14 13:36:20.845-04	{}	987	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	478
2021-04-14	2021-04-14 13:36:20.845-04	{}	988	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	478
2021-04-14	2021-04-14 13:36:20.845-04	{}	989	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	479
2021-04-14	2021-04-14 13:36:20.845-04	{}	990	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	479
2021-04-14	2021-04-14 13:36:20.845-04	{}	991	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	479
2021-04-14	2021-04-14 13:36:20.845-04	{}	992	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	479
2021-04-14	2021-04-14 13:36:20.845-04	{}	993	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	372
2021-04-14	2021-04-14 13:36:20.845-04	{}	994	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	372
2021-04-14	2021-04-14 13:36:20.845-04	{}	995	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	372
2021-04-14	2021-04-14 13:36:20.845-04	{}	996	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	372
2021-04-14	2021-04-14 13:36:20.845-04	{}	997	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	480
2021-04-14	2021-04-14 13:36:20.845-04	{}	998	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	480
2021-04-14	2021-04-14 13:36:20.845-04	{}	999	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	480
2021-04-14	2021-04-14 13:36:20.845-04	{}	1000	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	480
2021-04-14	2021-04-14 13:36:20.845-04	{}	1001	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	481
2021-04-14	2021-04-14 13:36:20.845-04	{}	1002	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	481
2021-04-14	2021-04-14 13:36:20.845-04	{}	1003	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	481
2021-04-14	2021-04-14 13:36:20.845-04	{}	1004	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	481
2021-04-14	2021-04-14 13:36:20.845-04	{}	1005	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	482
2021-04-14	2021-04-14 13:36:20.845-04	{}	1006	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	482
2021-04-14	2021-04-14 13:36:20.845-04	{}	1007	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	482
2021-04-14	2021-04-14 13:36:20.845-04	{}	1008	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	482
2021-04-14	2021-04-14 13:36:20.845-04	{}	1009	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	483
2021-04-14	2021-04-14 13:36:20.845-04	{}	1010	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	483
2021-04-14	2021-04-14 13:36:20.845-04	{}	1011	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	483
2021-04-14	2021-04-14 13:36:20.845-04	{}	1012	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	483
2021-04-14	2021-04-14 13:36:20.845-04	{}	1013	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	484
2021-04-14	2021-04-14 13:36:20.845-04	{}	1014	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	484
2021-04-14	2021-04-14 13:36:20.845-04	{}	1015	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	484
2021-04-14	2021-04-14 13:36:20.845-04	{}	1016	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	484
2021-04-14	2021-04-14 13:36:20.845-04	{}	1017	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	485
2021-04-14	2021-04-14 13:36:20.845-04	{}	1018	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	485
2021-04-14	2021-04-14 13:36:20.845-04	{}	1019	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	485
2021-04-14	2021-04-14 13:36:20.845-04	{}	1020	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	485
2021-04-14	2021-04-14 13:36:20.845-04	{}	1021	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	486
2021-04-14	2021-04-14 13:36:20.845-04	{}	1022	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	486
2021-04-14	2021-04-14 13:36:20.845-04	{}	1023	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	486
2021-04-14	2021-04-14 13:36:20.845-04	{}	1024	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	486
2021-04-14	2021-04-14 13:36:20.845-04	{}	1025	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	487
2021-04-14	2021-04-14 13:36:20.845-04	{}	1026	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	487
2021-04-14	2021-04-14 13:36:20.845-04	{}	1027	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	487
2021-04-14	2021-04-14 13:36:20.845-04	{}	1028	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	487
2021-04-14	2021-04-14 13:36:20.845-04	{}	1029	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	488
2021-04-14	2021-04-14 13:36:20.845-04	{}	1030	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	488
2021-04-14	2021-04-14 13:36:20.845-04	{}	1031	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	488
2021-04-14	2021-04-14 13:36:20.845-04	{}	1032	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	488
2021-04-14	2021-04-14 13:36:20.845-04	{}	1033	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	489
2021-04-14	2021-04-14 13:36:20.845-04	{}	1034	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	489
2021-04-14	2021-04-14 13:36:20.845-04	{}	1035	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	489
2021-04-14	2021-04-14 13:36:20.845-04	{}	1036	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	489
2021-04-14	2021-04-14 13:36:20.845-04	{}	1037	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	373
2021-04-14	2021-04-14 13:36:20.845-04	{}	1038	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	373
2021-04-14	2021-04-14 13:36:20.845-04	{}	1039	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	373
2021-04-14	2021-04-14 13:36:20.845-04	{}	1040	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	373
2021-04-14	2021-04-14 13:36:20.845-04	{}	1041	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	490
2021-04-14	2021-04-14 13:36:20.845-04	{}	1042	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	490
2021-04-14	2021-04-14 13:36:20.845-04	{}	1043	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	490
2021-04-14	2021-04-14 13:36:20.845-04	{}	1044	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	490
2021-04-14	2021-04-14 13:36:20.845-04	{}	1045	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	491
2021-04-14	2021-04-14 13:36:20.845-04	{}	1046	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	491
2021-04-14	2021-04-14 13:36:20.845-04	{}	1047	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	491
2021-04-14	2021-04-14 13:36:20.845-04	{}	1048	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	491
2021-04-14	2021-04-14 13:36:20.845-04	{}	1049	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	492
2021-04-14	2021-04-14 13:36:20.845-04	{}	1050	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	492
2021-04-14	2021-04-14 13:36:20.845-04	{}	1051	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	492
2021-04-14	2021-04-14 13:36:20.845-04	{}	1052	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	492
2021-04-14	2021-04-14 13:36:20.845-04	{}	1053	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	493
2021-04-14	2021-04-14 13:36:20.845-04	{}	1054	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	493
2021-04-14	2021-04-14 13:36:20.845-04	{}	1055	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	493
2021-04-14	2021-04-14 13:36:20.845-04	{}	1056	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	493
2021-04-14	2021-04-14 13:36:20.845-04	{}	1057	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	494
2021-04-14	2021-04-14 13:36:20.845-04	{}	1058	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	494
2021-04-14	2021-04-14 13:36:20.845-04	{}	1059	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	494
2021-04-14	2021-04-14 13:36:20.845-04	{}	1060	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	494
2021-04-14	2021-04-14 13:36:20.845-04	{}	1061	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	495
2021-04-14	2021-04-14 13:36:20.845-04	{}	1062	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	495
2021-04-14	2021-04-14 13:36:20.845-04	{}	1063	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	495
2021-04-14	2021-04-14 13:36:20.845-04	{}	1064	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	495
2021-04-14	2021-04-14 13:36:20.845-04	{}	1065	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	496
2021-04-14	2021-04-14 13:36:20.845-04	{}	1066	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	496
2021-04-14	2021-04-14 13:36:20.845-04	{}	1067	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	496
2021-04-14	2021-04-14 13:36:20.845-04	{}	1068	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	496
2021-04-14	2021-04-14 13:36:20.845-04	{}	1069	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	497
2021-04-14	2021-04-14 13:36:20.845-04	{}	1070	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	497
2021-04-14	2021-04-14 13:36:20.845-04	{}	1071	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	497
2021-04-14	2021-04-14 13:36:20.845-04	{}	1072	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	497
2021-04-14	2021-04-14 13:36:20.845-04	{}	1073	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	498
2021-04-14	2021-04-14 13:36:20.845-04	{}	1074	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	498
2021-04-14	2021-04-14 13:36:20.845-04	{}	1075	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	498
2021-04-14	2021-04-14 13:36:20.845-04	{}	1076	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	498
2021-04-14	2021-04-14 13:36:20.845-04	{}	1077	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	499
2021-04-14	2021-04-14 13:36:20.845-04	{}	1078	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	499
2021-04-14	2021-04-14 13:36:20.845-04	{}	1079	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	499
2021-04-14	2021-04-14 13:36:20.845-04	{}	1080	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	499
2021-04-14	2021-04-14 13:36:20.845-04	{}	1081	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	374
2021-04-14	2021-04-14 13:36:20.845-04	{}	1082	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	374
2021-04-14	2021-04-14 13:36:20.845-04	{}	1083	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	374
2021-04-14	2021-04-14 13:36:20.845-04	{}	1084	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	374
2021-04-14	2021-04-14 13:36:20.845-04	{}	1085	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	500
2021-04-14	2021-04-14 13:36:20.845-04	{}	1086	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	500
2021-04-14	2021-04-14 13:36:20.845-04	{}	1087	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	500
2021-04-14	2021-04-14 13:36:20.845-04	{}	1088	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	500
2021-04-14	2021-04-14 13:36:20.845-04	{}	1089	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	501
2021-04-14	2021-04-14 13:36:20.845-04	{}	1090	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	501
2021-04-14	2021-04-14 13:36:20.845-04	{}	1091	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	501
2021-04-14	2021-04-14 13:36:20.845-04	{}	1092	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	501
2021-04-14	2021-04-14 13:36:20.845-04	{}	1093	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	502
2021-04-14	2021-04-14 13:36:20.845-04	{}	1094	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	502
2021-04-14	2021-04-14 13:36:20.845-04	{}	1095	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	502
2021-04-14	2021-04-14 13:36:20.845-04	{}	1096	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	502
2021-04-14	2021-04-14 13:36:20.845-04	{}	1097	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	503
2021-04-14	2021-04-14 13:36:20.845-04	{}	1098	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	503
2021-04-14	2021-04-14 13:36:20.845-04	{}	1099	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	503
2021-04-14	2021-04-14 13:36:20.845-04	{}	1100	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	503
2021-04-14	2021-04-14 13:36:20.845-04	{}	1101	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	504
2021-04-14	2021-04-14 13:36:20.845-04	{}	1102	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	504
2021-04-14	2021-04-14 13:36:20.845-04	{}	1103	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	504
2021-04-14	2021-04-14 13:36:20.845-04	{}	1104	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	504
2021-04-14	2021-04-14 13:36:20.845-04	{}	1105	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	505
2021-04-14	2021-04-14 13:36:20.845-04	{}	1106	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	505
2021-04-14	2021-04-14 13:36:20.845-04	{}	1107	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	505
2021-04-14	2021-04-14 13:36:20.845-04	{}	1108	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	505
2021-04-14	2021-04-14 13:36:20.845-04	{}	1109	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	506
2021-04-14	2021-04-14 13:36:20.845-04	{}	1110	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	506
2021-04-14	2021-04-14 13:36:20.845-04	{}	1111	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	506
2021-04-14	2021-04-14 13:36:20.845-04	{}	1112	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	506
2021-04-14	2021-04-14 13:36:20.845-04	{}	1113	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	507
2021-04-14	2021-04-14 13:36:20.845-04	{}	1114	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	507
2021-04-14	2021-04-14 13:36:20.845-04	{}	1115	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	507
2021-04-14	2021-04-14 13:36:20.845-04	{}	1116	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	507
2021-04-14	2021-04-14 13:36:20.845-04	{}	1117	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	508
2021-04-14	2021-04-14 13:36:20.845-04	{}	1118	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	508
2021-04-14	2021-04-14 13:36:20.845-04	{}	1119	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	508
2021-04-14	2021-04-14 13:36:20.845-04	{}	1120	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	508
2021-04-14	2021-04-14 13:36:20.845-04	{}	1121	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	509
2021-04-14	2021-04-14 13:36:20.845-04	{}	1122	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	509
2021-04-14	2021-04-14 13:36:20.845-04	{}	1123	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	509
2021-04-14	2021-04-14 13:36:20.845-04	{}	1124	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	509
2021-04-14	2021-04-14 13:36:20.845-04	{}	1125	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	375
2021-04-14	2021-04-14 13:36:20.845-04	{}	1126	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	375
2021-04-14	2021-04-14 13:36:20.845-04	{}	1127	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	375
2021-04-14	2021-04-14 13:36:20.845-04	{}	1128	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	375
2021-04-14	2021-04-14 13:36:20.845-04	{}	1129	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	510
2021-04-14	2021-04-14 13:36:20.845-04	{}	1130	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	510
2021-04-14	2021-04-14 13:36:20.845-04	{}	1131	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	510
2021-04-14	2021-04-14 13:36:20.845-04	{}	1132	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	510
2021-04-14	2021-04-14 13:36:20.845-04	{}	1133	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	511
2021-04-14	2021-04-14 13:36:20.845-04	{}	1134	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	511
2021-04-14	2021-04-14 13:36:20.845-04	{}	1135	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	511
2021-04-14	2021-04-14 13:36:20.845-04	{}	1136	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	511
2021-04-14	2021-04-14 13:36:20.845-04	{}	1137	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	512
2021-04-14	2021-04-14 13:36:20.845-04	{}	1138	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	512
2021-04-14	2021-04-14 13:36:20.845-04	{}	1139	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	512
2021-04-14	2021-04-14 13:36:20.845-04	{}	1140	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	512
2021-04-14	2021-04-14 13:36:20.845-04	{}	1141	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	513
2021-04-14	2021-04-14 13:36:20.845-04	{}	1142	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	513
2021-04-14	2021-04-14 13:36:20.845-04	{}	1143	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	513
2021-04-14	2021-04-14 13:36:20.845-04	{}	1144	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	513
2021-04-14	2021-04-14 13:36:20.845-04	{}	1145	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	514
2021-04-14	2021-04-14 13:36:20.845-04	{}	1146	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	514
2021-04-14	2021-04-14 13:36:20.845-04	{}	1147	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	514
2021-04-14	2021-04-14 13:36:20.845-04	{}	1148	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	514
2021-04-14	2021-04-14 13:36:20.845-04	{}	1149	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	515
2021-04-14	2021-04-14 13:36:20.845-04	{}	1150	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	515
2021-04-14	2021-04-14 13:36:20.845-04	{}	1151	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	515
2021-04-14	2021-04-14 13:36:20.845-04	{}	1152	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	515
2021-04-14	2021-04-14 13:36:20.845-04	{}	1153	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	516
2021-04-14	2021-04-14 13:36:20.845-04	{}	1154	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	516
2021-04-14	2021-04-14 13:36:20.845-04	{}	1155	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	516
2021-04-14	2021-04-14 13:36:20.845-04	{}	1156	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	516
2021-04-14	2021-04-14 13:36:20.845-04	{}	1157	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	517
2021-04-14	2021-04-14 13:36:20.845-04	{}	1158	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	517
2021-04-14	2021-04-14 13:36:20.845-04	{}	1159	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	517
2021-04-14	2021-04-14 13:36:20.845-04	{}	1160	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	517
2021-04-14	2021-04-14 13:36:20.845-04	{}	1161	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	518
2021-04-14	2021-04-14 13:36:20.845-04	{}	1162	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	518
2021-04-14	2021-04-14 13:36:20.845-04	{}	1163	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	518
2021-04-14	2021-04-14 13:36:20.845-04	{}	1164	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	518
2021-04-14	2021-04-14 13:36:20.845-04	{}	1165	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	519
2021-04-14	2021-04-14 13:36:20.845-04	{}	1166	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	519
2021-04-14	2021-04-14 13:36:20.845-04	{}	1167	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	519
2021-04-14	2021-04-14 13:36:20.845-04	{}	1168	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	519
2021-04-14	2021-04-14 13:36:20.845-04	{}	1169	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	376
2021-04-14	2021-04-14 13:36:20.845-04	{}	1170	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	376
2021-04-14	2021-04-14 13:36:20.845-04	{}	1171	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	376
2021-04-14	2021-04-14 13:36:20.845-04	{}	1172	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	376
2021-04-14	2021-04-14 13:36:20.845-04	{}	1173	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	520
2021-04-14	2021-04-14 13:36:20.845-04	{}	1174	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	520
2021-04-14	2021-04-14 13:36:20.845-04	{}	1175	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	520
2021-04-14	2021-04-14 13:36:20.845-04	{}	1176	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	520
2021-04-14	2021-04-14 13:36:20.845-04	{}	1177	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	521
2021-04-14	2021-04-14 13:36:20.845-04	{}	1178	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	521
2021-04-14	2021-04-14 13:36:20.845-04	{}	1179	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	521
2021-04-14	2021-04-14 13:36:20.845-04	{}	1180	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	521
2021-04-14	2021-04-14 13:36:20.845-04	{}	1181	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	522
2021-04-14	2021-04-14 13:36:20.845-04	{}	1182	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	522
2021-04-14	2021-04-14 13:36:20.845-04	{}	1183	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	522
2021-04-14	2021-04-14 13:36:20.845-04	{}	1184	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	522
2021-04-14	2021-04-14 13:36:20.845-04	{}	1185	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	523
2021-04-14	2021-04-14 13:36:20.845-04	{}	1186	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	523
2021-04-14	2021-04-14 13:36:20.845-04	{}	1187	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	523
2021-04-14	2021-04-14 13:36:20.845-04	{}	1188	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	523
2021-04-14	2021-04-14 13:36:20.845-04	{}	1189	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	524
2021-04-14	2021-04-14 13:36:20.845-04	{}	1190	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	524
2021-04-14	2021-04-14 13:36:20.845-04	{}	1191	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	524
2021-04-14	2021-04-14 13:36:20.845-04	{}	1192	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	524
2021-04-14	2021-04-14 13:36:20.845-04	{}	1193	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	525
2021-04-14	2021-04-14 13:36:20.845-04	{}	1194	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	525
2021-04-14	2021-04-14 13:36:20.845-04	{}	1195	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	525
2021-04-14	2021-04-14 13:36:20.845-04	{}	1196	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	525
2021-04-14	2021-04-14 13:36:20.845-04	{}	1197	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	526
2021-04-14	2021-04-14 13:36:20.845-04	{}	1198	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	526
2021-04-14	2021-04-14 13:36:20.845-04	{}	1199	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	526
2021-04-14	2021-04-14 13:36:20.845-04	{}	1200	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	526
2021-04-14	2021-04-14 13:36:20.845-04	{}	1201	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	527
2021-04-14	2021-04-14 13:36:20.845-04	{}	1202	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	527
2021-04-14	2021-04-14 13:36:20.845-04	{}	1203	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	527
2021-04-14	2021-04-14 13:36:20.845-04	{}	1204	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	527
2021-04-14	2021-04-14 13:36:20.845-04	{}	1205	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	528
2021-04-14	2021-04-14 13:36:20.845-04	{}	1206	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	528
2021-04-14	2021-04-14 13:36:20.845-04	{}	1207	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	528
2021-04-14	2021-04-14 13:36:20.845-04	{}	1208	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	528
2021-04-14	2021-04-14 13:36:20.845-04	{}	1209	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	529
2021-04-14	2021-04-14 13:36:20.845-04	{}	1210	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	529
2021-04-14	2021-04-14 13:36:20.845-04	{}	1211	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	529
2021-04-14	2021-04-14 13:36:20.845-04	{}	1212	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	529
2021-04-14	2021-04-14 13:36:20.845-04	{}	1213	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	377
2021-04-14	2021-04-14 13:36:20.845-04	{}	1214	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	377
2021-04-14	2021-04-14 13:36:20.845-04	{}	1215	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	377
2021-04-14	2021-04-14 13:36:20.845-04	{}	1216	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	377
2021-04-14	2021-04-14 13:36:20.845-04	{}	1217	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	530
2021-04-14	2021-04-14 13:36:20.845-04	{}	1218	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	530
2021-04-14	2021-04-14 13:36:20.845-04	{}	1219	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	530
2021-04-14	2021-04-14 13:36:20.845-04	{}	1220	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	530
2021-04-14	2021-04-14 13:36:20.845-04	{}	1221	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	531
2021-04-14	2021-04-14 13:36:20.845-04	{}	1222	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	531
2021-04-14	2021-04-14 13:36:20.845-04	{}	1223	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	531
2021-04-14	2021-04-14 13:36:20.845-04	{}	1224	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	531
2021-04-14	2021-04-14 13:36:20.845-04	{}	1225	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	532
2021-04-14	2021-04-14 13:36:20.845-04	{}	1226	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	532
2021-04-14	2021-04-14 13:36:20.845-04	{}	1227	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	532
2021-04-14	2021-04-14 13:36:20.845-04	{}	1228	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	532
2021-04-14	2021-04-14 13:36:20.845-04	{}	1229	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	533
2021-04-14	2021-04-14 13:36:20.845-04	{}	1230	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	533
2021-04-14	2021-04-14 13:36:20.845-04	{}	1231	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	533
2021-04-14	2021-04-14 13:36:20.845-04	{}	1232	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	533
2021-04-14	2021-04-14 13:36:20.845-04	{}	1233	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	534
2021-04-14	2021-04-14 13:36:20.845-04	{}	1234	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	534
2021-04-14	2021-04-14 13:36:20.845-04	{}	1235	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	534
2021-04-14	2021-04-14 13:36:20.845-04	{}	1236	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	534
2021-04-14	2021-04-14 13:36:20.845-04	{}	1237	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	535
2021-04-14	2021-04-14 13:36:20.845-04	{}	1238	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	535
2021-04-14	2021-04-14 13:36:20.845-04	{}	1239	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	535
2021-04-14	2021-04-14 13:36:20.845-04	{}	1240	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	535
2021-04-14	2021-04-14 13:36:20.845-04	{}	1241	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	536
2021-04-14	2021-04-14 13:36:20.845-04	{}	1242	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	536
2021-04-14	2021-04-14 13:36:20.845-04	{}	1243	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	536
2021-04-14	2021-04-14 13:36:20.845-04	{}	1244	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	536
2021-04-14	2021-04-14 13:36:20.845-04	{}	1245	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	537
2021-04-14	2021-04-14 13:36:20.845-04	{}	1246	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	537
2021-04-14	2021-04-14 13:36:20.845-04	{}	1247	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	537
2021-04-14	2021-04-14 13:36:20.845-04	{}	1248	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	537
2021-04-14	2021-04-14 13:36:20.845-04	{}	1249	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	538
2021-04-14	2021-04-14 13:36:20.845-04	{}	1250	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	538
2021-04-14	2021-04-14 13:36:20.845-04	{}	1251	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	538
2021-04-14	2021-04-14 13:36:20.845-04	{}	1252	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	538
2021-04-14	2021-04-14 13:36:20.845-04	{}	1253	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	539
2021-04-14	2021-04-14 13:36:20.845-04	{}	1254	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	539
2021-04-14	2021-04-14 13:36:20.845-04	{}	1255	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	539
2021-04-14	2021-04-14 13:36:20.845-04	{}	1256	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	539
2021-04-14	2021-04-14 13:36:20.845-04	{}	1257	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	378
2021-04-14	2021-04-14 13:36:20.845-04	{}	1258	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	378
2021-04-14	2021-04-14 13:36:20.845-04	{}	1259	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	378
2021-04-14	2021-04-14 13:36:20.845-04	{}	1260	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	378
2021-04-14	2021-04-14 13:36:20.845-04	{}	1261	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	540
2021-04-14	2021-04-14 13:36:20.845-04	{}	1262	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	540
2021-04-14	2021-04-14 13:36:20.845-04	{}	1263	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	540
2021-04-14	2021-04-14 13:36:20.845-04	{}	1264	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	540
2021-04-14	2021-04-14 13:36:20.845-04	{}	1265	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	379
2021-04-14	2021-04-14 13:36:20.845-04	{}	1266	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	379
2021-04-14	2021-04-14 13:36:20.845-04	{}	1267	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	379
2021-04-14	2021-04-14 13:36:20.845-04	{}	1268	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	379
2021-04-14	2021-04-14 13:36:20.845-04	{}	1269	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	362
2021-04-14	2021-04-14 13:36:20.845-04	{}	1270	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	362
2021-04-14	2021-04-14 13:36:20.845-04	{}	1271	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	362
2021-04-14	2021-04-14 13:36:20.845-04	{}	1272	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	362
2021-04-14	2021-04-14 13:36:20.845-04	{}	1273	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	380
2021-04-14	2021-04-14 13:36:20.845-04	{}	1274	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	380
2021-04-14	2021-04-14 13:36:20.845-04	{}	1275	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	380
2021-04-14	2021-04-14 13:36:20.845-04	{}	1276	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	380
2021-04-14	2021-04-14 13:36:20.845-04	{}	1277	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	381
2021-04-14	2021-04-14 13:36:20.845-04	{}	1278	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	381
2021-04-14	2021-04-14 13:36:20.845-04	{}	1279	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	381
2021-04-14	2021-04-14 13:36:20.845-04	{}	1280	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	381
2021-04-14	2021-04-14 13:36:20.845-04	{}	1281	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	382
2021-04-14	2021-04-14 13:36:20.845-04	{}	1282	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	382
2021-04-14	2021-04-14 13:36:20.845-04	{}	1283	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	382
2021-04-14	2021-04-14 13:36:20.845-04	{}	1284	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	382
2021-04-14	2021-04-14 13:36:20.845-04	{}	1285	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	383
2021-04-14	2021-04-14 13:36:20.845-04	{}	1286	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	383
2021-04-14	2021-04-14 13:36:20.845-04	{}	1287	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	383
2021-04-14	2021-04-14 13:36:20.845-04	{}	1288	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	383
2021-04-14	2021-04-14 13:36:20.845-04	{}	1289	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	384
2021-04-14	2021-04-14 13:36:20.845-04	{}	1290	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	384
2021-04-14	2021-04-14 13:36:20.845-04	{}	1291	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	384
2021-04-14	2021-04-14 13:36:20.845-04	{}	1292	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	384
2021-04-14	2021-04-14 13:36:20.845-04	{}	1293	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	385
2021-04-14	2021-04-14 13:36:20.845-04	{}	1294	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	385
2021-04-14	2021-04-14 13:36:20.845-04	{}	1295	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	385
2021-04-14	2021-04-14 13:36:20.845-04	{}	1296	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	385
2021-04-14	2021-04-14 13:36:20.845-04	{}	1297	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	386
2021-04-14	2021-04-14 13:36:20.845-04	{}	1298	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	386
2021-04-14	2021-04-14 13:36:20.845-04	{}	1299	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	386
2021-04-14	2021-04-14 13:36:20.845-04	{}	1300	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	386
2021-04-14	2021-04-14 13:36:20.845-04	{}	1301	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	387
2021-04-14	2021-04-14 13:36:20.845-04	{}	1302	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	387
2021-04-14	2021-04-14 13:36:20.845-04	{}	1303	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	387
2021-04-14	2021-04-14 13:36:20.845-04	{}	1304	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	387
2021-04-14	2021-04-14 13:36:20.845-04	{}	1305	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	388
2021-04-14	2021-04-14 13:36:20.845-04	{}	1306	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	388
2021-04-14	2021-04-14 13:36:20.845-04	{}	1307	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	388
2021-04-14	2021-04-14 13:36:20.845-04	{}	1308	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	388
2021-04-14	2021-04-14 13:36:20.845-04	{}	1309	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	389
2021-04-14	2021-04-14 13:36:20.845-04	{}	1310	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	389
2021-04-14	2021-04-14 13:36:20.845-04	{}	1311	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	389
2021-04-14	2021-04-14 13:36:20.845-04	{}	1312	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	389
2021-04-14	2021-04-14 13:36:20.845-04	{}	1313	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	363
2021-04-14	2021-04-14 13:36:20.845-04	{}	1314	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	363
2021-04-14	2021-04-14 13:36:20.845-04	{}	1315	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	363
2021-04-14	2021-04-14 13:36:20.845-04	{}	1316	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	363
2021-04-14	2021-04-14 13:36:20.845-04	{}	1317	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	390
2021-04-14	2021-04-14 13:36:20.845-04	{}	1318	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	390
2021-04-14	2021-04-14 13:36:20.845-04	{}	1319	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	390
2021-04-14	2021-04-14 13:36:20.845-04	{}	1320	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	390
2021-04-14	2021-04-14 13:36:20.845-04	{}	1321	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	391
2021-04-14	2021-04-14 13:36:20.845-04	{}	1322	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	391
2021-04-14	2021-04-14 13:36:20.845-04	{}	1323	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	391
2021-04-14	2021-04-14 13:36:20.845-04	{}	1324	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	391
2021-04-14	2021-04-14 13:36:20.845-04	{}	1325	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	392
2021-04-14	2021-04-14 13:36:20.845-04	{}	1326	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	392
2021-04-14	2021-04-14 13:36:20.845-04	{}	1327	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	392
2021-04-14	2021-04-14 13:36:20.845-04	{}	1328	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	392
2021-04-14	2021-04-14 13:36:20.845-04	{}	1329	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	393
2021-04-14	2021-04-14 13:36:20.845-04	{}	1330	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	393
2021-04-14	2021-04-14 13:36:20.845-04	{}	1331	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	393
2021-04-14	2021-04-14 13:36:20.845-04	{}	1332	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	393
2021-04-14	2021-04-14 13:36:20.845-04	{}	1333	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	394
2021-04-14	2021-04-14 13:36:20.845-04	{}	1334	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	394
2021-04-14	2021-04-14 13:36:20.845-04	{}	1335	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	394
2021-04-14	2021-04-14 13:36:20.845-04	{}	1336	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	394
2021-04-14	2021-04-14 13:36:20.845-04	{}	1337	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	395
2021-04-14	2021-04-14 13:36:20.845-04	{}	1338	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	395
2021-04-14	2021-04-14 13:36:20.845-04	{}	1339	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	395
2021-04-14	2021-04-14 13:36:20.845-04	{}	1340	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	395
2021-04-14	2021-04-14 13:36:20.845-04	{}	1341	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	396
2021-04-14	2021-04-14 13:36:20.845-04	{}	1342	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	396
2021-04-14	2021-04-14 13:36:20.845-04	{}	1343	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	396
2021-04-14	2021-04-14 13:36:20.845-04	{}	1344	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	396
2021-04-14	2021-04-14 13:36:20.845-04	{}	1345	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	397
2021-04-14	2021-04-14 13:36:20.845-04	{}	1346	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	397
2021-04-14	2021-04-14 13:36:20.845-04	{}	1347	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	397
2021-04-14	2021-04-14 13:36:20.845-04	{}	1348	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	397
2021-04-14	2021-04-14 13:36:20.845-04	{}	1349	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	398
2021-04-14	2021-04-14 13:36:20.845-04	{}	1350	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	398
2021-04-14	2021-04-14 13:36:20.845-04	{}	1351	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	398
2021-04-14	2021-04-14 13:36:20.845-04	{}	1352	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	398
2021-04-14	2021-04-14 13:36:20.845-04	{}	1353	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	399
2021-04-14	2021-04-14 13:36:20.845-04	{}	1354	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	399
2021-04-14	2021-04-14 13:36:20.845-04	{}	1355	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	399
2021-04-14	2021-04-14 13:36:20.845-04	{}	1356	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	399
2021-04-14	2021-04-14 13:36:20.845-04	{}	1357	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	364
2021-04-14	2021-04-14 13:36:20.845-04	{}	1358	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	364
2021-04-14	2021-04-14 13:36:20.845-04	{}	1359	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	364
2021-04-14	2021-04-14 13:36:20.845-04	{}	1360	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	364
2021-04-14	2021-04-14 13:36:20.845-04	{}	1361	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	400
2021-04-14	2021-04-14 13:36:20.845-04	{}	1362	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	400
2021-04-14	2021-04-14 13:36:20.845-04	{}	1363	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	400
2021-04-14	2021-04-14 13:36:20.845-04	{}	1364	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	400
2021-04-14	2021-04-14 13:36:20.845-04	{}	1365	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	401
2021-04-14	2021-04-14 13:36:20.845-04	{}	1366	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	401
2021-04-14	2021-04-14 13:36:20.845-04	{}	1367	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	401
2021-04-14	2021-04-14 13:36:20.845-04	{}	1368	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	401
2021-04-14	2021-04-14 13:36:20.845-04	{}	1369	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	402
2021-04-14	2021-04-14 13:36:20.845-04	{}	1370	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	402
2021-04-14	2021-04-14 13:36:20.845-04	{}	1371	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	402
2021-04-14	2021-04-14 13:36:20.845-04	{}	1372	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	402
2021-04-14	2021-04-14 13:36:20.845-04	{}	1373	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	403
2021-04-14	2021-04-14 13:36:20.845-04	{}	1374	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	403
2021-04-14	2021-04-14 13:36:20.845-04	{}	1375	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	403
2021-04-14	2021-04-14 13:36:20.845-04	{}	1376	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	403
2021-04-14	2021-04-14 13:36:20.845-04	{}	1377	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	404
2021-04-14	2021-04-14 13:36:20.845-04	{}	1378	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	404
2021-04-14	2021-04-14 13:36:20.845-04	{}	1379	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	404
2021-04-14	2021-04-14 13:36:20.845-04	{}	1380	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	404
2021-04-14	2021-04-14 13:36:20.845-04	{}	1381	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	405
2021-04-14	2021-04-14 13:36:20.845-04	{}	1382	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	405
2021-04-14	2021-04-14 13:36:20.845-04	{}	1383	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	405
2021-04-14	2021-04-14 13:36:20.845-04	{}	1384	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	405
2021-04-14	2021-04-14 13:36:20.845-04	{}	1385	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	406
2021-04-14	2021-04-14 13:36:20.845-04	{}	1386	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	406
2021-04-14	2021-04-14 13:36:20.845-04	{}	1387	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	406
2021-04-14	2021-04-14 13:36:20.845-04	{}	1388	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	406
2021-04-14	2021-04-14 13:36:20.845-04	{}	1389	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	407
2021-04-14	2021-04-14 13:36:20.845-04	{}	1390	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	407
2021-04-14	2021-04-14 13:36:20.845-04	{}	1391	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	407
2021-04-14	2021-04-14 13:36:20.845-04	{}	1392	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	407
2021-04-14	2021-04-14 13:36:20.845-04	{}	1393	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	408
2021-04-14	2021-04-14 13:36:20.845-04	{}	1394	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	408
2021-04-14	2021-04-14 13:36:20.845-04	{}	1395	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	408
2021-04-14	2021-04-14 13:36:20.845-04	{}	1396	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	408
2021-04-14	2021-04-14 13:36:20.845-04	{}	1397	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	409
2021-04-14	2021-04-14 13:36:20.845-04	{}	1398	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	409
2021-04-14	2021-04-14 13:36:20.845-04	{}	1399	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	409
2021-04-14	2021-04-14 13:36:20.845-04	{}	1400	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	409
2021-04-14	2021-04-14 13:36:20.845-04	{}	1401	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	365
2021-04-14	2021-04-14 13:36:20.845-04	{}	1402	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	365
2021-04-14	2021-04-14 13:36:20.845-04	{}	1403	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	365
2021-04-14	2021-04-14 13:36:20.845-04	{}	1404	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	365
2021-04-14	2021-04-14 13:36:20.845-04	{}	1405	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	410
2021-04-14	2021-04-14 13:36:20.845-04	{}	1406	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	410
2021-04-14	2021-04-14 13:36:20.845-04	{}	1407	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	410
2021-04-14	2021-04-14 13:36:20.845-04	{}	1408	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	410
2021-04-14	2021-04-14 13:36:20.845-04	{}	1409	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	411
2021-04-14	2021-04-14 13:36:20.845-04	{}	1410	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	411
2021-04-14	2021-04-14 13:36:20.845-04	{}	1411	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	411
2021-04-14	2021-04-14 13:36:20.845-04	{}	1412	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	411
2021-04-14	2021-04-14 13:36:20.845-04	{}	1413	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	412
2021-04-14	2021-04-14 13:36:20.845-04	{}	1414	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	412
2021-04-14	2021-04-14 13:36:20.845-04	{}	1415	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	412
2021-04-14	2021-04-14 13:36:20.845-04	{}	1416	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	412
2021-04-14	2021-04-14 13:36:20.845-04	{}	1417	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	413
2021-04-14	2021-04-14 13:36:20.845-04	{}	1418	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	413
2021-04-14	2021-04-14 13:36:20.845-04	{}	1419	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	413
2021-04-14	2021-04-14 13:36:20.845-04	{}	1420	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	413
2021-04-14	2021-04-14 13:36:20.845-04	{}	1421	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	414
2021-04-14	2021-04-14 13:36:20.845-04	{}	1422	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	414
2021-04-14	2021-04-14 13:36:20.845-04	{}	1423	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	414
2021-04-14	2021-04-14 13:36:20.845-04	{}	1424	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	414
2021-04-14	2021-04-14 13:36:20.845-04	{}	1425	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	415
2021-04-14	2021-04-14 13:36:20.845-04	{}	1426	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	415
2021-04-14	2021-04-14 13:36:20.845-04	{}	1427	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	415
2021-04-14	2021-04-14 13:36:20.845-04	{}	1428	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	415
2021-04-14	2021-04-14 13:36:20.845-04	{}	1429	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	416
2021-04-14	2021-04-14 13:36:20.845-04	{}	1430	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	416
2021-04-14	2021-04-14 13:36:20.845-04	{}	1431	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	416
2021-04-14	2021-04-14 13:36:20.845-04	{}	1432	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	416
2021-04-14	2021-04-14 13:36:20.845-04	{}	1433	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	417
2021-04-14	2021-04-14 13:36:20.845-04	{}	1434	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	417
2021-04-14	2021-04-14 13:36:20.845-04	{}	1435	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	417
2021-04-14	2021-04-14 13:36:20.845-04	{}	1436	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	417
2021-04-14	2021-04-14 13:36:20.845-04	{}	1437	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	418
2021-04-14	2021-04-14 13:36:20.845-04	{}	1438	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	418
2021-04-14	2021-04-14 13:36:20.845-04	{}	1439	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	418
2021-04-14	2021-04-14 13:36:20.845-04	{}	1440	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	418
2021-04-14	2021-04-14 13:36:20.845-04	{}	1441	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	419
2021-04-14	2021-04-14 13:36:20.845-04	{}	1442	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	419
2021-04-14	2021-04-14 13:36:20.845-04	{}	1443	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	419
2021-04-14	2021-04-14 13:36:20.845-04	{}	1444	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	419
2021-04-14	2021-04-14 13:36:20.845-04	{}	1445	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	366
2021-04-14	2021-04-14 13:36:20.845-04	{}	1446	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	366
2021-04-14	2021-04-14 13:36:20.845-04	{}	1447	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	366
2021-04-14	2021-04-14 13:36:20.845-04	{}	1448	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	366
2021-04-14	2021-04-14 13:36:20.845-04	{}	1449	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	420
2021-04-14	2021-04-14 13:36:20.845-04	{}	1450	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	420
2021-04-14	2021-04-14 13:36:20.845-04	{}	1451	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	420
2021-04-14	2021-04-14 13:36:20.845-04	{}	1452	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	420
2021-04-14	2021-04-14 13:36:20.845-04	{}	1453	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	421
2021-04-14	2021-04-14 13:36:20.845-04	{}	1454	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	421
2021-04-14	2021-04-14 13:36:20.845-04	{}	1455	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	421
2021-04-14	2021-04-14 13:36:20.845-04	{}	1456	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	421
2021-04-14	2021-04-14 13:36:20.845-04	{}	1457	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	422
2021-04-14	2021-04-14 13:36:20.845-04	{}	1458	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	422
2021-04-14	2021-04-14 13:36:20.845-04	{}	1459	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	422
2021-04-14	2021-04-14 13:36:20.845-04	{}	1460	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	422
2021-04-14	2021-04-14 13:36:20.845-04	{}	1461	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	423
2021-04-14	2021-04-14 13:36:20.845-04	{}	1462	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	423
2021-04-14	2021-04-14 13:36:20.845-04	{}	1463	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	423
2021-04-14	2021-04-14 13:36:20.845-04	{}	1464	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	423
2021-04-14	2021-04-14 13:36:20.845-04	{}	1465	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	424
2021-04-14	2021-04-14 13:36:20.845-04	{}	1466	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	424
2021-04-14	2021-04-14 13:36:20.845-04	{}	1467	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	424
2021-04-14	2021-04-14 13:36:20.845-04	{}	1468	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	424
2021-04-14	2021-04-14 13:36:20.845-04	{}	1469	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	425
2021-04-14	2021-04-14 13:36:20.845-04	{}	1470	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	425
2021-04-14	2021-04-14 13:36:20.845-04	{}	1471	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	425
2021-04-14	2021-04-14 13:36:20.845-04	{}	1472	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	425
2021-04-14	2021-04-14 13:36:20.845-04	{}	1473	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	426
2021-04-14	2021-04-14 13:36:20.845-04	{}	1474	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	426
2021-04-14	2021-04-14 13:36:20.845-04	{}	1475	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	426
2021-04-14	2021-04-14 13:36:20.845-04	{}	1476	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	426
2021-04-14	2021-04-14 13:36:20.845-04	{}	1477	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	427
2021-04-14	2021-04-14 13:36:20.845-04	{}	1478	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	427
2021-04-14	2021-04-14 13:36:20.845-04	{}	1479	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	427
2021-04-14	2021-04-14 13:36:20.845-04	{}	1480	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	427
2021-04-14	2021-04-14 13:36:20.845-04	{}	1481	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	428
2021-04-14	2021-04-14 13:36:20.845-04	{}	1482	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	428
2021-04-14	2021-04-14 13:36:20.845-04	{}	1483	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	428
2021-04-14	2021-04-14 13:36:20.845-04	{}	1484	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	428
2021-04-14	2021-04-14 13:36:20.845-04	{}	1485	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	429
2021-04-14	2021-04-14 13:36:20.845-04	{}	1486	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	429
2021-04-14	2021-04-14 13:36:20.845-04	{}	1487	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	429
2021-04-14	2021-04-14 13:36:20.845-04	{}	1488	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	429
2021-04-14	2021-04-14 13:36:20.845-04	{}	1489	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	367
2021-04-14	2021-04-14 13:36:20.845-04	{}	1490	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	367
2021-04-14	2021-04-14 13:36:20.845-04	{}	1491	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	367
2021-04-14	2021-04-14 13:36:20.845-04	{}	1492	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	367
2021-04-14	2021-04-14 13:36:20.845-04	{}	1493	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	430
2021-04-14	2021-04-14 13:36:20.845-04	{}	1494	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	430
2021-04-14	2021-04-14 13:36:20.845-04	{}	1495	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	430
2021-04-14	2021-04-14 13:36:20.845-04	{}	1496	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	430
2021-04-14	2021-04-14 13:36:20.845-04	{}	1497	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	431
2021-04-14	2021-04-14 13:36:20.845-04	{}	1498	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	431
2021-04-14	2021-04-14 13:36:20.845-04	{}	1499	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	431
2021-04-14	2021-04-14 13:36:20.845-04	{}	1500	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	431
2021-04-14	2021-04-14 13:36:20.845-04	{}	1501	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	432
2021-04-14	2021-04-14 13:36:20.845-04	{}	1502	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	432
2021-04-14	2021-04-14 13:36:20.845-04	{}	1503	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	432
2021-04-14	2021-04-14 13:36:20.845-04	{}	1504	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	432
2021-04-14	2021-04-14 13:36:20.845-04	{}	1505	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	433
2021-04-14	2021-04-14 13:36:20.845-04	{}	1506	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	433
2021-04-14	2021-04-14 13:36:20.845-04	{}	1507	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	433
2021-04-14	2021-04-14 13:36:20.845-04	{}	1508	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	433
2021-04-14	2021-04-14 13:36:20.845-04	{}	1509	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	434
2021-04-14	2021-04-14 13:36:20.845-04	{}	1510	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	434
2021-04-14	2021-04-14 13:36:20.845-04	{}	1511	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	434
2021-04-14	2021-04-14 13:36:20.845-04	{}	1512	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	434
2021-04-14	2021-04-14 13:36:20.845-04	{}	1513	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	435
2021-04-14	2021-04-14 13:36:20.845-04	{}	1514	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	435
2021-04-14	2021-04-14 13:36:20.845-04	{}	1515	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	435
2021-04-14	2021-04-14 13:36:20.845-04	{}	1516	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	435
2021-04-14	2021-04-14 13:36:20.845-04	{}	1517	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	436
2021-04-14	2021-04-14 13:36:20.845-04	{}	1518	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	436
2021-04-14	2021-04-14 13:36:20.845-04	{}	1519	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	436
2021-04-14	2021-04-14 13:36:20.845-04	{}	1520	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	436
2021-04-14	2021-04-14 13:36:20.845-04	{}	1521	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	437
2021-04-14	2021-04-14 13:36:20.845-04	{}	1522	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	437
2021-04-14	2021-04-14 13:36:20.845-04	{}	1523	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	437
2021-04-14	2021-04-14 13:36:20.845-04	{}	1524	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	437
2021-04-14	2021-04-14 13:36:20.845-04	{}	1525	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	438
2021-04-14	2021-04-14 13:36:20.845-04	{}	1526	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	438
2021-04-14	2021-04-14 13:36:20.845-04	{}	1527	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	438
2021-04-14	2021-04-14 13:36:20.845-04	{}	1528	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	438
2021-04-14	2021-04-14 13:36:20.845-04	{}	1529	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	439
2021-04-14	2021-04-14 13:36:20.845-04	{}	1530	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	439
2021-04-14	2021-04-14 13:36:20.845-04	{}	1531	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	439
2021-04-14	2021-04-14 13:36:20.845-04	{}	1532	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	439
2021-04-14	2021-04-14 13:36:20.845-04	{}	1533	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	368
2021-04-14	2021-04-14 13:36:20.845-04	{}	1534	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	368
2021-04-14	2021-04-14 13:36:20.845-04	{}	1535	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	368
2021-04-14	2021-04-14 13:36:20.845-04	{}	1536	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	368
2021-04-14	2021-04-14 13:36:20.845-04	{}	1537	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	440
2021-04-14	2021-04-14 13:36:20.845-04	{}	1538	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	440
2021-04-14	2021-04-14 13:36:20.845-04	{}	1539	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	440
2021-04-14	2021-04-14 13:36:20.845-04	{}	1540	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	440
2021-04-14	2021-04-14 13:36:20.845-04	{}	1541	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	441
2021-04-14	2021-04-14 13:36:20.845-04	{}	1542	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	441
2021-04-14	2021-04-14 13:36:20.845-04	{}	1543	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	441
2021-04-14	2021-04-14 13:36:20.845-04	{}	1544	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	441
2021-04-14	2021-04-14 13:36:20.845-04	{}	1545	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	442
2021-04-14	2021-04-14 13:36:20.845-04	{}	1546	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	442
2021-04-14	2021-04-14 13:36:20.845-04	{}	1547	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	442
2021-04-14	2021-04-14 13:36:20.845-04	{}	1548	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	442
2021-04-14	2021-04-14 13:36:20.845-04	{}	1549	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	443
2021-04-14	2021-04-14 13:36:20.845-04	{}	1550	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	443
2021-04-14	2021-04-14 13:36:20.845-04	{}	1551	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	443
2021-04-14	2021-04-14 13:36:20.845-04	{}	1552	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	443
2021-04-14	2021-04-14 13:36:20.845-04	{}	1553	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	444
2021-04-14	2021-04-14 13:36:20.845-04	{}	1554	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	444
2021-04-14	2021-04-14 13:36:20.845-04	{}	1555	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	444
2021-04-14	2021-04-14 13:36:20.845-04	{}	1556	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	444
2021-04-14	2021-04-14 13:36:20.845-04	{}	1557	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	445
2021-04-14	2021-04-14 13:36:20.845-04	{}	1558	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	445
2021-04-14	2021-04-14 13:36:20.845-04	{}	1559	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	445
2021-04-14	2021-04-14 13:36:20.845-04	{}	1560	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	445
2021-04-14	2021-04-14 13:36:20.845-04	{}	1561	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	446
2021-04-14	2021-04-14 13:36:20.845-04	{}	1562	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	446
2021-04-14	2021-04-14 13:36:20.845-04	{}	1563	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	446
2021-04-14	2021-04-14 13:36:20.845-04	{}	1564	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	446
2021-04-14	2021-04-14 13:36:20.845-04	{}	1565	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	447
2021-04-14	2021-04-14 13:36:20.845-04	{}	1566	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	447
2021-04-14	2021-04-14 13:36:20.845-04	{}	1567	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	447
2021-04-14	2021-04-14 13:36:20.845-04	{}	1568	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	447
2021-04-14	2021-04-14 13:36:20.845-04	{}	1569	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	448
2021-04-14	2021-04-14 13:36:20.845-04	{}	1570	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	448
2021-04-14	2021-04-14 13:36:20.845-04	{}	1571	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	448
2021-04-14	2021-04-14 13:36:20.845-04	{}	1572	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	448
2021-04-14	2021-04-14 13:36:20.845-04	{}	1573	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	449
2021-04-14	2021-04-14 13:36:20.845-04	{}	1574	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	449
2021-04-14	2021-04-14 13:36:20.845-04	{}	1575	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	449
2021-04-14	2021-04-14 13:36:20.845-04	{}	1576	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	449
2021-04-14	2021-04-14 13:36:20.845-04	{}	1577	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	369
2021-04-14	2021-04-14 13:36:20.845-04	{}	1578	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	369
2021-04-14	2021-04-14 13:36:20.845-04	{}	1579	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	369
2021-04-14	2021-04-14 13:36:20.845-04	{}	1580	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	369
2021-04-14	2021-04-14 13:36:20.845-04	{}	1581	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	450
2021-04-14	2021-04-14 13:36:20.845-04	{}	1582	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	450
2021-04-14	2021-04-14 13:36:20.845-04	{}	1583	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	450
2021-04-14	2021-04-14 13:36:20.845-04	{}	1584	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	450
2021-04-14	2021-04-14 13:36:20.845-04	{}	1585	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	451
2021-04-14	2021-04-14 13:36:20.845-04	{}	1586	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	451
2021-04-14	2021-04-14 13:36:20.845-04	{}	1587	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	451
2021-04-14	2021-04-14 13:36:20.845-04	{}	1588	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	451
2021-04-14	2021-04-14 13:36:20.845-04	{}	1589	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	452
2021-04-14	2021-04-14 13:36:20.845-04	{}	1590	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	452
2021-04-14	2021-04-14 13:36:20.845-04	{}	1591	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	452
2021-04-14	2021-04-14 13:36:20.845-04	{}	1592	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	452
2021-04-14	2021-04-14 13:36:20.845-04	{}	1593	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	453
2021-04-14	2021-04-14 13:36:20.845-04	{}	1594	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	453
2021-04-14	2021-04-14 13:36:20.845-04	{}	1595	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	453
2021-04-14	2021-04-14 13:36:20.845-04	{}	1596	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	453
2021-04-14	2021-04-14 13:36:20.845-04	{}	1597	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	454
2021-04-14	2021-04-14 13:36:20.845-04	{}	1598	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	454
2021-04-14	2021-04-14 13:36:20.845-04	{}	1599	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	454
2021-04-14	2021-04-14 13:36:20.845-04	{}	1600	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	454
2021-04-14	2021-04-14 13:36:20.845-04	{}	1601	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	455
2021-04-14	2021-04-14 13:36:20.845-04	{}	1602	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	455
2021-04-14	2021-04-14 13:36:20.845-04	{}	1603	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	455
2021-04-14	2021-04-14 13:36:20.845-04	{}	1604	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	455
2021-04-14	2021-04-14 13:36:20.845-04	{}	1605	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	456
2021-04-14	2021-04-14 13:36:20.845-04	{}	1606	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	456
2021-04-14	2021-04-14 13:36:20.845-04	{}	1607	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	456
2021-04-14	2021-04-14 13:36:20.845-04	{}	1608	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	456
2021-04-14	2021-04-14 13:36:20.845-04	{}	1609	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	457
2021-04-14	2021-04-14 13:36:20.845-04	{}	1610	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	457
2021-04-14	2021-04-14 13:36:20.845-04	{}	1611	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	457
2021-04-14	2021-04-14 13:36:20.845-04	{}	1612	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	457
2021-04-14	2021-04-14 13:36:20.845-04	{}	1613	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	458
2021-04-14	2021-04-14 13:36:20.845-04	{}	1614	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	458
2021-04-14	2021-04-14 13:36:20.845-04	{}	1615	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	458
2021-04-14	2021-04-14 13:36:20.845-04	{}	1616	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	458
2021-04-14	2021-04-14 13:36:20.845-04	{}	1617	t	\N	\N		eth0	9999999999999999eth000000............		\N	\N	459
2021-04-14	2021-04-14 13:36:20.845-04	{}	1618	t	\N	\N		eth1	9999999999999999eth000001............		\N	\N	459
2021-04-14	2021-04-14 13:36:20.845-04	{}	1619	t	\N	\N		eth2	9999999999999999eth000002............		\N	\N	459
2021-04-14	2021-04-14 13:36:20.845-04	{}	1620	t	\N	\N		eth3	9999999999999999eth000003............		\N	\N	459
\.


--
-- Data for Name: virtualization_vminterface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_vminterface_tagged_vlans (id, vminterface_id, vlan_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 349, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuit_id_seq', 30, true);


--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittermination_id_seq', 54, true);


--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittype_id_seq', 4, true);


--
-- Name: circuits_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_provider_id_seq', 9, true);


--
-- Name: circuits_providernetwork_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_providernetwork_id_seq', 1, true);


--
-- Name: dcim_cable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cable_id_seq', 127, true);


--
-- Name: dcim_cablepath_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cablepath_id_seq', 156, true);


--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleport_id_seq', 33, true);


--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleporttemplate_id_seq', 11, true);


--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverport_id_seq', 1, false);


--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverporttemplate_id_seq', 1, false);


--
-- Name: dcim_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_device_id_seq', 97, true);


--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebay_id_seq', 28, true);


--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebaytemplate_id_seq', 1, false);


--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicerole_id_seq', 8, true);


--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicetype_id_seq', 13, true);


--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontport_id_seq', 1536, true);


--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontporttemplate_id_seq', 120, true);


--
-- Name: dcim_interface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_id_seq', 1113, true);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 1, false);


--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interfacetemplate_id_seq', 267, true);


--
-- Name: dcim_inventoryitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_inventoryitem_id_seq', 1, false);


--
-- Name: dcim_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_location_id_seq', 4, true);


--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_manufacturer_id_seq', 13, true);


--
-- Name: dcim_platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_platform_id_seq', 3, true);


--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerfeed_id_seq', 48, true);


--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlet_id_seq', 152, true);


--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlettemplate_id_seq', 8, true);


--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerpanel_id_seq', 4, true);


--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerport_id_seq', 59, true);


--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerporttemplate_id_seq', 20, true);


--
-- Name: dcim_rack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rack_id_seq', 42, true);


--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackreservation_id_seq', 1, false);


--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackrole_id_seq', 4, true);


--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearport_id_seq', 1254, true);


--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearporttemplate_id_seq', 73, true);


--
-- Name: dcim_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_region_id_seq', 82, true);


--
-- Name: dcim_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_site_id_seq', 24, true);


--
-- Name: dcim_sitegroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_sitegroup_id_seq', 1, false);


--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_virtualchassis_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 88, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 356, true);


--
-- Name: extras_configcontext_cluster_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_cluster_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_clusters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_clusters_id_seq', 1, false);


--
-- Name: extras_configcontext_device_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_device_types_id_seq', 1, false);


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_id_seq', 1, false);


--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_platforms_id_seq', 1, false);


--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_regions_id_seq', 1, false);


--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_roles_id_seq', 1, false);


--
-- Name: extras_configcontext_site_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_site_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_sites_id_seq', 1, false);


--
-- Name: extras_configcontext_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tags_id_seq', 1, false);


--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenant_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenants_id_seq', 1, false);


--
-- Name: extras_customfield_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_content_types_id_seq', 1, true);


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_id_seq', 1, true);


--
-- Name: extras_customlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customlink_id_seq', 1, false);


--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_exporttemplate_id_seq', 1, false);


--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_imageattachment_id_seq', 1, false);


--
-- Name: extras_jobresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_jobresult_id_seq', 1, false);


--
-- Name: extras_journalentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_journalentry_id_seq', 1, false);


--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_objectchange_id_seq', 1, false);


--
-- Name: extras_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_tag_id_seq', 1, false);


--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_taggeditem_id_seq', 1, false);


--
-- Name: extras_webhook_content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_content_types_id_seq', 1, false);


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_id_seq', 1, false);


--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_aggregate_id_seq', 4, true);


--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_ipaddress_id_seq', 1, false);


--
-- Name: ipam_iprange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_iprange_id_seq', 1, false);


--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_prefix_id_seq', 72, true);


--
-- Name: ipam_rir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_rir_id_seq', 7, true);


--
-- Name: ipam_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_role_id_seq', 4, true);


--
-- Name: ipam_routetarget_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_routetarget_id_seq', 1, false);


--
-- Name: ipam_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_id_seq', 1, false);


--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_ipaddresses_id_seq', 1, false);


--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlan_id_seq', 63, true);


--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlangroup_id_seq', 8, true);


--
-- Name: ipam_vrf_export_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_export_targets_id_seq', 1, false);


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_id_seq', 1, false);


--
-- Name: ipam_vrf_import_targets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_import_targets_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenant_id_seq', 13, true);


--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenantgroup_id_seq', 1, true);


--
-- Name: users_objectpermission_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_groups_id_seq', 1, false);


--
-- Name: users_objectpermission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_id_seq', 1, false);


--
-- Name: users_objectpermission_object_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_object_types_id_seq', 1, false);


--
-- Name: users_objectpermission_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_objectpermission_users_id_seq', 1, false);


--
-- Name: users_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_token_id_seq', 1, false);


--
-- Name: users_userconfig_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_userconfig_id_seq', 1, true);


--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_cluster_id_seq', 40, true);


--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustergroup_id_seq', 5, true);


--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustertype_id_seq', 6, true);


--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_virtualmachine_id_seq', 540, true);


--
-- Name: virtualization_vminterface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_id_seq', 1620, true);


--
-- Name: virtualization_vminterface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_vminterface_tagged_vlans_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: circuits_circuit circuits_circuit_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuit circuits_circuit_provider_id_cid_b6f29862_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_cid_b6f29862_uniq UNIQUE (provider_id, cid);


--
-- Name: circuits_circuittermination circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq UNIQUE (circuit_id, term_side);


--
-- Name: circuits_circuittermination circuits_circuittermination_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_name_key UNIQUE (name);


--
-- Name: circuits_circuittype circuits_circuittype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_slug_key UNIQUE (slug);


--
-- Name: circuits_provider circuits_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_name_key UNIQUE (name);


--
-- Name: circuits_provider circuits_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider circuits_provider_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_slug_key UNIQUE (slug);


--
-- Name: circuits_providernetwork circuits_providernetwork_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_pkey PRIMARY KEY (id);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_id_name_6f6610a0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_id_name_6f6610a0_uniq UNIQUE (provider_id, name);


--
-- Name: circuits_providernetwork circuits_providernetwork_provider_name; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernetwork_provider_name UNIQUE (provider_id, name);


--
-- Name: dcim_cable dcim_cable_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_pkey PRIMARY KEY (id);


--
-- Name: dcim_cable dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq UNIQUE (termination_a_type_id, termination_a_id);


--
-- Name: dcim_cable dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq UNIQUE (termination_b_type_id, termination_b_id);


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_origin_id_41b6f814_uniq UNIQUE (origin_type_id, origin_id);


--
-- Name: dcim_cablepath dcim_cablepath_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleport dcim_consoleport_device_id_name_293786b6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_name_293786b6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleport dcim_consoleport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_name_fb1c5999_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_name_fb1c5999_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverportte_device_type_id_name_a05c974d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverportte_device_type_id_name_a05c974d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_device dcim_device_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: dcim_device dcim_device_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: dcim_device dcim_device_rack_id_position_face_43208a79_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_position_face_43208a79_uniq UNIQUE (rack_id, "position", face);


--
-- Name: dcim_device dcim_device_site_id_tenant_id_name_93f4f962_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_tenant_id_name_93f4f962_uniq UNIQUE (site_id, tenant_id, name);


--
-- Name: dcim_device dcim_device_virtual_chassis_id_vc_position_efea7133_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_vc_position_efea7133_uniq UNIQUE (virtual_chassis_id, vc_position);


--
-- Name: dcim_devicebay dcim_devicebay_device_id_name_2475a67b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_name_2475a67b_uniq UNIQUE (device_id, name);


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_key UNIQUE (installed_device_id);


--
-- Name: dcim_devicebay dcim_devicebay_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_name_key UNIQUE (name);


--
-- Name: dcim_devicerole dcim_devicerole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_slug_key UNIQUE (slug);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_model_17948c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_model_17948c0c_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq UNIQUE (manufacturer_id, slug);


--
-- Name: dcim_devicetype dcim_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_device_id_name_235b7af2_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_name_235b7af2_uniq UNIQUE (device_id, name);


--
-- Name: dcim_frontport dcim_frontport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_interface dcim_interface_device_id_name_bffc4ec4_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_name_bffc4ec4_uniq UNIQUE (device_id, name);


--
-- Name: dcim_interface dcim_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq UNIQUE (interface_id, vlan_id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_device_type_id_name_3a847237_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_device_type_id_name_3a847237_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_parent_id_name_bb84bd2b_uniq UNIQUE (device_id, parent_id, name);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_pkey PRIMARY KEY (id);


--
-- Name: dcim_location dcim_location_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_pkey PRIMARY KEY (id);


--
-- Name: dcim_location dcim_location_site_id_name_b307d2e7_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_site_id_name_b307d2e7_uniq UNIQUE (site_id, name);


--
-- Name: dcim_location dcim_location_site_id_slug_08adceed_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_site_id_slug_08adceed_uniq UNIQUE (site_id, slug);


--
-- Name: dcim_manufacturer dcim_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_name_key UNIQUE (name);


--
-- Name: dcim_manufacturer dcim_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_slug_key UNIQUE (slug);


--
-- Name: dcim_platform dcim_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_name_key UNIQUE (name);


--
-- Name: dcim_platform dcim_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_slug_key UNIQUE (slug);


--
-- Name: dcim_powerfeed dcim_powerfeed_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq UNIQUE (power_panel_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_name_981b00c1_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_name_981b00c1_uniq UNIQUE (device_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_pkey PRIMARY KEY (id);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_name_804df4c0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_name_804df4c0_uniq UNIQUE (site_id, name);


--
-- Name: dcim_powerport dcim_powerport_device_id_name_948af82c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_name_948af82c_uniq UNIQUE (device_id, name);


--
-- Name: dcim_powerport dcim_powerport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_rack dcim_rack_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_rack dcim_rack_location_id_facility_id_59f80bca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_facility_id_59f80bca_uniq UNIQUE (location_id, facility_id);


--
-- Name: dcim_rack dcim_rack_location_id_name_283dd15d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_name_283dd15d_uniq UNIQUE (location_id, name);


--
-- Name: dcim_rack dcim_rack_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackreservation dcim_rackreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_name_key UNIQUE (name);


--
-- Name: dcim_rackrole dcim_rackrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_slug_key UNIQUE (slug);


--
-- Name: dcim_rearport dcim_rearport_device_id_name_4b14dde6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_name_4b14dde6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_rearport dcim_rearport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_pkey PRIMARY KEY (id);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_name_key UNIQUE (name);


--
-- Name: dcim_region dcim_region_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_slug_key UNIQUE (slug);


--
-- Name: dcim_site dcim_site_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_name_key UNIQUE (name);


--
-- Name: dcim_site dcim_site_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_pkey PRIMARY KEY (id);


--
-- Name: dcim_site dcim_site_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_slug_key UNIQUE (slug);


--
-- Name: dcim_sitegroup dcim_sitegroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_name_key UNIQUE (name);


--
-- Name: dcim_sitegroup dcim_sitegroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_sitegroup dcim_sitegroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_slug_key UNIQUE (slug);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_key UNIQUE (master_id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: extras_configcontext_clusters extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_0c7e5d20_uniq UNIQUE (configcontext_id, cluster_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clu_configcontext_id_cluster_bc530192_uniq UNIQUE (configcontext_id, clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_cluster_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_cluster_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_clusters extras_configcontext_clusters_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_clusters_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_device_types extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_dev_configcontext_id_devicet_a0aaba6f_uniq UNIQUE (configcontext_id, devicetype_id);


--
-- Name: extras_configcontext_device_types extras_configcontext_device_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_device_types_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext extras_configcontext_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_name_key UNIQUE (name);


--
-- Name: extras_configcontext extras_configcontext_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_platforms extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq UNIQUE (configcontext_id, platform_id);


--
-- Name: extras_configcontext_platforms extras_configcontext_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platforms_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_regions extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq UNIQUE (configcontext_id, region_id);


--
-- Name: extras_configcontext_regions extras_configcontext_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_regions_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_roles extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq UNIQUE (configcontext_id, devicerole_id);


--
-- Name: extras_configcontext_roles extras_configcontext_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_roles_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq UNIQUE (configcontext_id, site_id);


--
-- Name: extras_configcontext_site_groups extras_configcontext_sit_configcontext_id_sitegro_4caa52ec_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_sitegro_4caa52ec_uniq UNIQUE (configcontext_id, sitegroup_id);


--
-- Name: extras_configcontext_site_groups extras_configcontext_site_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_site_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_configcontext_id_tag_id_f6c53016_uniq UNIQUE (configcontext_id, tag_id);


--
-- Name: extras_configcontext_tags extras_configcontext_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq UNIQUE (configcontext_id, tenant_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq UNIQUE (configcontext_id, tenantgroup_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenant_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenant_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenants_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield_content_types extras_customfield_conte_customfield_id_contentty_51136c2b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_conte_customfield_id_contentty_51136c2b_uniq UNIQUE (customfield_id, contenttype_id);


--
-- Name: extras_customfield_content_types extras_customfield_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_name_key UNIQUE (name);


--
-- Name: extras_customfield extras_customfield_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_pkey PRIMARY KEY (id);


--
-- Name: extras_customlink extras_customlink_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_name_key UNIQUE (name);


--
-- Name: extras_customlink extras_customlink_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_pkey PRIMARY KEY (id);


--
-- Name: extras_exporttemplate extras_exporttemplate_content_type_id_name_edca9b9b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_content_type_id_name_edca9b9b_uniq UNIQUE (content_type_id, name);


--
-- Name: extras_exporttemplate extras_exporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_pkey PRIMARY KEY (id);


--
-- Name: extras_imageattachment extras_imageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_jobresult extras_jobresult_job_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_job_id_key UNIQUE (job_id);


--
-- Name: extras_jobresult extras_jobresult_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_pkey PRIMARY KEY (id);


--
-- Name: extras_journalentry extras_journalentry_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_pkey PRIMARY KEY (id);


--
-- Name: extras_objectchange extras_objectchange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_name_key UNIQUE (name);


--
-- Name: extras_tag extras_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_slug_key UNIQUE (slug);


--
-- Name: extras_taggeditem extras_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook_content_types extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_t_webhook_id_contenttype_i_485b9e93_uniq UNIQUE (webhook_id, contenttype_id);


--
-- Name: extras_webhook_content_types extras_webhook_content_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_content_types_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook extras_webhook_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_name_key UNIQUE (name);


--
-- Name: extras_webhook extras_webhook_payload_url_type_create__dd332134_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_payload_url_type_create__dd332134_uniq UNIQUE (payload_url, type_create, type_update, type_delete);


--
-- Name: extras_webhook extras_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_pkey PRIMARY KEY (id);


--
-- Name: ipam_aggregate ipam_aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_pkey PRIMARY KEY (id);


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_key UNIQUE (nat_inside_id);


--
-- Name: ipam_ipaddress ipam_ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_pkey PRIMARY KEY (id);


--
-- Name: ipam_iprange ipam_iprange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefix ipam_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_name_key UNIQUE (name);


--
-- Name: ipam_rir ipam_rir_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_slug_key UNIQUE (slug);


--
-- Name: ipam_role ipam_role_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_name_key UNIQUE (name);


--
-- Name: ipam_role ipam_role_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_pkey PRIMARY KEY (id);


--
-- Name: ipam_role ipam_role_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_slug_key UNIQUE (slug);


--
-- Name: ipam_routetarget ipam_routetarget_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_name_key UNIQUE (name);


--
-- Name: ipam_routetarget ipam_routetarget_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq UNIQUE (service_id, ipaddress_id);


--
-- Name: ipam_service ipam_service_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlan ipam_vlan_group_id_name_e53919df_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_name_e53919df_uniq UNIQUE (group_id, name);


--
-- Name: ipam_vlan ipam_vlan_group_id_vid_5ca4cc47_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_vid_5ca4cc47_uniq UNIQUE (group_id, vid);


--
-- Name: ipam_vlan ipam_vlan_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_scope_id_name_66199b4b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_scope_id_name_66199b4b_uniq UNIQUE (scope_type_id, scope_id, name);


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_scope_id_slug_6ae7ef85_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_scope_id_slug_6ae7ef85_uniq UNIQUE (scope_type_id, scope_id, slug);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_routetarget_id_63ba8c62_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_routetarget_id_399b155f_uniq UNIQUE (vrf_id, routetarget_id);


--
-- Name: ipam_vrf ipam_vrf_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf ipam_vrf_rd_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_rd_key UNIQUE (rd);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_name_key UNIQUE (name);


--
-- Name: tenancy_tenant tenancy_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_name_key UNIQUE (name);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_slug_key UNIQUE (slug);


--
-- Name: users_objectpermission_groups users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_g_objectpermission_id_grou_3b62a39c_uniq UNIQUE (objectpermission_id, group_id);


--
-- Name: users_objectpermission_groups users_objectpermission_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermission_groups_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_object_types users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_o_objectpermission_id_cont_7c40d31a_uniq UNIQUE (objectpermission_id, contenttype_id);


--
-- Name: users_objectpermission_object_types users_objectpermission_object_types_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermission_object_types_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission users_objectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission
    ADD CONSTRAINT users_objectpermission_pkey PRIMARY KEY (id);


--
-- Name: users_objectpermission_users users_objectpermission_u_objectpermission_id_user_3a7db108_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_u_objectpermission_id_user_3a7db108_uniq UNIQUE (objectpermission_id, user_id);


--
-- Name: users_objectpermission_users users_objectpermission_users_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_pkey PRIMARY KEY (id);


--
-- Name: users_token users_token_key_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_key_key UNIQUE (key);


--
-- Name: users_token users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_pkey PRIMARY KEY (id);


--
-- Name: users_userconfig users_userconfig_user_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_key UNIQUE (user_id);


--
-- Name: virtualization_cluster virtualization_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_name_key UNIQUE (name);


--
-- Name: virtualization_cluster virtualization_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_name_key UNIQUE (name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_slug_key UNIQUE (slug);


--
-- Name: virtualization_clustertype virtualization_clustertype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_name_key UNIQUE (name);


--
-- Name: virtualization_clustertype virtualization_clustertype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustertype virtualization_clustertype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_slug_key UNIQUE (slug);


--
-- Name: virtualization_virtualmachine virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualma_cluster_id_tenant_id_nam_56c69afb_uniq UNIQUE (cluster_id, tenant_id, name);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_pkey PRIMARY KEY (id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: virtualization_vminterface virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterfa_virtual_machine_id_name_cfb9c423_uniq UNIQUE (virtual_machine_id, name);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterfa_vminterface_id_vlan_id_27e907db_uniq UNIQUE (vminterface_id, vlan_id);


--
-- Name: virtualization_vminterface virtualization_vminterface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vminterface_pkey PRIMARY KEY (id);


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vminterface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vminterface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: circuits_circuit_provider_id_d9195418; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_provider_id_d9195418 ON public.circuits_circuit USING btree (provider_id);


--
-- Name: circuits_circuit_tenant_id_812508a5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_tenant_id_812508a5 ON public.circuits_circuit USING btree (tenant_id);


--
-- Name: circuits_circuit_termination_a_id_f891adac; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_termination_a_id_f891adac ON public.circuits_circuit USING btree (termination_a_id);


--
-- Name: circuits_circuit_termination_z_id_377b8551; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_termination_z_id_377b8551 ON public.circuits_circuit USING btree (termination_z_id);


--
-- Name: circuits_circuit_type_id_1b9f485a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_type_id_1b9f485a ON public.circuits_circuit USING btree (type_id);


--
-- Name: circuits_circuittermination__cable_peer_type_id_bd122156; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination__cable_peer_type_id_bd122156 ON public.circuits_circuittermination USING btree (_cable_peer_type_id);


--
-- Name: circuits_circuittermination_cable_id_35e9f703; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_cable_id_35e9f703 ON public.circuits_circuittermination USING btree (cable_id);


--
-- Name: circuits_circuittermination_circuit_id_257e87e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_circuit_id_257e87e7 ON public.circuits_circuittermination USING btree (circuit_id);


--
-- Name: circuits_circuittermination_provider_network_id_b0c660f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_provider_network_id_b0c660f1 ON public.circuits_circuittermination USING btree (provider_network_id);


--
-- Name: circuits_circuittermination_site_id_e6fe5652; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_site_id_e6fe5652 ON public.circuits_circuittermination USING btree (site_id);


--
-- Name: circuits_circuittype_name_8256ea9a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_name_8256ea9a_like ON public.circuits_circuittype USING btree (name varchar_pattern_ops);


--
-- Name: circuits_circuittype_slug_9b4b3cf9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_slug_9b4b3cf9_like ON public.circuits_circuittype USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_provider_name_8f2514f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_name_8f2514f5_like ON public.circuits_provider USING btree (name varchar_pattern_ops);


--
-- Name: circuits_provider_slug_c3c0aa10_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_slug_c3c0aa10_like ON public.circuits_provider USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_providernetwork_provider_id_7992236c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_providernetwork_provider_id_7992236c ON public.circuits_providernetwork USING btree (provider_id);


--
-- Name: dcim_cable__termination_a_device_id_e59cde1c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_a_device_id_e59cde1c ON public.dcim_cable USING btree (_termination_a_device_id);


--
-- Name: dcim_cable__termination_b_device_id_a9073762; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_b_device_id_a9073762 ON public.dcim_cable USING btree (_termination_b_device_id);


--
-- Name: dcim_cable_termination_a_type_id_a614bab8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_a_type_id_a614bab8 ON public.dcim_cable USING btree (termination_a_type_id);


--
-- Name: dcim_cable_termination_b_type_id_a91595d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_b_type_id_a91595d0 ON public.dcim_cable USING btree (termination_b_type_id);


--
-- Name: dcim_cablepath_destination_type_id_a8c1654b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cablepath_destination_type_id_a8c1654b ON public.dcim_cablepath USING btree (destination_type_id);


--
-- Name: dcim_cablepath_origin_type_id_6de54f6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cablepath_origin_type_id_6de54f6d ON public.dcim_cablepath USING btree (origin_type_id);


--
-- Name: dcim_consoleport__cable_peer_type_id_52adb1be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport__cable_peer_type_id_52adb1be ON public.dcim_consoleport USING btree (_cable_peer_type_id);


--
-- Name: dcim_consoleport__path_id_e40a4436; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport__path_id_e40a4436 ON public.dcim_consoleport USING btree (_path_id);


--
-- Name: dcim_consoleport_cable_id_a9ae5465; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_cable_id_a9ae5465 ON public.dcim_consoleport USING btree (cable_id);


--
-- Name: dcim_consoleport_device_id_f2d90d3c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_device_id_f2d90d3c ON public.dcim_consoleport USING btree (device_id);


--
-- Name: dcim_consoleporttemplate_device_type_id_075d4015; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleporttemplate_device_type_id_075d4015 ON public.dcim_consoleporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleserverport__cable_peer_type_id_132b6744; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport__cable_peer_type_id_132b6744 ON public.dcim_consoleserverport USING btree (_cable_peer_type_id);


--
-- Name: dcim_consoleserverport__path_id_dc5abe09; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport__path_id_dc5abe09 ON public.dcim_consoleserverport USING btree (_path_id);


--
-- Name: dcim_consoleserverport_cable_id_f2940dfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_cable_id_f2940dfd ON public.dcim_consoleserverport USING btree (cable_id);


--
-- Name: dcim_consoleserverport_device_id_d9866581; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_device_id_d9866581 ON public.dcim_consoleserverport USING btree (device_id);


--
-- Name: dcim_consoleserverporttemplate_device_type_id_579bdc86; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverporttemplate_device_type_id_579bdc86 ON public.dcim_consoleserverporttemplate USING btree (device_type_id);


--
-- Name: dcim_device_asset_tag_8dac1079_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_asset_tag_8dac1079_like ON public.dcim_device USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_device_cluster_id_cf852f78; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_cluster_id_cf852f78 ON public.dcim_device USING btree (cluster_id);


--
-- Name: dcim_device_device_role_id_682e8188; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_role_id_682e8188 ON public.dcim_device USING btree (device_role_id);


--
-- Name: dcim_device_device_type_id_d61b4086; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_type_id_d61b4086 ON public.dcim_device USING btree (device_type_id);


--
-- Name: dcim_device_location_id_11a7bedb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_location_id_11a7bedb ON public.dcim_device USING btree (location_id);


--
-- Name: dcim_device_platform_id_468138f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_platform_id_468138f1 ON public.dcim_device USING btree (platform_id);


--
-- Name: dcim_device_rack_id_23bde71f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_rack_id_23bde71f ON public.dcim_device USING btree (rack_id);


--
-- Name: dcim_device_site_id_ff897cf6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_site_id_ff897cf6 ON public.dcim_device USING btree (site_id);


--
-- Name: dcim_device_tenant_id_dcea7969; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_tenant_id_dcea7969 ON public.dcim_device USING btree (tenant_id);


--
-- Name: dcim_device_virtual_chassis_id_aed51693; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_virtual_chassis_id_aed51693 ON public.dcim_device USING btree (virtual_chassis_id);


--
-- Name: dcim_devicebay_device_id_0c8a1218; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebay_device_id_0c8a1218 ON public.dcim_devicebay USING btree (device_id);


--
-- Name: dcim_devicebaytemplate_device_type_id_f4b24a29; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebaytemplate_device_type_id_f4b24a29 ON public.dcim_devicebaytemplate USING btree (device_type_id);


--
-- Name: dcim_devicerole_name_1c813306_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_name_1c813306_like ON public.dcim_devicerole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicerole_slug_7952643b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_slug_7952643b_like ON public.dcim_devicerole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_devicetype_manufacturer_id_a3e8029e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_manufacturer_id_a3e8029e ON public.dcim_devicetype USING btree (manufacturer_id);


--
-- Name: dcim_devicetype_slug_448745bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd ON public.dcim_devicetype USING btree (slug);


--
-- Name: dcim_devicetype_slug_448745bd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd_like ON public.dcim_devicetype USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_frontport__cable_peer_type_id_c4690f56; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport__cable_peer_type_id_c4690f56 ON public.dcim_frontport USING btree (_cable_peer_type_id);


--
-- Name: dcim_frontport_cable_id_04ff8aab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_cable_id_04ff8aab ON public.dcim_frontport USING btree (cable_id);


--
-- Name: dcim_frontport_device_id_950557b5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_device_id_950557b5 ON public.dcim_frontport USING btree (device_id);


--
-- Name: dcim_frontport_rear_port_id_78df2532; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_rear_port_id_78df2532 ON public.dcim_frontport USING btree (rear_port_id);


--
-- Name: dcim_frontporttemplate_device_type_id_f088b952; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_device_type_id_f088b952 ON public.dcim_frontporttemplate USING btree (device_type_id);


--
-- Name: dcim_frontporttemplate_rear_port_id_9775411b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_rear_port_id_9775411b ON public.dcim_frontporttemplate USING btree (rear_port_id);


--
-- Name: dcim_interface__cable_peer_type_id_ce52cb81; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface__cable_peer_type_id_ce52cb81 ON public.dcim_interface USING btree (_cable_peer_type_id);


--
-- Name: dcim_interface__path_id_f8f4f7f0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface__path_id_f8f4f7f0 ON public.dcim_interface USING btree (_path_id);


--
-- Name: dcim_interface_cable_id_1b264edb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_cable_id_1b264edb ON public.dcim_interface USING btree (cable_id);


--
-- Name: dcim_interface_device_id_359c6115; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_device_id_359c6115 ON public.dcim_interface USING btree (device_id);


--
-- Name: dcim_interface_lag_id_ea1a1d12; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_lag_id_ea1a1d12 ON public.dcim_interface USING btree (lag_id);


--
-- Name: dcim_interface_parent_id_3e2b159b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_parent_id_3e2b159b ON public.dcim_interface USING btree (parent_id);


--
-- Name: dcim_interface_tagged_vlans_interface_id_5870c9e9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_interface_id_5870c9e9 ON public.dcim_interface_tagged_vlans USING btree (interface_id);


--
-- Name: dcim_interface_tagged_vlans_vlan_id_e027005c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_vlan_id_e027005c ON public.dcim_interface_tagged_vlans USING btree (vlan_id);


--
-- Name: dcim_interface_untagged_vlan_id_838dc7be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_untagged_vlan_id_838dc7be ON public.dcim_interface USING btree (untagged_vlan_id);


--
-- Name: dcim_interfacetemplate_device_type_id_4bfcbfab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interfacetemplate_device_type_id_4bfcbfab ON public.dcim_interfacetemplate USING btree (device_type_id);


--
-- Name: dcim_inventoryitem_asset_tag_d3289273_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_asset_tag_d3289273_like ON public.dcim_inventoryitem USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_inventoryitem_device_id_033d83f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_device_id_033d83f8 ON public.dcim_inventoryitem USING btree (device_id);


--
-- Name: dcim_inventoryitem_manufacturer_id_dcd1b78a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_manufacturer_id_dcd1b78a ON public.dcim_inventoryitem USING btree (manufacturer_id);


--
-- Name: dcim_inventoryitem_parent_id_7ebcd457; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_parent_id_7ebcd457 ON public.dcim_inventoryitem USING btree (parent_id);


--
-- Name: dcim_inventoryitem_tree_id_4676ade2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_tree_id_4676ade2 ON public.dcim_inventoryitem USING btree (tree_id);


--
-- Name: dcim_location_parent_id_d77f3318; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_parent_id_d77f3318 ON public.dcim_location USING btree (parent_id);


--
-- Name: dcim_location_site_id_b55e975f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_site_id_b55e975f ON public.dcim_location USING btree (site_id);


--
-- Name: dcim_location_slug_352c5472; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_slug_352c5472 ON public.dcim_location USING btree (slug);


--
-- Name: dcim_location_slug_352c5472_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_slug_352c5472_like ON public.dcim_location USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_location_tree_id_5089ef14; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_location_tree_id_5089ef14 ON public.dcim_location USING btree (tree_id);


--
-- Name: dcim_manufacturer_name_841fcd92_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_name_841fcd92_like ON public.dcim_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: dcim_manufacturer_slug_00430749_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_slug_00430749_like ON public.dcim_manufacturer USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_platform_manufacturer_id_83f72d3d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_manufacturer_id_83f72d3d ON public.dcim_platform USING btree (manufacturer_id);


--
-- Name: dcim_platform_name_c2f04255_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_name_c2f04255_like ON public.dcim_platform USING btree (name varchar_pattern_ops);


--
-- Name: dcim_platform_slug_b0908ae4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_slug_b0908ae4_like ON public.dcim_platform USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_powerfeed__cable_peer_type_id_9f930589; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed__cable_peer_type_id_9f930589 ON public.dcim_powerfeed USING btree (_cable_peer_type_id);


--
-- Name: dcim_powerfeed__path_id_a1ea1f28; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed__path_id_a1ea1f28 ON public.dcim_powerfeed USING btree (_path_id);


--
-- Name: dcim_powerfeed_cable_id_ec44c4f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_cable_id_ec44c4f8 ON public.dcim_powerfeed USING btree (cable_id);


--
-- Name: dcim_powerfeed_power_panel_id_32bde3be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_power_panel_id_32bde3be ON public.dcim_powerfeed USING btree (power_panel_id);


--
-- Name: dcim_powerfeed_rack_id_7abba090; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_rack_id_7abba090 ON public.dcim_powerfeed USING btree (rack_id);


--
-- Name: dcim_poweroutlet__cable_peer_type_id_bbff28d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet__cable_peer_type_id_bbff28d0 ON public.dcim_poweroutlet USING btree (_cable_peer_type_id);


--
-- Name: dcim_poweroutlet__path_id_cbb47bb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet__path_id_cbb47bb9 ON public.dcim_poweroutlet USING btree (_path_id);


--
-- Name: dcim_poweroutlet_cable_id_8dbea1ec; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_cable_id_8dbea1ec ON public.dcim_poweroutlet USING btree (cable_id);


--
-- Name: dcim_poweroutlet_device_id_286351d7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_device_id_286351d7 ON public.dcim_poweroutlet USING btree (device_id);


--
-- Name: dcim_poweroutlet_power_port_id_9bdf4163; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_power_port_id_9bdf4163 ON public.dcim_poweroutlet USING btree (power_port_id);


--
-- Name: dcim_poweroutlettemplate_device_type_id_26b2316c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_device_type_id_26b2316c ON public.dcim_poweroutlettemplate USING btree (device_type_id);


--
-- Name: dcim_poweroutlettemplate_power_port_id_c0fb0c42; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_power_port_id_c0fb0c42 ON public.dcim_poweroutlettemplate USING btree (power_port_id);


--
-- Name: dcim_powerpanel_location_id_474b60f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_location_id_474b60f8 ON public.dcim_powerpanel USING btree (location_id);


--
-- Name: dcim_powerpanel_site_id_c430bc89; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_site_id_c430bc89 ON public.dcim_powerpanel USING btree (site_id);


--
-- Name: dcim_powerport__cable_peer_type_id_9df2a278; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport__cable_peer_type_id_9df2a278 ON public.dcim_powerport USING btree (_cable_peer_type_id);


--
-- Name: dcim_powerport__path_id_9fe4af8f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport__path_id_9fe4af8f ON public.dcim_powerport USING btree (_path_id);


--
-- Name: dcim_powerport_cable_id_c9682ba2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_cable_id_c9682ba2 ON public.dcim_powerport USING btree (cable_id);


--
-- Name: dcim_powerport_device_id_ef7185ae; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_device_id_ef7185ae ON public.dcim_powerport USING btree (device_id);


--
-- Name: dcim_powerporttemplate_device_type_id_1ddfbfcc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerporttemplate_device_type_id_1ddfbfcc ON public.dcim_powerporttemplate USING btree (device_type_id);


--
-- Name: dcim_rack_asset_tag_f88408e5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_asset_tag_f88408e5_like ON public.dcim_rack USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_rack_location_id_5f63ec31; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_location_id_5f63ec31 ON public.dcim_rack USING btree (location_id);


--
-- Name: dcim_rack_role_id_62d6919e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_role_id_62d6919e ON public.dcim_rack USING btree (role_id);


--
-- Name: dcim_rack_site_id_403c7b3a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_site_id_403c7b3a ON public.dcim_rack USING btree (site_id);


--
-- Name: dcim_rack_tenant_id_7cdf3725; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_tenant_id_7cdf3725 ON public.dcim_rack USING btree (tenant_id);


--
-- Name: dcim_rackreservation_rack_id_1ebbaa9b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_rack_id_1ebbaa9b ON public.dcim_rackreservation USING btree (rack_id);


--
-- Name: dcim_rackreservation_tenant_id_eb5e045f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_tenant_id_eb5e045f ON public.dcim_rackreservation USING btree (tenant_id);


--
-- Name: dcim_rackreservation_user_id_0785a527; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_user_id_0785a527 ON public.dcim_rackreservation USING btree (user_id);


--
-- Name: dcim_rackrole_name_9077cfcc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_name_9077cfcc_like ON public.dcim_rackrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackrole_slug_40bbcd3a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_slug_40bbcd3a_like ON public.dcim_rackrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rearport__cable_peer_type_id_cecf241c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport__cable_peer_type_id_cecf241c ON public.dcim_rearport USING btree (_cable_peer_type_id);


--
-- Name: dcim_rearport_cable_id_42c0e4e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_cable_id_42c0e4e7 ON public.dcim_rearport USING btree (cable_id);


--
-- Name: dcim_rearport_device_id_0bdfe9c0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_device_id_0bdfe9c0 ON public.dcim_rearport USING btree (device_id);


--
-- Name: dcim_rearporttemplate_device_type_id_6a02fd01; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearporttemplate_device_type_id_6a02fd01 ON public.dcim_rearporttemplate USING btree (device_type_id);


--
-- Name: dcim_region_name_ba5a7082_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_name_ba5a7082_like ON public.dcim_region USING btree (name varchar_pattern_ops);


--
-- Name: dcim_region_parent_id_2486f5d4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_parent_id_2486f5d4 ON public.dcim_region USING btree (parent_id);


--
-- Name: dcim_region_slug_ff078a66_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_slug_ff078a66_like ON public.dcim_region USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_region_tree_id_a09ea9a7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_tree_id_a09ea9a7 ON public.dcim_region USING btree (tree_id);


--
-- Name: dcim_site_group_id_3910c975; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_group_id_3910c975 ON public.dcim_site USING btree (group_id);


--
-- Name: dcim_site_name_8fe66c76_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_name_8fe66c76_like ON public.dcim_site USING btree (name varchar_pattern_ops);


--
-- Name: dcim_site_region_id_45210932; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_region_id_45210932 ON public.dcim_site USING btree (region_id);


--
-- Name: dcim_site_slug_4412c762_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_slug_4412c762_like ON public.dcim_site USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_site_tenant_id_15e7df63; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_tenant_id_15e7df63 ON public.dcim_site USING btree (tenant_id);


--
-- Name: dcim_sitegroup_name_803063c0_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_name_803063c0_like ON public.dcim_sitegroup USING btree (name varchar_pattern_ops);


--
-- Name: dcim_sitegroup_parent_id_533a5e44; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_parent_id_533a5e44 ON public.dcim_sitegroup USING btree (parent_id);


--
-- Name: dcim_sitegroup_slug_a11d2b04_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_slug_a11d2b04_like ON public.dcim_sitegroup USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_sitegroup_tree_id_e76dc999; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_sitegroup_tree_id_e76dc999 ON public.dcim_sitegroup USING btree (tree_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: extras_configcontext_cluster_groups_clustergroup_id_f4322ce8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_clustergroup_id_f4322ce8 ON public.extras_configcontext_cluster_groups USING btree (clustergroup_id);


--
-- Name: extras_configcontext_cluster_groups_configcontext_id_8f50b794; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_cluster_groups_configcontext_id_8f50b794 ON public.extras_configcontext_cluster_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_clusters_cluster_id_6abd47a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_cluster_id_6abd47a1 ON public.extras_configcontext_clusters USING btree (cluster_id);


--
-- Name: extras_configcontext_clusters_configcontext_id_ed579a40; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_clusters_configcontext_id_ed579a40 ON public.extras_configcontext_clusters USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_configcontext_id_55632923; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_device_types_configcontext_id_55632923 ON public.extras_configcontext_device_types USING btree (configcontext_id);


--
-- Name: extras_configcontext_device_types_devicetype_id_b8788c2d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_device_types_devicetype_id_b8788c2d ON public.extras_configcontext_device_types USING btree (devicetype_id);


--
-- Name: extras_configcontext_name_4bbfe25d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_name_4bbfe25d_like ON public.extras_configcontext USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontext_platforms_configcontext_id_2a516699; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_configcontext_id_2a516699 ON public.extras_configcontext_platforms USING btree (configcontext_id);


--
-- Name: extras_configcontext_platforms_platform_id_3fdfedc0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_platform_id_3fdfedc0 ON public.extras_configcontext_platforms USING btree (platform_id);


--
-- Name: extras_configcontext_regions_configcontext_id_73003dbc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_configcontext_id_73003dbc ON public.extras_configcontext_regions USING btree (configcontext_id);


--
-- Name: extras_configcontext_regions_region_id_35c6ba9d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_region_id_35c6ba9d ON public.extras_configcontext_regions USING btree (region_id);


--
-- Name: extras_configcontext_roles_configcontext_id_59b67386; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_configcontext_id_59b67386 ON public.extras_configcontext_roles USING btree (configcontext_id);


--
-- Name: extras_configcontext_roles_devicerole_id_d3a84813; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_devicerole_id_d3a84813 ON public.extras_configcontext_roles USING btree (devicerole_id);


--
-- Name: extras_configcontext_site_groups_configcontext_id_2e0f43cb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_site_groups_configcontext_id_2e0f43cb ON public.extras_configcontext_site_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_site_groups_sitegroup_id_3287c9e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_site_groups_sitegroup_id_3287c9e7 ON public.extras_configcontext_site_groups USING btree (sitegroup_id);


--
-- Name: extras_configcontext_sites_configcontext_id_8c54feb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_configcontext_id_8c54feb9 ON public.extras_configcontext_sites USING btree (configcontext_id);


--
-- Name: extras_configcontext_sites_site_id_cbb76c96; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_site_id_cbb76c96 ON public.extras_configcontext_sites USING btree (site_id);


--
-- Name: extras_configcontext_tags_configcontext_id_64a392b1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_configcontext_id_64a392b1 ON public.extras_configcontext_tags USING btree (configcontext_id);


--
-- Name: extras_configcontext_tags_tag_id_129a5d87; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tags_tag_id_129a5d87 ON public.extras_configcontext_tags USING btree (tag_id);


--
-- Name: extras_configcontext_tenant_groups_configcontext_id_92f68345; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_configcontext_id_92f68345 ON public.extras_configcontext_tenant_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenant_groups_tenantgroup_id_0909688d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_tenantgroup_id_0909688d ON public.extras_configcontext_tenant_groups USING btree (tenantgroup_id);


--
-- Name: extras_configcontext_tenants_configcontext_id_b53552a6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_configcontext_id_b53552a6 ON public.extras_configcontext_tenants USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenants_tenant_id_8d0aa28e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_tenant_id_8d0aa28e ON public.extras_configcontext_tenants USING btree (tenant_id);


--
-- Name: extras_customfield_content_types_contenttype_id_2997ba90; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_content_types_contenttype_id_2997ba90 ON public.extras_customfield_content_types USING btree (contenttype_id);


--
-- Name: extras_customfield_content_types_customfield_id_3842aaf3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_content_types_customfield_id_3842aaf3 ON public.extras_customfield_content_types USING btree (customfield_id);


--
-- Name: extras_customfield_name_2fe72707_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_name_2fe72707_like ON public.extras_customfield USING btree (name varchar_pattern_ops);


--
-- Name: extras_customlink_content_type_id_4d35b063; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_content_type_id_4d35b063 ON public.extras_customlink USING btree (content_type_id);


--
-- Name: extras_customlink_name_daed2d18_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_name_daed2d18_like ON public.extras_customlink USING btree (name varchar_pattern_ops);


--
-- Name: extras_exporttemplate_content_type_id_59737e21; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_exporttemplate_content_type_id_59737e21 ON public.extras_exporttemplate USING btree (content_type_id);


--
-- Name: extras_imageattachment_content_type_id_90e0643d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_imageattachment_content_type_id_90e0643d ON public.extras_imageattachment USING btree (content_type_id);


--
-- Name: extras_jobresult_obj_type_id_475e80aa; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_obj_type_id_475e80aa ON public.extras_jobresult USING btree (obj_type_id);


--
-- Name: extras_jobresult_user_id_d35285ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_jobresult_user_id_d35285ab ON public.extras_jobresult USING btree (user_id);


--
-- Name: extras_journalentry_assigned_object_type_id_1bba9f68; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_journalentry_assigned_object_type_id_1bba9f68 ON public.extras_journalentry USING btree (assigned_object_type_id);


--
-- Name: extras_journalentry_created_by_id_8d4e4329; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_journalentry_created_by_id_8d4e4329 ON public.extras_journalentry USING btree (created_by_id);


--
-- Name: extras_objectchange_changed_object_type_id_b755bb60; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_changed_object_type_id_b755bb60 ON public.extras_objectchange USING btree (changed_object_type_id);


--
-- Name: extras_objectchange_related_object_type_id_fe6e521f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_related_object_type_id_fe6e521f ON public.extras_objectchange USING btree (related_object_type_id);


--
-- Name: extras_objectchange_time_224380ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_time_224380ea ON public.extras_objectchange USING btree ("time");


--
-- Name: extras_objectchange_user_id_7fdf8186; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_user_id_7fdf8186 ON public.extras_objectchange USING btree (user_id);


--
-- Name: extras_tag_name_9550b3d9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_name_9550b3d9_like ON public.extras_tag USING btree (name varchar_pattern_ops);


--
-- Name: extras_tag_slug_aaa5b7e9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_slug_aaa5b7e9_like ON public.extras_tag USING btree (slug varchar_pattern_ops);


--
-- Name: extras_taggeditem_content_type_id_ba5562ed; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_ba5562ed ON public.extras_taggeditem USING btree (content_type_id);


--
-- Name: extras_taggeditem_content_type_id_object_id_80e28e23_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_object_id_80e28e23_idx ON public.extras_taggeditem USING btree (content_type_id, object_id);


--
-- Name: extras_taggeditem_object_id_31b2aa77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_object_id_31b2aa77 ON public.extras_taggeditem USING btree (object_id);


--
-- Name: extras_taggeditem_tag_id_d48af7c7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_tag_id_d48af7c7 ON public.extras_taggeditem USING btree (tag_id);


--
-- Name: extras_webhook_content_types_contenttype_id_3fc2c4d3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_content_types_contenttype_id_3fc2c4d3 ON public.extras_webhook_content_types USING btree (contenttype_id);


--
-- Name: extras_webhook_content_types_webhook_id_0c169800; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_content_types_webhook_id_0c169800 ON public.extras_webhook_content_types USING btree (webhook_id);


--
-- Name: extras_webhook_name_82cf60b5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_name_82cf60b5_like ON public.extras_webhook USING btree (name varchar_pattern_ops);


--
-- Name: ipam_aggregate_rir_id_ef7a27bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_rir_id_ef7a27bd ON public.ipam_aggregate USING btree (rir_id);


--
-- Name: ipam_aggregate_tenant_id_637dd1a1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_tenant_id_637dd1a1 ON public.ipam_aggregate USING btree (tenant_id);


--
-- Name: ipam_ipaddress_assigned_object_type_id_02354370; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_assigned_object_type_id_02354370 ON public.ipam_ipaddress USING btree (assigned_object_type_id);


--
-- Name: ipam_ipaddress_tenant_id_ac55acfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_tenant_id_ac55acfd ON public.ipam_ipaddress USING btree (tenant_id);


--
-- Name: ipam_ipaddress_vrf_id_51fcc59b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_vrf_id_51fcc59b ON public.ipam_ipaddress USING btree (vrf_id);


--
-- Name: ipam_iprange_role_id_2782e864; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_role_id_2782e864 ON public.ipam_iprange USING btree (role_id);


--
-- Name: ipam_iprange_tenant_id_856027ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_tenant_id_856027ea ON public.ipam_iprange USING btree (tenant_id);


--
-- Name: ipam_iprange_vrf_id_613e9dd2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_iprange_vrf_id_613e9dd2 ON public.ipam_iprange USING btree (vrf_id);


--
-- Name: ipam_prefix_role_id_0a98d415; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_role_id_0a98d415 ON public.ipam_prefix USING btree (role_id);


--
-- Name: ipam_prefix_site_id_0b20df05; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_site_id_0b20df05 ON public.ipam_prefix USING btree (site_id);


--
-- Name: ipam_prefix_tenant_id_7ba1fcc4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_tenant_id_7ba1fcc4 ON public.ipam_prefix USING btree (tenant_id);


--
-- Name: ipam_prefix_vlan_id_1db91bff; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vlan_id_1db91bff ON public.ipam_prefix USING btree (vlan_id);


--
-- Name: ipam_prefix_vrf_id_34f78ed0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vrf_id_34f78ed0 ON public.ipam_prefix USING btree (vrf_id);


--
-- Name: ipam_rir_name_64a71982_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_name_64a71982_like ON public.ipam_rir USING btree (name varchar_pattern_ops);


--
-- Name: ipam_rir_slug_ff1a369a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_slug_ff1a369a_like ON public.ipam_rir USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_role_name_13784849_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_name_13784849_like ON public.ipam_role USING btree (name varchar_pattern_ops);


--
-- Name: ipam_role_slug_309ca14c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_slug_309ca14c_like ON public.ipam_role USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_routetarget_name_212be79f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_name_212be79f_like ON public.ipam_routetarget USING btree (name varchar_pattern_ops);


--
-- Name: ipam_routetarget_tenant_id_5a0b35e8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_routetarget_tenant_id_5a0b35e8 ON public.ipam_routetarget USING btree (tenant_id);


--
-- Name: ipam_service_device_id_b4d2bb9c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_device_id_b4d2bb9c ON public.ipam_service USING btree (device_id);


--
-- Name: ipam_service_ipaddresses_ipaddress_id_b4138c6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_ipaddress_id_b4138c6d ON public.ipam_service_ipaddresses USING btree (ipaddress_id);


--
-- Name: ipam_service_ipaddresses_service_id_ae26b9ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_service_id_ae26b9ab ON public.ipam_service_ipaddresses USING btree (service_id);


--
-- Name: ipam_service_virtual_machine_id_e8b53562; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_virtual_machine_id_e8b53562 ON public.ipam_service USING btree (virtual_machine_id);


--
-- Name: ipam_vlan_group_id_88cbfa62; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_group_id_88cbfa62 ON public.ipam_vlan USING btree (group_id);


--
-- Name: ipam_vlan_role_id_f5015962; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_role_id_f5015962 ON public.ipam_vlan USING btree (role_id);


--
-- Name: ipam_vlan_site_id_a59334e3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_site_id_a59334e3 ON public.ipam_vlan USING btree (site_id);


--
-- Name: ipam_vlan_tenant_id_71a8290d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_tenant_id_71a8290d ON public.ipam_vlan USING btree (tenant_id);


--
-- Name: ipam_vlangroup_scope_type_id_6606a755; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_scope_type_id_6606a755 ON public.ipam_vlangroup USING btree (scope_type_id);


--
-- Name: ipam_vlangroup_slug_40abcf6b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b ON public.ipam_vlangroup USING btree (slug);


--
-- Name: ipam_vlangroup_slug_40abcf6b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b_like ON public.ipam_vlangroup USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_vrf_export_targets_routetarget_id_8d9319f7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_routetarget_id_8d9319f7 ON public.ipam_vrf_export_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_export_targets_vrf_id_6f4875c4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_export_targets_vrf_id_6f4875c4 ON public.ipam_vrf_export_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_import_targets_routetarget_id_0e05b144; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_routetarget_id_0e05b144 ON public.ipam_vrf_import_targets USING btree (routetarget_id);


--
-- Name: ipam_vrf_import_targets_vrf_id_ed491b19; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_import_targets_vrf_id_ed491b19 ON public.ipam_vrf_import_targets USING btree (vrf_id);


--
-- Name: ipam_vrf_rd_0ac1bde1_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_rd_0ac1bde1_like ON public.ipam_vrf USING btree (rd varchar_pattern_ops);


--
-- Name: ipam_vrf_tenant_id_498b0051; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_tenant_id_498b0051 ON public.ipam_vrf USING btree (tenant_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: tenancy_tenant_group_id_7daef6f4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_group_id_7daef6f4 ON public.tenancy_tenant USING btree (group_id);


--
-- Name: tenancy_tenant_name_f6e5b2f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_name_f6e5b2f5_like ON public.tenancy_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenant_slug_0716575e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_slug_0716575e_like ON public.tenancy_tenant USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_name_53363199_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_name_53363199_like ON public.tenancy_tenantgroup USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_parent_id_2542fc18; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_parent_id_2542fc18 ON public.tenancy_tenantgroup USING btree (parent_id);


--
-- Name: tenancy_tenantgroup_slug_e2af1cb6_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_slug_e2af1cb6_like ON public.tenancy_tenantgroup USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_tree_id_769a98bf; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_tree_id_769a98bf ON public.tenancy_tenantgroup USING btree (tree_id);


--
-- Name: users_objectpermission_groups_group_id_fb7ba6e0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_group_id_fb7ba6e0 ON public.users_objectpermission_groups USING btree (group_id);


--
-- Name: users_objectpermission_groups_objectpermission_id_2f7cc117; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_groups_objectpermission_id_2f7cc117 ON public.users_objectpermission_groups USING btree (objectpermission_id);


--
-- Name: users_objectpermission_obj_objectpermission_id_38c7d8f5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_obj_objectpermission_id_38c7d8f5 ON public.users_objectpermission_object_types USING btree (objectpermission_id);


--
-- Name: users_objectpermission_object_types_contenttype_id_594b1cc7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_object_types_contenttype_id_594b1cc7 ON public.users_objectpermission_object_types USING btree (contenttype_id);


--
-- Name: users_objectpermission_users_objectpermission_id_78a9c2e6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_objectpermission_id_78a9c2e6 ON public.users_objectpermission_users USING btree (objectpermission_id);


--
-- Name: users_objectpermission_users_user_id_16c0905d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_objectpermission_users_user_id_16c0905d ON public.users_objectpermission_users USING btree (user_id);


--
-- Name: users_token_key_820deccd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_key_820deccd_like ON public.users_token USING btree (key varchar_pattern_ops);


--
-- Name: users_token_user_id_af964690; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_user_id_af964690 ON public.users_token USING btree (user_id);


--
-- Name: virtualization_cluster_group_id_de379828; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_group_id_de379828 ON public.virtualization_cluster USING btree (group_id);


--
-- Name: virtualization_cluster_name_1b59a61b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_name_1b59a61b_like ON public.virtualization_cluster USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_cluster_site_id_4d5af282; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_site_id_4d5af282 ON public.virtualization_cluster USING btree (site_id);


--
-- Name: virtualization_cluster_tenant_id_bc2868d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_tenant_id_bc2868d0 ON public.virtualization_cluster USING btree (tenant_id);


--
-- Name: virtualization_cluster_type_id_4efafb0a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_type_id_4efafb0a ON public.virtualization_cluster USING btree (type_id);


--
-- Name: virtualization_clustergroup_name_4fcd26b4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_name_4fcd26b4_like ON public.virtualization_clustergroup USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustergroup_slug_57ca1d23_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_slug_57ca1d23_like ON public.virtualization_clustergroup USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_clustertype_name_ea854d3d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_name_ea854d3d_like ON public.virtualization_clustertype USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustertype_slug_8ee4d0e0_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_slug_8ee4d0e0_like ON public.virtualization_clustertype USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_cluster_id_6c9f9047; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_cluster_id_6c9f9047 ON public.virtualization_virtualmachine USING btree (cluster_id);


--
-- Name: virtualization_virtualmachine_platform_id_a6c5ccb2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_platform_id_a6c5ccb2 ON public.virtualization_virtualmachine USING btree (platform_id);


--
-- Name: virtualization_virtualmachine_role_id_0cc898f9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_role_id_0cc898f9 ON public.virtualization_virtualmachine USING btree (role_id);


--
-- Name: virtualization_virtualmachine_tenant_id_d00d1d77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_tenant_id_d00d1d77 ON public.virtualization_virtualmachine USING btree (tenant_id);


--
-- Name: virtualization_vminterface_parent_id_f86958e1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_parent_id_f86958e1 ON public.virtualization_vminterface USING btree (parent_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vlan_id_4e77411e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vlan_id_4e77411e ON public.virtualization_vminterface_tagged_vlans USING btree (vlan_id);


--
-- Name: virtualization_vminterface_tagged_vlans_vminterface_id_904b12de; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_tagged_vlans_vminterface_id_904b12de ON public.virtualization_vminterface_tagged_vlans USING btree (vminterface_id);


--
-- Name: virtualization_vminterface_untagged_vlan_id_aea4fc69; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_untagged_vlan_id_aea4fc69 ON public.virtualization_vminterface USING btree (untagged_vlan_id);


--
-- Name: virtualization_vminterface_virtual_machine_id_e9f89829; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_vminterface_virtual_machine_id_e9f89829 ON public.virtualization_vminterface USING btree (virtual_machine_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_provider_id_d9195418_fk_circuits_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_d9195418_fk_circuits_provider_id FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_a_id_f891adac_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_a_id_f891adac_fk_circuits_ FOREIGN KEY (termination_a_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_termination_z_id_377b8551_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_termination_z_id_377b8551_fk_circuits_ FOREIGN KEY (termination_z_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id FOREIGN KEY (type_id) REFERENCES public.circuits_circuittype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm__cable_peer_type_id_bd122156_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_circuit_id_257e87e7_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_circuit_id_257e87e7_fk_circuits_ FOREIGN KEY (circuit_id) REFERENCES public.circuits_circuit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_provider_network_id_b0c660f1_fk_circuits_ FOREIGN KEY (provider_network_id) REFERENCES public.circuits_providernetwork(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_providernetwork circuits_providernet_provider_id_7992236c_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_providernetwork
    ADD CONSTRAINT circuits_providernet_provider_id_7992236c_fk_circuits_ FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id FOREIGN KEY (_termination_a_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id FOREIGN KEY (_termination_b_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_a_type_i_a614bab8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_i_a614bab8_fk_django_co FOREIGN KEY (termination_a_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_b_type_i_a91595d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_i_a91595d0_fk_django_co FOREIGN KEY (termination_b_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_destination_type_id_a8c1654b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_destination_type_id_a8c1654b_fk_django_co FOREIGN KEY (destination_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cablepath dcim_cablepath_origin_type_id_6de54f6d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cablepath
    ADD CONSTRAINT dcim_cablepath_origin_type_id_6de54f6d_fk_django_co FOREIGN KEY (origin_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__cable_peer_type_id_52adb1be_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport__path_id_e40a4436_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverpo__cable_peer_type_id_132b6744_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport__path_id_dc5abe09_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id FOREIGN KEY (device_role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_location_id_11a7bedb_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_location_id_11a7bedb_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_platform_id_468138f1_fk_dcim_platform_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_platform_id_468138f1_fk_dcim_platform_id FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_rack_id_23bde71f_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_23bde71f_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_site_id_ff897cf6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_ff897cf6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt FOREIGN KEY (virtual_chassis_id) REFERENCES public.dcim_virtualchassis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id FOREIGN KEY (installed_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebaytemplate dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport__cable_peer_type_id_c4690f56_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_device_id_950557b5_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_950557b5_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__cable_peer_type_id_ce52cb81_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__path_id_f8f4f7f0_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_cable_id_1b264edb_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_cable_id_1b264edb_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_device_id_359c6115_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_359c6115_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id FOREIGN KEY (lag_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_parent_id_3e2b159b_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_parent_id_3e2b159b_fk_dcim_interface_id FOREIGN KEY (parent_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_parent_id_d77f3318_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_parent_id_d77f3318_fk_dcim_location_id FOREIGN KEY (parent_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_location dcim_location_site_id_b55e975f_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_location
    ADD CONSTRAINT dcim_location_site_id_b55e975f_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_platform dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__cable_peer_type_id_9f930589_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed__path_id_a1ea1f28_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id FOREIGN KEY (power_panel_id) REFERENCES public.dcim_powerpanel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__cable_peer_type_id_bbff28d0_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet__path_id_cbb47bb9_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_location_id_474b60f8_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__cable_peer_type_id_9df2a278_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__path_id_9fe4af8f_fk_dcim_cablepath_id FOREIGN KEY (_path_id) REFERENCES public.dcim_cablepath(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_device_id_ef7185ae_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_ef7185ae_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_location_id_5f63ec31_fk_dcim_location_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_location_id_5f63ec31_fk_dcim_location_id FOREIGN KEY (location_id) REFERENCES public.dcim_location(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id FOREIGN KEY (role_id) REFERENCES public.dcim_rackrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_site_id_403c7b3a_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_403c7b3a_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_user_id_0785a527_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_user_id_0785a527_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport__cable_peer_type_id_cecf241c_fk_django_co FOREIGN KEY (_cable_peer_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_region dcim_region_parent_id_2486f5d4_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_id_2486f5d4_fk_dcim_region_id FOREIGN KEY (parent_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_group_id_3910c975_fk_dcim_sitegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_group_id_3910c975_fk_dcim_sitegroup_id FOREIGN KEY (group_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_region_id_45210932_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_region_id_45210932_fk_dcim_region_id FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_sitegroup dcim_sitegroup_parent_id_533a5e44_fk_dcim_sitegroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_sitegroup
    ADD CONSTRAINT dcim_sitegroup_parent_id_533a5e44_fk_dcim_sitegroup_id FOREIGN KEY (parent_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id FOREIGN KEY (master_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_cluster_id_6abd47a1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_cluster_id_6abd47a1_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_clustergroup_id_f4322ce8_fk_virtualiz FOREIGN KEY (clustergroup_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_configcontext_id_2a516699_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_configcontext_id_2a516699_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_site_groups extras_configcontext_configcontext_id_2e0f43cb_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_2e0f43cb_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_configcontext_id_55632923_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_configcontext_id_55632923_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_configcontext_id_59b67386_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_configcontext_id_59b67386_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_configcontext_id_64a392b1_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_configcontext_id_64a392b1_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_configcontext_id_73003dbc_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_configcontext_id_73003dbc_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_configcontext_id_8c54feb9_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_configcontext_id_8c54feb9_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_cluster_groups extras_configcontext_configcontext_id_8f50b794_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_cluster_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_8f50b794_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_configcontext_id_92f68345_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_92f68345_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_configcontext_id_b53552a6_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_configcontext_id_b53552a6_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_clusters extras_configcontext_configcontext_id_ed579a40_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_clusters
    ADD CONSTRAINT extras_configcontext_configcontext_id_ed579a40_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi FOREIGN KEY (devicerole_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_device_types extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_device_types
    ADD CONSTRAINT extras_configcontext_devicetype_id_b8788c2d_fk_dcim_devi FOREIGN KEY (devicetype_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_region_id_35c6ba9d_fk_dcim_regi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_region_id_35c6ba9d_fk_dcim_regi FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_site_groups extras_configcontext_sitegroup_id_3287c9e7_fk_dcim_site; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_site_groups
    ADD CONSTRAINT extras_configcontext_sitegroup_id_3287c9e7_fk_dcim_site FOREIGN KEY (sitegroup_id) REFERENCES public.dcim_sitegroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tags extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tags
    ADD CONSTRAINT extras_configcontext_tags_tag_id_129a5d87_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t FOREIGN KEY (tenantgroup_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_contenttype_id_2997ba90_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_contenttype_id_2997ba90_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_content_types extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_content_types
    ADD CONSTRAINT extras_customfield_c_customfield_id_3842aaf3_fk_extras_cu FOREIGN KEY (customfield_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customlink extras_customlink_content_type_id_4d35b063_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_content_type_id_4d35b063_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate extras_exporttemplat_content_type_id_59737e21_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplat_content_type_id_59737e21_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_imageattachment extras_imageattachme_content_type_id_90e0643d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachme_content_type_id_90e0643d_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_obj_type_id_475e80aa_fk_django_content_type_id FOREIGN KEY (obj_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_jobresult extras_jobresult_user_id_d35285ab_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_jobresult
    ADD CONSTRAINT extras_jobresult_user_id_d35285ab_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_journalentry extras_journalentry_assigned_object_type_1bba9f68_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_assigned_object_type_1bba9f68_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_journalentry extras_journalentry_created_by_id_8d4e4329_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_journalentry
    ADD CONSTRAINT extras_journalentry_created_by_id_8d4e4329_fk_auth_user_id FOREIGN KEY (created_by_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_changed_object_type__b755bb60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_changed_object_type__b755bb60_fk_django_co FOREIGN KEY (changed_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_related_object_type__fe6e521f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_related_object_type__fe6e521f_fk_django_co FOREIGN KEY (related_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_user_id_7fdf8186_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_user_id_7fdf8186_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_content_type_id_ba5562ed_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_content_type_id_ba5562ed_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_contenttype_id_3fc2c4d3_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_content_types extras_webhook_conte_webhook_id_0c169800_fk_extras_we; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_content_types
    ADD CONSTRAINT extras_webhook_conte_webhook_id_0c169800_fk_extras_we FOREIGN KEY (webhook_id) REFERENCES public.extras_webhook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_tenant_id_637dd1a1_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_assigned_object_type_02354370_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_assigned_object_type_02354370_fk_django_co FOREIGN KEY (assigned_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id FOREIGN KEY (nat_inside_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_role_id_2782e864_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_role_id_2782e864_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_tenant_id_856027ea_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_tenant_id_856027ea_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_iprange ipam_iprange_vrf_id_613e9dd2_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_iprange
    ADD CONSTRAINT ipam_iprange_vrf_id_613e9dd2_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_role_id_0a98d415_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_role_id_0a98d415_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_site_id_0b20df05_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_site_id_0b20df05_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_routetarget ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_routetarget
    ADD CONSTRAINT ipam_routetarget_tenant_id_5a0b35e8_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_device_id_b4d2bb9c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_device_id_b4d2bb9c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad FOREIGN KEY (ipaddress_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id FOREIGN KEY (service_id) REFERENCES public.ipam_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_virtual_machine_id_e8b53562_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_virtual_machine_id_e8b53562_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_vlangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_role_id_f5015962_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_role_id_f5015962_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_site_id_a59334e3_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_site_id_a59334e3_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_scope_type_id_6606a755_fk_django_content_type_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_scope_type_id_6606a755_fk_django_content_type_id FOREIGN KEY (scope_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targ_routetarget_id_8d9319f7_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_export_targets ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_export_targets
    ADD CONSTRAINT ipam_vrf_export_targets_vrf_id_6f4875c4_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targ_routetarget_id_0e05b144_fk_ipam_rout FOREIGN KEY (routetarget_id) REFERENCES public.ipam_routetarget(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf_import_targets ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf_import_targets
    ADD CONSTRAINT ipam_vrf_import_targets_vrf_id_ed491b19_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenant tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_parent_id_2542fc18_fk_tenancy_t FOREIGN KEY (parent_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_contenttype_id_594b1cc7_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_contenttype_id_594b1cc7_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_group_id_fb7ba6e0_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_groups users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_groups
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_2f7cc117_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_object_types users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_object_types
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_38c7d8f5_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermissi_objectpermission_id_78a9c2e6_fk_users_obj FOREIGN KEY (objectpermission_id) REFERENCES public.users_objectpermission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_objectpermission_users users_objectpermission_users_user_id_16c0905d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_objectpermission_users
    ADD CONSTRAINT users_objectpermission_users_user_id_16c0905d_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_token users_token_user_id_af964690_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_user_id_af964690_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_userconfig users_userconfig_user_id_afd44184_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_userconfig
    ADD CONSTRAINT users_userconfig_user_id_afd44184_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_group_id_de379828_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_group_id_de379828_fk_virtualiz FOREIGN KEY (group_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_type_id_4efafb0a_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_type_id_4efafb0a_fk_virtualiz FOREIGN KEY (type_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_site_id_4d5af282_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_4d5af282_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_tenant_id_bc2868d0_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_role_id_0cc898f9_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_role_id_0cc898f9_fk_dcim_devi FOREIGN KEY (role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_parent_id_f86958e1_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_parent_id_f86958e1_fk_virtualiz FOREIGN KEY (parent_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_untagged_vlan_id_aea4fc69_fk_ipam_vlan FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface
    ADD CONSTRAINT virtualization_vmint_virtual_machine_id_e9f89829_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vlan_id_4e77411e_fk_ipam_vlan FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_vminterface_tagged_vlans virtualization_vmint_vminterface_id_904b12de_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_vminterface_tagged_vlans
    ADD CONSTRAINT virtualization_vmint_vminterface_id_904b12de_fk_virtualiz FOREIGN KEY (vminterface_id) REFERENCES public.virtualization_vminterface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

