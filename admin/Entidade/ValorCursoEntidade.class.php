<?php

/**
 * ValorCurso.Entidade [ ENTIDADE ]
 * @copyright (c) 2021, Leo Bessa
 */

class ValorCursoEntidade extends AbstractEntidade
{
	const TABELA = 'TB_VALOR_CURSO';
	const ENTIDADE = 'ValorCursoEntidade';
	const CHAVE = CO_VALOR_CURSO;

	private $co_valor_curso;
	private $dt_cadastro;
	private $nu_valor;
	private $co_curso;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_VALOR_CURSO,
			DT_CADASTRO,
			NU_VALOR,
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
	* @return int $co_valor_curso
    */
	public function getCoValorCurso()
    {
        return $this->co_valor_curso;
    }

	/**
	* @param $co_valor_curso
    * @return mixed
    */
	public function setCoValorCurso($co_valor_curso)
    {
        return $this->co_valor_curso = $co_valor_curso;
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
	* @return mixed $nu_valor
    */
	public function getNuValor()
    {
        return $this->nu_valor;
    }

	/**
	* @param $nu_valor
    * @return mixed
    */
	public function setNuValor($nu_valor)
    {
        return $this->nu_valor = $nu_valor;
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