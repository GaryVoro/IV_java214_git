-- Копия БД Academy
-- PostgreSQL database dump
--

-- Dumped from database version 10.23
-- Dumped by pg_dump version 13.1

-- Started on 2023-04-10 08:27:19

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

--
-- TOC entry 205 (class 1259 OID 17068)
-- Name: curators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curators (
    id integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    CONSTRAINT curators_name_check CHECK ((btrim(name) <> ''::text)),
    CONSTRAINT curators_surname_check CHECK ((btrim(surname) <> ''::text))
);


ALTER TABLE public.curators OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 17066)
-- Name: curators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.curators_id_seq OWNER TO postgres;

--
-- TOC entry 2933 (class 0 OID 0)
-- Dependencies: 204
-- Name: curators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curators_id_seq OWNED BY public.curators.id;


--
-- TOC entry 197 (class 1259 OID 16910)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    financing money DEFAULT 0 NOT NULL,
    faculty_id integer DEFAULT 0 NOT NULL,
    CONSTRAINT departments_financing_check CHECK ((financing > (0)::money)),
    CONSTRAINT departments_name_check CHECK ((btrim((name)::text) <> ''::text))
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16908)
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO postgres;

--
-- TOC entry 2934 (class 0 OID 0)
-- Dependencies: 196
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 201 (class 1259 OID 16964)
-- Name: faculties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculties (
    id integer NOT NULL,
    dean text NOT NULL,
    name character varying(100) NOT NULL,
    financing money DEFAULT 0 NOT NULL,
    CONSTRAINT faculties_dean_check CHECK ((btrim(dean) <> ''::text)),
    CONSTRAINT faculties_name_check CHECK ((btrim((name)::text) <> ''::text))
);


ALTER TABLE public.faculties OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16962)
-- Name: faculties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faculties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faculties_id_seq OWNER TO postgres;

--
-- TOC entry 2935 (class 0 OID 0)
-- Dependencies: 200
-- Name: faculties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faculties_id_seq OWNED BY public.faculties.id;


--
-- TOC entry 199 (class 1259 OID 16948)
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(10) NOT NULL,
    raiting integer NOT NULL,
    course integer NOT NULL,
    department_id integer DEFAULT 0 NOT NULL,
    CONSTRAINT groups_check CHECK (((course >= 1) AND (raiting <= 5))),
    CONSTRAINT groups_name_check CHECK ((btrim((name)::text) <> ''::text)),
    CONSTRAINT groups_raiting_check CHECK (((raiting >= 0) AND (raiting <= 5)))
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 17121)
-- Name: groups_curators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups_curators (
    id integer NOT NULL,
    curator_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.groups_curators OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 17119)
-- Name: groups_curators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_curators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_curators_id_seq OWNER TO postgres;

--
-- TOC entry 2936 (class 0 OID 0)
-- Dependencies: 206
-- Name: groups_curators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_curators_id_seq OWNED BY public.groups_curators.id;


--
-- TOC entry 198 (class 1259 OID 16946)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- TOC entry 2937 (class 0 OID 0)
-- Dependencies: 198
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;


--
-- TOC entry 213 (class 1259 OID 17185)
-- Name: groups_lectures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.groups_lectures (
    id integer NOT NULL,
    group_id integer NOT NULL,
    lectured_id integer NOT NULL
);


ALTER TABLE public.groups_lectures OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17183)
-- Name: groups_lectures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.groups_lectures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_lectures_id_seq OWNER TO postgres;

--
-- TOC entry 2938 (class 0 OID 0)
-- Dependencies: 212
-- Name: groups_lectures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.groups_lectures_id_seq OWNED BY public.groups_lectures.id;


--
-- TOC entry 211 (class 1259 OID 17150)
-- Name: lectures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lectures (
    id integer NOT NULL,
    lecture_room text NOT NULL,
    subject_id integer NOT NULL,
    teacher_id integer NOT NULL,
    CONSTRAINT lecture_lecture_room_check CHECK ((btrim(lecture_room) <> ''::text))
);


ALTER TABLE public.lectures OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17148)
-- Name: lecture_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lecture_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lecture_id_seq OWNER TO postgres;

--
-- TOC entry 2939 (class 0 OID 0)
-- Dependencies: 210
-- Name: lecture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lecture_id_seq OWNED BY public.lectures.id;


--
-- TOC entry 209 (class 1259 OID 17139)
-- Name: subject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subject (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    CONSTRAINT subject_name_check CHECK ((btrim((name)::text) <> ''::text))
);


ALTER TABLE public.subject OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 17137)
-- Name: subject_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.subject_id_seq OWNER TO postgres;

--
-- TOC entry 2940 (class 0 OID 0)
-- Dependencies: 208
-- Name: subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subject_id_seq OWNED BY public.subject.id;


--
-- TOC entry 203 (class 1259 OID 17035)
-- Name: teachers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    emplayment_date date NOT NULL,
    is_assistant smallint DEFAULT 0 NOT NULL,
    is_professor smallint DEFAULT 0 NOT NULL,
    name text NOT NULL,
    position_d text NOT NULL,
    premium money DEFAULT 0 NOT NULL,
    salary numeric(10,4) NOT NULL,
    surname character varying(50) NOT NULL,
    CONSTRAINT "Teachers_emplayment_date_check" CHECK ((emplayment_date > '1990-01-01'::date)),
    CONSTRAINT teachers_name_check CHECK ((btrim(name) <> ''::text)),
    CONSTRAINT teachers_position_d_check CHECK ((btrim(position_d) <> ''::text)),
    CONSTRAINT teachers_premium_check CHECK ((premium > (0)::money)),
    CONSTRAINT teachers_salary_check CHECK ((salary > (0)::numeric)),
    CONSTRAINT teachers_surname_check CHECK ((btrim((surname)::text) <> ''::text))
);


ALTER TABLE public.teachers OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 17033)
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO postgres;

--
-- TOC entry 2941 (class 0 OID 0)
-- Dependencies: 202
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- TOC entry 2746 (class 2604 OID 17071)
-- Name: curators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curators ALTER COLUMN id SET DEFAULT nextval('public.curators_id_seq'::regclass);


--
-- TOC entry 2723 (class 2604 OID 16913)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 2733 (class 2604 OID 16967)
-- Name: faculties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties ALTER COLUMN id SET DEFAULT nextval('public.faculties_id_seq'::regclass);


--
-- TOC entry 2728 (class 2604 OID 16951)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);


--
-- TOC entry 2749 (class 2604 OID 17124)
-- Name: groups_curators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_curators ALTER COLUMN id SET DEFAULT nextval('public.groups_curators_id_seq'::regclass);


--
-- TOC entry 2754 (class 2604 OID 17188)
-- Name: groups_lectures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_lectures ALTER COLUMN id SET DEFAULT nextval('public.groups_lectures_id_seq'::regclass);


--
-- TOC entry 2752 (class 2604 OID 17153)
-- Name: lectures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures ALTER COLUMN id SET DEFAULT nextval('public.lecture_id_seq'::regclass);


--
-- TOC entry 2750 (class 2604 OID 17142)
-- Name: subject id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject ALTER COLUMN id SET DEFAULT nextval('public.subject_id_seq'::regclass);


--
-- TOC entry 2736 (class 2604 OID 17038)
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- TOC entry 2919 (class 0 OID 17068)
-- Dependencies: 205
-- Data for Name: curators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.curators (id, name, surname) FROM stdin;
1	Сергей Павлович	Коновалов
2	Григорий Петрович	Мировицкий
3	Игорь Викторович	Багрянцев
4	Лариса Петровна	Петрова
5	Светлана Юрьевна	Карандашина
\.


--
-- TOC entry 2911 (class 0 OID 16910)
-- Dependencies: 197
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, name, financing, faculty_id) FROM stdin;
3	Математики	12 000,36 ?	2
4	Истории	15 500,20 ?	4
2	Химии	15 000,34 ?	5
5	Философии	21 000,22 ?	1
1	Биологии	10 000,25 ?	5
\.


--
-- TOC entry 2915 (class 0 OID 16964)
-- Dependencies: 201
-- Data for Name: faculties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculties (id, dean, name, financing) FROM stdin;
1	Коновалов С.П.	философский	11 000,00 ?
2	Мировицкий Г.П.	математический	12 000,00 ?
3	Мировицкий Г.П.	прикладной математики	12 500,00 ?
4	Багрянцев И.В.	исторический	16 000,00 ?
5	Петрова Л.П.	органическая химия	14 000,00 ?
\.


--
-- TOC entry 2913 (class 0 OID 16948)
-- Dependencies: 199
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups (id, name, raiting, course, department_id) FROM stdin;
3	170А	4	4	1
4	250А	3	3	1
5	250Б	4	3	2
6	250Г	5	5	3
1	150А	1	1	3
7	150Б	1	2	4
2	160А	2	5	5
\.


--
-- TOC entry 2921 (class 0 OID 17121)
-- Dependencies: 207
-- Data for Name: groups_curators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups_curators (id, curator_id, group_id) FROM stdin;
1	1	1
2	2	2
3	3	3
4	4	7
\.


--
-- TOC entry 2927 (class 0 OID 17185)
-- Dependencies: 213
-- Data for Name: groups_lectures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.groups_lectures (id, group_id, lectured_id) FROM stdin;
1	1	1
2	2	1
3	3	2
4	4	3
6	6	5
\.


--
-- TOC entry 2925 (class 0 OID 17150)
-- Dependencies: 211
-- Data for Name: lectures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lectures (id, lecture_room, subject_id, teacher_id) FROM stdin;
1	12	1	1
2	14	2	1
3	16	3	3
4	12	4	4
5	22	2	5
\.


--
-- TOC entry 2923 (class 0 OID 17139)
-- Dependencies: 209
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subject (id, name) FROM stdin;
1	Мат анализ
2	Теория БД
3	Информатика
4	Углеводороды
\.


--
-- TOC entry 2917 (class 0 OID 17035)
-- Dependencies: 203
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers (id, emplayment_date, is_assistant, is_professor, name, position_d, premium, salary, surname) FROM stdin;
3	2013-10-10	0	1	Игорь Викторович	доцент	150,00 ?	300.0000	Багрянцев
2	2012-10-10	1	0	Григорий Петрович	преподаватель	120,00 ?	250.0000	Мировицкий
1	2011-10-10	1	0	Сергей Павлович	старший преподаватель	100,00 ?	240.0000	Коновалов
4	2014-10-10	1	0	Лариса Петровна	заведующая кафедрой	250,00 ?	250.0000	Петрова
5	2014-11-11	0	0	Samantha	преподаватель	100,00 ?	250.0000	Adams
\.


--
-- TOC entry 2942 (class 0 OID 0)
-- Dependencies: 204
-- Name: curators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curators_id_seq', 5, true);


--
-- TOC entry 2943 (class 0 OID 0)
-- Dependencies: 196
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 5, true);


--
-- TOC entry 2944 (class 0 OID 0)
-- Dependencies: 200
-- Name: faculties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faculties_id_seq', 5, true);


--
-- TOC entry 2945 (class 0 OID 0)
-- Dependencies: 206
-- Name: groups_curators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_curators_id_seq', 4, true);


--
-- TOC entry 2946 (class 0 OID 0)
-- Dependencies: 198
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_id_seq', 7, true);


--
-- TOC entry 2947 (class 0 OID 0)
-- Dependencies: 212
-- Name: groups_lectures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.groups_lectures_id_seq', 6, true);


--
-- TOC entry 2948 (class 0 OID 0)
-- Dependencies: 210
-- Name: lecture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lecture_id_seq', 5, true);


--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 208
-- Name: subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subject_id_seq', 4, true);


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 202
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_id_seq', 5, true);


--
-- TOC entry 2768 (class 2606 OID 17052)
-- Name: teachers Teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT "Teachers_pkey" PRIMARY KEY (id);


--
-- TOC entry 2770 (class 2606 OID 17078)
-- Name: curators curators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curators
    ADD CONSTRAINT curators_pkey PRIMARY KEY (id);


--
-- TOC entry 2756 (class 2606 OID 16920)
-- Name: departments departments_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_name_key UNIQUE (name);


--
-- TOC entry 2758 (class 2606 OID 16918)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 16978)
-- Name: faculties faculties_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_name_key UNIQUE (name);


--
-- TOC entry 2766 (class 2606 OID 16974)
-- Name: faculties faculties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 17126)
-- Name: groups_curators groups_curators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_curators
    ADD CONSTRAINT groups_curators_pkey PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 17190)
-- Name: groups_lectures groups_lectures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_lectures
    ADD CONSTRAINT groups_lectures_pkey PRIMARY KEY (id);


--
-- TOC entry 2760 (class 2606 OID 16958)
-- Name: groups groups_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_name_key UNIQUE (name);


--
-- TOC entry 2762 (class 2606 OID 16956)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 17159)
-- Name: lectures lecture_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lecture_pkey PRIMARY KEY (id);


--
-- TOC entry 2774 (class 2606 OID 17147)
-- Name: subject subject_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_name_key UNIQUE (name);


--
-- TOC entry 2776 (class 2606 OID 17145)
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 17228)
-- Name: groups foreign_key01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups
    ADD CONSTRAINT foreign_key01 FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- TOC entry 2781 (class 2606 OID 17233)
-- Name: departments foreign_key01; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT foreign_key01 FOREIGN KEY (faculty_id) REFERENCES public.faculties(id);


--
-- TOC entry 2783 (class 2606 OID 17127)
-- Name: groups_curators groups_curators_curator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_curators
    ADD CONSTRAINT groups_curators_curator_id_fkey FOREIGN KEY (curator_id) REFERENCES public.curators(id);


--
-- TOC entry 2784 (class 2606 OID 17132)
-- Name: groups_curators groups_curators_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_curators
    ADD CONSTRAINT groups_curators_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 2787 (class 2606 OID 17191)
-- Name: groups_lectures groups_lectures_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_lectures
    ADD CONSTRAINT groups_lectures_group_id_fkey FOREIGN KEY (group_id) REFERENCES public.groups(id);


--
-- TOC entry 2788 (class 2606 OID 17196)
-- Name: groups_lectures groups_lectures_lectured_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.groups_lectures
    ADD CONSTRAINT groups_lectures_lectured_id_fkey FOREIGN KEY (lectured_id) REFERENCES public.lectures(id);


--
-- TOC entry 2785 (class 2606 OID 17160)
-- Name: lectures lecture_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lecture_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- TOC entry 2786 (class 2606 OID 17165)
-- Name: lectures lecture_teacher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lectures
    ADD CONSTRAINT lecture_teacher_id_fkey FOREIGN KEY (teacher_id) REFERENCES public.teachers(id);


-- Completed on 2023-04-10 08:27:21

--
-- PostgreSQL database dump complete
--

