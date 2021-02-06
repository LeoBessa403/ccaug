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
	private $nu_total;
	private $nu_valor_pago;
	private $nu_valor_desconto;
	private $nu_parcelas;
	private $st_pagamento;
	private $ds_observacao;
	private $co_inscricao;
	private $co_parcela;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_PAGAMENTO,
			NU_TOTAL,
			NU_VALOR_PAGO,
			NU_VALOR_DESCONTO,
			NU_PARCELAS,
			ST_PAGAMENTO,
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
	* @return mixed $nu_total
    */
	public function getNuTotal()
    {
        return $this->nu_total;
    }

	/**
	* @param $nu_total
    * @return mixed
    */
	public function setNuTotal($nu_total)
    {
        return $this->nu_total = $nu_total;
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
	* @return mixed $nu_parcelas
    */
	public function getNuParcelas()
    {
        return $this->nu_parcelas;
    }

	/**
	* @param $nu_parcelas
    * @return mixed
    */
	public function setNuParcelas($nu_parcelas)
    {
        return $this->nu_parcelas = $nu_parcelas;
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
	* @return ParcelaEntidade $co_parcela
     */
	public function getCoParcela()
    {
        return $this->co_parcela;
    }

	/**
     * @param $co_parcela
     * @return mixed
     */
	public function setCoParcela($co_parcela)
    {
        return $this->co_parcela = $co_parcela;
    }

}