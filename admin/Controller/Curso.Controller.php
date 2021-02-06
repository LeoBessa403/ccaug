<?php

class Curso extends AbstractController
{
    public $result;
    public $curso;
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

        if ($coCurso) {
            /** @var CursoEntidade $curso */
            $curso = $CursoService->PesquisaUmRegistro($coCurso);
            /** @var ValorCursoEntidade $valor */
            $valor = $curso->getCoUltimoValorCurso();
            $res[NU_CARGA_HORARIA] = $valor->getNuCargaHoraria();
            $res[NU_DURACAO] = $valor->getNuDuracao();
            $res[DS_DESCRICAO] = $curso->getDsDescricao();
            $res[NU_VALOR] = Valida::FormataMoeda($valor->getNuValor());
            $res[DS_TITULO] = $valor->getDsTitulo();
            $res[ST_STATUS] = ($valor->getStStatus() == 'S')
                ? 'checked' : '';
            $res[ST_CERTIFICACAO] = ($valor->getStCertificacao() == 'S')
                ? 'checked' : '';
        }

        $this->form = CursoForm::CadastrarCurso($res);
    }

    public function HistoricoCurso()
    {
        /** @var CursoService $CursoService */
        $CursoService = $this->getService(CURSO_SERVICE);

        $coCurso = UrlAmigavel::PegaParametro(CO_CURSO);
        if ($coCurso) {
            $this->curso = $CursoService->PesquisaUmRegistro($coCurso);
        } else {
            Notificacoes::geraMensagem(
                'Não Existe Histórico dessa Promoção de Serviço',
                TiposMensagemEnum::ALERTA
            );
            Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/PromocaoServico/');
        }

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