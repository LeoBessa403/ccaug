<?php

/**
 * PaginaLivroService.class [ SEVICE ]
 * @copyright (c) 2020, Leo Bessa
 */
class  PaginaLivroService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(PaginaLivroEntidade::ENTIDADE);
        $this->ObjetoModel = new PaginaLivroModel();
    }


    public function salvaPaginaLivro($dados)
    {
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $session = new Session();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];
        $paginaLivro = $this->getDados($dados, PaginaLivroEntidade::ENTIDADE);
        $paginaLivro[ST_STATUS] = (!empty($dados[ST_STATUS])) ? SimNaoEnum::SIM : SimNaoEnum::NAO;

        $PDO->beginTransaction();

        if (!empty($dados[CO_PAGINA_LIVRO])):
            $retorno[SUCESSO] = $this->Salva($paginaLivro, $dados[CO_PAGINA_LIVRO]);
            $session->setSession(MENSAGEM, ATUALIZADO);
        else:
            $retorno[SUCESSO] = $this->Salva($paginaLivro);
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

    /**
     * @param $dados
     * @return int
     */
    public function PesquisaPaginasCapitulos($coCapitulo)
    {
        return $this->ObjetoModel->PesquisaPaginasCapitulos($coCapitulo);
    }
}