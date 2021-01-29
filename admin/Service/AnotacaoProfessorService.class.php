<?php

/**
 * AnotacaoProfessorService.class [ SEVICE ]
 * @copyright (c) 2020, Leo Bessa
 */
class  AnotacaoProfessorService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(AnotacaoProfessorEntidade::ENTIDADE);
        $this->ObjetoModel = New AnotacaoProfessorModel();
    }

    /**
     * @param $dados
     * @return array|AnotacaoLivroValidador
     */
    public function salvaAnotacaoProfessorAjax($dados)
    {
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];

        $PDO->beginTransaction();

        $anotacaoValidador = new AnotacaoLivroValidador();
        /** @var AnotacaoValidador $validador */
        $validador = $anotacaoValidador->validarAnotacaoProfessor($dados);
        if ($validador[SUCESSO]) {

            $anotacao[CO_PAGINA_LIVRO] = $dados[CO_PAGINA_LIVRO];
            $anotacao[DS_ANOTACAO] = $dados[DS_ANOTACAO];
            $anotacao[CO_MATERIA_TURMA] = $dados[CO_MATERIA_TURMA];

            if (!empty($dados[CO_ANOTACAO_PROFESSOR])) {
                $retorno[SUCESSO] = $this->Salva($anotacao, $dados[CO_ANOTACAO_PROFESSOR]);
                $retorno[MSG] = ATUALIZADO;
            } else {
                $anotacao[DT_CADASTRO] = Valida::DataHoraAtualBanco();
                $retorno[SUCESSO] = $this->Salva($anotacao);
                $retorno[MSG] = CADASTRADO;
            }

        } else {
            $retorno = $validador;
        }

        if ($retorno[SUCESSO]) {
            $retorno[SUCESSO] = true;
            $PDO->commit();
        } else {
            $retorno[MSG] = $validador[MSG];
            $retorno[SUCESSO] = false;
            $PDO->rollBack();
        }

        return $retorno;
    }

}