<?php

/**
 * LivroValidador [ VALIDATOR ]
 * @copyright (c) 2020, Leo Bessa
 */
class  LivroValidador extends AbstractValidador
{
    private $retorno = [
        SUCESSO => true,
        MSG => [],
        DADOS => []
    ];

    public function validarCadastro($dados)
    {
        if (!empty($dados['nova_materia'])) {
            $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioDescricao(
                $dados[DS_MATERIA], 2, 'Nova Matéria'
            );
        }else{
            $this->retorno[DADOS][] = $this->ValidaCampoSelectObrigatorio(
                $dados[CO_MATERIA], 'Matéria do livro'
            );
        }
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioDescricao(
            $dados[DS_TITULO], 3, 'Título do Livro'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioDescricao(
            $dados[DS_COR1], 3, 'Cor Primária'
        );
        $this->retorno[DADOS][] = $this->ValidaCampoObrigatorioDescricao(
            $dados[DS_COR2], 3, 'Cor Secundária'
        );

        return $this->MontaRetorno($this->retorno);
    }
}