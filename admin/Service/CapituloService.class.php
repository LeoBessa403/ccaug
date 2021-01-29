<?php

/**
 * CapituloService.class [ SEVICE ]
 * @copyright (c) 2020, Leo Bessa
 */
class  CapituloService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(CapituloEntidade::ENTIDADE);
        $this->ObjetoModel = New CapituloModel();
    }

    public function salvaCapitulo($dados, $foto)
    {
        /** @var ImagemService $imagemService */
        $imagemService = $this->getService(IMAGEM_SERVICE);
        /** @var LivroService $livroService */
        $livroService = $this->getService(LIVRO_SERVICE);
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];
        $session = new Session();
        $capitulo = $this->getDados($dados, CapituloEntidade::ENTIDADE);
        $capitulo[ST_STATUS] = (!empty($dados[ST_STATUS])) ? SimNaoEnum::SIM : SimNaoEnum::NAO;

        /** @var LivroEntidade $livro */
        $livro = $livroService->PesquisaUmRegistro($capitulo[CO_LIVRO]);

        $imagem[DS_CAMINHO] = "";
        if ($foto[DS_CAMINHO]["tmp_name"]):
            $capitulo[CO_IMAGEM] = $imagemService->salvaImagem(
                $foto, $capitulo[DS_TITULO], TipoImagemEnum::CAPA_CAPITULO,
                "Livro/" . $livro->getCoMateria()->getDsMateria() . "/"

            );
        endif;

        $PDO->beginTransaction();
        if (!empty($_POST[CO_CAPITULO])):
            $retorno[SUCESSO] = $this->Salva($capitulo, $dados[CO_CAPITULO]);
            $session->setSession(MENSAGEM, ATUALIZADO);
        else:
            $retorno[SUCESSO] = $this->Salva($capitulo);
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