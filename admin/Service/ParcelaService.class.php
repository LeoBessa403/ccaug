<?php

/**
 * ParcelaService.class [ SEVICE ]
 * @copyright (c) 2021, Leo Bessa
 */
class  ParcelaService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(ParcelaEntidade::ENTIDADE);
        $this->ObjetoModel = New ParcelaModel();
    }


}