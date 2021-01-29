<?php

/**
 * LivroService.class [ SEVICE ]
 * @copyright (c) 2020, Leo Bessa
 */
class  LivroService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(LivroEntidade::ENTIDADE);
        $this->ObjetoModel = new LivroModel();
    }

    public function salvaLivro($dados, $foto)
    {
        /** @var ImagemService $imagemService */
        $imagemService = $this->getService(IMAGEM_SERVICE);
        /** @var MateriaService $materiaService */
        $materiaService = $this->getService(MATERIA_SERVICE);
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $session = new Session();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];

        $dados["ds_cor1"] =  $dados['ds_cor1-input'];
        $dados["ds_cor2"] =  $dados['ds_cor2-input'];
        $dados["ds_cor3"] =  $dados['ds_cor3-input'];

        $livroValidador = new LivroValidador();
        /** @var LivroValidador $validador */
        $validador = $livroValidador->validarCadastro($dados);
        if ($validador[SUCESSO]) {

            $materia = $this->getDados($dados, MateriaEntidade::ENTIDADE);
            $livro = $this->getDados($dados, LivroEntidade::ENTIDADE);
            $livro[ST_STATUS] = (!empty($dados[ST_STATUS])) ? SimNaoEnum::SIM : SimNaoEnum::NAO;

            $PDO->beginTransaction();
            if (!empty($materia[CO_MATERIA])):
                /** @var MateriaEntidade $dsMateria */
                $dsMateria = $materiaService->PesquisaUmRegistro($materia[CO_MATERIA]);
                $dados[DS_MATERIA] = $dsMateria->getDsMateria();
            else:
                unset($materia[CO_MATERIA]);
                $livro[CO_MATERIA] = $materiaService->Salva($materia);
                $session->setSession(MENSAGEM, CADASTRADO);
            endif;

            $imagem[DS_CAMINHO] = "";
            if ($foto[DS_CAMINHO]["tmp_name"]):
                $livro[CO_IMAGEM] = $imagemService->salvaImagem(
                    $foto, $livro[DS_TITULO], TipoImagemEnum::CAPA_LIVRO,
                    "Livro/" . strtolower($dados[DS_MATERIA]) . "/"

                );
            endif;

            if (!empty($dados[CO_LIVRO])):
                $retorno[SUCESSO] = $this->Salva($livro, $dados[CO_LIVRO]);
                $session->setSession(MENSAGEM, ATUALIZADO);
            else:
                $retorno[SUCESSO] = $this->Salva($livro);
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
}