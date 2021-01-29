<?php

/**
 * AnotacaoLivroValidador [ VALIDATOR ]
 * @copyright (c) 2018, Leo Bessa
 */
class  AnotacaoLivroValidador extends AbstractValidador
{
    private $retorno = [
        SUCESSO => true,
        MSG => [],
        DADOS => []
    ];

    public function validarAnotacaoAluno($dados)
    {
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioDescricao(
            $dados[DS_ANOTACAO], 3, 'Anotacao'
        );
        return $this->MontaRetorno($this->retorno);
    }

    public function validarAnotacaoProfessor($dados)
    {
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioDescricao(
            $dados[DS_ANOTACAO], 3, 'Anotacao'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
            $dados[CO_MATERIA_TURMA],  AbstractValidador::VALIDACAO_NUMERO,'Turma'
        );
        return $this->MontaRetorno($this->retorno);
    }

}