<?php

/**
 * TurmaService.class [ SEVICE ]
 * @copyright (c) 2021, Leo Bessa
 */
class  TurmaService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(TurmaEntidade::ENTIDADE);
        $this->ObjetoModel = New TurmaModel();
    }


}