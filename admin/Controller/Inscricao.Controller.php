<?php

class Inscricao extends AbstractController
{
    public $result;
    public $curso;
    public $form;
    public $mensagem;


    public static function getReferenciaPagamentoInscricao()
    {
        /** @var InscricaoService $InscricaoService */
        $InscricaoService = new InscricaoService();
        return $InscricaoService->getReferenciaPagamentoInscricao();
    }

    public static function getValorCurso($coCurso)
    {
        /** @var InscricaoService $InscricaoService */
        $InscricaoService = new InscricaoService();
        return $InscricaoService->getValorCurso($coCurso);
    }

}