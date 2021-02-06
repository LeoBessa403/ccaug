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

    public function salvaTurma($dados)
    {
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];
        $session = new Session();

        $turma[DS_TURMA] = trim($dados[DS_TURMA]);
        $turma[NU_ANO] = trim($dados[NU_ANO]);
        $turma[CO_CURSO] = $dados[CO_CURSO];
        $turma[ST_STATUS] = (!empty($dados[ST_STATUS])) ? SimNaoEnum::SIM : SimNaoEnum::NAO;
        $turma[DT_INICIO] = Valida::DataDBDate($dados[DT_INICIO]);
        $turma[DT_FIM] = Valida::DataDBDate($dados[DT_FIM]);
        $turma[NU_HORA_ABERTURA] = $dados[NU_HORA_ABERTURA];
        $turma[NU_HORA_FECHAMENTO] = $dados[NU_HORA_FECHAMENTO];
        $turma[DT_CADASTRO] = Valida::DataHoraAtualBanco();

        $PDO->beginTransaction();
        if (!empty($_POST[CO_TURMA])):
            $retorno[SUCESSO] = $this->Salva($turma, $dados[CO_TURMA]);
            $session->setSession(MENSAGEM, ATUALIZADO);
        else:
            $retorno[SUCESSO] = $this->Salva($turma);
            $session->setSession(MENSAGEM, CADASTRADO);
        endif;

        if ($retorno[SUCESSO]) {
            $PDO->commit();
        } else {
            Notificacoes::geraMensagem(
                'Não foi possível realizar a ação',
                TiposMensagemEnum::ERRO
            );
            $PDO->rollBack();
        }
        return $retorno;
    }
}