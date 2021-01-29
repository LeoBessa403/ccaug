<?php

/**
 * AnotacaoAluno.Entidade [ ENTIDADE ]
 * @copyright (c) 2020, Leo Bessa
 */

class AnotacaoAlunoEntidade extends AbstractEntidade
{
    const TABELA = SCHEMA . '.TB_ANOTACAO_ALUNO';
    const ENTIDADE = 'AnotacaoAlunoEntidade';
    const CHAVE = CO_ANOTACAO_ALUNO;

    private $co_anotacao_aluno;
    private $co_pagina_livro;
    private $co_aluno;
    private $ds_anotacao;
    private $dt_cadastro;


    /**
     * @return array
     */
    public static function getCampos()
    {
        return [
            CO_ANOTACAO_ALUNO,
            CO_PAGINA_LIVRO,
            CO_ALUNO,
            DS_ANOTACAO,
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
     * @return int $co_anotacao_aluno
     */
    public function getCoAnotacaoAluno()
    {
        return $this->co_anotacao_aluno;
    }

    /**
     * @param $co_anotacao_aluno
     * @return mixed
     */
    public function setCoAnotacaoAluno($co_anotacao_aluno)
    {
        return $this->co_anotacao_aluno = $co_anotacao_aluno;
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

    /**
     * @return AlunoEntidade $co_aluno
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
     * @return mixed $ds_anotacao
     */
    public function getDsAnotacao()
    {
        return $this->ds_anotacao;
    }

    /**
     * @param $ds_anotacao
     * @return mixed
     */
    public function setDsAnotacao($ds_anotacao)
    {
        return $this->ds_anotacao = $ds_anotacao;
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

}