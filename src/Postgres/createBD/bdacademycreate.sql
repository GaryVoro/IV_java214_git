CREATE DATABASE Academy
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1 	-- снять ограничение на количество подключений
    IS_TEMPLATE = False;	-- без исопльзования шаблона

-- DROP TABLE IF EXISTS public."Teachers";
DROP TABLE IF EXISTS Teachers;
CREATE TABLE Teachers
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL CHECK (TRIM (name) != ''),
    surname character varying(50) COLLATE pg_catalog."default" NOT NULL,
	premium money NOT NULL CHECK (premium > 0::money) default 0,
    salary numeric(10,4) NOT NULL CHECK (salary > 0::numeric),
    emplayment_date date NOT NULL,
    CONSTRAINT "Teachers_pkey" PRIMARY KEY (id),
    CONSTRAINT "Teachers_emplayment_date_check" CHECK (emplayment_date > '1990-10-10'::date)
)

WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

--***************************************************************************************************
	DROP TABLE IF EXISTS Groups;
	CREATE TABLE Groups
(
    id integer NOT NULL,
    name 		character varying(10) COLLATE pg_catalog."default" NOT NULL UNIQUE CHECK (TRIM(name)!=''),
	raiting		integer NOT NULL CHECK (raiting >= 0 AND raiting <= 5),
	course		integer NOT NULL CHECK (course >= 1 AND raiting <= 5),
    CONSTRAINT "Groups_pkey" PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE Groups
    OWNER to postgres;
--***************************************************************************************************
	DROP TABLE IF EXISTS Departaments;
	CREATE TABLE Departaments
(
    id SERIAL  PRIMARY KEY,
    name 		character varying(10) COLLATE pg_catalog."default" NOT NULL UNIQUE CHECK (TRIM(name)!=''),
	financing	money NOT NULL  DEFAULT 0 CHECK(financing > 0::money)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE Departaments
    OWNER to postgres;
--***************************************************************************************************
	DROP TABLE IF EXISTS Faculties;
	CREATE TABLE Faculties
(
    id SERIAL  PRIMARY KEY,
    name 		character varying(10) COLLATE pg_catalog."default" NOT NULL UNIQUE CHECK (TRIM(name)!='')
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE Faculties
    OWNER to postgres;
--***************************************************************************************************
--***************************************************************************************************
-- изменить условие в таблице

ALTER TABLE Teachers DROP CONSTRAINT Teachers_emplayment_date_check;
ALTER TABLE Teachers ADD CONSTRAINT Teachers_emplayment_date_check CHECK (emplayment_date > '1990-01-01'::date);