--
-- PostgreSQL database dump
--

\restrict FUejOxVvwHrZCUepArnCFiMcst6e4KrZQm0OilWm3WwvKjSBo65Yf2dNNhEJZyS

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

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

--
-- Name: drizzle; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA drizzle;


SET default_table_access_method = heap;

--
-- Name: __drizzle_migrations; Type: TABLE; Schema: drizzle; Owner: -
--

CREATE TABLE IF NOT EXISTS drizzle.__drizzle_migrations (
    id integer NOT NULL,
    hash text NOT NULL,
    created_at bigint
);


--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE; Schema: drizzle; Owner: -
--

CREATE SEQUENCE IF NOT EXISTS drizzle.__drizzle_migrations_id_seq
    AS int
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: drizzle; Owner: -
--

ALTER SEQUENCE drizzle.__drizzle_migrations_id_seq OWNED BY drizzle.__drizzle_migrations.id;


--
-- Name: ai_history; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.ai_history (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    action text NOT NULL,
    input_preview text DEFAULT ''::text NOT NULL,
    result text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: app_settings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.app_settings (
    key text NOT NULL,
    value text NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: custom_actions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.custom_actions (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    label text NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    prompt text NOT NULL
);


--
-- Name: djen_clientes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.djen_clientes (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    nome_completo text NOT NULL,
    email text DEFAULT ''::text NOT NULL,
    tratamento text DEFAULT ''::text NOT NULL,
    nome_caso text DEFAULT ''::text NOT NULL,
    numero_processo text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: djen_execucoes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.djen_execucoes (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    status text DEFAULT 'executando'::text NOT NULL,
    total_publicacoes text DEFAULT '0'::text NOT NULL,
    processadas text DEFAULT '0'::text NOT NULL,
    com_erro text DEFAULT '0'::text NOT NULL,
    ignoradas text DEFAULT '0'::text NOT NULL,
    log text DEFAULT ''::text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: djen_publicacoes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.djen_publicacoes (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    execucao_id text DEFAULT ''::text NOT NULL,
    numero_processo text NOT NULL,
    texto text DEFAULT ''::text NOT NULL,
    inicio_sessao text DEFAULT ''::text NOT NULL,
    fim_sessao text DEFAULT ''::text NOT NULL,
    prazo_oral text DEFAULT ''::text NOT NULL,
    link_documento text DEFAULT ''::text NOT NULL,
    cliente_id text DEFAULT ''::text NOT NULL,
    cliente_nome text DEFAULT ''::text NOT NULL,
    email_status text DEFAULT 'nao_enviado'::text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: doc_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.doc_templates (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    titulo text NOT NULL,
    categoria text DEFAULT 'Geral'::text NOT NULL,
    conteudo text NOT NULL,
    docx_base64 text,
    docx_filename text
);


--
-- Name: ementas; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.ementas (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    titulo text NOT NULL,
    categoria text DEFAULT 'Geral'::text NOT NULL,
    texto text NOT NULL
);


--
-- Name: processos_monitorados; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.processos_monitorados (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    numero text NOT NULL,
    tribunal text NOT NULL,
    apelido text DEFAULT ''::text NOT NULL,
    classe text DEFAULT ''::text NOT NULL,
    orgao_julgador text DEFAULT ''::text NOT NULL,
    data_ajuizamento text DEFAULT ''::text NOT NULL,
    ultima_movimentacao text DEFAULT ''::text NOT NULL,
    ultima_movimentacao_data text DEFAULT ''::text NOT NULL,
    assuntos text DEFAULT ''::text NOT NULL,
    status text DEFAULT 'ativo'::text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: prompt_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.prompt_templates (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    titulo text NOT NULL,
    categoria text DEFAULT 'Geral'::text NOT NULL,
    texto text NOT NULL
);


--
-- Name: session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.session (
    sid character varying NOT NULL,
    sess json NOT NULL,
    expire timestamp(6) without time zone NOT NULL
);


--
-- Name: shared_pareceres; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.shared_pareceres (
    id character varying NOT NULL,
    html text NOT NULL,
    processo text DEFAULT ''::text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: snippets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.snippets (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    title text DEFAULT 'Untitled'::text NOT NULL,
    html text DEFAULT ''::text NOT NULL,
    css text DEFAULT ''::text NOT NULL,
    js text DEFAULT ''::text NOT NULL,
    mode text DEFAULT 'html'::text NOT NULL
);


--
-- Name: tramitacao_publicacoes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.tramitacao_publicacoes (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    ext_id text NOT NULL,
    idempotency_key text,
    numero_processo text DEFAULT ''::text NOT NULL,
    numero_processo_mascara text DEFAULT ''::text NOT NULL,
    tribunal text DEFAULT ''::text NOT NULL,
    orgao text DEFAULT ''::text NOT NULL,
    classe text DEFAULT ''::text NOT NULL,
    texto text DEFAULT ''::text NOT NULL,
    disponibilizacao_date text DEFAULT ''::text NOT NULL,
    publicacao_date text DEFAULT ''::text NOT NULL,
    inicio_prazo_date text DEFAULT ''::text NOT NULL,
    link_tramitacao text DEFAULT ''::text NOT NULL,
    link_tribunal text DEFAULT ''::text NOT NULL,
    destinatarios text DEFAULT '[]'::text NOT NULL,
    advogados text DEFAULT '[]'::text NOT NULL,
    lida text DEFAULT 'nao'::text NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE IF NOT EXISTS public.users (
    id character varying DEFAULT gen_random_uuid() NOT NULL,
    username text NOT NULL,
    password text NOT NULL
);


--
-- Name: __drizzle_migrations id; Type: DEFAULT; Schema: drizzle; Owner: -
--

ALTER TABLE IF EXISTS ONLY drizzle.__drizzle_migrations ALTER COLUMN id SET DEFAULT nextval('drizzle.__drizzle_migrations_id_seq'::regclass);


--
-- Name: __drizzle_migrations __drizzle_migrations_pkey; Type: CONSTRAINT; Schema: drizzle; Owner: -
--

ALTER TABLE IF EXISTS ONLY drizzle.__drizzle_migrations
    ADD CONSTRAINT __drizzle_migrations_pkey PRIMARY KEY (id);


--
-- Name: ai_history ai_history_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.ai_history
    ADD CONSTRAINT ai_history_pkey PRIMARY KEY (id);


--
-- Name: app_settings app_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.app_settings
    ADD CONSTRAINT app_settings_pkey PRIMARY KEY (key);


--
-- Name: custom_actions custom_actions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.custom_actions
    ADD CONSTRAINT custom_actions_pkey PRIMARY KEY (id);


--
-- Name: djen_clientes djen_clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.djen_clientes
    ADD CONSTRAINT djen_clientes_pkey PRIMARY KEY (id);


--
-- Name: djen_execucoes djen_execucoes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.djen_execucoes
    ADD CONSTRAINT djen_execucoes_pkey PRIMARY KEY (id);


--
-- Name: djen_publicacoes djen_publicacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.djen_publicacoes
    ADD CONSTRAINT djen_publicacoes_pkey PRIMARY KEY (id);


--
-- Name: doc_templates doc_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.doc_templates
    ADD CONSTRAINT doc_templates_pkey PRIMARY KEY (id);


--
-- Name: ementas ementas_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.ementas
    ADD CONSTRAINT ementas_pkey PRIMARY KEY (id);


--
-- Name: processos_monitorados processos_monitorados_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.processos_monitorados
    ADD CONSTRAINT processos_monitorados_pkey PRIMARY KEY (id);


--
-- Name: prompt_templates prompt_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.prompt_templates
    ADD CONSTRAINT prompt_templates_pkey PRIMARY KEY (id);


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (sid);


--
-- Name: shared_pareceres shared_pareceres_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.shared_pareceres
    ADD CONSTRAINT shared_pareceres_pkey PRIMARY KEY (id);


--
-- Name: snippets snippets_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.snippets
    ADD CONSTRAINT snippets_pkey PRIMARY KEY (id);


--
-- Name: tramitacao_publicacoes tramitacao_publicacoes_ext_id_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.tramitacao_publicacoes
    ADD CONSTRAINT tramitacao_publicacoes_ext_id_unique UNIQUE (ext_id);


--
-- Name: tramitacao_publicacoes tramitacao_publicacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.tramitacao_publicacoes
    ADD CONSTRAINT tramitacao_publicacoes_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE IF EXISTS ONLY public.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: IDX_session_expire; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX IF NOT EXISTS "IDX_session_expire" ON public.session USING btree (expire);


--
-- PostgreSQL database dump complete
--

\unrestrict FUejOxVvwHrZCUepArnCFiMcst6e4KrZQm0OilWm3WwvKjSBo65Yf2dNNhEJZyS

