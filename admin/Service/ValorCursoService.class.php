<?php

/**
 * ValorCursoService.class [ SEVICE ]
 * @copyright (c) 2021, Leo Bessa
 */
class  ValorCursoService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(ValorCursoEntidade::ENTIDADE);
        $this->ObjetoModel = New ValorCursoModel();
    }


}