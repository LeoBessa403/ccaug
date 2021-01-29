<?php

/**
 * Turma.Entidade [ ENTIDADE ]
 * @copyright (c) 2020, Leo Bessa
 */

class TurmaEntidade extends AbstractEntidade
{
	const TABELA = SCHEMA . '.TB_TURMA';
	const ENTIDADE = 'TurmaEntidade';
	const CHAVE = CO_TURMA;

	private $co_turma;
	private $ds_turma;
	private $dt_cadastro;
	private $nu_ano;
	private $st_status;
	private $co_escola;
	private $co_aluno;
	private $co_materia_turma;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_TURMA,
			DS_TURMA,
			DT_CADASTRO,
			NU_ANO,
			ST_STATUS,
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
	* @return int $co_turma
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
	* @return mixed $ds_turma
    */
	public function getDsTurma()
    {
        return $this->ds_turma;
    }

	/**
	* @param $ds_turma
    * @return mixed
    */
	public function setDsTurma($ds_turma)
    {
        return $this->ds_turma = $ds_turma;
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
	* @return mixed $nu_ano
    */
	public function getNuAno()
    {
        return $this->nu_ano;
    }

	/**
	* @param $nu_ano
    * @return mixed
    */
	public function setNuAno($nu_ano)
    {
        return $this->nu_ano = $nu_ano;
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
	* @return EscolaEntidade $co_escola
    */
	public function getCoEscola()
    {
        return $this->co_escola;
    }

	/**
	* @param $co_escola
    * @return mixed
    */
	public function setCoEscola($co_escola)
    {
        return $this->co_escola = $co_escola;
    }

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
        return $this->co_aluno = $co_aluno;
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

}