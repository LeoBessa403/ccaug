<?php

/**
 * Pagamento.Entidade [ ENTIDADE ]
 * @copyright (c) 2021, Leo Bessa
 */

class PagamentoEntidade extends AbstractEntidade
{
	const TABELA = 'TB_PAGAMENTO';
	const ENTIDADE = 'PagamentoEntidade';
	const CHAVE = CO_PAGAMENTO;

	private $co_pagamento;
	private $nu_valor_total;
	private $nu_valor_pago;
	private $nu_valor_desconto;
	private $dt_pago;
	private $ds_code_transacao;
	private $dt_modificado;
	private $tp_pagamento;
	private $st_pagamento;
	private $ds_link_boleto;
	private $ds_observacao;
	private $co_inscricao;
	private $co_historico_pagamento;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_PAGAMENTO,
			NU_VALOR_TOTAL,
			NU_VALOR_PAGO,
			NU_VALOR_DESCONTO,
			DT_PAGO,
			DS_CODE_TRANSACAO,
			DT_MODIFICADO,
			TP_PAGAMENTO,
			ST_PAGAMENTO,
			DS_LINK_BOLETO,
			DS_OBSERVACAO,
			CO_INSCRICAO,
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
	* @return int $co_pagamento
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

	/**
	* @return mixed $nu_valor_total
    */
	public function getNuValorTotal()
    {
        return $this->nu_valor_total;
    }

	/**
	* @param $nu_valor_total
    * @return mixed
    */
	public function setNuValorTotal($nu_valor_total)
    {
        return $this->nu_valor_total = $nu_valor_total;
    }

	/**
	* @return mixed $nu_valor_pago
    */
	public function getNuValorPago()
    {
        return $this->nu_valor_pago;
    }

	/**
	* @param $nu_valor_pago
    * @return mixed
    */
	public function setNuValorPago($nu_valor_pago)
    {
        return $this->nu_valor_pago = $nu_valor_pago;
    }

	/**
	* @return mixed $nu_valor_desconto
    */
	public function getNuValorDesconto()
    {
        return $this->nu_valor_desconto;
    }

	/**
	* @param $nu_valor_desconto
    * @return mixed
    */
	public function setNuValorDesconto($nu_valor_desconto)
    {
        return $this->nu_valor_desconto = $nu_valor_desconto;
    }

	/**
	* @return mixed $dt_pago
    */
	public function getDtPago()
    {
        return $this->dt_pago;
    }

	/**
	* @param $dt_pago
    * @return mixed
    */
	public function setDtPago($dt_pago)
    {
        return $this->dt_pago = $dt_pago;
    }

	/**
	* @return mixed $ds_code_transacao
    */
	public function getDsCodeTransacao()
    {
        return $this->ds_code_transacao;
    }

	/**
	* @param $ds_code_transacao
    * @return mixed
    */
	public function setDsCodeTransacao($ds_code_transacao)
    {
        return $this->ds_code_transacao = $ds_code_transacao;
    }

	/**
	* @return mixed $dt_modificado
    */
	public function getDtModificado()
    {
        return $this->dt_modificado;
    }

	/**
	* @param $dt_modificado
    * @return mixed
    */
	public function setDtModificado($dt_modificado)
    {
        return $this->dt_modificado = $dt_modificado;
    }

	/**
	* @return mixed $tp_pagamento
    */
	public function getTpPagamento()
    {
        return $this->tp_pagamento;
    }

	/**
	* @param $tp_pagamento
    * @return mixed
    */
	public function setTpPagamento($tp_pagamento)
    {
        return $this->tp_pagamento = $tp_pagamento;
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
	* @return mixed $ds_link_boleto
    */
	public function getDsLinkBoleto()
    {
        return $this->ds_link_boleto;
    }

	/**
	* @param $ds_link_boleto
    * @return mixed
    */
	public function setDsLinkBoleto($ds_link_boleto)
    {
        return $this->ds_link_boleto = $ds_link_boleto;
    }

	/**
	* @return mixed $ds_observacao
    */
	public function getDsObservacao()
    {
        return $this->ds_observacao;
    }

	/**
	* @param $ds_observacao
    * @return mixed
    */
	public function setDsObservacao($ds_observacao)
    {
        return $this->ds_observacao = $ds_observacao;
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
        return $this->co_inscricao = $co_inscricao;
    }

	/**
	* @return HistoricoPagamentoEntidade $co_historico_pagamento
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

}