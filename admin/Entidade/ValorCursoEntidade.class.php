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
    private $ds_titulo;
    private $nu_carga_horaria;
    private $nu_duracao;
    private $st_certificacao;
    private $st_status;
	private $co_curso;
	private $co_usuario;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_VALOR_CURSO,
			DT_CADASTRO,
			NU_VALOR,
            DS_TITULO,
            NU_CARGA_HORARIA,
            NU_DURACAO,
            ST_CERTIFICACAO,
            ST_STATUS,
			CO_CURSO,
			CO_USUARIO
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
     * @return mixed
     */
    public function getDsTitulo()
    {
        return $this->ds_titulo;
    }

    /**
     * @param mixed $ds_titulo
     */
    public function setDsTitulo($ds_titulo)
    {
        $this->ds_titulo = $ds_titulo;
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

	/**
	* @return UsuarioEntidade $co_usuario
    */
	public function getCoUsuario()
    {
        return $this->co_usuario;
    }

	/**
	* @param $co_usuario
    * @return mixed
    */
	public function setCoUsuario($co_usuario)
    {
        return $this->co_usuario = $co_usuario;
    }

}