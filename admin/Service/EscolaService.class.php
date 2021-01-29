<?php

/**
 * EscolaService.class [ SEVICE ]
 * @copyright (c) 2020, Leo Bessa
 */
class  EscolaService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(EscolaEntidade::ENTIDADE);
        $this->ObjetoModel = new EscolaModel();
    }


    public function salvaEscola($dados)
    {
        /** @var ContatoService $contatoService */
        $contatoService = $this->getService(CONTATO_SERVICE);
        /** @var EnderecoService $enderecoService */
        $enderecoService = $this->getService(ENDERECO_SERVICE);
        /** @var EscolaService $escolaService */
        $escolaService = $this->getService(ESCOLA_SERVICE);
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $session = new Session();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];

        $escolaValidador = new EscolaValidador();
        /** @var EscolaValidador $validador */
        $validador = $escolaValidador->validarCadastro($dados);
        if ($validador[SUCESSO]) {

            $endereco = $this->getDados($dados, EnderecoEntidade::ENTIDADE);
            $contato = $this->getDados($dados, ContatoEntidade::ENTIDADE);
            $escola = $this->getDados($dados, EscolaEntidade::ENTIDADE);

            $PDO->beginTransaction();
            if (!empty($dados[CO_ESCOLA])):
                $contatoService->Salva($contato, $dados[CO_CONTATO]);
                $enderecoService->Salva($endereco, $dados[CO_ENDERECO]);
                $retorno[SUCESSO] = $this->Salva($escola, $dados[CO_ESCOLA]);
                $session->setSession(MENSAGEM, ATUALIZADO);//
            else:
                $escola[CO_CONTATO] = $contatoService->Salva($contato);
                $escola[DT_CADASTRO] = Valida::DataHoraAtualBanco();
                $escola[CO_ENDERECO] = $enderecoService->Salva($endereco);

                $retorno[SUCESSO] = $escolaService->Salva($escola);
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
        } else {
            Notificacoes::geraMensagem(
                $validador[MSG],
                TiposMensagemEnum::ALERTA
            );
            $retorno = $validador;
        }

        return $retorno;
    }

    public function getEscolasCombo()
    {
        $comboEscolas = [
            '' => Mensagens::MSG_SEM_ITEM_SELECIONADO
        ];
        $escolas = $this->PesquisaTodos();
        /** @var EscolaEntidade $escola */
        foreach ($escolas as $escola) {
            $comboEscolas[$escola->getCoEscola()]
                = Valida::Resumi(strtoupper($escola->getNoFantasia()), 30);
        }
        return $comboEscolas;
    }

}