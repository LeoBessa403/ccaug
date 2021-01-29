<?php

/**
 * TurmaService.class [ SEVICE ]
 * @copyright (c) 2020, Leo Bessa
 */
class  TurmaService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(TurmaEntidade::ENTIDADE);
        $this->ObjetoModel = new TurmaModel();
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
        $turma[CO_ESCOLA] = $dados[CO_ESCOLA];
        $turma[ST_STATUS] = (!empty($dados[ST_STATUS])) ? SimNaoEnum::SIM : SimNaoEnum::NAO;

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

    public function getTurmasCombo($coEscola = null)
    {
        $comboTurmas = [
            '' => Mensagens::MSG_SEM_ITEM_SELECIONADO
        ];
        $turmas = $this->PesquisaTodos([
            CO_ESCOLA => $coEscola
        ]);
        /** @var TurmaEntidade $turma */
        foreach ($turmas as $turma) {
            $comboTurmas[$turma->getCoTurma()]
                = strtoupper($turma->getNuAno() . $turma->getDsTurma());
        }
        return $comboTurmas;
    }

}