<?php

/**
 * Livro.Entidade [ ENTIDADE ]
 * @copyright (c) 2020, Leo Bessa
 */

class LivroEntidade extends AbstractEntidade
{
	const TABELA = SCHEMA . '.TB_LIVRO';
	const ENTIDADE = 'LivroEntidade';
	const CHAVE = CO_LIVRO;

	private $co_livro;
	private $ds_titulo;
	private $st_status;
	private $dt_cadastro;
	private $ds_cor1;
	private $ds_cor2;
	private $ds_cor3;
	private $co_materia;
	private $co_imagem;
	private $co_capitulo;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_LIVRO,
			DS_TITULO,
			ST_STATUS,
			DT_CADASTRO,
			DS_COR1,
			DS_COR2,
			DS_COR3,
			CO_MATERIA,
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
	* @return int $co_livro
    */
	public function getCoLivro()
    {
        return $this->co_livro;
    }

	/**
	* @param $co_livro
    * @return mixed
    */
	public function setCoLivro($co_livro)
    {
        return $this->co_livro = $co_livro;
    }

	/**
	* @return mixed $ds_titulo
    */
	public function getDsTitulo()
    {
        return $this->ds_titulo;
    }

	/**
	* @param $ds_titulo
    * @return mixed
    */
	public function setDsTitulo($ds_titulo)
    {
        return $this->ds_titulo = $ds_titulo;
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
     * @return mixed
     */
    public function getDsCor1()
    {
        return $this->ds_cor1;
    }

    /**
     * @param mixed $ds_cor1
     */
    public function setDsCor1($ds_cor1)
    {
        $this->ds_cor1 = $ds_cor1;
    }

    /**
     * @return mixed
     */
    public function getDsCor2()
    {
        return $this->ds_cor2;
    }

    /**
     * @param mixed $ds_cor2
     */
    public function setDsCor2($ds_cor2)
    {
        $this->ds_cor2 = $ds_cor2;
    }

    /**
     * @return mixed
     */
    public function getDsCor3()
    {
        return $this->ds_cor3;
    }

    /**
     * @param mixed $ds_cor3
     */
    public function setDsCor3($ds_cor3)
    {
        $this->ds_cor3 = $ds_cor3;
    }


	/**
	* @return MateriaEntidade $co_materia
    */
	public function getCoMateria()
    {
        return $this->co_materia;
    }

	/**
	* @param $co_materia
    * @return mixed
    */
	public function setCoMateria($co_materia)
    {
        return $this->co_materia = $co_materia;
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

}