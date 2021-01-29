<?php

/**
 * EscolaValidador [ VALIDATOR ]
 * @copyright (c) 2020, Leo Bessa
 */
class  EscolaValidador extends AbstractValidador
{
    private $retorno = [
        SUCESSO => true,
        MSG => [],
        DADOS => []
    ];

    public function validarCadastro($dados)
    {
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioDescricao(
            $dados[NO_FANTASIA], 2, 'Nome Fantasia'
        );
        if (!empty($dados[NU_CNPJ])) {
            $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
                $dados[NU_CNPJ], AbstractValidador::VALIDACAO_CNPJ, 'CNPJ'
            );
        }
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
            $dados[NU_TEL1], AbstractValidador::VALIDACAO_TEL, 'Telefone Responsável'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
            $dados[DS_EMAIL], AbstractValidador::VALIDACAO_EMAIL, 'E-mail'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioValido(
            $dados[NU_CEP], AbstractValidador::VALIDACAO_CEP, 'CEP'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioDescricao(
            $dados[DS_ENDERECO], 3, 'Endereço'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoSelectObrigatorio(
            $dados[SG_UF],  'Estado'
        );
        return $this->MontaRetorno($this->retorno);
    }
}