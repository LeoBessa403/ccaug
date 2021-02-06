<?php

class Curso extends AbstractController
{
    public $result;
    public $escola;
    public $gestor;
    public $turma;
    public $form;
    public $mensagem;


    public function ListarCurso()
    {
        /** @var CursoService $CursoService */
            $CursoService = $this->getService(CURSO_SERVICE);
        $this->result = $CursoService->PesquisaTodos();
    }

    public function CadastroCurso()
    {
        /** @var CursoService $CursoService */
        $CursoService = $this->getService(CURSO_SERVICE);

        $id = "CadastrarCurso";

        if (!empty($_POST[$id])):
            $retorno = $CursoService->salvaCurso($_POST);

            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/ListarCurso/');
            }
        endif;

        $coCurso = UrlAmigavel::PegaParametro(CO_CURSO);
        $res = array();
        $res[CO_CURSO] = $coCurso;
        $res[ST_STATUS] = 'checked';
        $res[ST_CERTIFICACAO] = 'checked';

//        if ($coCurso) {
//            /** @var CursoEntidade $turma */
//            $turma = $CursoService->PesquisaUmRegistro($coCurso);
//            $res[NU_ANO] = $turma->getNuAno();
//            $res[DS_CURSO] = $turma->getDsCurso();
//            $res[ST_STATUS] = ($turma->getStStatus() == 'S')
//                ? 'checked' : '';
//        }

        $this->form = CursoForm::CadastrarCurso($res);
    }

    public static function verificaCurso()
    {
        $coCurso = UrlAmigavel::PegaParametro(CO_CURSO);
        if (!$coCurso) {
            $coCurso = (!empty($_POST[CO_CURSO])) ? $_POST[CO_CURSO][0] : null;
        }
        if (!$coCurso) {
            Notificacoes::geraMensagem(
                'Não foi possível localizar a curso!',
                TiposMensagemEnum::ALERTA
            );
            Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/ListarCurso/');
        }
        return $coCurso;
    }


}