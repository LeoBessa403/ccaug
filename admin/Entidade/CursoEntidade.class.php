<?php

/**
 * Curso.Entidade [ ENTIDADE ]
 * @copyright (c) 2021, Leo Bessa
 */

class CursoEntidade extends AbstractEntidade
{
	const TABELA = 'TB_CURSO';
	const ENTIDADE = 'CursoEntidade';
	const CHAVE = CO_CURSO;

	private $co_curso;
	private $ds_descricao;
    private $dt_cadastro;
	private $co_turma;
	private $co_valor_curso;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_CURSO,
			DS_DESCRICAO,
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
	* @return int $co_curso
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

	/**
	* @return mixed $ds_descricao
    */
	public function getDsDescricao()
    {
        return $this->ds_descricao;
    }

	/**
	* @param $ds_descricao
    * @return mixed
    */
	public function setDsDescricao($ds_descricao)
    {
        return $this->ds_descricao = $ds_descricao;
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
	* @return ValorCursoEntidade $co_valor_curso
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
     * @return ValorCursoEntidade $co_valor_curso
     */
    public function getCoUltimoValorCurso()
    {
        return $this->ultimo($this->getCoValorCurso());
    }

}