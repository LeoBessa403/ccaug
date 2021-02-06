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
	private $nu_carga_horaria;
	private $nu_duracao;
	private $st_certificacao;
	private $st_status;
	private $co_imagem;
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
			NU_CARGA_HORARIA,
			NU_DURACAO,
			ST_CERTIFICACAO,
			ST_STATUS,
			CO_IMAGEM,
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
	* @return mixed $nu_carga_horaria
    */
	public function getNuCargaHoraria()
    {
        return $this->nu_carga_horaria;
    }

	/**
	* @param $nu_carga_horaria
    * @return mixed
    */
	public function setNuCargaHoraria($nu_carga_horaria)
    {
        return $this->nu_carga_horaria = $nu_carga_horaria;
    }

	/**
	* @return mixed $nu_duracao
    */
	public function getNuDuracao()
    {
        return $this->nu_duracao;
    }

	/**
	* @param $nu_duracao
    * @return mixed
    */
	public function setNuDuracao($nu_duracao)
    {
        return $this->nu_duracao = $nu_duracao;
    }

	/**
	* @return mixed $st_certificacao
    */
	public function getStCertificacao()
    {
        return $this->st_certificacao;
    }

	/**
	* @param $st_certificacao
    * @return mixed
    */
	public function setStCertificacao($st_certificacao)
    {
        return $this->st_certificacao = $st_certificacao;
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
	* @return ImagemEntidade $co_imagem
    */
	public function getCoImagem()
    {
        return $this->co_imagem;
    }

	/**
	* @param $co_imagem
    * @return mixed
    */
	public function setCoImagem($co_imagem)
    {
        return $this->co_imagem = $co_imagem;
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

}