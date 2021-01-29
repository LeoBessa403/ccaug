<?php

/**
 * Professor.Entidade [ ENTIDADE ]
 * @copyright (c) 2020, Leo Bessa
 */

class ProfessorEntidade extends AbstractEntidade
{
    const TABELA = SCHEMA . '.TB_PROFESSOR';
    const ENTIDADE = 'ProfessorEntidade';
    const CHAVE = CO_PROFESSOR;

    private $co_professor;
    private $dt_cadastro;
    private $st_status;
    private $co_pessoa;
    private $co_materia_turma;
    private $co_escola;


    /**
     * @return array
     */
    public static function getCampos()
    {
        return [
            CO_PROFESSOR,
            DT_CADASTRO,
            ST_STATUS,
            CO_PESSOA,
            CO_ESCOLA,
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
     * @return int $co_professor
     */
    public function getCoProfessor()
    {
        return $this->co_professor;
    }

    /**
     * @param $co_professor
     * @return mixed
     */
    public function setCoProfessor($co_professor)
    {
        return $this->co_professor = $co_professor;
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

    /**
     * @return mixed $st_status
     */
    public function getStStatus()
    {
        return $this->st_status;
    }

    /**
     * @param $st_status
     * @return mixed
     */
    public function setStStatus($st_status)
    {
        return $this->st_status = $st_status;
    }

    /**
     * @return PessoaEntidade $co_pessoa
     */
    public function getCoPessoa()
    {
        return $this->co_pessoa;
    }

    /**
     * @param $co_pessoa
     * @return mixed
     */
    public function setCoPessoa($co_pessoa)
    {
        return $this->co_pessoa = $co_pessoa;
    }

    /**
     * @return MateriaTurmaEntidade $co_materia_turma
     */
    public function getCoMateriaTurma()
    {
        return $this->co_materia_turma;
    }

    /**
     * @return MateriaTurmaEntidade $co_materia_turma
     */
    public function getCoUltimaMateriaTurma()
    {
        return $this->ultimo($this->getCoMateriaTurma());
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
     * @return EscolaEntidade $co_escola
     */
    public function getCoEscola()
    {
        return $this->co_escola;
    }

    /**
     * @param mixed $co_escola
     */
    public function setCoEscola($co_escola)
    {
        $this->co_escola = $co_escola;
    }


}