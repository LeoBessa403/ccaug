<?php

/**
 * HistoricoPagamentoService.class [ SEVICE ]
 * @copyright (c) 2021, Leo Bessa
 */
class  HistoricoPagamentoService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(HistoricoPagamentoEntidade::ENTIDADE);
        $this->ObjetoModel = New HistoricoPagamentoModel();
    }


}