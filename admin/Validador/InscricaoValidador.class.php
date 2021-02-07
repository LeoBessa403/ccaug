<?php

/**
 * InscricaoValidador [ VALIDATOR ]
 * @copyright (c) 2018, Leo Bessa
 */
class  InscricaoValidador extends AbstractValidador
{
    private $retorno = [
        SUCESSO => true,
        MSG => [],
        DADOS => []
    ];

    public function validarInscricao($dados)
    {
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
            $dados[CO_CURSO], AbstractValidador::VALIDACAO_NUMERO, 'Curso'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoSelectObrigatorio(
            $dados[TP_PAGAMENTO],  'Tipo de Pagamento'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
            $dados[NU_CPF], AbstractValidador::VALIDACAO_CPF, 'CPF do Aluno'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
            $dados[NU_TEL1],AbstractValidador::VALIDACAO_TEL, 'Celular do Aluno'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
            $dados[DS_EMAIL], AbstractValidador::VALIDACAO_EMAIL, 'E-mail do Aluno'
        );
        return $this->MontaRetorno($this->retorno);
    }
}