<?php

class IndexWeb extends AbstractController
{
    public $result;
    public $form;

    public function Index()
    {
        /** @var CursoService $CursoService */
        $CursoService = $this->getService(CURSO_SERVICE);
        $this->result = $CursoService->PesquisaTodos();
    }

    public function DetalhesCurso()
    {
        /** @var CursoService $CursoService */
        $CursoService = $this->getService(CURSO_SERVICE);

        $coCurso = UrlAmigavel::PegaParametro(CO_CURSO);
        if ($coCurso) {
            /** @var CursoEntidade $this->result */
            $this->result = $CursoService->PesquisaUmRegistro($coCurso);
        }else{
            Notificacoes::geraMensagem(
                'Curso Não encontrado',
                TiposMensagemEnum::ALERTA
            );
            Redireciona(UrlAmigavel::$modulo . '/' . CONTROLLER_INICIAL_SITE . '/' . ACTION_INICIAL_SITE);
        }
    }

}