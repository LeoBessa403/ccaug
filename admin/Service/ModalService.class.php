<?php

/**
 * ModalService.class [ SEVICE ]
 * @copyright (c) 2020, Leo Bessa
 */
class ModalService extends AbstractService
{
    private $ObjetoModel;

    public function __construct()
    {
        parent::__construct(ModalEntidade::ENTIDADE);
        $this->ObjetoModel = new ModalModel();
    }


    public function salvaModalPagina($dados)
    {
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $session = new Session();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];
        $modalPagina = $this->getDados($dados, ModalEntidade::ENTIDADE);
        $modalPagina[ST_STATUS] = (!empty($dados[ST_STATUS])) ? SimNaoEnum::SIM : SimNaoEnum::NAO;


        $PDO->beginTransaction();

        if (!empty($dados[CO_MODAL])):
            $retorno[SUCESSO] = $this->Salva($modalPagina, $dados[CO_MODAL]);
            $session->setSession(MENSAGEM, ATUALIZADO);
        else:
            $retorno[SUCESSO] = $this->Salva($modalPagina);
            $session->setSession(MENSAGEM, CADASTRADO);
        endif;
        if ($retorno[SUCESSO]) {
            $retorno[SUCESSO] = true;
            $PDO->commit();
        } else {
            Notificacoes::geraMensagem(
                'Não foi possível realizar a ação',
                TiposMensagemEnum::ERRO
            );
            $retorno[SUCESSO] = false;
            $PDO->rollBack();
        }


        return $retorno;
    }

}