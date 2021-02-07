<?php

/**
 * HistoricoPagamento.Entidade [ ENTIDADE ]
 * @copyright (c) 2021, Leo Bessa
 */

class HistoricoPagamentoEntidade extends AbstractEntidade
{
	const TABELA = 'TB_HISTORICO_PAGAMENTO';
	const ENTIDADE = 'HistoricoPagamentoEntidade';
	const CHAVE = CO_HISTORICO_PAGAMENTO;

	private $co_historico_pagamento;
	private $dt_cadastro;
	private $ds_acao;
	private $ds_usuario;
	private $st_pagamento;
	private $co_pagamento;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_HISTORICO_PAGAMENTO,
			DT_CADASTRO,
			DS_ACAO,
			DS_USUARIO,
			ST_PAGAMENTO,
			CO_PAGAMENTO,
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
	* @return int $co_historico_pagamento
    */
	public function getCoHistoricoPagamento()
    {
        return $this->co_historico_pagamento;
    }

	/**
	* @param $co_historico_pagamento
    * @return mixed
    */
	public function setCoHistoricoPagamento($co_historico_pagamento)
    {
        return $this->co_historico_pagamento = $co_historico_pagamento;
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
	* @return mixed $ds_acao
    */
	public function getDsAcao()
    {
        return $this->ds_acao;
    }

	/**
	* @param $ds_acao
    * @return mixed
    */
	public function setDsAcao($ds_acao)
    {
        return $this->ds_acao = $ds_acao;
    }

	/**
	* @return mixed $ds_usuario
    */
	public function getDsUsuario()
    {
        return $this->ds_usuario;
    }

	/**
	* @param $ds_usuario
    * @return mixed
    */
	public function setDsUsuario($ds_usuario)
    {
        return $this->ds_usuario = $ds_usuario;
    }

	/**
	* @return mixed $st_pagamento
    */
	public function getStPagamento()
    {
        return $this->st_pagamento;
    }

	/**
	* @param $st_pagamento
    * @return mixed
    */
	public function setStPagamento($st_pagamento)
    {
        return $this->st_pagamento = $st_pagamento;
    }

	/**
	* @return PagamentoEntidade $co_pagamento
    */
	public function getCoPagamento()
    {
        return $this->co_pagamento;
    }

	/**
	* @param $co_pagamento
    * @return mixed
    */
	public function setCoPagamento($co_pagamento)
    {
        return $this->co_pagamento = $co_pagamento;
    }

}