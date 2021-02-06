<?php

/**
 * InscricaoService.class [ SEVICE ]
 * @copyright (c) 2021, Leo Bessa
 */
class  InscricaoService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(InscricaoEntidade::ENTIDADE);
        $this->ObjetoModel = New InscricaoModel();
    }


}