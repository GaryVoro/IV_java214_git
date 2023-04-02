--************************** ИМЕНА и НАЗВАНИЯ БЕЗ КАВЫЧЕК *************************************************************************************
CREATE DATABASE Academy
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1 	-- снять ограничение на количество подключений
    IS_TEMPLATE = False;	-- без исопльзования шаблона

-- Teachers ***************************************************************************************************
-- DROP TABLE IF EXISTS public."Teachers";
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers
(
    id					SERIAL NOT NULL,
	emplayment_date		date NOT NULL,
	is_assistant		smallint NOT NULL DEFAULT 0,
	is_professor		smallint NOT NULL DEFAULT 0,
    name 				text COLLATE pg_catalog."default" NOT NULL CHECK (BTRIM (name) != ''),
	position_d			text COLLATE pg_catalog."default" NOT NULL CHECK (BTRIM (position_d) != ''),
	premium				money NOT NULL CHECK (premium > 0::money) default 0,
    salary				money NOT NULL CHECK (salary > 0::numeric),
	surname				character varying(50) COLLATE pg_catalog."default" NOT NULL CHECK (BTRIM (surname) != ''),
    CONSTRAINT "Teachers_pkey" PRIMARY KEY (id),
    CONSTRAINT "Teachers_emplayment_date_check" CHECK (emplayment_date > '1990-01-01'::date)
)

WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
INSERT INTO public.teachers (emplayment_date, is_assistant, is_professor, name, position_d, premium, salary, surname) VALUES
							('2011-10-10', 1, 0, 'Сергей Павлович', 'старший преподаватель', '100,00 ?', 240.0000,	'Коновалов'),
							('2012-10-10', 1, 0, 'Григорий Петрович', 'преподаватель', 		'120,00 ?', 250.0000,	'Мировицкий'),
							('2013-10-10', 0, 1, 'Игорь Викторович', 'доцент', 				'150,00 ?', 300.0000,	'Багрянцев'),
							('2014-10-10', 1, 0, 'Лариса Петровна', 'заведующая кафедрой', 	'250,00 ?', 250.0000,	'Петрова');

-- groups ***************************************************************************************************
	DROP TABLE IF EXISTS groups;
	CREATE TABLE groups
(
    id 			SERIAL PRIMARY KEY,
    name 		character varying(10) COLLATE pg_catalog."default" NOT NULL UNIQUE CHECK (TRIM(name)!=''),
	raiting		integer NOT NULL CHECK (raiting >= 0 AND raiting <= 5),
	course		integer NOT NULL CHECK (course >= 1 AND raiting <= 5)
    --CONSTRAINT "groups_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE groups
    OWNER to postgres;

	INSERT INTO public.groups(name, raiting, course) VALUES ('150А', 2, 1);
	INSERT INTO public.groups(name, raiting, course) VALUES ('160А', 2, 4);
	INSERT INTO public.groups(name, raiting, course) VALUES ('170А', 4, 4);
	INSERT INTO public.groups(name, raiting, course) VALUES ('250А', 3, 3);
	INSERT INTO public.groups(name, raiting, course) VALUES ('250Б', 4, 3);
	INSERT INTO public.groups(name, raiting, course) VALUES ('250Г', 5, 5);

--  departments  ***************************************************************************************************
	DROP TABLE IF EXISTS departments;
	CREATE TABLE departments
(
    id SERIAL  	PRIMARY KEY,
    name 		character varying(150) COLLATE pg_catalog."default" NOT NULL UNIQUE CHECK (TRIM(name)!=''),
	financing	money NOT NULL  DEFAULT 0 CHECK(financing > 0::money)
)

WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE departaments
    OWNER to postgres;

-- создание таблицы с первичным автоинкрементным ключом
CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    financing money DEFAULT 0 NOT NULL,
    CONSTRAINT departments_financing_check CHECK ((financing > (0)::money)),
    CONSTRAINT departments_name_check CHECK ((btrim((name)::text) <> ''::text))
);
ALTER TABLE public.departments OWNER TO postgres;
CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER TABLE public.departments_id_seq OWNER TO postgres;
ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;
ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);
-- конец создание таблицы с первичным автоинкрементным ключом

INSERT INTO public.departments (id, name, financing) VALUES (1, 'Биологии', '100 000,25 ?');
INSERT INTO public.departments (id, name, financing) VALUES (2, 'Химии', '15 000,34 ?');
INSERT INTO public.departments (id, name, financing) VALUES (3, 'Математики', '12 000,355 ?');
INSERT INTO public.departments (id, name, financing) VALUES (4, 'Истории', '15 500,2 ?');
INSERT INTO public.departments (id, name, financing) VALUES (5, 'Философии', '12 500,2 ?');

--  faculties   ***************************************************************************************************
	DROP TABLE IF EXISTS faculties;
	CREATE TABLE faculties
(
    id 			SERIAL	PRIMARY KEY NOT NULL,
	dean 		text COLLATE pg_catalog."default" NOT NULL CHECK (BTRIM(dean)!=''),
    name 		character varying(100) COLLATE pg_catalog."default" NOT NULL UNIQUE CHECK (BTRIM(name)!='')
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE faculties
    OWNER to postgres;

INSERT INTO public.faculties (dean, name) VALUES
 ('Коновалов С.П.', 'философский'),
 ('Мировицкий Г.П.', 'математический'),
 ('Мировицкий Г.П.', 'прикладной математики'),
 ('Багрянцев И.В.', 'исторический'),
 ('Петрова Л.П.', 'органическая химия');