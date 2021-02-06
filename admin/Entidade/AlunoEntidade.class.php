<?php

/**
 * Aluno.Entidade [ ENTIDADE ]
 * @copyright (c) 2021, Leo Bessa
 */

class AlunoEntidade extends AbstractEntidade
{
	const TABELA = 'TB_ALUNO';
	const ENTIDADE = 'AlunoEntidade';
	const CHAVE = CO_ALUNO;

	private $co_aluno;
	private $dt_cadastro;
	private $st_status;
	private $co_pessoa;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_ALUNO,
			DT_CADASTRO,
			ST_STATUS,
			CO_PESSOA,
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
	* @return int $co_aluno
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

}