<?php

/**
 * AlunoService.class [ SEVICE ]
 * @copyright (c) 2021, Leo Bessa
 */
class  AlunoService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(AlunoEntidade::ENTIDADE);
        $this->ObjetoModel = New AlunoModel();
    }


}