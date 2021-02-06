<?php

/**
 * CursoValidador [ VALIDATOR ]
 * @copyright (c) 2020, Leo Bessa
 */
class  CursoValidador extends AbstractValidador
{
    private $retorno = [
        SUCESSO => true,
        MSG => [],
        DADOS => []
    ];

    public function validarCadastro($dados)
    {
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
            $dados[NU_VALOR], AbstractValidador::VALIDACAO_MOEDA, 'Investimento'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
            $dados[NU_DURACAO], AbstractValidador::VALIDACAO_NUMERO, 'Duração'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
            $dados[NU_CARGA_HORARIA], AbstractValidador::VALIDACAO_NUMERO, 'Carga Horário'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioDescricao(
            $dados[DS_DESCRICAO], 5, 'Descrição'
        );
        return $this->MontaRetorno($this->retorno);
    }
}