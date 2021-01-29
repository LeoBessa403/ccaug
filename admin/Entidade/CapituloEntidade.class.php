<?php

/**
 * Capitulo.Entidade [ ENTIDADE ]
 * @copyright (c) 2020, Leo Bessa
 */

class CapituloEntidade extends AbstractEntidade
{
    const TABELA = SCHEMA . '.TB_CAPITULO';
    const ENTIDADE = 'CapituloEntidade';
    const CHAVE = CO_CAPITULO;

    private $co_capitulo;
    private $ds_titulo;
    private $st_status;
    private $dt_cadastro;
    private $co_livro;
    private $co_imagem;
    private $co_pagina_livro;


    /**
     * @return array
     */
    public static function getCampos()
    {
        return [
            CO_CAPITULO,
            DS_TITULO,
            ST_STATUS,
            DT_CADASTRO,
            CO_LIVRO,
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
     * @return int $co_capitulo
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
     * @return LivroEntidade $co_livro
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
     * @return PaginaLivroEntidade $co_pagina_livro
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

}