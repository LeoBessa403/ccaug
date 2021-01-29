<?php

/**
 * AnotacaoProfessor.Entidade [ ENTIDADE ]
 * @copyright (c) 2020, Leo Bessa
 */

class AnotacaoProfessorEntidade extends AbstractEntidade
{
    const TABELA = SCHEMA . '.TB_ANOTACAO_PROFESSOR';
    const ENTIDADE = 'AnotacaoProfessorEntidade';
    const CHAVE = CO_ANOTACAO_PROFESSOR;

    private $co_anotacao_professor;
    private $co_materia_turma;
    private $co_pagina_livro;
    private $ds_anotacao;
    private $dt_cadastro;


    /**
     * @return array
     */
    public static function getCampos()
    {
        return [
            CO_ANOTACAO_PROFESSOR,
            CO_MATERIA_TURMA,
            CO_PAGINA_LIVRO,
            DS_ANOTACAO,
            DT_CADASTRO,
        ];
    }

    /**
     * @return array $relacionamentos
     */
    public static function getRelacionamentos()
    {
        $relacionamentos = Relacionamentos::getRelacionamentos();
        return $relacionamentos[static::TABELA];
    }


    /**
     * @return int $co_anotacao_professor
     */
    public function getCoAnotacaoProfessor()
    {
        return $this->co_anotacao_professor;
    }

    /**
     * @param $co_anotacao_professor
     * @return mixed
     */
    public function setCoAnotacaoProfessor($co_anotacao_professor)
    {
        return $this->co_anotacao_professor = $co_anotacao_professor;
    }

    /**
     * @return MateriaTurmaEntidade $co_materia_turma
     */
    public function getCoMateriaTurma()
    {
        return $this->co_materia_turma;
    }

    /**
     * @param $co_materia_turma
     * @return mixed
     */
    public function setCoMateriaTurma($co_materia_turma)
    {
        return $this->co_materia_turma = $co_materia_turma;
    }

    /**
     * @return PaginaLivroEntidade $co_pagina_livro
     */
    public function getCoPaginaLivro()
    {
        return $this->co_pagina_livro;
    }

    /**
     * @param $co_pagina_livro
     * @return mixed
     */
    public function setCoPaginaLivro($co_pagina_livro)
    {
        return $this->co_pagina_livro = $co_pagina_livro;
    }

    /**
     * @return mixed $ds_anotacao
     */
    public function getDsAnotacao()
    {
        return $this->ds_anotacao;
    }

    /**
     * @param $ds_anotacao
     * @return mixed
     */
    public function setDsAnotacao($ds_anotacao)
    {
        return $this->ds_anotacao = $ds_anotacao;
    }

    /**
     * @return mixed $dt_cadastro
     */
    public function getDtCadastro()
    {
        return $this->dt_cadastro;
    }

    /**
     * @param $dt_cadastro
     * @return mixed
     */
    public function setDtCadastro($dt_cadastro)
    {
        return $this->dt_cadastro = $dt_cadastro;
    }

}