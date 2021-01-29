
--
-- Name: tb_acesso; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_acesso (
                                      co_acesso integer NOT NULL,
                                      ds_session_id character varying(255),
                                      dt_inicio_acesso timestamp without time zone,
                                      dt_fim_acesso timestamp without time zone,
                                      tp_situacao character varying(1),
                                      co_usuario integer NULL,
                                      co_trafego integer NULL
);


ALTER TABLE sis_enovus.tb_acesso OWNER TO postgres;

--
-- Name: COLUMN tb_acesso.tp_situacao; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_acesso.tp_situacao IS 'A - Ativo / F - Finalizado';


--
-- Name: tb_acesso_co_acesso_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_acesso_co_acesso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_acesso_co_acesso_seq OWNER TO postgres;

--
-- Name: tb_acesso_co_acesso_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_acesso_co_acesso_seq OWNED BY sis_enovus.tb_acesso.co_acesso;


--
-- Name: tb_aluno; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_aluno (
                                     co_aluno integer NOT NULL,
                                     dt_cadastro timestamp without time zone,
                                     st_status character varying(1) DEFAULT 'S'::character varying,
                                     co_turma integer NULL,
                                     co_pessoa integer NULL
);


ALTER TABLE sis_enovus.tb_aluno OWNER TO postgres;

--
-- Name: COLUMN tb_aluno.st_status; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_aluno.st_status IS 'S - Sim / N - Não';


--
-- Name: tb_aluno_co_aluno_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_aluno_co_aluno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_aluno_co_aluno_seq OWNER TO postgres;

--
-- Name: tb_aluno_co_aluno_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_aluno_co_aluno_seq OWNED BY sis_enovus.tb_aluno.co_aluno;


--
-- Name: tb_anotacao; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_anotacao (
                                        co_anotacao integer NOT NULL,
                                        dt_cadastro timestamp without time zone,
                                        ds_observacao text,
                                        ds_titulo character varying(80),
                                        co_historia integer NULL
);


ALTER TABLE sis_enovus.tb_anotacao OWNER TO postgres;

--
-- Name: tb_anotacao_aluno; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_anotacao_aluno (
                                              co_anotacao_aluno integer NOT NULL,
                                              co_pagina_livro integer NOT NULL,
                                              co_aluno integer NOT NULL,
                                              ds_anotacao text,
                                              dt_cadastro timestamp without time zone
);


ALTER TABLE sis_enovus.tb_anotacao_aluno OWNER TO postgres;

--
-- Name: tb_anotacao_aluno_co_anotacao_aluno_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_anotacao_aluno_co_anotacao_aluno_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_anotacao_aluno_co_anotacao_aluno_seq OWNER TO postgres;

--
-- Name: tb_anotacao_aluno_co_anotacao_aluno_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_anotacao_aluno_co_anotacao_aluno_seq OWNED BY sis_enovus.tb_anotacao_aluno.co_anotacao_aluno;


--
-- Name: tb_anotacao_co_anotacao_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_anotacao_co_anotacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_anotacao_co_anotacao_seq OWNER TO postgres;

--
-- Name: tb_anotacao_co_anotacao_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_anotacao_co_anotacao_seq OWNED BY sis_enovus.tb_anotacao.co_anotacao;


--
-- Name: tb_anotacao_professor; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_anotacao_professor (
                                                  co_anotacao_professor integer NOT NULL,
                                                  co_materia_turma integer NOT NULL,
                                                  co_pagina_livro integer NOT NULL,
                                                  ds_anotacao text,
                                                  dt_cadastro timestamp without time zone
);


ALTER TABLE sis_enovus.tb_anotacao_professor OWNER TO postgres;

--
-- Name: tb_anotacao_professor_co_anotacao_professor_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_anotacao_professor_co_anotacao_professor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_anotacao_professor_co_anotacao_professor_seq OWNER TO postgres;

--
-- Name: tb_anotacao_professor_co_anotacao_professor_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_anotacao_professor_co_anotacao_professor_seq OWNED BY sis_enovus.tb_anotacao_professor.co_anotacao_professor;


--
-- Name: tb_auditoria; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_auditoria (
                                         co_auditoria integer NOT NULL,
                                         dt_realizado timestamp without time zone,
                                         ds_perfil_usuario text,
                                         co_usuario integer NOT NULL
);


ALTER TABLE sis_enovus.tb_auditoria OWNER TO postgres;

--
-- Name: tb_auditoria_co_auditoria_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_auditoria_co_auditoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_auditoria_co_auditoria_seq OWNER TO postgres;

--
-- Name: tb_auditoria_co_auditoria_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_auditoria_co_auditoria_seq OWNED BY sis_enovus.tb_auditoria.co_auditoria;


--
-- Name: tb_auditoria_itens; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_auditoria_itens (
                                               co_auditoria_itens integer NOT NULL,
                                               ds_item_anterior text,
                                               ds_item_atual text,
                                               ds_campo character varying(120),
                                               co_auditoria_tabela integer NOT NULL
);


ALTER TABLE sis_enovus.tb_auditoria_itens OWNER TO postgres;

--
-- Name: tb_auditoria_itens_co_auditoria_itens_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_auditoria_itens_co_auditoria_itens_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_auditoria_itens_co_auditoria_itens_seq OWNER TO postgres;

--
-- Name: tb_auditoria_itens_co_auditoria_itens_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_auditoria_itens_co_auditoria_itens_seq OWNED BY sis_enovus.tb_auditoria_itens.co_auditoria_itens;


--
-- Name: tb_auditoria_tabela; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_auditoria_tabela (
                                                co_auditoria_tabela integer NOT NULL,
                                                no_tabela character varying(45),
                                                tp_operacao character varying(1),
                                                co_registro integer,
                                                co_auditoria integer NOT NULL
);


ALTER TABLE sis_enovus.tb_auditoria_tabela OWNER TO postgres;

--
-- Name: tb_auditoria_tabela_co_auditoria_tabela_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_auditoria_tabela_co_auditoria_tabela_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_auditoria_tabela_co_auditoria_tabela_seq OWNER TO postgres;

--
-- Name: tb_auditoria_tabela_co_auditoria_tabela_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_auditoria_tabela_co_auditoria_tabela_seq OWNED BY sis_enovus.tb_auditoria_tabela.co_auditoria_tabela;


--
-- Name: tb_capitulo; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_capitulo (
                                        co_capitulo integer NOT NULL,
                                        ds_titulo character varying(100),
                                        st_status character varying(1) DEFAULT 'S'::character varying,
                                        dt_cadastro timestamp without time zone,
                                        co_livro integer NOT NULL,
                                        co_imagem integer NULL
);


ALTER TABLE sis_enovus.tb_capitulo OWNER TO postgres;

--
-- Name: COLUMN tb_capitulo.st_status; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_capitulo.st_status IS 'S - Sim / N - Não';


--
-- Name: COLUMN tb_capitulo.co_imagem; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_capitulo.co_imagem IS 'Capa do Capítulo';


--
-- Name: tb_capitulo_co_capitulo_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_capitulo_co_capitulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_capitulo_co_capitulo_seq OWNER TO postgres;

--
-- Name: tb_capitulo_co_capitulo_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_capitulo_co_capitulo_seq OWNED BY sis_enovus.tb_capitulo.co_capitulo;


--
-- Name: tb_contato; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_contato (
                                       co_contato integer NOT NULL,
                                       nu_tel1 character varying(15),
                                       nu_tel2 character varying(15),
                                       nu_tel3 character varying(15),
                                       nu_tel_0800 character varying(30),
                                       ds_email character varying(150),
                                       ds_site character varying(100),
                                       ds_facebook character varying(90),
                                       ds_twitter character varying(90),
                                       ds_instagram character varying(90)
);


ALTER TABLE sis_enovus.tb_contato OWNER TO postgres;

--
-- Name: tb_contato_co_contato_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_contato_co_contato_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_contato_co_contato_seq OWNER TO postgres;

--
-- Name: tb_contato_co_contato_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_contato_co_contato_seq OWNED BY sis_enovus.tb_contato.co_contato;


--
-- Name: tb_controller; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_controller (
                                          co_controller integer NOT NULL,
                                          no_controller character varying(60),
                                          ds_class_icon character varying(30)
);


ALTER TABLE sis_enovus.tb_controller OWNER TO postgres;

--
-- Name: COLUMN tb_controller.ds_class_icon; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_controller.ds_class_icon IS 'Classe do Ícone';


--
-- Name: tb_controller_co_controller_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_controller_co_controller_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_controller_co_controller_seq OWNER TO postgres;

--
-- Name: tb_controller_co_controller_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_controller_co_controller_seq OWNED BY sis_enovus.tb_controller.co_controller;


--
-- Name: tb_crons; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_crons (
                                     co_cron integer NOT NULL,
                                     dt_cadastro timestamp without time zone,
                                     no_cron character varying(70),
                                     ds_sql text
);


ALTER TABLE sis_enovus.tb_crons OWNER TO postgres;

--
-- Name: tb_crons_co_cron_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_crons_co_cron_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_crons_co_cron_seq OWNER TO postgres;

--
-- Name: tb_crons_co_cron_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_crons_co_cron_seq OWNED BY sis_enovus.tb_crons.co_cron;


--
-- Name: tb_endereco; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_endereco (
                                        co_endereco integer NOT NULL,
                                        ds_endereco character varying(150),
                                        ds_complemento character varying(100),
                                        ds_bairro character varying(80),
                                        nu_cep character varying(12),
                                        no_cidade character varying(80),
                                        sg_uf character varying(2)
);


ALTER TABLE sis_enovus.tb_endereco OWNER TO postgres;

--
-- Name: tb_endereco_co_endereco_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_endereco_co_endereco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_endereco_co_endereco_seq OWNER TO postgres;

--
-- Name: tb_endereco_co_endereco_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_endereco_co_endereco_seq OWNED BY sis_enovus.tb_endereco.co_endereco;


--
-- Name: tb_escola; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_escola (
                                      co_escola integer NOT NULL,
                                      nu_cnpj character varying(14),
                                      no_fantasia character varying(100),
                                      no_razao_social character varying(150),
                                      nu_insc_estadual character varying(20),
                                      ds_observacao text,
                                      dt_cadastro timestamp without time zone,
                                      co_endereco integer NULL,
                                      co_usuario integer NULL,
                                      co_contato integer NULL
);


ALTER TABLE sis_enovus.tb_escola OWNER TO postgres;

--
-- Name: tb_escola_co_escola_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_escola_co_escola_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_escola_co_escola_seq OWNER TO postgres;

--
-- Name: tb_escola_co_escola_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_escola_co_escola_seq OWNED BY sis_enovus.tb_escola.co_escola;


--
-- Name: tb_funcionalidade; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_funcionalidade (
                                              co_funcionalidade integer NOT NULL,
                                              no_funcionalidade character varying(150) NOT NULL,
                                              ds_action character varying(120),
                                              st_status character varying(1) DEFAULT 'A'::character varying,
                                              st_menu character varying(1) DEFAULT 'S'::character varying,
                                              co_controller integer NOT NULL
);


ALTER TABLE sis_enovus.tb_funcionalidade OWNER TO postgres;

--
-- Name: COLUMN tb_funcionalidade.st_status; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_funcionalidade.st_status IS '''A - Ativo / I - Inativo''';


--
-- Name: COLUMN tb_funcionalidade.st_menu; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_funcionalidade.st_menu IS 'S - Sim / N - Não (Se apresenta no menu)';


--
-- Name: tb_funcionalidade_co_funcionalidade_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_funcionalidade_co_funcionalidade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_funcionalidade_co_funcionalidade_seq OWNER TO postgres;

--
-- Name: tb_funcionalidade_co_funcionalidade_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_funcionalidade_co_funcionalidade_seq OWNED BY sis_enovus.tb_funcionalidade.co_funcionalidade;


--
-- Name: tb_historia; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_historia (
                                        co_historia integer NOT NULL,
                                        ds_titulo character varying(80),
                                        ds_observacao text,
                                        dt_cadastro timestamp without time zone,
                                        dt_atualizado timestamp without time zone,
                                        st_situacao character varying(1) DEFAULT 'N'::character varying,
                                        co_sessao integer NOT NULL
);


ALTER TABLE sis_enovus.tb_historia OWNER TO postgres;

--
-- Name: COLUMN tb_historia.st_situacao; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_historia.st_situacao IS 'N - Não iniciada / I - Iniciada / C - Concluida';


--
-- Name: tb_historia_co_historia_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_historia_co_historia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_historia_co_historia_seq OWNER TO postgres;

--
-- Name: tb_historia_co_historia_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_historia_co_historia_seq OWNED BY sis_enovus.tb_historia.co_historia;


--
-- Name: tb_historico_historia; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_historico_historia (
                                                  co_historico_historia integer NOT NULL,
                                                  nu_esforco character varying(2),
                                                  nu_esforco_restante character varying(2),
                                                  dt_cadastro timestamp without time zone,
                                                  co_historia integer NOT NULL
);


ALTER TABLE sis_enovus.tb_historico_historia OWNER TO postgres;

--
-- Name: tb_historico_historia_co_historico_historia_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_historico_historia_co_historico_historia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_historico_historia_co_historico_historia_seq OWNER TO postgres;

--
-- Name: tb_historico_historia_co_historico_historia_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_historico_historia_co_historico_historia_seq OWNED BY sis_enovus.tb_historico_historia.co_historico_historia;


--
-- Name: tb_historico_suporte; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_historico_suporte (
                                                 co_historico_suporte integer NOT NULL,
                                                 dt_cadastro timestamp without time zone,
                                                 ds_mensagem text,
                                                 st_lido character varying(1) DEFAULT 'N'::character varying,
                                                 co_suporte integer NOT NULL,
                                                 co_usuario integer NOT NULL,
                                                 co_imagem integer NULL
);


ALTER TABLE sis_enovus.tb_historico_suporte OWNER TO postgres;

--
-- Name: COLUMN tb_historico_suporte.st_lido; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_historico_suporte.st_lido IS 'S - Sim / N - Não';


--
-- Name: COLUMN tb_historico_suporte.co_imagem; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_historico_suporte.co_imagem IS 'Chave do Anexo.';


--
-- Name: tb_historico_suporte_co_historico_suporte_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_historico_suporte_co_historico_suporte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_historico_suporte_co_historico_suporte_seq OWNER TO postgres;

--
-- Name: tb_historico_suporte_co_historico_suporte_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_historico_suporte_co_historico_suporte_seq OWNED BY sis_enovus.tb_historico_suporte.co_historico_suporte;


--
-- Name: tb_imagem; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_imagem (
                                      co_imagem integer NOT NULL,
                                      ds_caminho character varying(150) NOT NULL,
                                      co_tipo_imagem integer NOT NULL
);


ALTER TABLE sis_enovus.tb_imagem OWNER TO postgres;

--
-- Name: tb_imagem_co_imagem_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_imagem_co_imagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_imagem_co_imagem_seq OWNER TO postgres;

--
-- Name: tb_imagem_co_imagem_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_imagem_co_imagem_seq OWNED BY sis_enovus.tb_imagem.co_imagem;


--
-- Name: tb_livro; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_livro (
                                     co_livro integer NOT NULL,
                                     ds_titulo character varying(80),
                                     st_status character varying(1) DEFAULT 'S'::character varying,
                                     dt_cadastro timestamp without time zone,
                                     co_materia integer NOT NULL,
                                     co_imagem integer NULL
);


ALTER TABLE sis_enovus.tb_livro OWNER TO postgres;

--
-- Name: COLUMN tb_livro.st_status; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_livro.st_status IS 'S - Sim / N - Não';


--
-- Name: COLUMN tb_livro.co_imagem; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_livro.co_imagem IS 'Capa do Livro';


--
-- Name: tb_livro_co_livro_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_livro_co_livro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_livro_co_livro_seq OWNER TO postgres;

--
-- Name: tb_livro_co_livro_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_livro_co_livro_seq OWNED BY sis_enovus.tb_livro.co_livro;


--
-- Name: tb_materia; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_materia (
                                       co_materia integer NOT NULL,
                                       ds_materia character varying(80),
                                       dt_cadastro timestamp without time zone,
                                       co_escola integer NOT NULL
);


ALTER TABLE sis_enovus.tb_materia OWNER TO postgres;

--
-- Name: tb_materia_co_materia_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_materia_co_materia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_materia_co_materia_seq OWNER TO postgres;

--
-- Name: tb_materia_co_materia_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_materia_co_materia_seq OWNED BY sis_enovus.tb_materia.co_materia;


--
-- Name: tb_materia_turma; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_materia_turma (
                                             co_materia_turma integer NOT NULL,
                                             co_materia integer NOT NULL,
                                             co_turma integer NOT NULL,
                                             co_professor integer NOT NULL
);


ALTER TABLE sis_enovus.tb_materia_turma OWNER TO postgres;

--
-- Name: tb_materia_turma_co_materia_turma_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_materia_turma_co_materia_turma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_materia_turma_co_materia_turma_seq OWNER TO postgres;

--
-- Name: tb_materia_turma_co_materia_turma_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_materia_turma_co_materia_turma_seq OWNED BY sis_enovus.tb_materia_turma.co_materia_turma;


--
-- Name: tb_modulo; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_modulo (
                                      co_modulo integer NOT NULL,
                                      no_modulo character varying(50),
                                      dt_cadastro timestamp without time zone,
                                      co_projeto integer NOT NULL
);


ALTER TABLE sis_enovus.tb_modulo OWNER TO postgres;

--
-- Name: tb_modulo_co_modulo_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_modulo_co_modulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_modulo_co_modulo_seq OWNER TO postgres;

--
-- Name: tb_modulo_co_modulo_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_modulo_co_modulo_seq OWNED BY sis_enovus.tb_modulo.co_modulo;


--
-- Name: tb_pagina; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_pagina (
                                      co_pagina integer NOT NULL,
                                      dt_cadastro timestamp without time zone,
                                      ds_titulo_url_amigavel character varying(255),
                                      nu_visualizacao integer,
                                      nu_usuario integer
);


ALTER TABLE sis_enovus.tb_pagina OWNER TO postgres;

--
-- Name: COLUMN tb_pagina.ds_titulo_url_amigavel; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_pagina.ds_titulo_url_amigavel IS 'Url amigável da página';


--
-- Name: COLUMN tb_pagina.nu_usuario; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_pagina.nu_usuario IS 'Número de usuário que visitou a página';


--
-- Name: tb_pagina_co_pagina_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_pagina_co_pagina_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_pagina_co_pagina_seq OWNER TO postgres;

--
-- Name: tb_pagina_co_pagina_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_pagina_co_pagina_seq OWNED BY sis_enovus.tb_pagina.co_pagina;


--
-- Name: tb_pagina_livro; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_pagina_livro (
                                            co_pagina_livro integer NOT NULL,
                                            ds_code text,
                                            dt_cadastro timestamp without time zone,
                                            st_status character varying(1) DEFAULT 'S'::character varying,
                                            co_capitulo integer NOT NULL
);


ALTER TABLE sis_enovus.tb_pagina_livro OWNER TO postgres;

--
-- Name: COLUMN tb_pagina_livro.ds_code; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_pagina_livro.ds_code IS 'Código da Página';


--
-- Name: COLUMN tb_pagina_livro.st_status; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_pagina_livro.st_status IS 'S - Sim / N - Não';


--
-- Name: tb_pagina_livro_co_pagina_livro_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_pagina_livro_co_pagina_livro_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_pagina_livro_co_pagina_livro_seq OWNER TO postgres;

--
-- Name: tb_pagina_livro_co_pagina_livro_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_pagina_livro_co_pagina_livro_seq OWNED BY sis_enovus.tb_pagina_livro.co_pagina_livro;


--
-- Name: tb_pagina_visita; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_pagina_visita (
                                             co_pagina_visita integer NOT NULL,
                                             co_visita integer NOT NULL,
                                             co_pagina integer NOT NULL
);


ALTER TABLE sis_enovus.tb_pagina_visita OWNER TO postgres;

--
-- Name: tb_pagina_visita_co_pagina_visita_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_pagina_visita_co_pagina_visita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_pagina_visita_co_pagina_visita_seq OWNER TO postgres;

--
-- Name: tb_pagina_visita_co_pagina_visita_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_pagina_visita_co_pagina_visita_seq OWNED BY sis_enovus.tb_pagina_visita.co_pagina_visita;


--
-- Name: tb_perfil; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_perfil (
                                      co_perfil integer NOT NULL,
                                      no_perfil character varying(45) NOT NULL,
                                      st_status character varying(1) DEFAULT 'A'::character varying NOT NULL
);


ALTER TABLE sis_enovus.tb_perfil OWNER TO postgres;

--
-- Name: COLUMN tb_perfil.no_perfil; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_perfil.no_perfil IS 'Nome do Perfil';


--
-- Name: COLUMN tb_perfil.st_status; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_perfil.st_status IS '''A - Ativo / I - Inativo''';


--
-- Name: tb_perfil_co_perfil_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_perfil_co_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_perfil_co_perfil_seq OWNER TO postgres;

--
-- Name: tb_perfil_co_perfil_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_perfil_co_perfil_seq OWNED BY sis_enovus.tb_perfil.co_perfil;


--
-- Name: tb_perfil_funcionalidade; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_perfil_funcionalidade (
                                                     co_perfil_funcionalidade integer NOT NULL,
                                                     co_funcionalidade integer NOT NULL,
                                                     co_perfil integer NOT NULL
);


ALTER TABLE sis_enovus.tb_perfil_funcionalidade OWNER TO postgres;

--
-- Name: tb_perfil_funcionalidade_co_perfil_funcionalidade_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_perfil_funcionalidade_co_perfil_funcionalidade_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_perfil_funcionalidade_co_perfil_funcionalidade_seq OWNER TO postgres;

--
-- Name: tb_perfil_funcionalidade_co_perfil_funcionalidade_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_perfil_funcionalidade_co_perfil_funcionalidade_seq OWNED BY sis_enovus.tb_perfil_funcionalidade.co_perfil_funcionalidade;


--
-- Name: tb_pessoa; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_pessoa (
                                      co_pessoa integer NOT NULL,
                                      nu_cpf character varying(15),
                                      no_pessoa character varying(100),
                                      nu_rg character varying(45),
                                      dt_cadastro timestamp without time zone,
                                      dt_nascimento date,
                                      st_sexo character varying(1),
                                      co_endereco integer NOT NULL,
                                      co_contato integer NOT NULL,
                                      co_imagem integer NULL
);


ALTER TABLE sis_enovus.tb_pessoa OWNER TO postgres;

--
-- Name: COLUMN tb_pessoa.st_sexo; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_pessoa.st_sexo IS 'M - Masculino ou F - Feminino';


--
-- Name: tb_pessoa_co_pessoa_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_pessoa_co_pessoa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_pessoa_co_pessoa_seq OWNER TO postgres;

--
-- Name: tb_pessoa_co_pessoa_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_pessoa_co_pessoa_seq OWNED BY sis_enovus.tb_pessoa.co_pessoa;


--
-- Name: tb_professor; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_professor (
                                         co_professor integer NOT NULL,
                                         dt_cadastro timestamp without time zone,
                                         st_status character varying(1) DEFAULT 'S'::character varying,
                                         co_pessoa integer NOT NULL,
                                         co_escola integer NOT NULL
);


ALTER TABLE sis_enovus.tb_professor OWNER TO postgres;

--
-- Name: COLUMN tb_professor.st_status; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_professor.st_status IS 'S - Sim / N - Não';


--
-- Name: tb_professor_co_professor_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_professor_co_professor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_professor_co_professor_seq OWNER TO postgres;

--
-- Name: tb_professor_co_professor_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_professor_co_professor_seq OWNED BY sis_enovus.tb_professor.co_professor;


--
-- Name: tb_projeto; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_projeto (
                                       co_projeto integer NOT NULL,
                                       no_projeto character varying(80),
                                       dt_cadastro timestamp without time zone
);


ALTER TABLE sis_enovus.tb_projeto OWNER TO postgres;

--
-- Name: tb_projeto_co_projeto_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_projeto_co_projeto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_projeto_co_projeto_seq OWNER TO postgres;

--
-- Name: tb_projeto_co_projeto_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_projeto_co_projeto_seq OWNED BY sis_enovus.tb_projeto.co_projeto;


--
-- Name: tb_sessao; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_sessao (
                                      co_sessao integer NOT NULL,
                                      no_sessao character varying(80),
                                      dt_cadastro timestamp without time zone,
                                      co_modulo integer NOT NULL
);


ALTER TABLE sis_enovus.tb_sessao OWNER TO postgres;

--
-- Name: tb_sessao_co_sessao_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_sessao_co_sessao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_sessao_co_sessao_seq OWNER TO postgres;

--
-- Name: tb_sessao_co_sessao_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_sessao_co_sessao_seq OWNED BY sis_enovus.tb_sessao.co_sessao;


--
-- Name: tb_suporte; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_suporte (
                                       co_suporte integer NOT NULL,
                                       st_status character varying(1) DEFAULT 'A'::character varying,
                                       dt_cadastro timestamp without time zone,
                                       ds_assunto character varying(100),
                                       st_tipo_assunto integer
);


ALTER TABLE sis_enovus.tb_suporte OWNER TO postgres;

--
-- Name: COLUMN tb_suporte.st_status; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_suporte.st_status IS 'A - Ativa / I - Inativa';


--
-- Name: COLUMN tb_suporte.st_tipo_assunto; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_suporte.st_tipo_assunto IS '1 - Sugestão ou Melhorias / 2 - Reclamação / 3 -  Correção no Sistema / 4 - Outros';


--
-- Name: tb_suporte_co_suporte_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_suporte_co_suporte_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_suporte_co_suporte_seq OWNER TO postgres;

--
-- Name: tb_suporte_co_suporte_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_suporte_co_suporte_seq OWNED BY sis_enovus.tb_suporte.co_suporte;


--
-- Name: tb_tipo_imagem; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_tipo_imagem (
                                           co_tipo_imagem integer NOT NULL,
                                           ds_tipo_imagem character varying(80)
);


ALTER TABLE sis_enovus.tb_tipo_imagem OWNER TO postgres;

--
-- Name: tb_tipo_imagem_co_tipo_imagem_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_tipo_imagem_co_tipo_imagem_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_tipo_imagem_co_tipo_imagem_seq OWNER TO postgres;

--
-- Name: tb_tipo_imagem_co_tipo_imagem_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_tipo_imagem_co_tipo_imagem_seq OWNED BY sis_enovus.tb_tipo_imagem.co_tipo_imagem;


--
-- Name: tb_trafego; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_trafego (
                                       co_trafego integer NOT NULL,
                                       nu_ip character varying(20),
                                       ds_pais character varying(100),
                                       ds_code_pais character varying(100),
                                       ds_uf character varying(45),
                                       ds_estado character varying(100),
                                       ds_cidade character varying(120),
                                       ds_navegador character varying(45),
                                       ds_sistema_operacional character varying(45),
                                       ds_dispositivo character varying(45),
                                       ds_agente character varying(255)
);


ALTER TABLE sis_enovus.tb_trafego OWNER TO postgres;

--
-- Name: tb_trafego_co_trafego_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_trafego_co_trafego_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_trafego_co_trafego_seq OWNER TO postgres;

--
-- Name: tb_trafego_co_trafego_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_trafego_co_trafego_seq OWNED BY sis_enovus.tb_trafego.co_trafego;


--
-- Name: tb_turma; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_turma (
                                     co_turma integer NOT NULL,
                                     ds_turma character varying(45) DEFAULT 'Ano + Identificador'::character varying,
                                     dt_cadastro timestamp without time zone,
                                     nu_ano integer,
                                     st_status character varying(1) DEFAULT 'S'::character varying,
                                     co_escola integer NOT NULL
);


ALTER TABLE sis_enovus.tb_turma OWNER TO postgres;

--
-- Name: COLUMN tb_turma.st_status; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_turma.st_status IS 'S - Sim / N - Não';


--
-- Name: tb_turma_co_turma_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_turma_co_turma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_turma_co_turma_seq OWNER TO postgres;

--
-- Name: tb_turma_co_turma_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_turma_co_turma_seq OWNED BY sis_enovus.tb_turma.co_turma;


--
-- Name: tb_usuario; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_usuario (
                                       co_usuario integer NOT NULL,
                                       ds_senha character varying(100) NOT NULL,
                                       ds_code character varying(50) NOT NULL,
                                       st_status character varying(1) DEFAULT 'I'::character varying NOT NULL,
                                       st_troca_senha character varying(1) DEFAULT 'N'::character varying,
                                       dt_cadastro timestamp without time zone,
                                       co_imagem integer NULL,
                                       co_pessoa integer NOT NULL
);


ALTER TABLE sis_enovus.tb_usuario OWNER TO postgres;

--
-- Name: COLUMN tb_usuario.ds_code; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_usuario.ds_code IS 'Senha criptografada';


--
-- Name: COLUMN tb_usuario.st_status; Type: COMMENT; Schema: sis_enovus; Owner: digitalenovus
--

COMMENT ON COLUMN sis_enovus.tb_usuario.st_status IS '''A - Ativo / I - Inativo''';


--
-- Name: tb_usuario_co_usuario_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_usuario_co_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_usuario_co_usuario_seq OWNER TO postgres;

--
-- Name: tb_usuario_co_usuario_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_usuario_co_usuario_seq OWNED BY sis_enovus.tb_usuario.co_usuario;


--
-- Name: tb_usuario_perfil; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_usuario_perfil (
                                              co_usuario_perfil integer NOT NULL,
                                              co_usuario integer NOT NULL,
                                              co_perfil integer NOT NULL
);


ALTER TABLE sis_enovus.tb_usuario_perfil OWNER TO postgres;

--
-- Name: tb_usuario_perfil_co_usuario_perfil_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_usuario_perfil_co_usuario_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_usuario_perfil_co_usuario_perfil_seq OWNER TO postgres;

--
-- Name: tb_usuario_perfil_co_usuario_perfil_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_usuario_perfil_co_usuario_perfil_seq OWNED BY sis_enovus.tb_usuario_perfil.co_usuario_perfil;


--
-- Name: tb_visita; Type: TABLE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE TABLE sis_enovus.tb_visita (
                                      co_visita integer NOT NULL,
                                      dt_realizado timestamp without time zone,
                                      dt_atualizado timestamp without time zone,
                                      nu_visitas integer,
                                      co_trafego integer NOT NULL
);


ALTER TABLE sis_enovus.tb_visita OWNER TO postgres;

--
-- Name: tb_visita_co_visita_seq; Type: SEQUENCE; Schema: sis_enovus; Owner: digitalenovus
--

CREATE SEQUENCE sis_enovus.tb_visita_co_visita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sis_enovus.tb_visita_co_visita_seq OWNER TO postgres;

--
-- Name: tb_visita_co_visita_seq; Type: SEQUENCE OWNED BY; Schema: sis_enovus; Owner: digitalenovus
--

ALTER SEQUENCE sis_enovus.tb_visita_co_visita_seq OWNED BY sis_enovus.tb_visita.co_visita;


--
-- Name: tb_acesso co_acesso; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_acesso ALTER COLUMN co_acesso SET DEFAULT nextval('sis_enovus.tb_acesso_co_acesso_seq'::regclass);


--
-- Name: tb_aluno co_aluno; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_aluno ALTER COLUMN co_aluno SET DEFAULT nextval('sis_enovus.tb_aluno_co_aluno_seq'::regclass);


--
-- Name: tb_anotacao co_anotacao; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_anotacao ALTER COLUMN co_anotacao SET DEFAULT nextval('sis_enovus.tb_anotacao_co_anotacao_seq'::regclass);


--
-- Name: tb_anotacao_aluno co_anotacao_aluno; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_anotacao_aluno ALTER COLUMN co_anotacao_aluno SET DEFAULT nextval('sis_enovus.tb_anotacao_aluno_co_anotacao_aluno_seq'::regclass);


--
-- Name: tb_anotacao_professor co_anotacao_professor; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_anotacao_professor ALTER COLUMN co_anotacao_professor SET DEFAULT nextval('sis_enovus.tb_anotacao_professor_co_anotacao_professor_seq'::regclass);


--
-- Name: tb_auditoria co_auditoria; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_auditoria ALTER COLUMN co_auditoria SET DEFAULT nextval('sis_enovus.tb_auditoria_co_auditoria_seq'::regclass);


--
-- Name: tb_auditoria_itens co_auditoria_itens; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_auditoria_itens ALTER COLUMN co_auditoria_itens SET DEFAULT nextval('sis_enovus.tb_auditoria_itens_co_auditoria_itens_seq'::regclass);


--
-- Name: tb_auditoria_tabela co_auditoria_tabela; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_auditoria_tabela ALTER COLUMN co_auditoria_tabela SET DEFAULT nextval('sis_enovus.tb_auditoria_tabela_co_auditoria_tabela_seq'::regclass);


--
-- Name: tb_capitulo co_capitulo; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_capitulo ALTER COLUMN co_capitulo SET DEFAULT nextval('sis_enovus.tb_capitulo_co_capitulo_seq'::regclass);


--
-- Name: tb_contato co_contato; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_contato ALTER COLUMN co_contato SET DEFAULT nextval('sis_enovus.tb_contato_co_contato_seq'::regclass);


--
-- Name: tb_controller co_controller; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_controller ALTER COLUMN co_controller SET DEFAULT nextval('sis_enovus.tb_controller_co_controller_seq'::regclass);


--
-- Name: tb_crons co_cron; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_crons ALTER COLUMN co_cron SET DEFAULT nextval('sis_enovus.tb_crons_co_cron_seq'::regclass);


--
-- Name: tb_endereco co_endereco; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_endereco ALTER COLUMN co_endereco SET DEFAULT nextval('sis_enovus.tb_endereco_co_endereco_seq'::regclass);


--
-- Name: tb_escola co_escola; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_escola ALTER COLUMN co_escola SET DEFAULT nextval('sis_enovus.tb_escola_co_escola_seq'::regclass);


--
-- Name: tb_funcionalidade co_funcionalidade; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_funcionalidade ALTER COLUMN co_funcionalidade SET DEFAULT nextval('sis_enovus.tb_funcionalidade_co_funcionalidade_seq'::regclass);


--
-- Name: tb_historia co_historia; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_historia ALTER COLUMN co_historia SET DEFAULT nextval('sis_enovus.tb_historia_co_historia_seq'::regclass);


--
-- Name: tb_historico_historia co_historico_historia; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_historico_historia ALTER COLUMN co_historico_historia SET DEFAULT nextval('sis_enovus.tb_historico_historia_co_historico_historia_seq'::regclass);


--
-- Name: tb_historico_suporte co_historico_suporte; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_historico_suporte ALTER COLUMN co_historico_suporte SET DEFAULT nextval('sis_enovus.tb_historico_suporte_co_historico_suporte_seq'::regclass);


--
-- Name: tb_imagem co_imagem; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_imagem ALTER COLUMN co_imagem SET DEFAULT nextval('sis_enovus.tb_imagem_co_imagem_seq'::regclass);


--
-- Name: tb_livro co_livro; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_livro ALTER COLUMN co_livro SET DEFAULT nextval('sis_enovus.tb_livro_co_livro_seq'::regclass);


--
-- Name: tb_materia co_materia; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_materia ALTER COLUMN co_materia SET DEFAULT nextval('sis_enovus.tb_materia_co_materia_seq'::regclass);


--
-- Name: tb_materia_turma co_materia_turma; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_materia_turma ALTER COLUMN co_materia_turma SET DEFAULT nextval('sis_enovus.tb_materia_turma_co_materia_turma_seq'::regclass);


--
-- Name: tb_modulo co_modulo; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_modulo ALTER COLUMN co_modulo SET DEFAULT nextval('sis_enovus.tb_modulo_co_modulo_seq'::regclass);


--
-- Name: tb_pagina co_pagina; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pagina ALTER COLUMN co_pagina SET DEFAULT nextval('sis_enovus.tb_pagina_co_pagina_seq'::regclass);


--
-- Name: tb_pagina_livro co_pagina_livro; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pagina_livro ALTER COLUMN co_pagina_livro SET DEFAULT nextval('sis_enovus.tb_pagina_livro_co_pagina_livro_seq'::regclass);


--
-- Name: tb_pagina_visita co_pagina_visita; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pagina_visita ALTER COLUMN co_pagina_visita SET DEFAULT nextval('sis_enovus.tb_pagina_visita_co_pagina_visita_seq'::regclass);


--
-- Name: tb_perfil co_perfil; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_perfil ALTER COLUMN co_perfil SET DEFAULT nextval('sis_enovus.tb_perfil_co_perfil_seq'::regclass);


--
-- Name: tb_perfil_funcionalidade co_perfil_funcionalidade; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_perfil_funcionalidade ALTER COLUMN co_perfil_funcionalidade SET DEFAULT nextval('sis_enovus.tb_perfil_funcionalidade_co_perfil_funcionalidade_seq'::regclass);


--
-- Name: tb_pessoa co_pessoa; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pessoa ALTER COLUMN co_pessoa SET DEFAULT nextval('sis_enovus.tb_pessoa_co_pessoa_seq'::regclass);


--
-- Name: tb_professor co_professor; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_professor ALTER COLUMN co_professor SET DEFAULT nextval('sis_enovus.tb_professor_co_professor_seq'::regclass);


--
-- Name: tb_projeto co_projeto; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_projeto ALTER COLUMN co_projeto SET DEFAULT nextval('sis_enovus.tb_projeto_co_projeto_seq'::regclass);


--
-- Name: tb_sessao co_sessao; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_sessao ALTER COLUMN co_sessao SET DEFAULT nextval('sis_enovus.tb_sessao_co_sessao_seq'::regclass);


--
-- Name: tb_suporte co_suporte; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_suporte ALTER COLUMN co_suporte SET DEFAULT nextval('sis_enovus.tb_suporte_co_suporte_seq'::regclass);


--
-- Name: tb_tipo_imagem co_tipo_imagem; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_tipo_imagem ALTER COLUMN co_tipo_imagem SET DEFAULT nextval('sis_enovus.tb_tipo_imagem_co_tipo_imagem_seq'::regclass);


--
-- Name: tb_trafego co_trafego; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_trafego ALTER COLUMN co_trafego SET DEFAULT nextval('sis_enovus.tb_trafego_co_trafego_seq'::regclass);


--
-- Name: tb_turma co_turma; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_turma ALTER COLUMN co_turma SET DEFAULT nextval('sis_enovus.tb_turma_co_turma_seq'::regclass);


--
-- Name: tb_usuario co_usuario; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_usuario ALTER COLUMN co_usuario SET DEFAULT nextval('sis_enovus.tb_usuario_co_usuario_seq'::regclass);


--
-- Name: tb_usuario_perfil co_usuario_perfil; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_usuario_perfil ALTER COLUMN co_usuario_perfil SET DEFAULT nextval('sis_enovus.tb_usuario_perfil_co_usuario_perfil_seq'::regclass);


--
-- Name: tb_visita co_visita; Type: DEFAULT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_visita ALTER COLUMN co_visita SET DEFAULT nextval('sis_enovus.tb_visita_co_visita_seq'::regclass);



--
-- Data for Name: tb_aluno; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_aluno (co_aluno, dt_cadastro, st_status, co_turma, co_pessoa) VALUES (1, '2020-10-30 19:47:41', 'S', 1, 16);
INSERT INTO sis_enovus.tb_aluno (co_aluno, dt_cadastro, st_status, co_turma, co_pessoa) VALUES (2, '2020-12-03 16:28:39', 'A', 4, 19);
INSERT INTO sis_enovus.tb_aluno (co_aluno, dt_cadastro, st_status, co_turma, co_pessoa) VALUES (3, '2020-12-21 11:32:02', 'A', 1, 21);
INSERT INTO sis_enovus.tb_aluno (co_aluno, dt_cadastro, st_status, co_turma, co_pessoa) VALUES (4, '2020-12-22 11:41:30', 'S', 4, 24);


--
-- Data for Name: tb_anotacao; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--



--
-- Data for Name: tb_anotacao_aluno; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_anotacao_aluno (co_anotacao_aluno, co_pagina_livro, co_aluno, ds_anotacao, dt_cadastro) VALUES (3, 4, 3, 'NOVOS TESTES DE ANOTAÇÃO DO ALUNO', '2020-12-22 15:44:06');
INSERT INTO sis_enovus.tb_anotacao_aluno (co_anotacao_aluno, co_pagina_livro, co_aluno, ds_anotacao, dt_cadastro) VALUES (4, 3, 3, 'wef weqgfqg ewrhg reht er', '2020-12-22 16:00:25');
INSERT INTO sis_enovus.tb_anotacao_aluno (co_anotacao_aluno, co_pagina_livro, co_aluno, ds_anotacao, dt_cadastro) VALUES (5, 6, 3, 'ef  wg ewgw', '2020-12-22 16:01:11');
INSERT INTO sis_enovus.tb_anotacao_aluno (co_anotacao_aluno, co_pagina_livro, co_aluno, ds_anotacao, dt_cadastro) VALUES (6, 7, 3, ' fewg wer g', '2020-12-22 16:01:29');
INSERT INTO sis_enovus.tb_anotacao_aluno (co_anotacao_aluno, co_pagina_livro, co_aluno, ds_anotacao, dt_cadastro) VALUES (7, 31, 3, 'rgwe reg reg', '2020-12-22 16:02:31');
INSERT INTO sis_enovus.tb_anotacao_aluno (co_anotacao_aluno, co_pagina_livro, co_aluno, ds_anotacao, dt_cadastro) VALUES (8, 26, 3, 'ANOTAÇÃO PÁGINA 9', '2020-12-22 16:26:39');
INSERT INTO sis_enovus.tb_anotacao_aluno (co_anotacao_aluno, co_pagina_livro, co_aluno, ds_anotacao, dt_cadastro) VALUES (9, 27, 3, 'ANOTAÇÃO PÁGINA 10 ATUALIZADO', '2020-12-22 16:26:49');
INSERT INTO sis_enovus.tb_anotacao_aluno (co_anotacao_aluno, co_pagina_livro, co_aluno, ds_anotacao, dt_cadastro) VALUES (10, 4, 4, 'Anotação página 4 aluno nota mil texto de teste', '2020-12-22 17:09:38');
INSERT INTO sis_enovus.tb_anotacao_aluno (co_anotacao_aluno, co_pagina_livro, co_aluno, ds_anotacao, dt_cadastro) VALUES (11, 6, 4, 'Página 6 conhecendo melhor a vida', '2020-12-22 18:14:16');


--
-- Data for Name: tb_anotacao_professor; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_anotacao_professor (co_anotacao_professor, co_materia_turma, co_pagina_livro, ds_anotacao, dt_cadastro) VALUES (1, 16, 3, 'Anotação prof. pardal turma 7E matemática', '2020-12-22 17:50:33');
INSERT INTO sis_enovus.tb_anotacao_professor (co_anotacao_professor, co_materia_turma, co_pagina_livro, ds_anotacao, dt_cadastro) VALUES (2, 16, 4, 'Página 4 7E anotação prof pardal edição 233', '2020-12-30 13:56:55');
INSERT INTO sis_enovus.tb_anotacao_professor (co_anotacao_professor, co_materia_turma, co_pagina_livro, ds_anotacao, dt_cadastro) VALUES (3, 16, 10, 'ecfe ceqwc wqwq', '2020-12-30 14:06:55');
INSERT INTO sis_enovus.tb_anotacao_professor (co_anotacao_professor, co_materia_turma, co_pagina_livro, ds_anotacao, dt_cadastro) VALUES (4, 16, 6, 'gar gr g', '2020-12-30 15:29:07');
INSERT INTO sis_enovus.tb_anotacao_professor (co_anotacao_professor, co_materia_turma, co_pagina_livro, ds_anotacao, dt_cadastro) VALUES (5, 16, 25, 'fe fe', '2020-12-30 15:35:09');
INSERT INTO sis_enovus.tb_anotacao_professor (co_anotacao_professor, co_materia_turma, co_pagina_livro, ds_anotacao, dt_cadastro) VALUES (1, 16, 5, 'FDGB FEGBH REHG', '2021-01-06 17:57:21');

--
-- Data for Name: tb_capitulo; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_capitulo (co_capitulo, ds_titulo, st_status, dt_cadastro, co_livro, co_imagem) VALUES (1, 'Novo Teorema 22', 'S', '2020-11-09 10:26:56', 10, 30);
INSERT INTO sis_enovus.tb_capitulo (co_capitulo, ds_titulo, st_status, dt_cadastro, co_livro, co_imagem) VALUES (2, 'Estudo dos Fluídos', 'S', '2020-12-15 12:12:30', 10, 33);
INSERT INTO sis_enovus.tb_capitulo (co_capitulo, ds_titulo, st_status, dt_cadastro, co_livro, co_imagem) VALUES (3, 'Relação entre os seres vivos', 'S', '2021-01-18 09:54:53', 11, 35);
INSERT INTO sis_enovus.tb_capitulo (co_capitulo, ds_titulo, st_status, dt_cadastro, co_livro, co_imagem) VALUES (4, 'Capítulo 1 - Universo, Sistema Solar e planeta terra', 'S', '2021-01-18 10:11:44', 11, 41);
INSERT INTO sis_enovus.tb_capitulo (co_capitulo, ds_titulo, st_status, dt_cadastro, co_livro, co_imagem) VALUES (5, 'Capítulo 2 - As rochas e o solo - características', 'S', '2021-01-19 08:52:55', 11, 42);


--
-- Data for Name: tb_contato; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (1, '61993274991', '6130826060', '0', '', 'leonardomcbessa@gmail.com', '', '', '', '');
INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (2, '61993055454', '', '', '', 'leninha.k@gmail.com', '', '', '', '');
INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (8, '61615613132', '', '', '', 'leninha.k@gmail.com', '', '', '', '');
INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (22, '65465465465', '46565465465', '', '', 'leonardo.bessa@basis.com.br', '', '', '', '');
INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (24, '45354356464', '', '', '', 'leninha.k@gmail.com', '', '', '', '');
INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (25, '6656565555', '', '', '', 'arnaldo@gmail.com', '', '', '', '');
INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (26, '', '', '', '', 'leonardomcbessa@gmail.com', '', '', '', '');
INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (27, '61991958371', '', '', '', 'lucas_soares_dasilva@outlook.com', '', '', '', '');
INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (28, '65465464654', '', '', '', 'leodjx55@hotmail.com', '', '', '', '');
INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (29, '61999562323', '61646541316', '', '', 'leodjx@hotmail.com', '', '', '', '');
INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (30, '4654564165', '', '', '', 'leninha.kff@gmail.com', '', '', '', '');
INSERT INTO sis_enovus.tb_contato (co_contato, nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES (31, '51651656513', '', '', '', 'lucas_10@outlook.com', '', '', '', '');


--
-- Data for Name: tb_controller; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_controller (co_controller, no_controller, ds_class_icon) VALUES (1, 'Gestão', 'clip-data');
INSERT INTO sis_enovus.tb_controller (co_controller, no_controller, ds_class_icon) VALUES (2, 'Auditoria', 'fa fa-crosshairs');
INSERT INTO sis_enovus.tb_controller (co_controller, no_controller, ds_class_icon) VALUES (3, 'Acesso', 'clip-connection-2');
INSERT INTO sis_enovus.tb_controller (co_controller, no_controller, ds_class_icon) VALUES (4, 'Funcionalidade', 'fa fa-outdent');
INSERT INTO sis_enovus.tb_controller (co_controller, no_controller, ds_class_icon) VALUES (5, 'Perfil', 'clip-stack-empty');
INSERT INTO sis_enovus.tb_controller (co_controller, no_controller, ds_class_icon) VALUES (6, 'Usuário', 'fa fa-group');
INSERT INTO sis_enovus.tb_controller (co_controller, no_controller, ds_class_icon) VALUES (7, 'Visita', 'clip-airplane');
INSERT INTO sis_enovus.tb_controller (co_controller, no_controller, ds_class_icon) VALUES (8, 'Relatorio', 'fa fa-clipboard');
INSERT INTO sis_enovus.tb_controller (co_controller, no_controller, ds_class_icon) VALUES (9, 'Suporte', 'fa fa-envelope');
INSERT INTO sis_enovus.tb_controller (co_controller, no_controller, ds_class_icon) VALUES (10, 'Escola', 'clip-home-2');
INSERT INTO sis_enovus.tb_controller (co_controller, no_controller, ds_class_icon) VALUES (11, 'Livro', 'clip-note');


--
-- Data for Name: tb_crons; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--



--
-- Data for Name: tb_endereco; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (1, 'qr 403 conjunto 10 casa 28', '', 'Samambaia Norte', '72319111', 'Brasília', 'DF');
INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (2, '', '', '', '', '', '');
INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (8, 'QR 403 Conjunto 10', '', 'Samambaia Norte (Samambaia)', '72319111', 'Brasília', 'DF');
INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (22, 'Rua Ipanema', 'complemento', 'Ypiranga', '72879282', 'Valparaíso de Goiás', 'GO');
INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (24, 'QR 403 Conjunto 10', 'complemento', 'Samambaia Norte (Samambaia)', '72319111', 'Brasília', 'DF');
INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (25, '', '', '', '', '', '');
INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (26, '', '', '', '', '', '');
INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (27, '', '', '', '', '', '');
INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (28, '', '', '', '', '', '');
INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (29, 'QR 403 Conjunto 10', 'complemento', 'Samambaia Norte (Samambaia)', '72319111', 'Brasília', 'DF');
INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (30, '', '', '', '', '', '');
INSERT INTO sis_enovus.tb_endereco (co_endereco, ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES (31, 'QR 403 Conjunto 10', '', 'Samambaia Norte (Samambaia)', '72319111', 'Brasília', 'DF');


--
-- Data for Name: tb_escola; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_escola (co_escola, nu_cnpj, no_fantasia, no_razao_social, nu_insc_estadual, ds_observacao, dt_cadastro, co_endereco, co_usuario, co_contato) VALUES (1, '', 'Escola Leonardo da vinci', '', '', '', '2020-10-23 14:29:02', 8, 2, 8);
INSERT INTO sis_enovus.tb_escola (co_escola, nu_cnpj, no_fantasia, no_razao_social, nu_insc_estadual, ds_observacao, dt_cadastro, co_endereco, co_usuario, co_contato) VALUES (2, '', 'Escola dos sonhos', '', '', '', '2020-10-31 12:57:42', 24, 2, 24);


--
-- Data for Name: tb_funcionalidade; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (1, 'Perfil Master', 'PerfilMaster', 'A', 'S', 1);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (2, 'Auditoria Listar', 'ListarAuditoria', 'A', 'S', 2);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (3, 'Auditoria Detalhar', 'DetalharAuditoria', 'A', 'N', 2);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (4, 'Usuario Cadastrar', 'CadastroUsuario', 'A', 'N', 6);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (5, 'Usuario Listar', 'ListarUsuario', 'A', 'S', 6);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (6, 'Meu Perfil Usuario', 'MeuPerfilUsuario', 'A', 'S', 6);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (7, 'Perfil Listar', 'ListarPerfil', 'A', 'S', 5);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (8, 'Perfil Cadastrar', 'CadastroPerfil', 'A', 'S', 5);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (9, 'Funcionalidade Listar', 'ListarFuncionalidade', 'A', 'S', 4);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (10, 'Funcionalidade Cadastrar', 'CadastroFuncionalidade', 'A', 'S', 4);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (11, 'Troca Senha Usuario', 'TrocaSenhaUsuario', 'A', 'S', 6);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (13, 'Listar Visita', 'ListarVisita', 'A', 'S', 7);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (14, 'Configuração Gestao', 'ConfigGestao', 'A', 'S', 1);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (15, 'Gerar Entidades Gestao', 'GerarEntidadesGestao', 'A', 'S', 1);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (16, 'Gerar Backup Gestao', 'GerarBackupGestao', 'A', 'S', 1);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (17, 'Listar Acesso', 'ListarAcesso', 'A', 'S', 3);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (22, 'Pre Projeto Gestao', 'PreProjetoGestao', 'A', 'S', 1);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (23, 'Acompanhar Projeto Gestao', 'AcompanharProjetoGestao', 'A', 'N', 1);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (24, 'Limpar Banco Gestao', 'LimparBancoGestao', 'A', 'S', 1);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (28, 'Crons', 'CronsGestao', 'A', 'S', 1);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (29, 'Minificação', 'MinificacaoGestao', 'A', 'S', 1);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (30, 'Gráfico', 'GraficoRelatorio', 'A', 'S', 8);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (31, 'Listar Suporte', 'ListarSuporte', 'A', 'S', 9);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (32, 'Cadastro Suporte', 'CadastroSuporte', 'A', 'N', 9);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (33, 'Deleta Suporte', 'DeletaSuporte', 'A', 'N', 9);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (34, 'Listar Escola', 'ListarEscola', 'A', 'S', 10);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (35, 'Cadastrar Escola', 'CadastroEscola', 'A', 'N', 10);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (36, 'Listar Turma', 'ListarTurma', 'A', 'N', 10);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (37, 'Cadastrar Turma', 'CadastroTurma', 'A', 'N', 10);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (38, 'Listar Aluno', 'ListarAluno', 'A', 'N', 10);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (39, 'Cadastrar Aluno', 'CadastroAluno', 'A', 'N', 10);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (40, 'Listar Livro', 'ListarLivro', 'A', 'S', 11);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (41, 'Cadastrar Livro', 'CadastroLivro', 'A', 'N', 11);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (42, 'Listar Capítulo', 'ListarCapitulo', 'A', 'N', 11);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (43, 'Cadastrar Capítulo', 'CadastroCapitulo', 'A', 'N', 11);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (44, 'Listar Página', 'ListarPaginaLivro', 'A', 'N', 11);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (45, 'Cadastrar Página', 'CadastroPaginaLivro', 'A', 'N', 11);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (46, 'Ler Livro', 'LerLivro', 'A', 'N', 11);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (47, 'Listar Professor', 'ListarProfessor', 'A', 'N', 10);
INSERT INTO sis_enovus.tb_funcionalidade (co_funcionalidade, no_funcionalidade, ds_action, st_status, st_menu, co_controller) VALUES (48, 'Cadastro Professor', 'CadastroProfessor', 'A', 'N', 10);


--
-- Data for Name: tb_historia; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (1, 'Criar Perfis', 'Criar Perfis', '2020-09-26 13:54:16', '2020-09-26 13:54:16', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (2, 'Criar Login', 'Criar Login', '2020-09-26 14:17:38', '2020-09-26 14:17:38', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (3, 'Criar Menus', 'Criar Menus', '2020-09-26 14:18:04', '2020-09-26 14:18:04', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (4, 'Criar Entidades', 'Criar Entidades', '2020-09-26 14:18:30', '2020-09-26 14:18:30', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (5, 'Criar Modelo de Dados', 'Criar Modelo de Dados', '2020-09-26 14:18:47', '2020-09-26 14:18:47', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (6, 'Configurações Iniciais do Sistema', 'Configurações Iniciais do Sistema', '2020-09-26 14:19:41', '2020-09-26 14:19:41', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (7, 'Carga Inicial do Sistema', 'Carga Inicial do Sistema', '2020-09-26 14:20:16', '2020-09-26 14:21:03', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (8, 'Responsividade do Sistema', 'Responsividade do Sistema', '2020-09-26 14:23:52', '2020-12-22 17:52:04', 'I', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (9, 'Instalação do Plugin', 'Instalação do Plugin', '2020-09-26 14:47:04', '2020-12-22 17:53:19', 'C', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (10, 'Css Padrão', 'Css Padrão', '2020-09-26 14:47:46', '2020-09-26 14:47:46', 'N', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (11, 'Css dos Livros específico', 'Css dos Livros específico', '2020-09-26 14:48:19', '2020-09-26 14:48:19', 'N', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (12, 'JavaScript', 'JavaScript', '2020-09-26 14:48:42', '2020-09-26 14:48:42', 'N', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (13, 'Pluguins para Imagem', 'Pluguins para Imagem', '2020-09-26 14:49:15', '2020-12-22 17:53:02', 'C', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (14, 'Pluguins para Enquete', 'Pluguins para Enquete', '2020-09-26 14:49:51', '2020-09-26 14:49:51', 'N', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (15, 'Pluguins para Vídeos', 'Pluguins para Vídeos', '2020-09-26 14:50:12', '2020-12-22 17:52:46', 'C', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (16, 'Pluguins para Elemento Lateral', 'Pluguins para Elemento Lateral', '2020-09-26 14:50:35', '2020-09-26 14:50:35', 'N', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (17, 'Pluguins para Popup Explicativo', 'Pluguins para Popup Explicativo', '2020-09-26 14:50:55', '2020-09-26 14:50:55', 'N', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (18, 'padrão do Livro', 'padrão do Livro', '2020-09-26 14:51:40', '2020-12-22 17:54:06', 'I', 3);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (19, 'padrão da Página', 'padrão da Página', '2020-09-26 14:51:52', '2020-12-22 17:54:01', 'I', 3);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (20, 'Não Cópiar o livro', 'Segurança para não copiar os livros (Botão direito e copiar código fonte e outros)', '2020-09-26 14:53:03', '2020-09-26 14:53:03', 'N', 4);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (21, 'Bloquear acesso as mídias do livro', 'Bloquear acesso as mídias do livro', '2020-09-26 14:54:28', '2020-09-26 14:54:28', 'N', 4);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (22, 'Bloquear Acesso simultâneo', 'Bloquear Acesso simultâneo', '2020-09-26 14:55:23', '2020-10-22 12:00:27', 'C', 5);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (23, 'Validar dispositivo sendo acessado', 'Validar dispositivo sendo acessado', '2020-09-26 14:55:54', '2020-09-26 14:55:54', 'N', 5);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (24, 'Download Apple Store', 'Download Apple Store', '2020-09-26 15:07:50', '2020-09-26 15:07:50', 'N', 6);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (25, 'Download Google play', 'Download Google play', '2020-09-26 15:08:13', '2020-09-26 15:08:13', 'N', 6);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (26, 'Criar Aplicativo', 'Criar Aplicativo acesso ao site e gerar menus', '2020-09-26 15:08:55', '2020-09-26 15:08:55', 'N', 6);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (27, 'Criar Função para notificações', 'Criar Função para notificações', '2020-09-26 15:13:54', '2020-09-26 15:13:54', 'N', 6);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (28, 'Manter Escola', 'Manter Escola', '2020-10-23 10:07:07', '2020-10-23 15:20:01', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (29, 'Manter Turma', 'Manter Turma', '2020-10-23 10:07:24', '2020-10-27 10:35:38', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (30, 'Manter Aluno', 'Manter Aluno', '2020-10-23 10:07:41', '2020-10-30 19:59:45', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (31, 'Manter Professor', 'Manter Professor / matérias do Professor', '2020-10-23 10:08:02', '2020-12-22 17:51:53', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (32, 'Manter Matéria', 'Manter Matéria', '2020-10-23 10:08:30', '2020-11-08 23:19:41', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (33, 'Manter Livro', 'Manter Livro', '2020-10-23 10:09:52', '2020-11-08 23:20:08', 'C', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (34, 'Manter Capítulo', 'Manter Capítulo', '2020-10-23 10:10:09', '2020-11-09 10:35:39', 'C', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (35, 'Manter Página', 'Manter Página', '2020-10-23 10:10:37', '2020-11-09 13:59:38', 'C', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (36, 'Breadcrumb das Telas da Escola', 'Breadcrumb das Telas da Escola', '2020-10-27 10:35:04', '2020-11-02 16:57:05', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (37, 'Pesquisa Avançada Escola', 'Pesquisa Avançada Escola', '2020-10-27 10:36:09', '2020-11-02 14:14:10', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (38, 'Pesquisa Avançada Turma', 'Pesquisa Avançada Turma', '2020-10-27 10:36:25', '2020-11-02 14:14:01', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (39, 'Pesquisa Avançada Aluno', 'Pesquisa Avançada Aluno', '2020-10-27 10:37:11', '2020-11-02 14:13:52', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (40, 'Adequar telas para Gestor de Coordenador Escolar', 'Adequar telas para Gestor de Coordenador Escolar', '2020-10-31 13:03:31', '2020-11-02 14:13:41', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (41, 'História de Ganho 1', 'História de Ganho', '2020-11-09 10:39:17', '2020-11-09 10:39:17', 'C', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (42, 'História de Ganho 2', 'História de Ganho 2', '2020-11-09 10:39:33', '2020-11-09 10:39:33', 'C', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (43, 'História de Ganho 3', 'História de Ganho 3', '2020-11-09 10:39:48', '2020-11-09 10:39:48', 'C', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (44, 'História de Ganho 4', 'História de Ganho 4', '2020-11-09 10:40:31', '2020-11-09 10:40:31', 'C', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (45, 'História de Ganho 5', 'História de Ganho 5', '2020-11-09 10:40:52', '2020-11-09 10:40:52', 'C', 2);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (46, 'Dependencia da Turma ao Professor', 'Dependencia da Turma ao Professor', '2020-11-09 10:41:23', '2020-12-03 11:44:24', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (47, 'Dependencia da Turma com a Matéria', 'Dependencia da Turma com a Matéria', '2020-11-09 10:41:37', '2020-12-03 11:44:47', 'C', 1);
INSERT INTO sis_enovus.tb_historia (co_historia, ds_titulo, ds_observacao, dt_cadastro, dt_atualizado, st_situacao, co_sessao) VALUES (48, 'Plugin para Galeria', 'Plugin para Galeria', '2020-12-22 17:53:40', '2020-12-22 17:53:40', 'C', 2);


--
-- Data for Name: tb_historico_historia; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (1, '3', '0', '2020-09-26 13:54:16', 1);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (2, '5', '0', '2020-09-26 14:17:38', 2);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (3, '5', '0', '2020-09-26 14:18:04', 3);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (4, '8', '0', '2020-09-26 14:18:30', 4);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (5, '13', '0', '2020-09-26 14:18:47', 5);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (6, '8', '0', '2020-09-26 14:19:41', 6);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (7, '3', '0', '2020-09-26 14:20:16', 7);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (8, '3', '0', '2020-09-26 14:20:43', 7);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (9, '3', '0', '2020-09-26 14:21:03', 7);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (10, '40', '35', '2020-09-26 14:23:52', 8);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (11, '13', '13', '2020-09-26 14:47:04', 9);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (12, '20', '20', '2020-09-26 14:47:46', 10);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (13, '8', '8', '2020-09-26 14:48:19', 11);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (14, '5', '5', '2020-09-26 14:48:42', 12);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (15, '5', '5', '2020-09-26 14:49:15', 13);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (16, '20', '20', '2020-09-26 14:49:51', 14);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (17, '5', '5', '2020-09-26 14:50:12', 15);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (18, '5', '5', '2020-09-26 14:50:35', 16);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (19, '5', '5', '2020-09-26 14:50:55', 17);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (20, '13', '13', '2020-09-26 14:51:40', 18);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (21, '13', '13', '2020-09-26 14:51:52', 19);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (22, '13', '13', '2020-09-26 14:53:03', 20);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (23, '8', '8', '2020-09-26 14:54:28', 21);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (24, '5', '5', '2020-09-26 14:55:23', 22);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (25, '20', '20', '2020-09-26 14:55:54', 23);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (26, '8', '8', '2020-09-26 15:07:50', 24);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (27, '5', '5', '2020-09-26 15:08:13', 25);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (28, '30', '30', '2020-09-26 15:08:55', 26);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (29, '20', '20', '2020-09-26 15:13:54', 27);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (30, '5', '0', '2020-10-22 12:00:27', 22);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (31, '5', '5', '2020-10-23 10:07:07', 28);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (32, '5', '5', '2020-10-23 10:07:24', 29);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (33, '5', '5', '2020-10-23 10:07:41', 30);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (34, '5', '5', '2020-10-23 10:08:02', 31);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (35, '5', '5', '2020-10-23 10:08:30', 32);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (36, '8', '8', '2020-10-23 10:08:53', 31);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (37, '5', '5', '2020-10-23 10:09:52', 33);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (38, '5', '5', '2020-10-23 10:10:09', 34);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (39, '20', '20', '2020-10-23 10:10:37', 35);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (40, '8', '4', '2020-10-23 11:54:39', 28);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (41, '8', '8', '2020-10-23 11:54:49', 29);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (42, '8', '8', '2020-10-23 11:55:01', 30);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (43, '8', '8', '2020-10-23 11:57:56', 32);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (44, '8', '0', '2020-10-23 15:20:01', 28);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (45, '5', '5', '2020-10-27 10:35:04', 36);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (46, '8', '0', '2020-10-27 10:35:38', 29);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (47, '5', '5', '2020-10-27 10:36:09', 37);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (48, '3', '3', '2020-10-27 10:36:25', 38);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (49, '8', '8', '2020-10-27 10:37:11', 39);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (50, '8', '0', '2020-10-30 19:59:45', 30);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (51, '20', '10', '2020-10-31 13:03:31', 40);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (52, '13', '8', '2020-10-31 13:05:25', 40);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (53, '13', '0', '2020-11-02 14:13:41', 40);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (54, '8', '0', '2020-11-02 14:13:52', 39);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (55, '3', '0', '2020-11-02 14:14:01', 38);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (56, '5', '0', '2020-11-02 14:14:10', 37);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (57, '5', '3', '2020-11-02 16:56:55', 36);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (58, '5', '0', '2020-11-02 16:57:05', 36);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (59, '3', '0', '2020-11-08 23:19:41', 32);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (60, '8', '0', '2020-11-08 23:20:08', 33);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (61, '5', '3', '2020-11-09 00:01:53', 34);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (62, '5', '0', '2020-11-09 10:35:39', 34);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (63, '40', '0', '2020-11-09 10:39:17', 41);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (64, '40', '0', '2020-11-09 10:39:33', 42);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (65, '40', '0', '2020-11-09 10:39:48', 43);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (66, '40', '0', '2020-11-09 10:40:31', 44);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (67, '40', '0', '2020-11-09 10:40:52', 45);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (68, '40', '0', '2020-11-09 10:41:23', 46);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (69, '40', '0', '2020-11-09 10:41:37', 47);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (70, '20', '0', '2020-11-09 13:59:38', 35);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (71, '40', '0', '2020-12-03 11:44:24', 46);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (72, '40', '0', '2020-12-03 11:44:47', 47);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (73, '40', '20', '2020-12-03 17:49:56', 8);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (74, '40', '35', '2020-12-03 17:50:29', 8);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (75, '8', '0', '2020-12-22 17:51:53', 31);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (76, '40', '2', '2020-12-22 17:52:04', 8);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (77, '5', '0', '2020-12-22 17:52:46', 15);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (78, '5', '0', '2020-12-22 17:53:02', 13);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (79, '13', '0', '2020-12-22 17:53:19', 9);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (80, '5', '0', '2020-12-22 17:53:40', 48);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (81, '13', '2', '2020-12-22 17:54:01', 19);
INSERT INTO sis_enovus.tb_historico_historia (co_historico_historia, nu_esforco, nu_esforco_restante, dt_cadastro, co_historia) VALUES (82, '13', '2', '2020-12-22 17:54:06', 18);


--
-- Data for Name: tb_historico_suporte; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--



--
-- Data for Name: tb_imagem; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (1, 'leonardo-m-c-bessa-56e8920c23ab66.jpg', 1);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (2, 'Livro/Matemática/aprendendo-matematica-9-ano-5fa888a6580fd.jpg', 2);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (3, 'Livro/Português/conhecendo-com-o-portugues-3-ano-5fa88b10a54c1.jpg', 2);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (15, 'Livro/Ciências/aprendendo-ciencias-nova-7-ano-tipo-3-5fa897bfb0a1c.PNG', 2);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (18, 'Livro/Ciências/aprendendo-ciencias-nova-7-ano-tipo-3-5fa8986b5e294.PNG', 2);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (19, 'Livro/Ciências/aprendendo-ciencias-nova-7-ano-tipo-3-5fa8990742dfd.jpg', 2);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (22, 'Livro/Matemática/aprendendo-matematica-9-ano-5fa92967b1f72.jpg', 2);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (23, 'Livro//novo-teorema-5fa9347c4caac.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (24, 'Livro/Ciências/novo-teorema-5fa9350cc5e40.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (25, 'Livro/Ciências/novo-teorema-5fa935908c314.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (26, 'Livro/Ciências/novo-teorema-22-5fa9372abb2f0.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (27, 'Livro/Ciências/aprendendo-ci-ncias-nova-7-ano-tipo-3-5fc65a9432426.jpg', 2);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (28, 'Livro/Português/conhecendo-com-o-portugu-s-3-ano-5fc65a9f1e1ee.jpg', 2);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (29, 'Livro/Matemática/aprendendo-matem-tica-9-ano-5fc65aaf0b1bb.jpg', 2);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (30, 'Livro/Ciências/novo-teorema-22-5fc65ac559ced.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (31, 'Livro/Ciências/teorema-66-5fd8c44e3ec1b.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (33, 'Livro/Ciências/teorema-66-5feb33601c7b3.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (32, 'lucas-soares-5fdcb6bf5d900.jpg', 1);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (20, 'Livro/Ciências/aprendendo-ciencias-nova-7-ano-tipo-3-5fa926526a213.jpg', 1);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (21, 'Livro/Português/conhecendo-com-o-portugues-3-ano-5fa927f292609.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (34, 'Livro/Biologia/aprender-biologia-6-600584f1e823a.jpg', 2);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (35, 'Livro/Biologia/relacao-entre-os-seres-vivos-6005851ddd3d2.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (36, 'Livro/Biologia/universo-sistema-solar-e-planeta-terra-600589111bf6c.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (37, 'Livro/Biologia/universo-sistema-solar-e-planeta-terra-6005a46d1437a.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (38, 'Livro/Biologia/aprender-biologia-6-6005a89e61212.jpg', 2);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (39, 'Livro/Biologia/capitulo-1-universo-sistema-solar-e-planeta-terra-6005b8fca48d5.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (40, 'Livro/Biologia/capitulo-1-universo-sistema-solar-e-planeta-terra-6005b9468bd85.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (41, 'Livro/Biologia/capitulo-1-universo-sistema-solar-e-planeta-terra-6005b9ca54a23.jpg', 3);
INSERT INTO sis_enovus.tb_imagem (co_imagem, ds_caminho, co_tipo_imagem) VALUES (42, 'Livro/Biologia/capitulo-2-as-rochas-e-o-solo-caracteristicas-6006c8179be61.jpg', 3);


--
-- Data for Name: tb_livro; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_livro (co_livro, ds_titulo, st_status, dt_cadastro, co_materia, co_imagem) VALUES (1, 'Aprendendo Matemática 9 Ano', 'S', '2020-11-08 22:09:10', 1, 29);
INSERT INTO sis_enovus.tb_livro (co_livro, ds_titulo, st_status, dt_cadastro, co_materia, co_imagem) VALUES (2, 'Conhecendo com o Português 3 Ano', 'S', '2020-11-08 22:19:28', 2, 28);
INSERT INTO sis_enovus.tb_livro (co_livro, ds_titulo, st_status, dt_cadastro, co_materia, co_imagem) VALUES (10, 'Aprendendo Ciências Nova 7 Ano TIPO 3', 'S', '2020-11-08 22:36:16', 10, 27);
INSERT INTO sis_enovus.tb_livro (co_livro, ds_titulo, st_status, dt_cadastro, co_materia, co_imagem) VALUES (11, 'Aprender Biologia 6', 'S', '2021-01-18 09:54:09', 2, 38);


--
-- Data for Name: tb_materia; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_materia (co_materia, ds_materia, dt_cadastro, co_escola) VALUES (1, 'Matemática', '2021-01-07 12:44:46', 2);
INSERT INTO sis_enovus.tb_materia (co_materia, ds_materia, dt_cadastro, co_escola) VALUES (2, 'Biologia', '2021-01-07 12:45:01', 1);
INSERT INTO sis_enovus.tb_materia (co_materia, ds_materia, dt_cadastro, co_escola) VALUES (10, 'Ciências', '2021-01-07 12:45:15', 1);


--
-- Data for Name: tb_materia_turma; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_materia_turma (co_materia_turma, co_materia, co_turma, co_professor) VALUES (11, 10, 3, 1);
INSERT INTO sis_enovus.tb_materia_turma (co_materia_turma, co_materia, co_turma, co_professor) VALUES (12, 10, 2, 1);
INSERT INTO sis_enovus.tb_materia_turma (co_materia_turma, co_materia, co_turma, co_professor) VALUES (13, 10, 1, 1);
INSERT INTO sis_enovus.tb_materia_turma (co_materia_turma, co_materia, co_turma, co_professor) VALUES (16, 1, 4, 2);


--
-- Data for Name: tb_modulo; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_modulo (co_modulo, no_modulo, dt_cadastro, co_projeto) VALUES (10, 'Site / Sistema / Leitor do Livro', '2020-09-26 13:42:25', 1);
INSERT INTO sis_enovus.tb_modulo (co_modulo, no_modulo, dt_cadastro, co_projeto) VALUES (11, 'FrameWork', '2020-09-26 13:42:32', 1);
INSERT INTO sis_enovus.tb_modulo (co_modulo, no_modulo, dt_cadastro, co_projeto) VALUES (12, 'Aplicativo', '2020-09-26 13:42:38', 1);


--
-- Data for Name: tb_pagina; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--



--
-- Data for Name: tb_pagina_livro; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (3, 1, '<h1><span style=\"font-family:Verdana,Geneva,sans-serif\"><span style=\"font-size:26px\"><big><span style=\"color:#e74c3c\">4</span></big></span> <span style=\"font-size:24px\"><big><span style=\"color:#ffffff\"><span style=\"background-color:#c0392b\">MEIOSE &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></span></big></span><span style=\"font-size:28px\"><big><span style=\"color:#ffffff\"><span style=\"background-color:#c0392b\"> </span></span></big></span></span></h1>
\n
\n<p><span style=\"font-size:14px\">No in&iacute;cio do texto sobre mitose, comentamos a respeito do momento da fecunda&ccedil;&atilde;o, quando o espermatozoide fecunda o gameta feminino formando um zigoto diploide. Isso ocorre porque o espermatozoide e o gameta feminino s&atilde;o c&eacute;lulas haploides, isto &eacute;, n&atilde;o apresentam os cromossomos aos pares. Mas como essas c&eacute;lulas s&atilde;o formadas no organismo a partir de c&eacute;lulas diploides, essa produ&ccedil;&atilde;o &eacute; responsabilidade de um processo de divis&atilde;o denominado meiose. </span></p>
\n
\n<p><span style=\"font-size:14px\">A meiose &eacute; uma divis&atilde;o celular em que, a partir de uma c&eacute;lula diploide, se formam quatro c&eacute;lulas-filhas com metade dos cromossomos da c&eacute;lula precursora. Como vimos, a fun&ccedil;&atilde;o desse processo nos seres humanos &eacute; a produ&ccedil;&atilde;o de gametas, ou seja, o gameta masculino (espermatozoide) ou o gameta feminino (ov&oacute;cito II). Isso mant&eacute;m constante a ploidia da esp&eacute;cie. Al&eacute;m disso, a meiose proporciona um aumento da variabilidade gen&eacute;tica.&rdquo;</span></p>
\n
\n<p><span style=\"font-size:14px\">Para a ocorr&ecirc;ncia da meiose, a interfase tamb&eacute;m &eacute; necess&aacute;ria, mas o processo mei&oacute;tico, diferente da mitose, &eacute; divido para fins did&aacute;ticos em duas fases: Meiose I e Meiose II.</span></p>
\n
\n<p><span style=\"font-size:14px\">Para a ocorr&ecirc;ncia da meiose, a interfase tamb&eacute;m &eacute; necess&aacute;ria, mas o processo mei&oacute;tico, diferente da mitose, &eacute; divido para fins did&aacute;ticos em duas fases: Meiose I e Meiose II.</span></p>
\n
\n<p><span style=\"font-size:14px\">Para a ocorr&ecirc;ncia da meiose, a interfase tamb&eacute;m &eacute; necess&aacute;ria, mas o processo mei&oacute;tico, diferente da mitose, &eacute; divido para fins did&aacute;ticos em duas fases: Meiose I e Meiose II.</span></p>
\n
\n<p><span style=\"font-size:14px\">Para a ocorr&ecirc;ncia da meiose, a interfase tamb&eacute;m &eacute; necess&aacute;ria, mas o processo mei&oacute;tico, diferente da mitose, &eacute; divido para fins did&aacute;ticos em duas fases: Meiose I e Meiose II.</span></p>
\n
\n<p>&nbsp;</p>', '2020-12-15 11:42:12', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (4, 1, '<h3><strong><big><span style=\"font-size:24px\"><span style=\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\">Telofase II e citocinese</span></span></big></strong></h3>\n\n\n\n<p><span style=\"font-size:14px\">Ocorre a forma&ccedil;&atilde;o da carioteca em volta de cada grupo de cromossomos e a descondensa&ccedil;&atilde;o destes. A citocinese divide a membrana plasm&aacute;tica para forma&ccedil;&atilde;o de novas c&eacute;lulas.</span></p>\n\n\n\n<p><span style=\"font-size:14px\">Diferentemente da mitose, que &eacute; uma divis&atilde;o equacional, a meiose &eacute; uma divis&atilde;o celular reducional, visto que as quatro c&eacute;lulas formadas no final do processo apresentam metade dos cromossomos da c&eacute;lula inicial. Observe a seguir, a figura que considera como exemplo a meiose em um organismo 2n = 4 e o v&iacute;deo que ilustra esse processo de divis&atilde;o celular em uma c&eacute;lula 2n = 2.</span></p>\n\n\n\n<p><span style=\"font-size:14px\">&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <img alt=\"\" src=\"http://localhost/enovus/uploads/Imagens/files/imagem6.png\" style=\"height:387px; width:311px\" /></span></p>', '2020-12-15 11:45:04', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (5, 1, '<h2><span style=\"color:#000000\"><span style=\"font-size:28px\"><span style=\"font-family:Georgia,serif\"><tt>Citocinese</tt></span></span></span></h2>\n\n\n\n<p><span style=\"color:#000000\"><img alt=\"\" src=\"http://localhost/enovus/uploads/Imagens/files/1190269b7a8594ca24288d829e479063.jpg\" style=\"float:right; height:392px; margin:10px; width:294px\" /><span style=\"font-size:14px\">A citocinese &eacute; a divis&atilde;o da membrana plasm&aacute;tica das c&eacute;lulas e, desta maneira, a finaliza&ccedil;&atilde;o do processo mit&oacute;tico, dividindo as duas cariotecas e todo o material citoplasm&aacute;tico. A citocinese na c&eacute;lula animal ocorre por estrangulamento, isto &eacute;, de fora para dentro, denominada citocinese centr&iacute;peta, j&aacute; na c&eacute;lula vegetal, no centro da c&eacute;lula vai se formando uma estrutura denominada lamela m&eacute;dia que vai aumentando de tamanho at&eacute; a separa&ccedil;&atilde;o das c&eacute;lulas, isto &eacute;, de dentro para fora, citocinese centr&iacute;fuga.</span></span></p>\n\n\n\n<p>&nbsp;</p>\n\n\n\n<p><span style=\"color:#000000\"><span style=\"font-size:14px\">Como vimos, a mitose &eacute; um processo cont&iacute;nuo de divis&atilde;o celular, onde uma c&eacute;lula &eacute; respons&aacute;vel pela forma&ccedil;&atilde;o de duas c&eacute;lulas id&ecirc;nticas, por isso, &eacute; denominada divis&atilde;o equacional, visto que a quantidade de material gen&eacute;tico &eacute; a mesma nas c&eacute;lulas-filhas e na c&eacute;lula inicial. A anima&ccedil;&atilde;o a seguir demonstra todo o processo mit&oacute;tico com a inclus&atilde;o da interfase que preparou a c&eacute;lula para sua divis&atilde;o.</span></span></p>\n\n\n\n<p>&nbsp;</p>\n\n\n\n<p>&nbsp;</p>', '2020-12-07 13:28:01', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (6, 1, '<div class=\"cvcv\"><span style=\"font-size:18px\"><strong>Ou&ccedil;a livros, document&aacute;rios, podcasts e muito mais!</strong></span></div>\n\n\n\n<h3><span style=\"font-size:18px\"><strong>Encontre milhares de audiobooks, ebooks, podcasts, entrevistas e comedy shows em &aacute;udio.</strong></span></h3>\n\n\n\n<p>&nbsp;</p>\n\n\n\n<h2><span style=\"font-size:18px\">Experimente 7 dias gr&aacute;tis</span></h2>\n\n\n\n<ul>\n\n	<li>Acesso ilimitado a todo conte&uacute;do da plataforma.</li>\n\n</ul>\n\n\n\n<h3>Mais de 400 mil t&iacute;tulos, entre audiobooks, ebooks, podcasts, s&eacute;ries, document&aacute;rios e not&iacute;cias.</h3>\n\n\n\n<h3>Narra&ccedil;&atilde;o dos audiolivros feita por profissionais, entre atores, locutores e at&eacute; mesmo os pr&oacute;prios autores.<br />\n\n<br />\n\nAproveite nossa plataforma</h3>\n\n\n\n<ul>\n\n	<li>Aprenda novos idiomas - disponibilizamos conte&uacute;do em espanhol e ingl&ecirc;s.</li>\n\n	<li>Mantenha-se bem informado - not&iacute;cias em tempo real 7 dias por semana.</li>\n\n	<li>Aprimore-se profissionalmente - contamos com conte&uacute;dos t&eacute;cnicos e sobre neg&oacute;cios.</li>\n\n	<li>Aproveite tamb&eacute;m para ouvir livros de autoajuda, romances, fic&ccedil;&otilde;es, biografias, document&aacute;rios e podcasts</li>\n\n</ul>', '2020-11-09 13:49:52', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (7, 1, '<div class=\"ee\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:28px\"><span style=\"color:#e74c3c\">5 </span><span style=\"color:#ffffff\"><span style=\"background-color:#c0392b\">Gametog&ecirc;nese&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span></span></span></div>\n\n\n\n<p style=\"text-align:justify\"><span style=\"color:#000000\"><span style=\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\"><span style=\"font-size:14px\">Sabemos que a fun&ccedil;&atilde;o da meiose nos seres humanos &eacute; a forma&ccedil;&atilde;o de gametas. Mas tanto a estrutura da c&eacute;lula como a produ&ccedil;&atilde;o de cada uma delas &eacute; muito diferente no homem e na mulher.</span></span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"color:#000000\"><span style=\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\"><span style=\"font-size:14px\">Um homem libera mais ou menos 200 milh&otilde;es de espermatozoides por ejacula&ccedil;&atilde;o e, a partir da puberdade, pode ter uma ejacula&ccedil;&atilde;o com alta capacidade de fecunda&ccedil;&atilde;o uma vez a cada 48 horas at&eacute; o fim da vida, enquanto isso, uma mulher libera um ov&oacute;cito II por ciclo menstrual, isto &eacute;, a cada 28 dias, iniciando essa libera&ccedil;&atilde;o na puberdade e terminando na menopausa, mais ou menos aos 50 anos. Fazendo um c&aacute;lculo simples, uma mulher libera por volta de 400 ov&oacute;citos durante a vida. Conclui-se que em uma ejacula&ccedil;&atilde;o masculina o homem libera uma quantidade excepcionalmente maior de gametas a mais do que uma mulher libera durante toda vida. </span></span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"color:#000000\"><span style=\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\"><span style=\"font-size:14px\">Essas informa&ccedil;&otilde;es comprovam que existem diferen&ccedil;as na produ&ccedil;&atilde;o de gametas no homem e na mulher, vamos conhec&ecirc;-las:</span></span></span></p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<h3 style=\"color:#aaaaaa; font-style:italic\"><u><span style=\"color:#e74c3c\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><big><span style=\"font-size:20px\">Espermatog&ecirc;nese II &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></big></span></span></u></h3>\n\n\n\n<p><span style=\"color:#000000\"><span style=\"font-size:14px\"><span style=\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\">A gametog&ecirc;nese masculina chama-se espermatog&ecirc;nese e come&ccedil;a na fase embrion&aacute;ria onde as c&eacute;lulas germinativas do test&iacute;culo se multiplicam por mitose formando as espermatog&ocirc;nias (2n), esta fase &eacute; denominada per&iacute;odo de multiplica&ccedil;&atilde;o.</span></span></span></p>', '2020-12-15 13:37:48', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (15, 2, '<h2><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Profase I</span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Esta fase &eacute; uma das mais importantes do processo mei&oacute;tico e tamb&eacute;m a que demanda mais tempo, pois um dos principais fatores respons&aacute;veis pela diversidade entre os indiv&iacute;duos ocorre aqui, o&nbsp;crossing-over.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Em alguns livros, principalmente de Ensino Superior, a profase I &eacute; subdividida em 5 fases: lept&oacute;teno, zig&oacute;teno, paqu&iacute;teno, dipl&oacute;teno e diacinese. N&atilde;o vamos diferenciar essas fases pois este n&atilde;o &eacute; o foco do estudo do Ensino M&eacute;dio.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">As principais ocorr&ecirc;ncias da profase I s&atilde;o:</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">- a condensa&ccedil;&atilde;o dos cromossomos;</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">- o rompimento da carioteca e o desaparecimento do nucl&eacute;olo;</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">- a forma&ccedil;&atilde;o do fuso de divis&atilde;o pelos centr&iacute;olos;</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">- o pareamento dos cromossomos hom&oacute;logos, isto &eacute;, cada par de cromossomos vai ficar lado a lado na regi&atilde;o equatorial da c&eacute;lula.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">- a ocorr&ecirc;ncia do&nbsp;crossing-over&nbsp;(recombina&ccedil;&atilde;o g&ecirc;nica).</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Como os cromossomos hom&oacute;logos est&atilde;o pareados, as crom&aacute;tides de cada um dos cromossomos podem trocar peda&ccedil;os correspondentes entre si, em locais denominados</span></span></p>', '2020-12-18 12:56:00', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (8, 2, '<h2><span style=\"color:#ecf0f1\"><span style=\"font-size:24px\"><span style=\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\"><big><span style=\"background-color:#c0392b\">&nbsp;Criando E Book&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp; </span></big></span></span></span></h2>\n\n\n\n<p><span style=\"font-size:14px\"><span style=\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\">Esse v&iacute;deo mostra como criar um E-Book.</span></span></p>\n\n\n\n<div class=\"embeddedContent oembed-provider- oembed-provider-youtube\" data-align=\"center\" data-maxheight=\"245\" data-maxwidth=\"440\" data-oembed=\"https://www.youtube.com/watch?v=euV38l3C-As\" data-oembed_provider=\"youtube\" data-resizetype=\"custom\" data-title=\"Novo\" style=\"text-align:center\"><iframe allowfullscreen=\"true\" allowscriptaccess=\"always\" frameborder=\"0\" height=\"245\" scrolling=\"no\" src=\"//www.youtube.com/embed/euV38l3C-As?wmode=transparent&amp;jqoemcache=qpJ8A\" title=\"Novo\" width=\"440\"></iframe></div>\n\n\n\n<p><span style=\"font-family:Lucida Sans Unicode,Lucida Grande,sans-serif\"><span style=\"font-size:14px\">Diagramando E-Book:</span></span></p>\n\n\n\n<div class=\"embeddedContent oembed-provider- oembed-provider-vimeo\" data-align=\"center\" data-maxheight=\"245\" data-maxwidth=\"440\" data-oembed=\"https://vimeo.com/76979871\" data-oembed_provider=\"vimeo\" data-resizetype=\"custom\" data-title=\"Vídeo do Vimeo\" style=\"text-align:center\"><iframe allow=\"autoplay; fullscreen\" allowfullscreen=\"\" frameborder=\"0\" height=\"245\" src=\"https://player.vimeo.com/video/76979871?app_id=122963\" title=\"The New Vimeo Player (You Know, For Videos)\" width=\"436\"></iframe></div>\n\n\n\n<p>&nbsp;</p>', '2020-12-17 11:06:54', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (9, 2, '<h2><span style=\"color:#c0392b\"><span style=\"font-size:26px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><u><strong>Experimentos:</strong></u></span></span></span></h2>\n\n\n\n<div class=\"slideshowPlugin\" contenteditable=\"false\" data-animspeedid=\"500\" data-autostartid=\"true\" data-openonclickid=\"true\" data-pictheightid=\"300\" data-slideshowid=\"cke_itgyg7xz_slideShow\" data-speedid=\"4\" data-transitiontypeid=\"resize\" id=\"cke_itgyg7xz_slideShow\">\n\n<div class=\"ad-gallery\" contenteditable=\"false\" id=\"ad-gallery_cke_itgyg7xz_slideShow\">\n\n<div class=\"ad-image-wrapper\" contenteditable=\"false\">&nbsp;</div>\n\n\n\n<div class=\"ad-controls\" contenteditable=\"false\" style=\"visibility:hidden\">&nbsp;</div>\n\n\n\n<div class=\"ad-nav\" contenteditable=\"false\" style=\"display:none\">\n\n<div class=\"ad-thumbs\" contenteditable=\"false\">\n\n<ul class=\"ad-thumb-list\" contenteditable=\"false\">\n\n	<li contenteditable=\"false\"><span contenteditable=\"false\" tabindex=\"-1\"><a data-widget=\"image\" href=\"/enovus/uploads/Imagens/files/imagem6.png\"><img alt=\"Esse slideshow é para demonstração\" contenteditable=\"false\" height=\"50\" src=\"/enovus/uploads/Imagens/files/imagem6.png\" title=\"Experimento 1\" width=\"40\" /></a></span></li>\n\n	<li contenteditable=\"false\"><span contenteditable=\"false\" tabindex=\"-1\"><a data-widget=\"image\" href=\"/enovus/uploads/Imagens/files/c8df4ccfcaba9cccae6d2c9c354d051c.jpg\"><img alt=\"\" contenteditable=\"false\" height=\"28\" src=\"/enovus/uploads/Imagens/files/c8df4ccfcaba9cccae6d2c9c354d051c.jpg\" title=\"\" width=\"50\" /></a></span></li>\n\n	<li contenteditable=\"false\"><span contenteditable=\"false\" tabindex=\"-1\"><a data-widget=\"image\" href=\"/enovus/uploads/Imagens/files/estudantes-realizando-experimento-em-aula-quimica-543c28042993a.jpg\"><img alt=\"\" contenteditable=\"false\" height=\"50\" src=\"/enovus/uploads/Imagens/files/estudantes-realizando-experimento-em-aula-quimica-543c28042993a.jpg\" title=\"\" width=\"50\" /></a></span></li>\n\n	<li contenteditable=\"false\"><span contenteditable=\"false\" tabindex=\"-1\"><a data-widget=\"image\" href=\"/enovus/uploads/Imagens/files/exames1.jpg\"><img alt=\"\" contenteditable=\"false\" height=\"50\" src=\"/enovus/uploads/Imagens/files/exames1.jpg\" title=\"\" width=\"50\" /></a></span></li>\n\n</ul>\n\n</div>\n\n</div>\n\n</div>\n\n<script src=\"/enovus/library/plugins/ckeditor4/plugins/slideshow/3rdParty/jquery.min.js\" type=\"text/javascript\"></script><script src=\"/enovus/library/plugins/ckeditor4/plugins/slideshow/3rdParty/ad-gallery/jquery.ad-gallery.min.js\" type=\"text/javascript\"></script><script type=\"text/javascript\">(function($) { $(\"head\").append(\"<link rel=\"stylesheet\" href=\"/enovus/library/plugins/ckeditor4/plugins/slideshow/3rdParty/fancybox2/jquery.fancybox.css?v=2.1.5\" type=\"text/css\" />\"); })(jQuery);</script><script src=\"/enovus/library/plugins/ckeditor4/plugins/slideshow/3rdParty/fancybox2/jquery.fancybox.pack.js?v=2.1.5\" type=\"text/javascript\"></script><script type=\"text/javascript\">(function($) {$(function() {$(\"#ad-gallery_cke_itgyg7xz_slideShow\").on(\"click\",\".ad-image\",function(){var imgObj =$(this).find(\"img\");var isrc=imgObj.attr(\"src\");var ititle=null;var idesc=null;var iname=isrc.split(\"/\");iname=iname[iname.length-1];var imgdescid=$(this).find(\".ad-image-description\");if(imgdescid){ititle=$(this).find(\".ad-description-title\");if(ititle)ititle=ititle.text();if(ititle!=\"\")ititle=\"<big>\"+ititle+\"</big>\";idesc=$(this).find(\"span\");if(idesc)idesc=idesc.text();if (idesc.indexOf(\"IMAGE_LINK_\") >= 0) {idesc = \"\";}if(idesc!=\"\"){if(ititle!=\"\")ititle=ititle+\"<br>\";idesc=\"<i>\"+idesc+\"</i>\";}}$.fancybox.open({href:isrc,beforeLoad:function(){this.title=ititle+idesc;},});});});})(jQuery);</script><script type=\"text/javascript\">(function($) {$(function() {$(\"#ad-gallery_cke_itgyg7xz_slideShow\").on(\"click\",\".ad-image\",function(){var imgObj =$(this).find(\"img\");var isrc=imgObj.attr(\"src\");var ititle=null;var idesc=null;var iname=isrc.split(\"/\");iname=iname[iname.length-1];var imgdescid=$(this).find(\".ad-image-description\");if(imgdescid){ititle=$(this).find(\".ad-description-title\");if(ititle)ititle=ititle.text();idesc=$(this).find(\"span\");if(idesc)idesc=idesc.text();if(idesc!=\"\"){var url=window.location.href.trim();if (idesc.indexOf(\"IMAGE_LINK_TAB:\") >= 0) {	idesc = idesc.substring(15).trim(); if (url != idesc) window.open(idesc,\"_blank\");} else if (idesc.indexOf(\"IMAGE_LINK_PAR:\") >= 0) {	idesc = idesc.substring(15).trim(); if (url != idesc) window.open(idesc,\"_self\");}}}});});})(jQuery);</script><script type=\"text/javascript\">(function($) { $(\"head\").append(\"<link rel=\"stylesheet\" href=\"/enovus/library/plugins/ckeditor4/plugins/slideshow/3rdParty/ad-gallery/jquery.ad-gallery.css\" type=\"text/css\" />\"); })(jQuery);</script><script type=\"text/javascript\">(function($) {$(function() {   var galleries = $(\"#ad-gallery_cke_itgyg7xz_slideShow\").adGallery({loader_image: \"/enovus/library/plugins/ckeditor4/plugins/slideshow/3rdParty/ad-gallery/loader.gif\", width:false, height:300, start_at_index: 0, animation_speed: 500,  hooks: { displayDescription: function(image) {}}, update_window_hash: false, effect: \"resize\", slideshow: { enable: true, autostart: true, start_label: \"Início\", stop_label: \"Fim\", speed: 4000}});});})(jQuery);</script></div>\n\n\n\n<p>&nbsp;</p>\n\n\n\n<h3><span style=\"color:#c0392b\"><strong><u><span style=\"font-size:20px\">Ovog&ecirc;nese ou ovulog&ecirc;nese</span></u></strong></span></h3>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A ovog&ecirc;nese &eacute; o processo de forma&ccedil;&atilde;o de gametas femininos. Da mesma maneira que a espermatog&ecirc;nese, o in&iacute;cio do processo &eacute; embrion&aacute;rio, mas diferente do processo masculino a produ&ccedil;&atilde;o de gametas femininos cessa em um per&iacute;odo denominado menopausa, que ocorre por volta dos 50 anos da mulher.</span></span></p>\n\n\n\n<p>&nbsp;</p>\n\n\n\n<p>&nbsp;</p>', '2020-12-17 11:33:35', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (10, 2, '<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Na reprodu&ccedil;&atilde;o humana, a mulher n&atilde;o elimina &oacute;vulos e sim ov&oacute;citos II, estes s&oacute; concluir&atilde;o pela meiose II se forem fecundados pelo espermatozoide. Isto &eacute;, caso ocorra uma fecunda&ccedil;&atilde;o, o ov&oacute;cito II conclui a meiose II formando tamb&eacute;m duas c&eacute;lulas (per&iacute;odo de matura&ccedil;&atilde;o), uma denominada &oacute;vulo (n), c&eacute;lula funcional que passar&aacute; pelo processo de carogamia (fus&atilde;o dos pron&uacute;cleos) com o espermatozoide para formar o zigoto (2n), e a outra invi&aacute;vel, denominada segundo corp&uacute;sculo polar.</span></span></p>\n\n\n\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Se uma mulher n&atilde;o tiver nenhuma rela&ccedil;&atilde;o sexual com fecunda&ccedil;&atilde;o dos espermatozoides durante sua vida, ela nunca concluir&aacute; o processo de ovulog&ecirc;nese, visto que a mulher libera ov&oacute;cito II, e este s&oacute; termina o processo mei&oacute;tico se ocorrer fecunda&ccedil;&atilde;o.</span></span></p>\n\n</div>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp;&nbsp;&nbsp;&nbsp; </span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Diferente do homem que forma quatro espermatozoides a partir de cada espermat&oacute;cito I que entra no processo de espermiog&ecirc;nese, a mulher produz um ov&oacute;cito II a cada ov&oacute;cito I que inicia o processo e, al&eacute;m disso, enquanto no homem milh&otilde;es de espermat&oacute;citos I iniciam o processo juntos, na mulher, somente um ov&oacute;cito I inicia o processo a cada ciclo menstrual. Al&eacute;m disso, o homem sempre tem espermatog&ocirc;nias se multiplicando por mitose para que as c&eacute;lulas germinativas n&atilde;o cessem at&eacute; o fim da vida dele,</span></span></p>', '2020-12-17 12:23:38', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (11, 2, '<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Diferente do homem que forma quatro espermatozoides a partir de cada espermat&oacute;cito I que entra no processo de espermiog&ecirc;nese, a mulher produz um ov&oacute;cito II a cada ov&oacute;cito I que inicia o processo e, al&eacute;m disso, enquanto no homem milh&otilde;es de espermat&oacute;citos I iniciam o processo juntos, na mulher, somente um ov&oacute;cito I inicia o processo a cada ciclo menstrual. Al&eacute;m disso, o homem sempre tem espermatog&ocirc;nias se multiplicando por mitose para que as c&eacute;lulas germinativas n&atilde;o cessem at&eacute; o fim da vida dele.</span></span></p>', '2020-12-17 12:24:49', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (12, 2, '<h1 style=\"text-align:center\"><span style=\"color:#c0392b\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Exerc&iacute;cios de 1 a 4</span></span></h1>\n\n\n\n<hr />\n\n<h3><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">1) Em qual fase da mitose ocorre a separa&ccedil;&atilde;o das crom&aacute;tides-irm&atilde;s?</span></span></h3>\n\n\n\n<p><span style=\"font-size:16px\"><input name=\"Anafase\" type=\"radio\" /><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp;Anafase</span></span></p>\n\n\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><input name=\"Profase\" type=\"radio\" value=\"B\" />&nbsp;Profase</span></span></p>\n\n\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><input name=\"Metafase\" type=\"radio\" value=\"C\" />&nbsp;Metafase</span></span></p>\n\n\n\n<p><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><input name=\"Citocinese\" type=\"radio\" value=\"D\" />&nbsp;Citocinese</span></span></p>', '2020-12-17 12:55:56', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (13, 2, '<h2><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Citocinese</span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; A citocinese &eacute; a divis&atilde;o da membrana plasm&aacute;tica das c&eacute;lulas e, desta maneira, a finaliza&ccedil;&atilde;o do processo mit&oacute;tico, dividindo as duas cariotecas e todo o material citoplasm&aacute;tico. A citocinese na c&eacute;lula animal ocorre por estrangulamento, isto &eacute;, de fora para dentro, denominada citocinese centr&iacute;peta, j&aacute; na c&eacute;lula vegetal, no centro da c&eacute;lula vai se formando uma estrutura denominada lamela m&eacute;dia que vai aumentando de tamanho at&eacute; a separa&ccedil;&atilde;o das c&eacute;lulas, isto &eacute;, de dentro para fora, citocinese centr&iacute;fuga.</span></span></p>\n\n\n\n<div dir=\"rtl\">\n\n<figure class=\"image\" style=\"float:right\"><img alt=\"Exemplo\" height=\"158\" src=\"http://localhost/enovus/uploads/Imagens/files/imagem3.png\" width=\"168\" />\n\n<figcaption>Exemplo</figcaption>\n\n</figure>\n\n</div>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Como vimos, a mitose &eacute; um processo cont&iacute;nuo de divis&atilde;o celular, onde uma c&eacute;lula &eacute; respons&aacute;vel pela forma&ccedil;&atilde;o de duas c&eacute;lulas id&ecirc;nticas, por isso, &eacute; denominada divis&atilde;o equacional, visto que a quantidade de material gen&eacute;tico &eacute; a mesma nas c&eacute;lulas-filhas e na c&eacute;lula inicial. A anima&ccedil;&atilde;o a seguir demonstra todo o processo mit&oacute;tico com a inclus&atilde;o da interfase que preparou a c&eacute;lula para sua divis&atilde;o.A citocinese &eacute; a divis&atilde;o da membrana plasm&aacute;tica das c&eacute;lulas e, desta maneira, a finaliza&ccedil;&atilde;o do processo mit&oacute;tico, dividindo as duas cariotecas e todo o material citoplasm&aacute;tico. A citocinese na c&eacute;lula animal ocorre por estrangulamento, isto &eacute;, de fora para dentro, denominada citocinese centr&iacute;peta, j&aacute; na c&eacute;lula vegetal, no centro da c&eacute;lula vai se formando uma estrutura denominada lamela m&eacute;dia que vai aumentando de tamanho at&eacute; a separa&ccedil;&atilde;o das c&eacute;lulas, isto &eacute;, de dentro para fora, citocinese centr&iacute;fuga.</span></span></p>', '2020-12-18 12:16:00', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (14, 2, '<h2><span style=\"font-size:36px\"><span style=\"color:#c0392b\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">4</span></span> </span><span style=\"color:#ffffff\"><span style=\"background-color:#c0392b\">MEIOSE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; No in&iacute;cio do texto sobre mitose, comentamos a respeito do momento da fecunda&ccedil;&atilde;o, quando o espermatozoide fecunda o gameta feminino formando um zigoto diploide. Isso ocorre porque o espermatozoide e o gameta feminino s&atilde;o c&eacute;lulas haploides, isto &eacute;, n&atilde;o apresentam os cromossomos aos pares. Mas como essas c&eacute;lulas s&atilde;o formadas no organismo a partir de c&eacute;lulas diploides, essa produ&ccedil;&atilde;o &eacute; responsabilidade de um processo de divis&atilde;o denominado meiose.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; A meiose &eacute; uma divis&atilde;o celular em que, a partir de uma c&eacute;lula diploide, se formam quatro c&eacute;lulas-filhas com metade dos cromossomos da c&eacute;lula precursora. Como vimos, a fun&ccedil;&atilde;o desse processo nos seres humanos &eacute; a produ&ccedil;&atilde;o de gametas, ou seja, o gameta masculino (espermatozoide) ou o gameta feminino (ov&oacute;cito II). Isso mant&eacute;m constante a ploidia da esp&eacute;cie. Al&eacute;m disso, a meiose proporciona um aumento da variabilidade gen&eacute;tica.&rdquo;</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Para a ocorr&ecirc;ncia da meiose, a interfase tamb&eacute;m &eacute; necess&aacute;ria, mas o processo mei&oacute;tico, diferente da mitose, &eacute; divido para fins did&aacute;ticos em duas fases: Meiose I e Meiose II.</span></span></p>\n\n\n\n<h2><span style=\"color:#c0392b\">Meiose I</span></h2>\n\n\n\n<hr />\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; A meiose I &eacute; a primeira etapa da meiose, seu in&iacute;cio ocorre logo depois da interfase com uma c&eacute;lula diploide com cromossomos duplicados pela fase S da e termina com a forma&ccedil;&atilde;o de duas c&eacute;lulas haploides mas ainda com os cromossomos duplicados.</span></span></p>', '2020-12-18 12:48:19', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (16, 2, '<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">quiasmas, formando novas sequ&ecirc;ncias gen&eacute;ticas. Essas recombina&ccedil;&otilde;es s&atilde;o aleat&oacute;rias e, dessa maneira, a possibilidade de novas sequ&ecirc;ncias &eacute; infinita, aumentando muito a variabilidade gen&eacute;tica na esp&eacute;cie, este &eacute; um dos motivos para a presen&ccedil;a de 7 bilh&otilde;es de pessoas na Terra com caracter&iacute;sticas individuais, com exce&ccedil;&atilde;o dos g&ecirc;meos univitelinos que apresentam o DNA id&ecirc;ntico um ao outro.</span></span></p>\n\n\n\n<h2 style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Metafase I</span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Nesta fase, o fuso de divis&atilde;o se prende ao centr&ocirc;mero do cromossomo, mas como os cromossomos hom&oacute;logos est&atilde;o pareados, cada fibra do fuso se prende somente ao cromossomo que est&aacute; no seu hemisf&eacute;rio.</span></span></p>\n\n\n\n<h2 style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Anafase I</span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Nesta fase, ocorre o encurtamento dos fusos e, desta maneira, cada um vai puxar um dos cromossomos hom&oacute;logos para um hemisf&eacute;rio da c&eacute;lula, separando-os.</span></span></p>\n\n\n\n<h2 style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Telofase I e Intercinese</span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; &nbsp;A telofase &eacute; a &uacute;ltima fase da meiose I e, nesta fase, teremos a desporaliza&ccedil;&atilde;o dos cromossomos e a forma&ccedil;&atilde;o das cariotecas em volta de cada um dos grupos cromoss&ocirc;micos. Em algumas c&eacute;lulas onde o processo mei&oacute;tico &eacute; muito r&aacute;pido, esse processo nem ocorre, visto que a meiose II ir&aacute; se iniciar em seguida.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp;&nbsp;</span></span></p>', '2020-12-18 12:58:40', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (17, 2, '<h2><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"color:#c0392b\">Meiose II</span></span></h2>\n\n\n\n<hr />\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">No fim da meiose I, temos duas c&eacute;lulas que j&aacute; s&atilde;o haploides (n), isto &eacute;, n&atilde;o apresentam mais os cromossomos em par, mas ainda apresentam o material gen&eacute;tico de cada cromossomo duplicado com a presen&ccedil;a de crom&aacute;tides- irm&atilde;s. A meiose II &eacute; respons&aacute;vel pela separa&ccedil;&atilde;o dessas crom&aacute;tides e, por isso, &eacute; um processo muito parecido com a mitose onde tamb&eacute;m ocorre a separa&ccedil;&atilde;o das crom&aacute;tides. Temos que lembrar que a meiose II ocorre nas duas c&eacute;lulas formadas pela meiose I e, dessa maneira, o resultado final &eacute; duplicado. As fases da meiose II s&atilde;o: profase II, metafase II, anafase II e telofase II, terminando com o processo de citocinese. Quando esse processo termina, temos a presen&ccedil;a de quatro c&eacute;lulas haploides. Vamos ver as principais ocorr&ecirc;ncias de cada uma:</span></span></p>\n\n\n\n<h2 style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Profase II</span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Ocorrer&aacute; a condensa&ccedil;&atilde;o dos cromossomos, a desorganiza&ccedil;&atilde;o da carioteca e a forma&ccedil;&atilde;o do fuso de divis&atilde;o.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Os fusos de divis&atilde;o se prendem aos centr&ocirc;meros do cromossomo, sendo um fuso de cada hemisf&eacute;rio preso em cada centr&ocirc;mero.</span></span></p>\n\n\n\n<h2 style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Metafase II</span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Os cromossomos hom&oacute;logos, ainda emparelhados e com grau m&aacute;ximo de condensa&ccedil;&atilde;o, posiciom-se a placa equatorial (regi&atilde;o central da c&eacute;lula).</span></span></p>', '2020-12-18 13:05:26', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (18, 2, '<h2><span style=\"font-size:28px\"><span style=\"color:#c0392b\">5</span></span> <span style=\"color:#ecf0f1\"><span style=\"background-color:#c0392b\">GAMETOG&Ecirc;NESE&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Sabemos que a fun&ccedil;&atilde;o da meiose nos seres humanos &eacute; a forma&ccedil;&atilde;o de gametas. Mas tanto a estrutura da c&eacute;lula como a produ&ccedil;&atilde;o de cada uma delas &eacute; muito diferente no homem e na mulher.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Um homem libera mais ou menos 200 milh&otilde;es de espermatozoides por ejacula&ccedil;&atilde;o e, a partir da puberdade, pode ter uma ejacula&ccedil;&atilde;o com alta capacidade de fecunda&ccedil;&atilde;o uma vez a cada 48 horas at&eacute; o fim da vida, enquanto isso, uma mulher libera um ov&oacute;cito II por ciclo menstrual, isto &eacute;, a cada 28 dias, iniciando essa libera&ccedil;&atilde;o na puberdade e terminando na menopausa, mais ou menos aos 50 anos. Fazendo um c&aacute;lculo simples, uma mulher libera por volta de 400 ov&oacute;citos durante a vida. Conclui-se que em uma ejacula&ccedil;&atilde;o masculina o homem libera uma quantidade excepcionalmente maior de gametas a mais do que uma mulher libera durante toda vida.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Essas informa&ccedil;&otilde;es comprovam que existem diferen&ccedil;as na produ&ccedil;&atilde;o de gametas no homem e na mulher, vamos conhec&ecirc;-las:</span></span></p>\n\n\n\n<h2 style=\"text-align:justify\"><span style=\"color:#c0392b\">Espermatog&ecirc;nese</span></h2>\n\n\n\n<hr />\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">A gametog&ecirc;nese masculina chama-se espermatog&ecirc;nese e come&ccedil;a na fase embrion&aacute;ria onde as c&eacute;lulas germinativas do test&iacute;culo se multiplicam por mitose formando as espermatog&ocirc;nias (2n), esta fase &eacute; denominada per&iacute;odo de multiplica&ccedil;&atilde;o.</span></span></p>', '2020-12-18 13:08:57', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (19, 2, '<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp; &nbsp; Depois do nascimento do jovem, existe um per&iacute;odo de inatividade mit&oacute;tica nos test&iacute;culos que vai do nascimento at&eacute; a puberdade. Na puberdade, o processo mit&oacute;tico para multiplica&ccedil;&atilde;o de espermatog&ocirc;nias &eacute; reiniciado e dura at&eacute; o fim da vida do homem, dessa maneira, n&atilde;o haver&aacute; falta de espermatog&ocirc;nias para produ&ccedil;&atilde;o de espermatozoides. Esse per&iacute;odo &eacute; chamado de per&iacute;odo germinativo.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp; &nbsp; &nbsp; As espermatog&ocirc;nias param de realizar mitose e passam por um crescimento celular, formando as c&eacute;lulas denominadas espermat&oacute;citos I, o processo de forma&ccedil;&atilde;o de espermat&oacute;citos I &eacute; denominado per&iacute;odo de crescimento e estas c&eacute;lulas j&aacute; est&atilde;o prontas para iniciar o processo mei&oacute;tico no per&iacute;odo de matura&ccedil;&atilde;o. O espermat&oacute;cito I (2n) passa pela meiose I, formando duas c&eacute;lulas j&aacute; haploides denominadas espermat&oacute;citos II (n). Cada espermat&oacute;cito II passa pela meiose II formando as esperm&aacute;tides. Terminando o processo de meiose, isto &eacute;, a cada espermat&oacute;cito I que entrou em meiose formaram-se 4 esperm&aacute;tides vi&aacute;veis. Para essas esperm&aacute;tides se tornarem espermatozoides elas necessitam de um processo de diferencia&ccedil;&atilde;o para a forma&ccedil;&atilde;o do acrossomo e do flagelo principalmente. Esse processo &eacute; denominado espermiog&ecirc;nese ou per&iacute;odo de diferencia&ccedil;&atilde;o.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp; &nbsp; &nbsp; O espermatozoide pronto &eacute; dividido em partes importantes para o sucesso da fecunda&ccedil;&atilde;o: o acrossomo que se localiza na cabe&ccedil;a do espermatozoide e armazena enzimas importantes para a penetra&ccedil;&atilde;o no gameta feminino, o n&uacute;cleo da c&eacute;lula onde se localiza o material gen&eacute;tico.</span></span></p>', '2020-12-18 13:40:33', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (20, 2, '<p style=\"text-align:justify\"><span style=\"font-size:16px\">&nbsp; &nbsp; &nbsp; Entre a cabe&ccedil;a e a cauda do espermatozoide encontra-se a pe&ccedil;a intermedi&aacute;ria onde existem um grande n&uacute;mero de mitoc&ocirc;ndria respons&aacute;veis pela produ&ccedil;&atilde;o de energia para movimenta&ccedil;&atilde;o do flagelo e, dessa maneira, para fornecer mobilidade ao espermatozoide.</span></p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"370\" src=\"http://localhost/enovus/uploads/Imagens/files/imagem10(2).png\" width=\"383\" /></p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<hr />\n\n<p>&nbsp;</p>', '2020-12-18 13:44:36', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (21, 2, '<h2><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"color:#c0392b\">Ovog&ecirc;nese ou ovulog&ecirc;nese</span></span></h2>\n\n\n\n<hr />\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">A ovog&ecirc;nese &eacute; o processo de forma&ccedil;&atilde;o de gametas femininos. Da mesma maneira que a espermatog&ecirc;nese, o in&iacute;cio do processo &eacute; embrion&aacute;rio, mas diferente do processo masculino a produ&ccedil;&atilde;o de gametas femininos cessa em um per&iacute;odo denominado menopausa, que ocorre por volta dos 50 anos da mulher.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">No per&iacute;odo embrion&aacute;rio, c&eacute;lulas germinativas formam ovog&ocirc;nias (2n) que se multiplicam por mitose (per&iacute;odo germinativo). Ainda no per&iacute;odo embrion&aacute;rio essas ovog&ocirc;nias param de realizar mitose e passam por um per&iacute;odo de crescimento celular, formando ov&oacute;citos I j&aacute; com a profase I iniciada (per&iacute;odo de crescimento).</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">A mulher, quando nasce, traz consigo um n&uacute;mero limitado de ov&oacute;citos I, enquanto que o homem nasce com espermatog&ocirc;nias que ainda v&atilde;o se multiplicar durante toda a vida, formando espermat&oacute;citos I, conforme a necessidade de produ&ccedil;&atilde;o de espermatozoides</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Na puberdade feminina, um ov&oacute;cito I (2n), a cada ciclo menstrual, retoma a meiose I iniciada no per&iacute;odo fetal (per&iacute;odo de crescimento). Mas, quando a meiose I se completa, ocorre uma diferencia&ccedil;&atilde;o na separa&ccedil;&atilde;o de material citoplasm&aacute;tico nas duas c&eacute;lulas que ser&atilde;o formadas: uma delas recebe grande quantidade de citoplasma e forma uma c&eacute;lula vi&aacute;vel denominada ov&oacute;cito II (n), em met&aacute;fase II, e outra c&eacute;lula c&eacute;lula que recebe uma pequena</span></span></p>', '2020-12-18 13:54:46', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (28, 1, '<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\n\n<h2 style=\"text-align:center\"><span style=\"color:#2c3e50\">Atividades de Fixa&ccedil;&atilde;o</span></h2>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">1) Determine a massa, em kg, de um bloco de ferro maci&ccedil;o em forma de cubo cuja aresta mede 10 cm. Suponha que a massa espec&iacute;fica do ferro seja igual a 7,8 g/cm<sup>3</sup>.</span></span></p>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">a) m = 78 kg</span></span></p>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">b) m = 0,78 kg</span></span></p>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">c) m = 0,0078 kg</span></span></p>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">d) m = 8,7 kg</span></span></p>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">e) m = 7,8 kg</span></span></p>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">2) Calcule a densidade da mistura de dois l&iacute;quidos homog&ecirc;neos de massas iguais e densidades respectivas de 4,2 g/cm<sup>3</sup>&nbsp;e 1,4 g/cm<sup>3</sup>. Marque a op&ccedil;&atilde;o correta cuja unidade seja dada em g/cm<sup>3</sup></span></span></p>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">a) d = 2,1 g/cm<sup>3</sup></span></span></p>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">b) d = 5,2 g/cm<sup>3</sup></span></span></p>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">c) d = 1,6 g/cm<sup>3</sup></span></span></p>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">d) d = 0,4 g/cm<sup>3</sup></span></span></p>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">e) d = 2,5 g/cm<sup>3</sup></span></span></p>\n\n</div>\n\n\n\n<hr />\n\n<hr />', '2020-12-18 14:45:19', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (22, 2, '<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">j&aacute; na mulher, o n&uacute;mero de ov&oacute;cito II j&aacute; &eacute; definido no nascimento da mulher, por isso, ocorre essa discrep&acirc;ncia t&atilde;o grande na produ&ccedil;&atilde;o de gametas em cada sexo.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Cada ov&oacute;cito &eacute; envolvido por um fol&iacute;culo ovariano. Quando o ov&oacute;cito II &eacute; liberado pelo ov&aacute;rio feminino, ele e os corp&uacute;sculos polares saem envoltos por duas regi&otilde;es: a zona pel&uacute;cida, formada por uma rede de prote&iacute;nas e a corona radiata (ou coroa radiada), uma camada de c&eacute;lulas provenientes do ov&aacute;rio, isto &eacute;, para o espermatozoide fecundar, ele necessita passar por essas duas regi&otilde;es, mas esse j&aacute; &eacute; um assunto para o nosso pr&oacute;ximo livro, quando voc&ecirc;s estiverem na 2&ordf; s&eacute;rie.</span></span></p>\n\n\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"303\" src=\"http://localhost/enovus/uploads/Imagens/files/imagem11(1).png\" width=\"400\" /></p>\n\n\n\n<p>&nbsp;</p>', '2020-12-18 13:59:59', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (23, 2, '<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\n\n<h2><span style=\"color:#c0392b\">Vamos testar seus conhecimentos!</span></h2>\n\n\n\n<p>&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;┄&nbsp;</p>\n\n\n\n<h2><span style=\"color:#c0392b\">Exerc&iacute;cios de 1 a 4</span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">1) Se temos 128 espermatozoides, quantas ovog&ocirc;nias foram necess&aacute;rias no processo?</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><input type=\"radio\" value=\"A\" />&nbsp;16</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><input type=\"radio\" value=\"B\" />&nbsp;32</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><input type=\"radio\" value=\"C\" />&nbsp;64</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><input type=\"radio\" value=\"D\" /></span></span>&nbsp;128</p>\n\n\n\n<p style=\"text-align:justify\"><input type=\"radio\" value=\"E\" />&nbsp;256</p>\n\n\n\n<p>&nbsp;</p>\n\n\n\n<p>&nbsp;</p>\n\n</div>\n\n\n\n<hr />\n\n<p>&nbsp;</p>', '2020-12-18 14:13:08', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (24, 2, '<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Existem alguns tipos de cromossomos, e estes podem ser classificados de acordo com a posi&ccedil;&atilde;o do centr&ocirc;mero:</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">- Metac&ecirc;ntrico: o centr&ocirc;mero divide o cromossomo em crom&aacute;tides de mesmo tamanho.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">- Submetac&ecirc;ntrico: o centr&ocirc;mero divide o cromossomo com uma das crom&aacute;tides um pouco maior.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">- Acroc&ecirc;ntrico: o centr&ocirc;mero divide o cromossomo quase na sua extremidade.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">- Teloc&ecirc;ntrico: o centr&ocirc;mero fica na extremidade do cromossomo.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><img alt=\"\" height=\"154\" src=\"http://localhost/enovus/uploads/Imagens/files/imagem2.png\" width=\"394\" /></span></span></p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<h2 style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"color:#c0392b\">C&eacute;lulas Haploides e Diploides</span></span></h2>\n\n\n\n<hr />\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Na maioria dos seres vivos, as c&eacute;lulas podem ser classificadas de duas maneiras em rela&ccedil;&atilde;o ao n&uacute;mero de cromossomos: haploides ou diploides. As c&eacute;lulas haploides s&atilde;o aquelas que apresentam somente uma c&oacute;pia de cada cromossomo, representadas como c&eacute;lula &ldquo;n&rdquo;. O &ldquo;n&rdquo; representa o n&uacute;mero de cromossomos presente na c&eacute;lula de cada esp&eacute;cie.</span></span></p>', '2020-12-18 14:21:49', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (25, 1, '<h2><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"color:#006633\">Introdu&ccedil;&atilde;o</span></span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp; &nbsp; &nbsp; N&atilde;o parece ser t&atilde;o curioso o fato de que o &oacute;leo boia na &aacute;gua. Mas por que um navio boiaria? Por que o ser humano &agrave;s vezes boia na &aacute;gua e &agrave;s vezes n&atilde;o? Por que alguns bal&otilde;es sobem e outros descem no ar? Por que as facas cortam? Por que &eacute; dif&iacute;cil andar com certos cal&ccedil;ados na areia? Como podemos usar esses fen&ocirc;menos naturais a nosso favor?</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp; &nbsp; &nbsp; As perguntas anteriores parecem estar completamente dissociadas umas das outras, no entanto, suas respostas s&atilde;o relativas a um mesmo assunto na F&iacute;sica: a Hidrost&aacute;tica.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp; &nbsp; &nbsp; Os conceitos de press&atilde;o e densidade s&atilde;o de fundamental import&acirc;ncia para que possamos entender fen&ocirc;menos corriqueiros do nosso dia a dia, al&eacute;m de serem muito aplic&aacute;veis em engenharias e outras &aacute;reas.</span></span></p>\n\n\n\n<h2 style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">1&nbsp;<span style=\"background-color:#2c3e50\"><span style=\"color:#ffffff\">DENSIDADE OU MASSA ESPEC&Iacute;FICA</span>?</span></span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp; &nbsp; &nbsp; Experimente perguntar a uma crian&ccedil;a de quatro ou cinco anos quem tem mais massa: um quilograma de algod&atilde;o ou um quilograma de chumbo. Certamente essa resposta n&atilde;o parecer&aacute; t&atilde;o clara para ela quanto pode parecer para voc&ecirc; hoje. Essa aparente confus&atilde;o se forma porque, quando crian&ccedil;as, estamos acostumados a associar quantidade &agrave; massa e a encarar massa como sin&ocirc;nimo de volume. Na verdade essas duas grandezas est&atilde;o</span></span></p>', '2020-12-18 14:35:53', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (26, 1, '<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">associadas, mas nunca ser&atilde;o equipar&aacute;veis. A massa &eacute; a quantidade de mat&eacute;ria contida no corpo, o volume &eacute; o espa&ccedil;o f&iacute;sico realmente ocupado por ele. Massa e volume relacionam-se por meio de uma outra grandeza f&iacute;sica, que quantifica a mat&eacute;ria contida em cada unidade de volume ocupada pelo corpo ou pela subst&acirc;ncia.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Quando trata-se de determinada por&ccedil;&atilde;o de uma subst&acirc;ncia, ou simplesmente de um corpo maci&ccedil;o feito de uma subst&acirc;ncia pura, a grandeza que relaciona a massa ao volume &eacute; a massa espec&iacute;fica da subst&acirc;ncia (&mu;), definida matematicamente por</span></span></p>\n\n\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"91\" src=\"http://localhost/enovus/uploads/Imagens/files/f1111.jpg\" width=\"113\" /></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">onde m &eacute; a massa de subst&acirc;ncia contida nessa por&ccedil;&atilde;o, e V &eacute; o volume ocupado por ela. &Eacute; claro, observando-se a rela&ccedil;&atilde;o matem&aacute;tica acima, que a unidade da massa espec&iacute;fica no Sistema Internacional de Unidades &eacute; o kg/m<sup>3</sup>.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Mas, e se o corpo n&atilde;o for maci&ccedil;o, ou se n&atilde;o for composto por apenas uma subst&acirc;ncia? N&atilde;o podemos determinar sua massa espec&iacute;fica? Na verdade, a rela&ccedil;&atilde;o matem&aacute;tica entre massa e volume continua existindo, mas agora com um novo nome: densidade do corpo (d).</span></span></p>', '2020-12-18 14:39:03', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (27, 1, '<p style=\"text-align:center\"><img alt=\"\" height=\"132\" src=\"http://localhost/enovus/uploads/Imagens/files/f2.jpg\" width=\"132\" /></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">onde , novamente, m &eacute; a massa do corpo, e V, seu volume.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Este &uacute;ltimo termo, at&eacute; mais popular que o primeiro, &eacute; calculado pela mesma express&atilde;o matem&aacute;tica que o anterior e representa uma ideia semelhante. Note, por&eacute;m, que nem sempre ser&atilde;o quantidades de mesmo valor. Se tomarmos uma esfera maci&ccedil;a de ouro, por exemplo, tanto a densidade do corpo quanto a massa espec&iacute;fica da subst&acirc;ncia ser&atilde;o 19,3g/cm<sup>3</sup>&nbsp;, no entanto se a esfera fosse oca, certamente sua densidade seria menor que a massa espec&iacute;fica do material que a constitui.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Quando misturamos dois fluidos de diferentes massas espec&iacute;ficas, aquele com maior densidade (ou massa espec&iacute;fica) tender&aacute; a se acumular no fundo dos recipientes; &eacute; por isso que a mistura &aacute;gua e &oacute;leo sempre se disp&otilde;e com o &oacute;leo na parte de cima: sua densidade &eacute; menor.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; No Sistema Internacional de Unidades (S.I.), a unidade de massa espec&iacute;fica (determinada para subst&acirc;ncias) e de densidade (determinada para corpos) &eacute; o quilograma por metro c&uacute;bico (kg/m<sup>3</sup>).</span></span></p>', '2020-12-18 14:40:43', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (29, 1, '<h1>2 <span style=\"color:#ffffff\"><span style=\"background-color:#2c3e50\">EMPUXO&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</span></span></h1>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Algumas das quest&otilde;es propostas no in&iacute;cio do cap&iacute;tulo<img alt=\"\" height=\"200\" src=\"http://localhost/enovus/uploads/Imagens/files/Domenico-Fetti_Archimedes_1620(2).jpg\" style=\"padding:8px; float:right\" width=\"150\" /> passam a ser respondidas agora. Quando dois fluidos de densidades diferentes s&atilde;o colocados no mesmo recipiente, sabemos que aquele que apresentar maior densidade ficar&aacute; no fundo e os demais se depositaram acima dele em ordem decrescente de densidade, de forma que o menos denso ficar&aacute; na parte superior. Mas, e quando colocamos um corpo s&oacute;lido no interior do fluido? O que acontece? Por que alguns corpos boiam e outros n&atilde;o? O que faz com que tenhamos a sensa&ccedil;&atilde;o de que estamos mais leves quando estamos dentro d&#39;&aacute;gua?</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Conta a lenda que, pressionado pelo rei de seu pa&iacute;s, Arquimedes teria encontrado uma explica&ccedil;&atilde;o para isso (e uma consequente solu&ccedil;&atilde;o para o problema do rei).</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><br />\n\n<span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp;</span></span></p>', '2020-12-18 14:54:40', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (30, 1, '<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp;Essa descoberta de Arquimedes ficou conhecida como o Teorema de Arquimedes.</span></span></p>\n\n\n\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\n\n<h2 style=\"text-align:justify\"><span style=\"color:#000000\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Teorema de Arquimedes</span></span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\">&nbsp; &nbsp; &nbsp; O Empuxo exercido por um flu&iacute;do sobre um corpo nele imerso tem valor igual ao peso do flu&iacute;do deslocado, dire&ccedil;&atilde;o vertical e sentido para cima.</span></p>\n\n</div>\n\n\n\n<h2><span style=\"color:#2c3e50\">Principio de Arquimedes</span></h2>\n\n\n\n<hr />\n\n<div class=\"embeddedContent oembed-provider-\">&nbsp;</div>\n\n\n\n<div class=\"embeddedContent oembed-provider- oembed-provider-youtube\" data-align=\"center\" data-maxheight=\"315\" data-maxwidth=\"400\" data-oembed=\"https://www.youtube.com/watch?v=NRjafzwzwlg\" data-oembed_provider=\"youtube\" data-resizetype=\"responsive\" data-title=\"arquimedes\" style=\"text-align:center\"><iframe allowfullscreen=\"true\" allowscriptaccess=\"always\" frameborder=\"0\" height=\"315\" scrolling=\"no\" src=\"//www.youtube.com/embed/NRjafzwzwlg?wmode=transparent&amp;jqoemcache=4dWQv\" title=\"arquimedes\" width=\"383.595988538682\"></iframe></div>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>', '2020-12-18 15:06:34', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (31, 1, '<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Entenda melhor o exemplo avaliando o esquema de for&ccedil;as mostrado no submarino abaixo. O mecanismo utilizado por um submarino para que ele possa submergir ou emergir, quando necess&aacute;rio, est&aacute; intimamente associado &agrave;s varia&ccedil;&otilde;es nas for&ccedil;as de empuxo e peso que atuam sobre ele. V&aacute;lvulas de press&atilde;o s&atilde;o respons&aacute;veis por permitir a entrada ou a sa&iacute;da de ar e de &aacute;gua de reservat&oacute;rios presentes no corpo do submarino, promovendo a varia&ccedil;&atilde;o de peso (<img alt=\"\" src=\"imagens/efd.png\" width=\"60\" />), conforme figura a seguir.</span></span></p>\n\n\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"160\" src=\"http://localhost/enovus/uploads/Imagens/files/submarino.png\" width=\"400\" /></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">O valor do peso (P) do flu&iacute;do deslocado pelo corpo imerso &eacute; calculado pelo produto da massa deslocada (m) e o valor da acelera&ccedil;&atilde;o gravitacional (g): P = m.g, mas a massa (m) &eacute; dada pelo produto da densidade do flu&iacute;do pelo volume (V) deslocado: m = d.V. Ent&atilde;o:</span></span></p>\n\n\n\n<p style=\"text-align:center\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">P = d.V.g</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">De acordo com o teorema de Arquimedes, sabemos que o empuxo exercido pelo flu&iacute;do sobre o corpo imerso tem valor igual ao da massa flu&iacute;da deslocada. Ent&atilde;o:</span></span></p>', '2020-12-18 15:22:35', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (32, 1, '<p style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">E = d.V.g</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Sendo a dire&ccedil;&atilde;o da for&ccedil;a de empuxo&nbsp;<img alt=\"\" src=\"imagens/eee.png\" width=\"32\" />&nbsp;vertical e sentido orientado para cima (oposto ao do peso da massa de fluido que estava ali).</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Como o EMPUXO &eacute; uma for&ccedil;a, no Sistema Internacional de Unidades (S.I.), sua unidade &eacute; o newton (N).</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Isso tamb&eacute;m acontece com o ar, evidenciando-se nos bal&otilde;es de g&aacute;s h&eacute;lio que sobem ao inv&eacute;s de cair, e em todos os demais meios fluidos. Eles exercem uma for&ccedil;a de empuxo vertical e para cima em todos os corpos que ousarem ocupar um espa&ccedil;o que antes era completamente ocupado por eles.</span></span></p>\n\n\n\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\n\n<h2 style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">EXEMPLO 1</span></span></h2>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">Em um recipiente, h&aacute; um l&iacute;quido de densidade 2,56 g/cm&sup3;. Dentro desse l&iacute;quido, encontra-se um corpo de volume 1000 cm&sup3;, que est&aacute; totalmente imerso. Qual o empuxo sofrido por este corpo? Dado g=10 m/s&sup2;</span></span></p>\n\n</div>', '2020-12-18 15:26:26', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (33, 1, '<h1><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:28px\">3</span> <span style=\"color:#ffffff\"><span style=\"background-color:#2c3e50\">PRESS&Atilde;O&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></span></span></h1>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Estamos acostumados a atribuir &agrave; grandeza for&ccedil;a grande parte das sensa&ccedil;&otilde;es que experimentamos no nosso cotidiano. Mas ser&aacute; que &eacute; a for&ccedil;a a verdadeira respons&aacute;vel por nossos sentidos? Se voc&ecirc; segurar sua caneta com apenas dois dedos (um tocando a ponta, e o outro tocando a parte final da caneta), ver&aacute; que a sensa&ccedil;&atilde;o que tem em cada um dos dedos &eacute; bem diferente. No dedo que segura a parte final da caneta, o conforto parece ser bem maior que o que sentimos no dedo que pressiona a ponta da caneta. &Eacute; f&aacute;cil mostrar, utilizando as leis de Newton, que as for&ccedil;as exercidas pela caneta em cada um dos dedos tem m&oacute;dulos iguais. Por que, ent&atilde;o, temos duas sensa&ccedil;&otilde;es completamente diferentes? Simplesmente porque n&atilde;o estamos sentindo a for&ccedil;a, e sim a press&atilde;o exercida pela caneta em cada um de nossos dedos.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; &Eacute; importante saber que for&ccedil;a &eacute; uma grandeza f&iacute;sica vetorial associada &agrave;s a&ccedil;&otilde;es de puxar, empurrar ou deformar; ao passo que a press&atilde;o &eacute; uma grandeza f&iacute;sica escalar associada &agrave; capacidade de furar, de atravessar uma superf&iacute;cie. N&atilde;o h&aacute; press&atilde;o quando n&atilde;o h&aacute; possibilidade de penetrar na superf&iacute;cie, mesmo que estejamos aplicando uma for&ccedil;a sobre ela (a for&ccedil;a de atrito, por exemplo, nunca exercer&aacute; press&atilde;o sobre a superf&iacute;cie em que atua). A press&atilde;o est&aacute; associada &agrave; for&ccedil;a, mas n&atilde;o se trata da mesma ideia.a</span></span></p>', '2020-12-18 15:28:15', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (34, 1, '<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Apenas for&ccedil;as que possuem componentes perpendiculares &agrave; superf&iacute;cie s&atilde;o capazes de exercer press&atilde;o sobre ela.</span></span></p>\n\n</div>\n\n\n\n<p>&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp; &nbsp; &nbsp; Podemos, por exemplo, propor novas indaga&ccedil;&otilde;es: O que os jipes t&ecirc;m de diferente dos carros comuns que os faz passear sobre a areia fofa nas praias sem atolar? O que os a&ccedil;ougueiros realmente fazem quando amolam a faca para cortar a carne? Por que conseguimos perfurar uma parede usando um prego com a mesma for&ccedil;a que n&atilde;o a perfuraria se bat&ecirc;ssemos nela apenas com o martelo? A resposta para todas essas quest&otilde;es &eacute; uma s&oacute;: porque a capacidade de cortar, furar e afundar tamb&eacute;m est&aacute; associada &agrave; &aacute;rea sobre a qual a for&ccedil;a &eacute; aplicada e n&atilde;o s&oacute; ao valor da for&ccedil;a em si. Estamos falando de press&atilde;o, e n&atilde;o de for&ccedil;a.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp; &nbsp; &nbsp; Um jipe possui pneus mais largos que os carros de passeio. Isso faz com que a for&ccedil;a que ele aplica sobre o solo, mesmo que tenha valor igual ao da for&ccedil;a que seria aplicada por um outro modelo, seja mais distribu&iacute;da. Ao amolar uma faca, o a&ccedil;ougueiro reduz a superf&iacute;cie de contato entre a l&acirc;mina e a carne, facilitando a penetra&ccedil;&atilde;o. O prego tem uma ponta que concentra a for&ccedil;a transmitida &agrave; parede.</span></span></p>', '2020-12-18 15:38:22', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (35, 1, '<p>&nbsp;</p>\n\n\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"142\" src=\"http://localhost/enovus/uploads/Imagens/files/f7.jpg\" width=\"147\" /></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">onde p &eacute; a press&atilde;o que estamos calculando, F &eacute; a for&ccedil;a aplicada normalmente &agrave; superf&iacute;cie e A &eacute; a &aacute;rea da superf&iacute;cie de contato entre os corpos. Note que, no Sistema Internacional de Unidades, devemos determinar a press&atilde;o em N/m2, unidade que recebeu o nome de pascal (Pa), para homenagear um cientista que deixou grandes contribui&ccedil;&otilde;es nesta &aacute;rea, como veremos a seguir.</span></span></p>\n\n\n\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">EXEMPLO 2</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">Uma for&ccedil;a de intensidade 60N &eacute; aplicada perpendicularmente &agrave; superf&iacute;cie de um bloco de &aacute;rea 0,3m&sup2;, qual a press&atilde;o exercida por essa for&ccedil;a?</span></span></p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">No Sistema Internacional de Unidades (S.I.), a unidade de press&atilde;o &eacute; o newton por metro quadrado (N/m2), que recebeu o nome de pascal (Pa).</span></span></p>\n\n</div>', '2020-12-18 15:40:53', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (36, 1, '<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Tente entender a verdadeira ci&ecirc;ncia por tr&aacute;s de uma cama de pregos que, muitas vezes, passa por magia. Se ficar curioso, leia mais no link a seguir</span></span></p>\n\n\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"167\" src=\"http://localhost/enovus/uploads/Imagens/files/fakir.jpg\" width=\"219\" /></p>\n\n\n\n<h2>&nbsp;4 <span style=\"color:#ffffff\"><span style=\"background-color:#2c3e50\">PRINC&Iacute;PIO DE STEVIN&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></span></h2>\n\n\n\n<p><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><span style=\"font-size:16px\">&nbsp; &nbsp; &nbsp; Vamos iniciar esta parte do cap&iacute;tulo com uma pequena experi&ecirc;ncia. Veja o v&iacute;deo a seguir.</span></span></p>\n\n\n\n<div class=\"embeddedContent oembed-provider- oembed-provider-youtube\" data-align=\"center\" data-maxheight=\"315\" data-maxwidth=\"350\" data-oembed=\"https://www.youtube.com/watch?v=TQABlHQAUy0\" data-oembed_provider=\"youtube\" data-resizetype=\"responsive\" data-title=\"enovus\" style=\"text-align:center\"><iframe allowfullscreen=\"true\" allowscriptaccess=\"always\" frameborder=\"0\" height=\"287.4117647058823\" scrolling=\"no\" src=\"//www.youtube.com/embed/TQABlHQAUy0?wmode=transparent&amp;jqoemcache=TmfiJ\" title=\"enovus\" width=\"350\"></iframe></div>\n\n\n\n<p>&nbsp;</p>', '2020-12-18 15:46:00', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (37, 1, '<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Voc&ecirc; foi capaz de perceber o comportamento da &aacute;gua em diferentes situa&ccedil;&otilde;es. Se n&atilde;o acredita no que viu, construa voc&ecirc; mesmo seu experimento e teste! N&atilde;o h&aacute; nada de m&aacute;gico, mas o que faz com que a &aacute;gua seja empurrada para fora da garrafa?</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Para tanto, suponha um b&eacute;quer com um fluido at&eacute; uma profundidade h, por exemplo. Devemos esclarecer inicialmente que, neste cap&iacute;tulo, todos os fluidos de nossas an&aacute;lises dever&atilde;o estar em equil&iacute;brio, isto &eacute;, repouso. A press&atilde;o exercida pela &aacute;gua no fundo do recipiente corresponde &agrave; raz&atilde;o entre uma for&ccedil;a de valor igual ao peso (m.g) da &aacute;gua e a &aacute;rea (A) do fundo do b&eacute;quer. Ou seja:</span></span></p>\n\n\n\n<div style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\"><img alt=\"\" height=\"148\" src=\"http://localhost/enovus/uploads/Imagens/files/vidro.png\" style=\"float:left\" width=\"156\" /></span></span>&nbsp;</p>\n\n\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"55\" src=\"http://localhost/enovus/uploads/Imagens/files/form1.png\" width=\"100\" /></p>\n\n\n\n<p>&nbsp;</p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; mas, a massa (m) do flu&iacute;do &eacute; dada pelo produto da densidade (d) do flu&iacute;do pelo seu volume (V): m = d.V. Por&eacute;m, o volume &eacute; dada pela express&atilde;o: V = A.h. Dessa forma, m = d.A.h, substituindo na express&atilde;o (1):</span></span></p>\n\n</div>', '2020-12-18 15:50:54', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (38, 1, '<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; </span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; onde&nbsp;&eacute; a densidade (pode ser substitu&iacute;da pela massa espec&iacute;fica quando tratar-se de uma subst&acirc;ncia fluida), g &eacute; a acelera&ccedil;&atilde;o gravitacional, e h &eacute; a altura de fluido sobre o ponto onde se deseja calcular a press&atilde;o.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Assim, a press&atilde;o exercida pelo fluido sobre um ponto, em seu interior, depende da altura da coluna de fluido sobre esse ponto. &Eacute; por isso que, quando os dois furos da garrafa s&atilde;o abertos e a garrafa est&aacute; tampada, a &aacute;gua jorra pelo furo mais baixo e n&atilde;o pelo furo de cima. Tamb&eacute;m &eacute; por isso que, quando a garrafa est&aacute; sem a tampa e os mesmos dois furos est&atilde;o abertos, a &aacute;gua jorra mais longe pelo furo de baixo.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; &nbsp;Mas seria imposs&iacute;vel que a &aacute;gua derramasse da garrafa com apenas um furo aberto e a garrafa tampada? N&atilde;o. Para entender o porqu&ecirc; disso, precisamos conhecer um pouco mais sobre a press&atilde;o exercida por um fluido sem o qual seria imposs&iacute;vel a sobreviv&ecirc;ncia na Terra: o ar atmosf&eacute;rico.</span></span></p>\n\n\n\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; Note que dois pontos localizados na mesma profundidade no interior do fluido em equil&iacute;brio est&atilde;o necessariamente sujeitos &agrave; mesma press&atilde;o.</span></span></p>', '2020-12-18 15:52:48', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (39, 1, '<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Trebuchet MS,Helvetica,sans-serif\">&nbsp; &nbsp; &nbsp; &nbsp;mesmo fluido em equil&iacute;brio, estar&atilde;o sujeitos &agrave; mesma press&atilde;o. Caso uma dessas condi&ccedil;&otilde;es seja ferida, as duas outras n&atilde;o podem ser garantidas. Assim, podemos entender como as pessoas fazem para retirar gasolina de dentro de tanques de combust&iacute;vel, por exemplo. Basta que tomemos uma mangueira, completamente cheia de combust&iacute;vel, e coloquemos a extremidade que est&aacute; fora do tanque em uma altura menor que a extremidade interna. O combust&iacute;vel ir&aacute; fluir pela mangueira ferindo a condi&ccedil;&atilde;o do equil&iacute;brio j&aacute; que as duas extremidades da mangueira n&atilde;o estavam na mesma altura. Havia diferen&ccedil;a de press&atilde;o entre as duas extremidades.&nbsp;</span></span></p>\n\n\n\n<p style=\"text-align:justify\">&nbsp;</p>\n\n\n\n<p style=\"text-align:center\"><img alt=\"\" height=\"284\" src=\"http://localhost/enovus/uploads/Imagens/files/pag6.png\" width=\"375\" /></p>\n\n\n\n<p>&nbsp;</p>', '2020-12-18 15:53:57', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (41, 3, '<p><span class="num_tit">1</span> <span class="tit_1 tit_1_bio">Rela&ccedil;&otilde;es harm&ocirc;nicas</span></p>

<p class="paragrafo">N&atilde;o promovem preju&iacute;zo a nenhum indiv&iacute;duo na simbiose (rela&ccedil;&atilde;o entre seres vivos). Podem ser intraespec&iacute;ficas (entre indiv&iacute;duos da mesma esp&eacute;cie) ou interespec&iacute;ficas (entre indiv&iacute;duos de esp&eacute;cies diferentes).</p>

<p class="paragrafo"><span class="tit_1 tit_1_bio">Sociedade</span></p>

<p class="paragrafo">Come&ccedil;amos com a rela&ccedil;&atilde;o entre os seres vivos, da qual participamos, que &eacute; a sociedade. Nessa rela&ccedil;&atilde;o, os indiv&iacute;duos s&atilde;o da mesma esp&eacute;cie e organizam-se dividindo fun&ccedil;&otilde;es e mantendo um sistema organizacional e hier&aacute;rquico entre os pertencentes do grupo. S&atilde;o exemplos, os seres humanos, as abelhas, os cupins e as formigas. Nestes tr&ecirc;s &uacute;ltimos exemplos, a divis&atilde;o de trabalho e de fun&ccedil;&otilde;es &eacute; bem percept&iacute;vel.&nbsp;</p>

<div style="text-align:center">
<figure class="image" style="display:inline-block"><img alt="" height="297" src="https://dgt.editoraenovus.com.br/livros/uploads/Imagens/files/imagem3.png" width="316" />
<figcaption>Imaem padr&atilde;o</figcaption>
</figure>
</div>

<p>&nbsp;</p>', '2021-01-18 09:57:57', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (44, 4, '<p class="paragrafo">O Sol &eacute; extremamente importante. Al&eacute;m de manter os oito planetas em &oacute;rbita, que nada mais &eacute; que a trajet&oacute;ria percorrida por um corpo ao redor de outro, devido &agrave; influ&ecirc;ncia de alguma for&ccedil;a, o Sol tamb&eacute;m &eacute; respons&aacute;vel pela possibilidade de vida no planeta Terra. Como j&aacute; foi mencionado, no in&iacute;cio deste cap&iacute;tulo, a temperatura m&eacute;dia do nosso planeta &eacute; de 15&deg;C.</p>

<p class="paragrafo">No nosso Sistema Solar os planetas giram em torno da estrela Sol, de maneira el&iacute;ptica, conforme representado na imagem abaixo. Os 8 planetas giram ao redor do Sol e cada um leva um tempo espec&iacute;fico para girar em torno de si e em torno dessa grande e importante estrela.</p>

<p class="paragrafo">Ainda neste cap&iacute;tulo vamos conhecer um pouco sobre a hist&oacute;ria e as descobertas do nosso Sistema Solar.</p>

<p class="paragrafo"><span class="tit_1 tit_1_bio">Movimentos da Terra</span></p>

<p class="paragrafo"><strong>Rota&ccedil;&atilde;o</strong></p>

<p class="paragrafo">Giro que o planeta Terra executa em torno do seu pr&oacute;prio eixo com dura&ccedil;&atilde;o de aproximadamente 24 horas, com sentido de oeste para leste. Ela &eacute; fundamental para o equil&iacute;brio da temperatura e da vida na Terra. Este movimento &eacute; a causa dos dias e das noites; enquanto a face do planeta est&aacute; virada para o Sol &eacute; dia, o outro lado &eacute; noite.</p>

<p class="paragrafo"><strong>Transla&ccedil;&atilde;o</strong></p>

<p class="paragrafo">Movimento que o planeta Terra realiza ao redor do Sol, com dura&ccedil;&atilde;o de 365 dias e 6 horas. Por esse tempo, &eacute; que a cada 4 anos &eacute; necess&aacute;rio acrescentar mais um dia no calend&aacute;rio (29 de fevereiro); formando-se o chamado ano bissexto.</p>

<figure class="image" style="float:right"><img alt="" height="214" src="https://dgt.editoraenovus.com.br/livros/uploads/Imagens/files/shutterstock_74430796(1).jpg" width="380" />
<figcaption>Transla&ccedil;&atilde;o da Terra: ano bissexto</figcaption>
</figure>

<figure class="image" style="float:right"><img alt="" height="214" src="https://dgt.editoraenovus.com.br/livros/uploads/Imagens/files/shutterstock_325628420.jpg" width="363" />
<figcaption>Rota&ccedil;&atilde;o da Terra. Consequ&ecirc;ncia: dias e noites</figcaption>
</figure>

<p class="paragrafo">&nbsp;</p>

<p>&nbsp;</p>', '2021-01-18 11:55:38', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (43, 4, '<p><span class="num_tit">2</span>&nbsp; &nbsp;&nbsp;<span class="tit_1 tit_1_bio">Sistema Solar</span></p>

<p class="paragrafo">O nosso Sistema Solar foi formado pela expans&atilde;o da mat&eacute;ria e da energia, ap&oacute;s a grande explos&atilde;o <em>Big Bang</em>. As part&iacute;culas foram se unindo e, devido &agrave; a&ccedil;&atilde;o da gravidade, esses aglomerados de part&iacute;culas come&ccedil;aram a se movimentar (rota&ccedil;&atilde;o) ao redor da estrela Sol. O Sol &eacute; uma grande esfera de elementos incandescentes: H&eacute;lio cujo s&iacute;mbolo, na tabela peri&oacute;dica, &eacute; He, Hidrog&ecirc;nio - H, Oxig&ecirc;nio - O e Carbono - C; a temperatura interna do Sol &eacute; de 15.000.000 &deg;C, e a superf&iacute;cie externa &eacute; de 6.000 &deg;C.</p>

<div class="cx_total">
<p class="paragrafo"><strong>Gravidade</strong>: propriedade de atra&ccedil;&atilde;o entre os corpos, que comanda o movimento dos objetos celestes. Quanto maior for a massa do corpo, maior ser&aacute; a sua gravidade.</p>
</div>

<p class="paragrafo">Quando olhamos para o c&eacute;u, durante o dia, e vemos o Sol, n&atilde;o imaginamos o qu&atilde;o grande essa estrela &eacute;. Para que voc&ecirc; tenha essa dimens&atilde;o, vamos explicar, por meio de n&uacute;meros. Para &nbsp;preencher todo o volume dessa estrela, seriam necess&aacute;rios cerca de 1,3 milh&atilde;o &nbsp;de planetas Terra.&nbsp;<br />
De que nosso Sistema Solar &eacute; composto?</p>

<p class="paragrafo">Como o pr&oacute;prio nome diz, o Sistema Solar &eacute; formado pela estrela Sol e por v&aacute;rios corpos celestes, ou seja, corpos existentes no espa&ccedil;o: planetas, cometas, asteroides, sat&eacute;lites e meteoros. Atualmente, nosso sistema &eacute; composto de oito planetas. S&atilde;o eles, na ordem da proximidade do Sol, Merc&uacute;rio, V&ecirc;nus, Terra, Marte, J&uacute;piter, Saturno, Urano e Netuno.&nbsp;</p>

<p class="paragrafo">Curiosamente, alguns planetas do Sistema Solar s&atilde;o rochosos, assim, sendo formados por mat&eacute;ria no estado s&oacute;lido (rochas e metais). Os planetas rochosos, tamb&eacute;m chamados de tel&uacute;ricos, s&atilde;o Merc&uacute;rio, V&ecirc;nus, Terra e Marte. Os outros quatro restantes, J&uacute;piter, Saturno, Urano e Netuno s&atilde;o planetas compostos por gases; dentre eles, metano, h&eacute;lio e hidrog&ecirc;nio; da&iacute; serem chamados de planetas gasosos ou jovianos.&nbsp;</p>

<p class="paragrafo">Voc&ecirc; aprender&aacute;, ainda este ano, em f&iacute;sica, mais detalhes sobre o Universo e nosso Sistema Solar.</p>

<div style="text-align:center">
<figure class="image" style="display:inline-block"><img alt="" height="233" src="https://dgt.editoraenovus.com.br/livros/uploads/Imagens/files/shutterstock_577527589.jpg" width="656" />
<figcaption>Ilustra&ccedil;&atilde;o representando o nosso Sistema Solar</figcaption>
</figure>
</div>

<p>&nbsp;</p>', '2021-01-18 11:43:25', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (46, 4, '<p><span class="tit_1 tit_1_bio">Manto</span></p>

<p class="paragrafo">&Eacute; a segunda camada da Terra e possui profundidade de 35 a 2900 km. Ali as temperaturas podem chegar a 2000 &deg;C, principalmente, no manto inferior, parte mais pr&oacute;xima ao n&uacute;cleo. A composi&ccedil;&atilde;o principal do manto &eacute; de ferro e magn&eacute;sio. &Eacute; a maior camada terrestre, e seu volume &eacute; de cerca de 80% do volume total do planeta Terra.&nbsp;</p>

<p class="paragrafo">O manto &eacute; s&oacute;lido, mas quando nessa camada da Terra h&aacute; fissuras (rachaduras), o material interno do manto, devido &agrave; alta press&atilde;o, torna-se l&iacute;quido e tende a escapar e, assim, extravasa o magma, processo conhecido por vulcanismo. A lava vulc&acirc;nica sai a uma temperatura de aproximadamente 1200 &deg;C e, conforme vai resfriando, volta ao estado s&oacute;lido. Dessa forma, altera o relevo terrestre, modificando, al&eacute;m da paisagem, a composi&ccedil;&atilde;o do solo.</p>

<div style="text-align:center">
<figure class="image" style="display:inline-block"><img alt="" height="235" src="https://dgt.editoraenovus.com.br/livros/uploads/Imagens/files/shutterstock_104304611%20%26%20536690992.jpg" width="786" />
<figcaption>Vulc&atilde;o Tungurahua em erup&ccedil;&atilde;o. Localizado na prov&iacute;ncia de Tungurahua, centro do Equador, tem mais de 5000 m de altura e a &uacute;ltima erup&ccedil;&atilde;o foi em 2014.</figcaption>
</figure>
</div>

<p><span class="tit_1 tit_1_bio">Crosta terrestre</span></p>

<p class="paragrafo">&Eacute; a camada mais externa, mais fina e superficial da Terra, com profundidade m&aacute;xima de 35 km. A crosta terrestre &eacute; basicamente composta por sil&iacute;cio (Si), magn&eacute;sio (Mg) e alum&iacute;nio (Aℓ) e, em menor propor&ccedil;&atilde;o, o ferro (Fe). &Eacute; nessa camada que n&oacute;s vivemos. &nbsp;</p>

<p class="paragrafo">Com o cont&iacute;nuo resfriamento do planeta, a crosta terrestre foi solidificando-se, e as temperaturas mais baixas promoveram o ac&uacute;mulo de &aacute;gua no estado l&iacute;quido, permitindo-se ent&atilde;o a forma&ccedil;&atilde;o dos oceanos, rios e lagos.</p>

<p class="paragrafo">Nessas condi&ccedil;&otilde;es, a Terra, bem como a atmosfera (camada de ar), foram, gradativamente, resfriando-se, o que possibilitou o surgimento da vida. Portanto, a luz do Sol, as temperaturas mais amenas, a &aacute;gua no estado l&iacute;quido, o solo e o ar, todos esses elementos foram fundamentais e imprescind&iacute;veis para o aparecimento dos primeiros seres vivos.</p>

<p>&nbsp;</p>', '2021-01-18 14:38:52', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (42, 4, '<p class="paragrafo">O planeta Terra &eacute;, entre os planetas do Sistema Solar, o &uacute;nico em que h&aacute; todas as condi&ccedil;&otilde;es para haver seres vivos. Um dos motivos &eacute; que o nosso planeta n&atilde;o possui temperaturas t&atilde;o extremas, a m&eacute;dia &eacute; de 15&deg;C. E, at&eacute; agora, &eacute; o &uacute;nico planeta que apresenta condi&ccedil;&otilde;es de vida para as in&uacute;meras esp&eacute;cies de seres vivos; dentre eles, plantas, animais, fungos e bact&eacute;rias.&nbsp;<br />
Mas antes de conhecermos melhor nosso planeta, vamos compreender como surgiu o Universo e o nosso Sistema Solar.</p>

<p><span class="num_tit">1</span><span class="tit_1 tit_1_bio">&nbsp; &nbsp; Teoria do Big Bang</span></p>

<p class="paragrafo">Big Bang &eacute; uma das teorias mais aceitas sobre a origem do Universo, segundo a qual tudo que existe no Universo surgiu h&aacute; bilh&otilde;es de anos (10 a 20 bilh&otilde;es de anos), ap&oacute;s uma grande explos&atilde;o. Alguns estudiosos acreditam, no entanto, que n&atilde;o teria sido uma &uacute;nica e grande explos&atilde;o a promover a dispers&atilde;o uniforme dos fragmentos do universo, e sim, v&aacute;rias explos&otilde;es que ocorreram em momentos distintos e com intensidades diferentes. Estas provocaram, que promoveram &nbsp;a dispers&atilde;o heterog&ecirc;nea desses fragmentos. A energia e a mat&eacute;ria, ap&oacute;s essa explos&atilde;o, foram fundindo-se e dando origem &agrave;s estrelas, &agrave;s gal&aacute;xias e tamb&eacute;m ao nosso Sistema Solar.</p>

<p class="paragrafo">Essa teoria demonstra que o Universo, ap&oacute;s a explos&atilde;o, continua expandindo-se; fen&ocirc;meno comprovado, uma vez que as gal&aacute;xias permanecem se distanciando e em constantes transforma&ccedil;&otilde;es.</p>

<p class="paragrafo">A imagem abaixo mostra a escala, no tempo, da evolu&ccedil;&atilde;o do Universo. Ap&oacute;s a grande explos&atilde;o, passaram-se nove bilh&otilde;es de anos para que algumas part&iacute;culas se fundissem e o Sistema Solar fosse ent&atilde;o formado.</p>

<p style="text-align:center"><img alt="" height="422" src="https://dgt.editoraenovus.com.br/livros/uploads/Imagens/images/shutterstock_458227702.jpg" width="569" /></p>

<p>&nbsp;</p>', '2021-01-18 10:18:57', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (45, 4, '<p><span class="num_tit">3</span>&nbsp; &nbsp; <span class="tit_1 tit_1_bio">Planeta Terra</span></p>

<p class="paragrafo">A Terra &eacute; um dos planetas rochosos e possui um sat&eacute;lite natural, a Lua, que fica girando ao redor dela, devido &agrave; for&ccedil;a gravitacional do nosso planeta. Os sat&eacute;lites naturais s&atilde;o corpos celestes que orbitam ao redor de um outro corpo celeste maior. No caso do Sistema Solar, h&aacute; 170 sat&eacute;lites naturais, e somente a Lua &eacute; sat&eacute;lite da Terra. Os demais s&atilde;o dos outros sete planetas.</p>

<p class="paragrafo">Pode parecer estranho, mas a Lua n&atilde;o tem luz pr&oacute;pria. N&oacute;s conseguimos enxerg&aacute;-la &agrave; noite, devido &agrave; luz do Sol que ilumina a sua superf&iacute;cie e a reflete para a Terra.&nbsp;</p>

<p class="paragrafo">O planeta Terra, curiosamente, possui cerca de 70% da sua composi&ccedil;&atilde;o formada por &aacute;gua e, desse total, &frac34; est&atilde;o nos oceanos, em estado l&iacute;quido, o que nos faz pensar que o planeta poderia ser chamado de Planeta &Aacute;gua. Cientistas relatam que a Terra surgiu h&aacute; cerca de 4,5 bilh&otilde;es de anos. A mat&eacute;ria, ao longo dos anos, foi fundindo-se e dando forma arredondada ao planeta. Com o passar dos anos, a temperatura foi reduzindo, e o que antes era incandescente foi se solidificando e formando as camadas do nosso planeta.</p>

<p><span class="num_tit">4</span>&nbsp; &nbsp; <span class="tit_1 tit_1_bio">Camadas da Terra</span></p>

<p class="paragrafo">A Terra possui, ao todo, tr&ecirc;s camadas. Elas est&atilde;o representadas, de dentro para fora, na ilustra&ccedil;&atilde;o: n&uacute;cleo (interno e externo), manto (superior e inferior) e crosta terrestre.</p>

<p style="text-align:center"><img alt="" height="265" src="https://dgt.editoraenovus.com.br/livros/uploads/Imagens/files/shutterstock_556718233.jpg" width="364" /></p>

<p><span class="tit_1 tit_1_bio">N&uacute;cleos interno e externo</span></p>

<p class="paragrafo">Todo o n&uacute;cleo da Terra corresponde a, aproximadamente, 2900 a 6300 quil&ocirc;metros (km) de profundidade. O n&uacute;cleo externo da Terra &eacute; uma camada l&iacute;quida, formada, principalmente, por dois elementos qu&iacute;micos &mdash; o n&iacute;quel e o ferro. A temperatura m&eacute;dia do n&uacute;cleo externo &eacute; de +3000 oC.&nbsp;</p>

<p class="paragrafo">O n&uacute;cleo interno &eacute; s&oacute;lido, e sua composi&ccedil;&atilde;o tamb&eacute;m &eacute; de n&iacute;quel e ferro. As temperaturas desta camada chegam a +5000 oC e, mesmo com essas altas temperaturas, o n&uacute;cleo permanece s&oacute;lido, devido &agrave; alta press&atilde;o sobre os elementos, que juntos formam uma liga met&aacute;lica. Essa caracter&iacute;stica &eacute; importante para o magnetismo da Terra e sua for&ccedil;a gravitacional.</p>', '2021-01-18 14:20:59', 'S');
INSERT INTO sis_enovus.tb_pagina_livro (co_pagina_livro, co_capitulo, ds_code, dt_cadastro, st_status) VALUES (47, 4, '<p class="paragrafo">&nbsp;A crosta terrestre &eacute; a camada da Terra que est&aacute; em constante transforma&ccedil;&atilde;o. Isto ocorre por <strong>fatores internos</strong>, chamados de <strong>end&oacute;genos</strong>; dentre eles, erup&ccedil;&otilde;es vulc&acirc;nicas e terremotos que alteram, al&eacute;m da paisagem, a composi&ccedil;&atilde;o do solo. E h&aacute; tamb&eacute;m os <strong>fatores externos</strong>, chamados de <strong>ex&oacute;genos</strong>, que promovem altera&ccedil;&otilde;es. &nbsp;Em meio a eles, est&atilde;o o vento, a &aacute;gua, o clima e a a&ccedil;&atilde;o do homem.</p>

<div style="text-align:center">
<figure class="image" style="display:inline-block"><img alt="" height="288" src="https://dgt.editoraenovus.com.br/livros/uploads/Imagens/files/shutterstock_494165443.jpg" width="823" />
<figcaption>Montanhas que comp&otilde;em a crosta terrestre</figcaption>
</figure>
</div>

<p>SAIBA MAIS</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p class="paragrafo">Voc&ecirc; ir&aacute; aprender, nesse ano, em f&iacute;sica, com mais detalhes, quais foram os modelos criados, para explicar o Universo e o nosso Sistema Solar, aqui vamos listar os mais relevantes.</p>', '2021-01-19 08:30:39', 'S');


--
-- Data for Name: tb_pagina_visita; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--



--
-- Data for Name: tb_perfil; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_perfil (co_perfil, no_perfil, st_status) VALUES (1, 'Master', 'A');
INSERT INTO sis_enovus.tb_perfil (co_perfil, no_perfil, st_status) VALUES (2, 'Gestor', 'A');
INSERT INTO sis_enovus.tb_perfil (co_perfil, no_perfil, st_status) VALUES (3, 'Usuário Padrão', 'A');
INSERT INTO sis_enovus.tb_perfil (co_perfil, no_perfil, st_status) VALUES (4, 'Professor', 'A');
INSERT INTO sis_enovus.tb_perfil (co_perfil, no_perfil, st_status) VALUES (5, 'Coordenador Escolar', 'A');
INSERT INTO sis_enovus.tb_perfil (co_perfil, no_perfil, st_status) VALUES (6, 'Diagramador', 'A');
INSERT INTO sis_enovus.tb_perfil (co_perfil, no_perfil, st_status) VALUES (7, 'Aluno', 'A');
INSERT INTO sis_enovus.tb_perfil (co_perfil, no_perfil, st_status) VALUES (8, 'Geral', 'A');


--
-- Data for Name: tb_perfil_funcionalidade; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (1, 1, 1);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (2, 11, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (3, 6, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (4, 11, 3);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (5, 6, 3);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (6, 11, 4);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (7, 6, 4);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (8, 11, 5);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (9, 6, 5);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (23, 11, 6);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (26, 6, 6);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (34, 11, 7);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (35, 6, 7);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (36, 30, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (37, 34, 5);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (38, 34, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (40, 8, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (41, 17, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (43, 5, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (44, 7, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (53, 39, 5);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (54, 39, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (55, 38, 5);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (56, 38, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (57, 37, 5);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (58, 37, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (59, 36, 5);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (60, 36, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (61, 35, 5);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (62, 35, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (71, 40, 7);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (72, 40, 6);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (73, 40, 5);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (74, 40, 4);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (75, 40, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (76, 41, 6);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (77, 41, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (90, 43, 6);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (91, 43, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (92, 42, 6);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (93, 42, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (94, 45, 6);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (95, 45, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (96, 44, 6);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (97, 44, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (98, 45, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (99, 44, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (100, 43, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (101, 42, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (102, 41, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (103, 40, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (104, 39, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (105, 38, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (106, 37, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (107, 36, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (108, 35, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (109, 34, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (110, 33, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (111, 32, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (112, 31, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (113, 30, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (114, 29, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (115, 28, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (116, 24, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (117, 23, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (118, 22, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (119, 17, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (120, 16, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (121, 15, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (122, 14, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (123, 13, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (124, 11, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (125, 10, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (126, 9, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (127, 8, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (128, 7, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (129, 6, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (130, 5, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (132, 3, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (133, 2, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (134, 1, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (139, 48, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (140, 48, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (141, 47, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (142, 47, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (143, 4, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (144, 4, 7);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (145, 4, 6);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (146, 4, 5);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (147, 4, 4);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (148, 4, 3);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (149, 4, 2);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (150, 46, 8);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (151, 46, 7);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (152, 46, 6);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (153, 46, 5);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (154, 46, 4);
INSERT INTO sis_enovus.tb_perfil_funcionalidade (co_perfil_funcionalidade, co_funcionalidade, co_perfil) VALUES (155, 46, 2);


--
-- Data for Name: tb_pessoa; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_pessoa (co_pessoa, nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo, co_endereco, co_contato, co_imagem) VALUES (1, '', 'Usuário SisEnovus', '', '2016-10-31 00:00:00', '2010-10-10', 'M', 1, 1, 1);
INSERT INTO sis_enovus.tb_pessoa (co_pessoa, nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo, co_endereco, co_contato, co_imagem) VALUES (2, '01304694160', 'MARIA KARLENE', '', '2020-10-23 11:38:41', '2020-10-10', '', 2, 2, 1);
INSERT INTO sis_enovus.tb_pessoa (co_pessoa, nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo, co_endereco, co_contato, co_imagem) VALUES (16, '12345678909', 'LEONARDO MACHADO CARVALHO BESSA', '2077811', '2020-10-30 19:47:41', '2000-10-11', 'M', 22, 22, 1);
INSERT INTO sis_enovus.tb_pessoa (co_pessoa, nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo, co_endereco, co_contato, co_imagem) VALUES (18, '22322191191', 'JOSE ARNALDO', '', '2020-11-02 11:21:51', '2020-10-10', '', 25, 25, 1);
INSERT INTO sis_enovus.tb_pessoa (co_pessoa, nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo, co_endereco, co_contato, co_imagem) VALUES (19, '', 'Leonardo', '', '2020-12-03 16:28:39', '2020-10-10', '', 26, 26, 1);
INSERT INTO sis_enovus.tb_pessoa (co_pessoa, nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo, co_endereco, co_contato, co_imagem) VALUES (20, '16688683776', 'LUCAS SOARES', '', '2020-12-18 12:03:43', '2020-10-10', '', 27, 27, 1);
INSERT INTO sis_enovus.tb_pessoa (co_pessoa, nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo, co_endereco, co_contato, co_imagem) VALUES (21, '', 'ALUNO NOTA DEZ', '', '2020-12-21 11:32:02', '2020-10-10', '', 28, 28, 1);
INSERT INTO sis_enovus.tb_pessoa (co_pessoa, nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo, co_endereco, co_contato, co_imagem) VALUES (22, '12345678909', 'Lucas Soares', '202020', '2020-12-21 11:51:32', '2020-12-02', 'M', 29, 29, 1);
INSERT INTO sis_enovus.tb_pessoa (co_pessoa, nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo, co_endereco, co_contato, co_imagem) VALUES (23, '', 'PROFESSOR PARDAL', '', '2020-12-21 16:22:32', '2020-10-10', '', 30, 30, 1);
INSERT INTO sis_enovus.tb_pessoa (co_pessoa, nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo, co_endereco, co_contato, co_imagem) VALUES (24, '', 'ALUNO NOTA MIL', '', '2020-12-22 11:41:30', '2020-10-10', '', 31, 31, 1);


--
-- Data for Name: tb_professor; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_professor (co_professor, dt_cadastro, st_status, co_pessoa, co_escola) VALUES (1, '2020-12-21 11:44:37', 'S', 22, 1);
INSERT INTO sis_enovus.tb_professor (co_professor, dt_cadastro, st_status, co_pessoa, co_escola) VALUES (2, '2020-12-21 16:22:32', 'S', 23, 2);


--
-- Data for Name: tb_projeto; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_projeto (co_projeto, no_projeto, dt_cadastro) VALUES (1, 'Enovus', '2020-09-05 11:07:40');


--
-- Data for Name: tb_sessao; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_sessao (co_sessao, no_sessao, dt_cadastro, co_modulo) VALUES (1, 'Site / Sistema / Leitor do Livro', '2020-09-26 13:46:15', 10);
INSERT INTO sis_enovus.tb_sessao (co_sessao, no_sessao, dt_cadastro, co_modulo) VALUES (2, 'Plugin', '2020-09-26 14:46:16', 11);
INSERT INTO sis_enovus.tb_sessao (co_sessao, no_sessao, dt_cadastro, co_modulo) VALUES (3, 'Configuração', '2020-09-26 14:46:27', 11);
INSERT INTO sis_enovus.tb_sessao (co_sessao, no_sessao, dt_cadastro, co_modulo) VALUES (4, 'Segurança', '2020-09-26 14:46:36', 11);
INSERT INTO sis_enovus.tb_sessao (co_sessao, no_sessao, dt_cadastro, co_modulo) VALUES (5, 'Segurança', '2020-09-26 14:54:53', 10);
INSERT INTO sis_enovus.tb_sessao (co_sessao, no_sessao, dt_cadastro, co_modulo) VALUES (6, 'Download Aplicativo', '2020-09-26 15:07:16', 12);


--
-- Data for Name: tb_suporte; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--



--
-- Data for Name: tb_tipo_imagem; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_tipo_imagem (co_tipo_imagem, ds_tipo_imagem) VALUES (1, 'Perfil Usuário');
INSERT INTO sis_enovus.tb_tipo_imagem (co_tipo_imagem, ds_tipo_imagem) VALUES (2, 'Capa Livro');
INSERT INTO sis_enovus.tb_tipo_imagem (co_tipo_imagem, ds_tipo_imagem) VALUES (3, 'Capa Capítulo');
INSERT INTO sis_enovus.tb_tipo_imagem (co_tipo_imagem, ds_tipo_imagem) VALUES (4, 'Conteúdo Livro');


--
-- Data for Name: tb_trafego; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (220, '127.0.0.1', 'Desconhecido', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (221, '::1', 'Desconhecido', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Chrome', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (222, '127.0.0.1', 'Desconhecido', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (223, '127.0.0.1', 'Desconhecido', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (1, '127.0.0.1', 'Desconhecido', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (2, '127.0.0.1', 'Desconhecido', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (3, '127.0.0.1', 'Desconhecido', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (4, '127.0.0.1', 'Desconhecido', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (5, '127.0.0.1', 'Desconhecido', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (6, '127.0.0.1', 'Desconhecido', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (7, '127.0.0.1', 'Desconhecido', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Desconhecida', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (8, '189.85.83.242', 'Brazil', 'BR', 'DF', 'Distrito Federal', 'Brasília', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (9, '189.85.83.242', 'Brazil', 'BR', 'DF', 'Distrito Federal', 'Brasília', 'Chrome', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.88 Safari/537.36');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (10, '189.85.83.242', 'Brazil', 'BR', 'DF', 'Distrito Federal', 'Brasília', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (224, '189.85.83.242', 'Brazil', 'BR', 'DF', 'Distrito Federal', 'Brasília', 'Chrome', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (225, '189.85.83.242', 'Brazil', 'BR', 'DF', 'Distrito Federal', 'Brasília', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (226, '189.85.83.242', 'Brazil', 'BR', 'DF', 'Distrito Federal', 'Brasília', 'Chrome', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (227, '189.85.83.242', 'Brazil', 'BR', 'DF', 'Distrito Federal', 'Brasília', 'Chrome', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (228, '189.85.83.242', 'Brazil', 'BR', 'DF', 'Distrito Federal', 'Brasília', 'Chrome', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/87.0.4280.141 Safari/537.36');
INSERT INTO sis_enovus.tb_trafego (co_trafego, nu_ip, ds_pais, ds_code_pais, ds_uf, ds_estado, ds_cidade, ds_navegador, ds_sistema_operacional, ds_dispositivo, ds_agente) VALUES (229, '189.85.83.242', 'Brazil', 'BR', 'DF', 'Distrito Federal', 'Brasília', 'Firefox', 'Windows 10', 'Desktop', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:84.0) Gecko/20100101 Firefox/84.0');


--
-- Data for Name: tb_turma; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_turma (co_turma, ds_turma, dt_cadastro, nu_ano, st_status, co_escola) VALUES (1, 'K', '2020-10-10 00:00:00', 8, 'S', 1);
INSERT INTO sis_enovus.tb_turma (co_turma, ds_turma, dt_cadastro, nu_ano, st_status, co_escola) VALUES (2, 'p', '2020-10-10 00:00:00', 7, 'S', 1);
INSERT INTO sis_enovus.tb_turma (co_turma, ds_turma, dt_cadastro, nu_ano, st_status, co_escola) VALUES (3, 'A', '2020-10-10 00:00:00', 1, 'S', 1);
INSERT INTO sis_enovus.tb_turma (co_turma, ds_turma, dt_cadastro, nu_ano, st_status, co_escola) VALUES (4, 'E', '2020-10-10 00:00:00', 7, 'S', 2);


--
-- Data for Name: tb_usuario; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_usuario (co_usuario, ds_senha, ds_code, st_status, st_troca_senha, dt_cadastro, co_imagem, co_pessoa) VALUES (1, '123456**', 'TVRJek5EVTJLaW89', 'A', 'S', '2016-10-31 00:00:00', 1, 1);
INSERT INTO sis_enovus.tb_usuario (co_usuario, ds_senha, ds_code, st_status, st_troca_senha, dt_cadastro, co_imagem, co_pessoa) VALUES (17, '123456', 'TVRJek5EVTI=', 'A', 'N', '2020-12-18 12:03:43', 32, 20);
INSERT INTO sis_enovus.tb_usuario (co_usuario, ds_senha, ds_code, st_status, st_troca_senha, dt_cadastro, co_imagem, co_pessoa) VALUES (2, '123456**', 'TVRJek5EVTJLaW89', 'A', 'N', '2020-10-23 11:38:41', 1, 2);
INSERT INTO sis_enovus.tb_usuario (co_usuario, ds_senha, ds_code, st_status, st_troca_senha, dt_cadastro, co_imagem, co_pessoa) VALUES (14, '123456**', 'TVRJek5EVTJLaW89', 'A', 'N', '2020-10-30 19:47:41', 1, 16);
INSERT INTO sis_enovus.tb_usuario (co_usuario, ds_senha, ds_code, st_status, st_troca_senha, dt_cadastro, co_imagem, co_pessoa) VALUES (15, '123456**', 'TVRJek5EVTJLaW89', 'A', 'N', '2020-11-02 11:21:51', 1, 18);
INSERT INTO sis_enovus.tb_usuario (co_usuario, ds_senha, ds_code, st_status, st_troca_senha, dt_cadastro, co_imagem, co_pessoa) VALUES (16, 'AWE2WZH4', 'UVZkRk1sZGFTRFE9', 'I', 'N', '2020-12-03 16:28:39', 1, 19);
INSERT INTO sis_enovus.tb_usuario (co_usuario, ds_senha, ds_code, st_status, st_troca_senha, dt_cadastro, co_imagem, co_pessoa) VALUES (18, 'GOW6LEE5', 'UjA5WE5reEZSVFU9', 'A', 'N', '2020-12-21 11:32:02', 1, 21);
INSERT INTO sis_enovus.tb_usuario (co_usuario, ds_senha, ds_code, st_status, st_troca_senha, dt_cadastro, co_imagem, co_pessoa) VALUES (19, 'TYU3OTB0', 'VkZsVk0wOVVRakE9', 'I', 'N', '2020-12-21 11:51:32', 1, 22);
INSERT INTO sis_enovus.tb_usuario (co_usuario, ds_senha, ds_code, st_status, st_troca_senha, dt_cadastro, co_imagem, co_pessoa) VALUES (20, '123456**', 'TVRJek5EVTJLaW89', 'A', 'N', '2020-12-21 16:22:32', 1, 23);
INSERT INTO sis_enovus.tb_usuario (co_usuario, ds_senha, ds_code, st_status, st_troca_senha, dt_cadastro, co_imagem, co_pessoa) VALUES (21, '123456**', 'TVRJek5EVTJLaW89', 'A', 'N', '2020-12-22 11:41:30', 1, 24);


--
-- Data for Name: tb_usuario_perfil; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--

INSERT INTO sis_enovus.tb_usuario_perfil (co_usuario_perfil, co_usuario, co_perfil) VALUES (1, 1, 1);
INSERT INTO sis_enovus.tb_usuario_perfil (co_usuario_perfil, co_usuario, co_perfil) VALUES (25, 17, 8);
INSERT INTO sis_enovus.tb_usuario_perfil (co_usuario_perfil, co_usuario, co_perfil) VALUES (26, 17, 3);
INSERT INTO sis_enovus.tb_usuario_perfil (co_usuario_perfil, co_usuario, co_perfil) VALUES (28, 19, 3);
INSERT INTO sis_enovus.tb_usuario_perfil (co_usuario_perfil, co_usuario, co_perfil) VALUES (29, 19, 4);
INSERT INTO sis_enovus.tb_usuario_perfil (co_usuario_perfil, co_usuario, co_perfil) VALUES (37, 18, 7);
INSERT INTO sis_enovus.tb_usuario_perfil (co_usuario_perfil, co_usuario, co_perfil) VALUES (38, 18, 3);
INSERT INTO sis_enovus.tb_usuario_perfil (co_usuario_perfil, co_usuario, co_perfil) VALUES (41, 21, 7);
INSERT INTO sis_enovus.tb_usuario_perfil (co_usuario_perfil, co_usuario, co_perfil) VALUES (42, 21, 3);
INSERT INTO sis_enovus.tb_usuario_perfil (co_usuario_perfil, co_usuario, co_perfil) VALUES (45, 20, 4);
INSERT INTO sis_enovus.tb_usuario_perfil (co_usuario_perfil, co_usuario, co_perfil) VALUES (46, 20, 3);


--
-- Data for Name: tb_visita; Type: TABLE DATA; Schema: sis_enovus; Owner: digitalenovus
--



--
-- Name: tb_acesso_co_acesso_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_acesso_co_acesso_seq', 1, true);


--
-- Name: tb_aluno_co_aluno_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_aluno_co_aluno_seq', 4, true);


--
-- Name: tb_anotacao_aluno_co_anotacao_aluno_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_anotacao_aluno_co_anotacao_aluno_seq', 11, true);


--
-- Name: tb_anotacao_co_anotacao_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_anotacao_co_anotacao_seq', 1, false);


--
-- Name: tb_anotacao_professor_co_anotacao_professor_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_anotacao_professor_co_anotacao_professor_seq', 5, true);


--
-- Name: tb_auditoria_co_auditoria_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_auditoria_co_auditoria_seq', 1, true);


--
-- Name: tb_auditoria_itens_co_auditoria_itens_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_auditoria_itens_co_auditoria_itens_seq', 1, true);


--
-- Name: tb_auditoria_tabela_co_auditoria_tabela_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_auditoria_tabela_co_auditoria_tabela_seq', 1, true);


--
-- Name: tb_capitulo_co_capitulo_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_capitulo_co_capitulo_seq', 5, true);


--
-- Name: tb_contato_co_contato_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_contato_co_contato_seq', 34, true);


--
-- Name: tb_controller_co_controller_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_controller_co_controller_seq', 11, true);


--
-- Name: tb_crons_co_cron_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_crons_co_cron_seq', 1, false);


--
-- Name: tb_endereco_co_endereco_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_endereco_co_endereco_seq', 34, true);


--
-- Name: tb_escola_co_escola_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_escola_co_escola_seq', 2, true);


--
-- Name: tb_funcionalidade_co_funcionalidade_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_funcionalidade_co_funcionalidade_seq', 48, true);


--
-- Name: tb_historia_co_historia_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_historia_co_historia_seq', 48, true);


--
-- Name: tb_historico_historia_co_historico_historia_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_historico_historia_co_historico_historia_seq', 82, true);


--
-- Name: tb_historico_suporte_co_historico_suporte_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_historico_suporte_co_historico_suporte_seq', 1, false);


--
-- Name: tb_imagem_co_imagem_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_imagem_co_imagem_seq', 42, true);


--
-- Name: tb_livro_co_livro_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_livro_co_livro_seq', 11, true);


--
-- Name: tb_materia_co_materia_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_materia_co_materia_seq', 1, false);


--
-- Name: tb_materia_turma_co_materia_turma_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_materia_turma_co_materia_turma_seq', 16, true);


--
-- Name: tb_modulo_co_modulo_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_modulo_co_modulo_seq', 12, true);


--
-- Name: tb_pagina_co_pagina_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_pagina_co_pagina_seq', 1, false);


--
-- Name: tb_pagina_livro_co_pagina_livro_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_pagina_livro_co_pagina_livro_seq', 47, true);


--
-- Name: tb_pagina_visita_co_pagina_visita_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_pagina_visita_co_pagina_visita_seq', 1, false);


--
-- Name: tb_perfil_co_perfil_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_perfil_co_perfil_seq', 8, true);


--
-- Name: tb_perfil_funcionalidade_co_perfil_funcionalidade_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_perfil_funcionalidade_co_perfil_funcionalidade_seq', 155, true);


--
-- Name: tb_pessoa_co_pessoa_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_pessoa_co_pessoa_seq', 29, true);


--
-- Name: tb_professor_co_professor_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_professor_co_professor_seq', 2, true);


--
-- Name: tb_projeto_co_projeto_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_projeto_co_projeto_seq', 1, true);


--
-- Name: tb_sessao_co_sessao_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_sessao_co_sessao_seq', 6, true);


--
-- Name: tb_suporte_co_suporte_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_suporte_co_suporte_seq', 1, false);


--
-- Name: tb_tipo_imagem_co_tipo_imagem_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_tipo_imagem_co_tipo_imagem_seq', 4, true);


--
-- Name: tb_trafego_co_trafego_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_trafego_co_trafego_seq', 229, true);


--
-- Name: tb_turma_co_turma_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_turma_co_turma_seq', 4, true);


--
-- Name: tb_usuario_co_usuario_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_usuario_co_usuario_seq', 21, true);


--
-- Name: tb_usuario_perfil_co_usuario_perfil_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_usuario_perfil_co_usuario_perfil_seq', 46, true);


--
-- Name: tb_visita_co_visita_seq; Type: SEQUENCE SET; Schema: sis_enovus; Owner: digitalenovus
--

SELECT pg_catalog.setval('sis_enovus.tb_visita_co_visita_seq', 1, false);


--
-- Name: tb_acesso primary; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_acesso
    ADD CONSTRAINT "primary" PRIMARY KEY (co_acesso);


--
-- Name: tb_aluno primary1; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_aluno
    ADD CONSTRAINT primary1 PRIMARY KEY (co_aluno);


--
-- Name: tb_controller primary10; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_controller
    ADD CONSTRAINT primary10 PRIMARY KEY (co_controller);


--
-- Name: tb_crons primary11; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_crons
    ADD CONSTRAINT primary11 PRIMARY KEY (co_cron);


--
-- Name: tb_endereco primary12; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_endereco
    ADD CONSTRAINT primary12 PRIMARY KEY (co_endereco);


--
-- Name: tb_escola primary13; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_escola
    ADD CONSTRAINT primary13 PRIMARY KEY (co_escola);


--
-- Name: tb_funcionalidade primary14; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_funcionalidade
    ADD CONSTRAINT primary14 PRIMARY KEY (co_funcionalidade);


--
-- Name: tb_historia primary15; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_historia
    ADD CONSTRAINT primary15 PRIMARY KEY (co_historia);


--
-- Name: tb_historico_historia primary16; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_historico_historia
    ADD CONSTRAINT primary16 PRIMARY KEY (co_historico_historia);


--
-- Name: tb_historico_suporte primary17; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_historico_suporte
    ADD CONSTRAINT primary17 PRIMARY KEY (co_historico_suporte);


--
-- Name: tb_imagem primary18; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_imagem
    ADD CONSTRAINT primary18 PRIMARY KEY (co_imagem);


--
-- Name: tb_livro primary19; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_livro
    ADD CONSTRAINT primary19 PRIMARY KEY (co_livro);


--
-- Name: tb_anotacao primary2; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_anotacao
    ADD CONSTRAINT primary2 PRIMARY KEY (co_anotacao);


--
-- Name: tb_materia primary20; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_materia
    ADD CONSTRAINT primary20 PRIMARY KEY (co_materia);


--
-- Name: tb_materia_turma primary21; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_materia_turma
    ADD CONSTRAINT primary21 PRIMARY KEY (co_materia_turma);


--
-- Name: tb_modulo primary22; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_modulo
    ADD CONSTRAINT primary22 PRIMARY KEY (co_modulo);


--
-- Name: tb_pagina primary23; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pagina
    ADD CONSTRAINT primary23 PRIMARY KEY (co_pagina);


--
-- Name: tb_pagina_livro primary24; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pagina_livro
    ADD CONSTRAINT primary24 PRIMARY KEY (co_pagina_livro);


--
-- Name: tb_pagina_visita primary25; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pagina_visita
    ADD CONSTRAINT primary25 PRIMARY KEY (co_pagina_visita);


--
-- Name: tb_perfil primary26; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_perfil
    ADD CONSTRAINT primary26 PRIMARY KEY (co_perfil);


--
-- Name: tb_perfil_funcionalidade primary27; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_perfil_funcionalidade
    ADD CONSTRAINT primary27 PRIMARY KEY (co_perfil_funcionalidade);


--
-- Name: tb_pessoa primary28; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pessoa
    ADD CONSTRAINT primary28 PRIMARY KEY (co_pessoa);


--
-- Name: tb_professor primary29; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_professor
    ADD CONSTRAINT primary29 PRIMARY KEY (co_professor);


--
-- Name: tb_anotacao_aluno primary3; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_anotacao_aluno
    ADD CONSTRAINT primary3 PRIMARY KEY (co_anotacao_aluno);


--
-- Name: tb_projeto primary30; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_projeto
    ADD CONSTRAINT primary30 PRIMARY KEY (co_projeto);


--
-- Name: tb_sessao primary31; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_sessao
    ADD CONSTRAINT primary31 PRIMARY KEY (co_sessao);


--
-- Name: tb_suporte primary32; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_suporte
    ADD CONSTRAINT primary32 PRIMARY KEY (co_suporte);


--
-- Name: tb_tipo_imagem primary33; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_tipo_imagem
    ADD CONSTRAINT primary33 PRIMARY KEY (co_tipo_imagem);


--
-- Name: tb_trafego primary34; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_trafego
    ADD CONSTRAINT primary34 PRIMARY KEY (co_trafego);


--
-- Name: tb_turma primary35; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_turma
    ADD CONSTRAINT primary35 PRIMARY KEY (co_turma);


--
-- Name: tb_usuario primary36; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_usuario
    ADD CONSTRAINT primary36 PRIMARY KEY (co_usuario);


--
-- Name: tb_usuario_perfil primary37; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_usuario_perfil
    ADD CONSTRAINT primary37 PRIMARY KEY (co_usuario_perfil);


--
-- Name: tb_visita primary38; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_visita
    ADD CONSTRAINT primary38 PRIMARY KEY (co_visita);


--
-- Name: tb_auditoria primary5; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_auditoria
    ADD CONSTRAINT primary5 PRIMARY KEY (co_auditoria);


--
-- Name: tb_auditoria_itens primary6; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_auditoria_itens
    ADD CONSTRAINT primary6 PRIMARY KEY (co_auditoria_itens);


--
-- Name: tb_auditoria_tabela primary7; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_auditoria_tabela
    ADD CONSTRAINT primary7 PRIMARY KEY (co_auditoria_tabela);


--
-- Name: tb_capitulo primary8; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_capitulo
    ADD CONSTRAINT primary8 PRIMARY KEY (co_capitulo);


--
-- Name: tb_contato primary9; Type: CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_contato
    ADD CONSTRAINT primary9 PRIMARY KEY (co_contato);


--
-- Name: tb_acesso tb_acesso_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_acesso
    ADD CONSTRAINT tb_acesso_fk FOREIGN KEY (co_usuario) REFERENCES sis_enovus.tb_usuario(co_usuario);


--
-- Name: tb_acesso tb_acesso_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_acesso
    ADD CONSTRAINT tb_acesso_fk_1 FOREIGN KEY (co_trafego) REFERENCES sis_enovus.tb_trafego(co_trafego);


--
-- Name: tb_aluno tb_aluno_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_aluno
    ADD CONSTRAINT tb_aluno_fk FOREIGN KEY (co_turma) REFERENCES sis_enovus.tb_turma(co_turma);


--
-- Name: tb_aluno tb_aluno_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_aluno
    ADD CONSTRAINT tb_aluno_fk_1 FOREIGN KEY (co_pessoa) REFERENCES sis_enovus.tb_pessoa(co_pessoa);


--
-- Name: tb_anotacao_aluno tb_anotacao_aluno_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_anotacao_aluno
    ADD CONSTRAINT tb_anotacao_aluno_fk FOREIGN KEY (co_pagina_livro) REFERENCES sis_enovus.tb_pagina_livro(co_pagina_livro);


--
-- Name: tb_anotacao_aluno tb_anotacao_aluno_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_anotacao_aluno
    ADD CONSTRAINT tb_anotacao_aluno_fk_1 FOREIGN KEY (co_aluno) REFERENCES sis_enovus.tb_aluno(co_aluno);


--
-- Name: tb_anotacao tb_anotacao_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_anotacao
    ADD CONSTRAINT tb_anotacao_fk FOREIGN KEY (co_historia) REFERENCES sis_enovus.tb_historia(co_historia);


--
-- Name: tb_anotacao_professor tb_anotacao_professor_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_anotacao_professor
    ADD CONSTRAINT tb_anotacao_professor_fk FOREIGN KEY (co_materia_turma) REFERENCES sis_enovus.tb_materia_turma(co_materia_turma);


--
-- Name: tb_anotacao_professor tb_anotacao_professor_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_anotacao_professor
    ADD CONSTRAINT tb_anotacao_professor_fk_1 FOREIGN KEY (co_pagina_livro) REFERENCES sis_enovus.tb_pagina_livro(co_pagina_livro);


--
-- Name: tb_auditoria tb_auditoria_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_auditoria
    ADD CONSTRAINT tb_auditoria_fk FOREIGN KEY (co_usuario) REFERENCES sis_enovus.tb_usuario(co_usuario);


--
-- Name: tb_auditoria_itens tb_auditoria_itens_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_auditoria_itens
    ADD CONSTRAINT tb_auditoria_itens_fk FOREIGN KEY (co_auditoria_tabela) REFERENCES sis_enovus.tb_auditoria_tabela(co_auditoria_tabela);


--
-- Name: tb_auditoria_tabela tb_auditoria_tabela_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_auditoria_tabela
    ADD CONSTRAINT tb_auditoria_tabela_fk FOREIGN KEY (co_auditoria) REFERENCES sis_enovus.tb_auditoria(co_auditoria);


--
-- Name: tb_capitulo tb_capitulo_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_capitulo
    ADD CONSTRAINT tb_capitulo_fk FOREIGN KEY (co_livro) REFERENCES sis_enovus.tb_livro(co_livro);


--
-- Name: tb_capitulo tb_capitulo_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_capitulo
    ADD CONSTRAINT tb_capitulo_fk_1 FOREIGN KEY (co_imagem) REFERENCES sis_enovus.tb_imagem(co_imagem);


--
-- Name: tb_escola tb_escola_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_escola
    ADD CONSTRAINT tb_escola_fk FOREIGN KEY (co_endereco) REFERENCES sis_enovus.tb_endereco(co_endereco);


--
-- Name: tb_escola tb_escola_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_escola
    ADD CONSTRAINT tb_escola_fk_1 FOREIGN KEY (co_contato) REFERENCES sis_enovus.tb_contato(co_contato);


--
-- Name: tb_escola tb_escola_fk_2; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_escola
    ADD CONSTRAINT tb_escola_fk_2 FOREIGN KEY (co_usuario) REFERENCES sis_enovus.tb_usuario(co_usuario);


--
-- Name: tb_funcionalidade tb_funcionalidade_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_funcionalidade
    ADD CONSTRAINT tb_funcionalidade_fk FOREIGN KEY (co_controller) REFERENCES sis_enovus.tb_controller(co_controller);


--
-- Name: tb_historia tb_historia_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_historia
    ADD CONSTRAINT tb_historia_fk FOREIGN KEY (co_sessao) REFERENCES sis_enovus.tb_sessao(co_sessao);


--
-- Name: tb_historico_historia tb_historico_historia_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_historico_historia
    ADD CONSTRAINT tb_historico_historia_fk FOREIGN KEY (co_historia) REFERENCES sis_enovus.tb_historia(co_historia);


--
-- Name: tb_historico_suporte tb_historico_suporte_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_historico_suporte
    ADD CONSTRAINT tb_historico_suporte_fk FOREIGN KEY (co_suporte) REFERENCES sis_enovus.tb_suporte(co_suporte);


--
-- Name: tb_historico_suporte tb_historico_suporte_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_historico_suporte
    ADD CONSTRAINT tb_historico_suporte_fk_1 FOREIGN KEY (co_usuario) REFERENCES sis_enovus.tb_usuario(co_usuario);


--
-- Name: tb_historico_suporte tb_historico_suporte_fk_2; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_historico_suporte
    ADD CONSTRAINT tb_historico_suporte_fk_2 FOREIGN KEY (co_imagem) REFERENCES sis_enovus.tb_imagem(co_imagem);


--
-- Name: tb_imagem tb_imagem_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_imagem
    ADD CONSTRAINT tb_imagem_fk FOREIGN KEY (co_tipo_imagem) REFERENCES sis_enovus.tb_tipo_imagem(co_tipo_imagem);


--
-- Name: tb_livro tb_livro_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_livro
    ADD CONSTRAINT tb_livro_fk FOREIGN KEY (co_materia) REFERENCES sis_enovus.tb_materia(co_materia);


--
-- Name: tb_livro tb_livro_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_livro
    ADD CONSTRAINT tb_livro_fk_1 FOREIGN KEY (co_imagem) REFERENCES sis_enovus.tb_imagem(co_imagem);


--
-- Name: tb_materia tb_materia_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_materia
    ADD CONSTRAINT tb_materia_fk FOREIGN KEY (co_escola) REFERENCES sis_enovus.tb_escola(co_escola);


--
-- Name: tb_materia_turma tb_materia_turma_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_materia_turma
    ADD CONSTRAINT tb_materia_turma_fk FOREIGN KEY (co_materia) REFERENCES sis_enovus.tb_materia(co_materia);


--
-- Name: tb_materia_turma tb_materia_turma_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_materia_turma
    ADD CONSTRAINT tb_materia_turma_fk_1 FOREIGN KEY (co_turma) REFERENCES sis_enovus.tb_turma(co_turma);


--
-- Name: tb_materia_turma tb_materia_turma_fk_2; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_materia_turma
    ADD CONSTRAINT tb_materia_turma_fk_2 FOREIGN KEY (co_professor) REFERENCES sis_enovus.tb_professor(co_professor);


--
-- Name: tb_modulo tb_modulo_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_modulo
    ADD CONSTRAINT tb_modulo_fk FOREIGN KEY (co_projeto) REFERENCES sis_enovus.tb_projeto(co_projeto);


--
-- Name: tb_pagina_livro tb_pagina_livro_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pagina_livro
    ADD CONSTRAINT tb_pagina_livro_fk FOREIGN KEY (co_capitulo) REFERENCES sis_enovus.tb_capitulo(co_capitulo);


--
-- Name: tb_pagina_visita tb_pagina_visita_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pagina_visita
    ADD CONSTRAINT tb_pagina_visita_fk FOREIGN KEY (co_pagina) REFERENCES sis_enovus.tb_pagina(co_pagina);


--
-- Name: tb_pagina_visita tb_pagina_visita_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pagina_visita
    ADD CONSTRAINT tb_pagina_visita_fk_1 FOREIGN KEY (co_visita) REFERENCES sis_enovus.tb_visita(co_visita);


--
-- Name: tb_perfil_funcionalidade tb_perfil_funcionalidade_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_perfil_funcionalidade
    ADD CONSTRAINT tb_perfil_funcionalidade_fk FOREIGN KEY (co_perfil) REFERENCES sis_enovus.tb_perfil(co_perfil);


--
-- Name: tb_perfil_funcionalidade tb_perfil_funcionalidade_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_perfil_funcionalidade
    ADD CONSTRAINT tb_perfil_funcionalidade_fk_1 FOREIGN KEY (co_funcionalidade) REFERENCES sis_enovus.tb_funcionalidade(co_funcionalidade);


--
-- Name: tb_pessoa tb_pessoa_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pessoa
    ADD CONSTRAINT tb_pessoa_fk FOREIGN KEY (co_endereco) REFERENCES sis_enovus.tb_endereco(co_endereco);


--
-- Name: tb_pessoa tb_pessoa_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pessoa
    ADD CONSTRAINT tb_pessoa_fk_1 FOREIGN KEY (co_contato) REFERENCES sis_enovus.tb_contato(co_contato);


--
-- Name: tb_pessoa tb_pessoa_fk_2; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_pessoa
    ADD CONSTRAINT tb_pessoa_fk_2 FOREIGN KEY (co_imagem) REFERENCES sis_enovus.tb_imagem(co_imagem);


--
-- Name: tb_professor tb_professor_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_professor
    ADD CONSTRAINT tb_professor_fk FOREIGN KEY (co_escola) REFERENCES sis_enovus.tb_escola(co_escola);


--
-- Name: tb_professor tb_professor_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_professor
    ADD CONSTRAINT tb_professor_fk_1 FOREIGN KEY (co_pessoa) REFERENCES sis_enovus.tb_pessoa(co_pessoa);


--
-- Name: tb_sessao tb_sessao_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_sessao
    ADD CONSTRAINT tb_sessao_fk FOREIGN KEY (co_modulo) REFERENCES sis_enovus.tb_modulo(co_modulo);


--
-- Name: tb_turma tb_turma_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_turma
    ADD CONSTRAINT tb_turma_fk FOREIGN KEY (co_escola) REFERENCES sis_enovus.tb_escola(co_escola);


--
-- Name: tb_usuario tb_usuario_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_usuario
    ADD CONSTRAINT tb_usuario_fk FOREIGN KEY (co_imagem) REFERENCES sis_enovus.tb_imagem(co_imagem);


--
-- Name: tb_usuario tb_usuario_fk_1; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_usuario
    ADD CONSTRAINT tb_usuario_fk_1 FOREIGN KEY (co_pessoa) REFERENCES sis_enovus.tb_pessoa(co_pessoa);


--
-- Name: tb_usuario_perfil tb_usuario_perfil_fk; Type: FK CONSTRAINT; Schema: sis_enovus; Owner: digitalenovus
--

ALTER TABLE ONLY sis_enovus.tb_usuario_perfil
    ADD CONSTRAINT tb_usuario_perfil_fk FOREIGN KEY (co_usuario) REFERENCES sis_enovus.tb_usuario(co_usuario);


--
-- PostgreSQL database dump complete
--

