<?php

/**
 * MateriaTurma.Entidade [ ENTIDADE ]
 * @copyright (c) 2020, Leo Bessa
 */

class MateriaTurmaEntidade extends AbstractEntidade
{
    const TABELA = SCHEMA . '.TB_MATERIA_TURMA';
    const ENTIDADE = 'MateriaTurmaEntidade';
    const CHAVE = CO_MATERIA_TURMA;

    private $co_materia_turma;
    private $co_materia;
    private $co_turma;
    private $co_professor;
    private $co_anotacao_professor;

    /**
     * @return array
     */
    public static function getCampos()
    {
        return [
            CO_MATERIA_TURMA,
            CO_MATERIA,
            CO_TURMA,
            CO_PROFESSOR,
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
     * @return int $co_materia_turma
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
     * @return MateriaEntidade $co_materia
     */
    public function getCoMateria()
    {
        return $this->co_materia;
    }

    /**
     * @param $co_materia
     * @return mixed
     */
    public function setCoMateria($co_materia)
    {
        return $this->co_materia = $co_materia;
    }

    /**
     * @return TurmaEntidade $co_turma
     */
    public function getCoTurma()
    {
        return $this->co_turma;
    }

    /**
     * @param $co_turma
     * @return mixed
     */
    public function setCoTurma($co_turma)
    {
        return $this->co_turma = $co_turma;
    }

    /**
     * @return ProfessorEntidade $co_professor
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
     * @return AnotacaoProfessorEntidade $co_anotacao_professor
     */
    public function getCoAnotacaoProfessor()
    {
        return $this->co_anotacao_professor;
    }

    /**
     * @param mixed $co_anotacao_professor
     */
    public function setCoAnotacaoProfessor($co_anotacao_professor)
    {
        $this->co_anotacao_professor = $co_anotacao_professor;
    }

}