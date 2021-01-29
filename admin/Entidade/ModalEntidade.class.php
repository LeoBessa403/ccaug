<?php

/**
 * Modal.Entidade [ ENTIDADE ]
 * @copyright (c) 2020, Leo Bessa
 */

class ModalEntidade extends AbstractEntidade
{
    const TABELA = SCHEMA . '.TB_MODAL';
    const ENTIDADE = 'ModalEntidade';
    const CHAVE = CO_MODAL;

    private $co_modal;
    private $st_status;
    private $ds_titulo;
    private $ds_identificador;
    private $ds_code;
    private $co_pagina_livro;


    /**
     * @return array
     */
    public static function getCampos()
    {
        return [
            CO_MODAL,
            ST_STATUS,
            DS_TITULO,
            DS_CODE,
            DS_IDENTIFICADOR,
            CO_PAGINA_LIVRO,
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
     * @return mixed
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

    /**
     * @return mixed
     */
    public function getStStatus()
    {
        return $this->st_status;
    }

    /**
     * @param mixed $st_status
     */
    public function setStStatus($st_status)
    {
        $this->st_status = $st_status;
    }

    /**
     * @return mixed
     */
    public function getDsCode()
    {
        return $this->ds_code;
    }

    /**
     * @param mixed $ds_code
     */
    public function setDsCode($ds_code)
    {
        $this->ds_code = $ds_code;
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
     * @return mixed
     */
    public function getDsIdentificador()
    {
        return $this->ds_identificador;
    }

    /**
     * @param mixed $ds_identificador
     */
    public function setDsIdentificador($ds_identificador)
    {
        $this->ds_identificador = $ds_identificador;
    }

    /**
     * @return PaginaLivroEntidade $co_pagina_livro
     */
    public function getCoPaginaLivro()
    {
        return $this->co_pagina_livro;
    }

    /**
     * @param mixed $co_pagina_livro
     */
    public function setCoPaginaLivro($co_pagina_livro)
    {
        $this->co_pagina_livro = $co_pagina_livro;
    }

}