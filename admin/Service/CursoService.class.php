<?php

/**
 * CursoService.class [ SEVICE ]
 * @copyright (c) 2021, Leo Bessa
 */
class  CursoService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(CursoEntidade::ENTIDADE);
        $this->ObjetoModel = New CursoModel();
    }


}