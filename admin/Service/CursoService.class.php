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
        $this->ObjetoModel = new CursoModel();
    }


    public function salvaCurso($dados, $foto)
    {
        /** @var ImagemService $imagemService */
        $imagemService = $this->getService(IMAGEM_SERVICE);
        /** @var ValorCursoService $ValorCursoService */
        $ValorCursoService = $this->getService(VALOR_CURSO_SERVICE);
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];
        $session = new Session();
        $cursoValidador = new CursoValidador();
        /** @var CursoValidador $validador */
        $validador = $cursoValidador->validarCadastro($dados);
        if ($validador[SUCESSO]) {
            $curso = $this->getDados($dados, CursoEntidade::ENTIDADE);
            $valor = $this->getDados($dados, ValorCursoEntidade::ENTIDADE);

            $imagem[DS_CAMINHO] = "";
            if ($foto[DS_CAMINHO]["tmp_name"]):
                $curso[CO_IMAGEM] = $imagemService->salvaImagem(
                    $foto, $valor[DS_TITULO], TipoImagemEnum::CAPA_CURSO, "Curso/"
                );
            endif;

            $PDO->beginTransaction();
            if (!empty($_POST[CO_CURSO])):
                unset($curso[DT_CADASTRO]);
                $valor[CO_CURSO] = $dados[CO_CURSO];
                $this->Salva($curso, $dados[CO_CURSO]);
                $session->setSession(MENSAGEM, ATUALIZADO);
            else:
                $valor[CO_CURSO] = $this->Salva($curso);
                $session->setSession(MENSAGEM, CADASTRADO);
            endif;
            $valor[DT_CADASTRO] = Valida::DataHoraAtualBanco();
            if(empty($dados['st_gratuito'])) {
                $valor[NU_VALOR] = Valida::FormataMoedaBanco($dados[NU_VALOR]);
            }else{
                $valor[NU_VALOR] = '0.00';
            }
            $valor[ST_CERTIFICACAO] = (!empty($dados[ST_CERTIFICACAO])) ? SimNaoEnum::SIM : SimNaoEnum::NAO;
            $valor[ST_STATUS] = (!empty($dados[ST_STATUS])) ? SimNaoEnum::SIM : SimNaoEnum::NAO;
            $valor[CO_USUARIO] = UsuarioService::getCoUsuarioLogado();

            $retorno[SUCESSO] = $ValorCursoService->Salva($valor);

            if ($retorno[SUCESSO]) {
                $PDO->commit();
            } else {
                Notificacoes::geraMensagem(
                    'Não foi possível realizar a ação',
                    TiposMensagemEnum::ERRO
                );
                $PDO->rollBack();
            }
        } else {
            Notificacoes::geraMensagem(
                $validador[MSG],
                TiposMensagemEnum::ALERTA
            );
            $retorno = $validador;
        }

        return $retorno;
    }


}