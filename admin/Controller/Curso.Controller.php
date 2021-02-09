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
            $retorno = $CursoService->salvaCurso($_POST, $_FILES);

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
            $res['st_gratuito'] = ($res[NU_VALOR] === '0,00')
                ? 'checked' : '';
            $res[ST_CERTIFICACAO] = ($valor->getStCertificacao() == 'S')
                ? 'checked' : '';
            if (!empty($curso->getCoImagem())):
                if ($curso->getCoImagem()->getDsCaminho()):
                    $res[DS_CAMINHO] = $curso->getCoImagem()->getDsCaminho();
                endif;
            endif;
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

    public function ListarTurma()
    {
        /** @var TurmaService $TurmaService */
        $TurmaService = $this->getService(TURMA_SERVICE);

        $this->curso = static::verificaCurso();

        /** @var Session $session */
        $session = new Session();
        if ($session->CheckSession(PESQUISA_AVANCADA)) {
            $session->FinalizaSession(PESQUISA_AVANCADA);
        }
        $Condicoes = [
            CO_CURSO => $this->curso
        ];
        if (!empty($_POST)) {
            $Condicoes[NU_ANO] = trim($_POST[NU_ANO]);
            $Condicoes[DS_TURMA] = trim($_POST[DS_TURMA]);
            $Condicoes[ST_STATUS] = (!empty($_POST[ST_STATUS])) ? SimNaoEnum::SIM : SimNaoEnum::NAO;
            $Condicoes[CO_CURSO] = $_POST[CO_CURSO][0];

        }
        $this->result = $TurmaService->PesquisaTodos($Condicoes);
    }


    public function CadastroTurma()
    {
        /** @var TurmaService $TurmaService */
        $TurmaService = $this->getService(TURMA_SERVICE);

        $id = "CadastrarTurma";

        if (!empty($_POST[$id])):
            $retorno = $TurmaService->salvaTurma($_POST);

            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller
                    . '/ListarTurma/' . Valida::GeraParametro(CO_CURSO . "/" . $_POST[CO_CURSO]));
            }
        endif;

        $coTurma = UrlAmigavel::PegaParametro(CO_TURMA);
        $res = array();
        $res[CO_CURSO] = static::verificaCurso();
        $res[CO_TURMA] = $coTurma;
        $res[ST_STATUS] = 'checked';

        if ($coTurma) {
            /** @var TurmaEntidade $turma */
            $turma = $TurmaService->PesquisaUmRegistro($coTurma);
            $res[NU_ANO] = $turma->getNuAno();
            $res[DS_TURMA] = $turma->getDsTurma();
            $res[ST_STATUS] = ($turma->getStStatus() == 'S')
                ? 'checked' : '';
            $res[DT_INICIO] = Valida::DataShow($turma->getDtInicio());
            $res[DT_FIM] = Valida::DataShow($turma->getDtFim());
            $res[NU_HORA_ABERTURA] = $turma->getNuHoraAbertura();
            $res[NU_HORA_FECHAMENTO] = $turma->getNuHoraFechamento();
        }

        $this->form = CursoForm::CadastrarTurma($res);
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

    public function ListarAluno()
    {
        /** @var InscricaoService $InscricaoService */
        $InscricaoService = $this->getService(INSCRICAO_SERVICE);

        $coTurma = UrlAmigavel::PegaParametro(CO_TURMA);
        if ($coTurma) {
                $this->result = $InscricaoService->PesquisaTodos([
                    CO_TURMA => $coTurma
                ]);
        } else {
            $this->result = $InscricaoService->PesquisaTodos();
        }
    }

    public function InscricaoCurso()
    {
        /** @var InscricaoService $InscricaoService */
        $InscricaoService = $this->getService(INSCRICAO_SERVICE);

        if (!empty($_POST)):
            $retorno = $InscricaoService->salvaInscricao($_POST);
            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/InscricaoCurso/');
                exit;
            }
        endif;

        $res[CO_CURSO] = 1;//static::verificaCurso();
        $this->form = CursoForm::Pagamento($res);
    }


    public function CancelarPagamentoCurso()
    {
        /** @var PagamentoService $PagamentoService */
        $PagamentoService = $this->getService(PAGAMENTO_SERVICE);
        $code = UrlAmigavel::PegaParametro(DS_CODE_TRANSACAO);
        $PagamentoService->CancelarPagamentoCurso($code);
        Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/ListarAluno/');
    }

    public function EstornarPagamentoCurso()
    {
        /** @var PagamentoService $PagamentoService */
        $PagamentoService = $this->getService(PAGAMENTO_SERVICE);
        $code = UrlAmigavel::PegaParametro(DS_CODE_TRANSACAO);
        $PagamentoService->EstornarPagamentoCurso($code);
        Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/ListarAluno/');
    }

    public function NotificacaoPagSeguro()
    {
        /** @var PagamentoService $PagamentoService */
        $PagamentoService = $this->getService(PAGAMENTO_SERVICE);

        $id = "CadastrarNotificaacao";

        if (!empty($_POST[$id])):
            $retorno = $PagamentoService->notificacaoPagSeguro(true);
            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/ListarAluno/');
            }
        endif;

        $this->form = CursoForm::CadastrarNotificaacao();

    }

    public static function DetalharPagamentoAjax($coPlanoAssAss)
    {
        /** @var PagamentoService $PagamentoService */
        $PagamentoService = static::getServiceStatic(PAGAMENTO_SERVICE);
        return $PagamentoService->DetalharPagamentoAjax($coPlanoAssAss);
    }


}