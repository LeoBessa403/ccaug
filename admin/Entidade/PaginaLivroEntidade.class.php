<?php

/**
 * PaginaLivro.Entidade [ ENTIDADE ]
 * @copyright (c) 2020, Leo Bessa
 */

class PaginaLivroEntidade extends AbstractEntidade
{
	const TABELA = SCHEMA . '.TB_PAGINA_LIVRO';
	const ENTIDADE = 'PaginaLivroEntidade';
	const CHAVE = CO_PAGINA_LIVRO;

	private $co_pagina_livro;
	private $ds_code;
	private $dt_cadastro;
	private $st_status;
	private $co_capitulo;
	private $co_anotacao_aluno;
	private $co_anotacao_professor;
	private $co_modal;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_PAGINA_LIVRO,
			DS_CODE,
			DT_CADASTRO,
			ST_STATUS,
			CO_CAPITULO,
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
	* @return int $co_pagina_livro
    */
	public function getCoPaginaLivro()
    {
        return $this->co_pagina_livro;
    }

	/**
	* @param $co_pagina_livro
    * @return mixed
    */
	public function setCoPaginaLivro($co_pagina_livro)
    {
        return $this->co_pagina_livro = $co_pagina_livro;
    }

	/**
	* @return mixed $ds_code
    */
	public function getDsCode()
    {
        return $this->ds_code;
    }

	/**
	* @param $ds_code
    * @return mixed
    */
	public function setDsCode($ds_code)
    {
        return $this->ds_code = $ds_code;
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
	* @return CapituloEntidade $co_capitulo
    */
	public function getCoCapitulo()
    {
        return $this->co_capitulo;
    }

	/**
	* @param $co_capitulo
    * @return mixed
    */
	public function setCoCapitulo($co_capitulo)
    {
        return $this->co_capitulo = $co_capitulo;
    }

    /**
     * @return AnotacaoAlunoEntidade $co_anotacao_aluno
     */
    public function getCoAnotacaoAluno()
    {
        return $this->co_anotacao_aluno;
    }

    /**
     * @param mixed $co_anotacao_aluno
     */
    public function setCoAnotacaoAluno($co_anotacao_aluno)
    {
        $this->co_anotacao_aluno = $co_anotacao_aluno;
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

    /**
     * @return ModalEntidade $co_modal
     */
    public function getCoModal()
    {
        return $this->co_modal;
    }

    /**
     * @param mixed $co_modal
     */
    public function setCoModal($co_modal)
    {
        $this->co_modal = $co_modal;
    }


}