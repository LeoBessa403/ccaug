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
    private $dt_inicio;
    private $dt_fim;
    private $nu_hora_abertura;
    private $nu_hora_fechamento;
	private $st_status;
	private $co_curso;
	private $co_inscricao;

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
            DT_INICIO,
            DT_FIM,
            NU_HORA_ABERTURA,
            NU_HORA_FECHAMENTO,
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
     * @return mixed $dt_inicio
     */
    public function getDtInicio()
    {
        return $this->dt_inicio;
    }

    /**
     * @param $dt_inicio
     * @return mixed
     */
    public function setDtInicio($dt_inicio)
    {
        return $this->dt_inicio = $dt_inicio;
    }

    /**
     * @return mixed $dt_fim
     */
    public function getDtFim()
    {
        return $this->dt_fim;
    }

    /**
     * @param $dt_fim
     * @return mixed
     */
    public function setDtFim($dt_fim)
    {
        return $this->dt_fim = $dt_fim;
    }

    /**
     * @return mixed $nu_hora_abertura
     */
    public function getNuHoraAbertura()
    {
        return $this->nu_hora_abertura;
    }

    /**
     * @param $nu_hora_abertura
     * @return mixed
     */
    public function setNuHoraAbertura($nu_hora_abertura)
    {
        return $this->nu_hora_abertura = $nu_hora_abertura;
    }

    /**
     * @return mixed $nu_hora_fechamento
     */
    public function getNuHoraFechamento()
    {
        return $this->nu_hora_fechamento;
    }

    /**
     * @param $nu_hora_fechamento
     * @return mixed
     */
    public function setNuHoraFechamento($nu_hora_fechamento)
    {
        return $this->nu_hora_fechamento = $nu_hora_fechamento;
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
     * @return InscricaoEntidade $co_inscricao
     */
    public function getCoInscricao()
    {
        return $this->co_inscricao;
    }

    /**
     * @param $co_inscricao
     * @return mixed
     */
    public function setCoInscricao($co_inscricao)
    {
        $this->co_inscricao = $co_inscricao;
    }

}