<?php

/**
 * Pessoa.Entidade extends [ ENTIDADE ]
 * @copyright (c) 2017, Leo Bessa
 */

class PessoaEntidadeExtends extends AbstractEntidade
{
    private $co_aluno;
    private $co_professor;

    /**
     * @return AlunoEntidade $co_aluno
     */
    public function getCoAluno()
    {
        return $this->co_aluno;
    }

    /**
     * @param $co_aluno
     * @return mixed
     */
    public function setCoAluno($co_aluno)
    {
        $this->co_aluno = $co_aluno;
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
        $this->co_professor = $co_professor;
    }

}