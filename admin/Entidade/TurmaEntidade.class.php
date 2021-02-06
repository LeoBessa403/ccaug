<?php

/**
 * Turma.Entidade [ ENTIDADE ]
 * @copyright (c) 2021, Leo Bessa
 */

class TurmaEntidade extends AbstractEntidade
{
	const TABELA = 'TB_TURMA';
	const ENTIDADE = 'TurmaEntidade';
	const CHAVE = CO_TURMA;

	private $co_turma;
	private $ds_turma;
	private $dt_cadastro;
	private $nu_ano;
	private $st_status;
	private $co_curso;


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
			CO_CURSO,
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
	* @return CursoEntidade $co_curso
    */
	public function getCoCurso()
    {
        return $this->co_curso;
    }

	/**
	* @param $co_curso
    * @return mixed
    */
	public function setCoCurso($co_curso)
    {
        return $this->co_curso = $co_curso;
    }

}