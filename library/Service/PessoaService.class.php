<?php

/**
 * PessoaService.class [ SEVICE ]
 * @copyright (c) 2017, Leo Bessa
 */
class  PessoaService extends AbstractService
{

    public function __construct()
    {
        parent::__construct(PessoaEntidade::ENTIDADE);
    }

    /**
     * @param PessoaEntidade $pessoa
     * @param array $dados
     * @return array
     */
    public function getArrayDadosPessoa(PessoaEntidade $pessoa, array $dados)
    {
        $dados[CO_PESSOA] = $pessoa->getCoPessoa();
        $dados[NU_CPF] = ($pessoa->getNuCpf()) ? Valida::MascaraCpf($pessoa->getNuCpf()) : null;
        $dados[NU_RG] = $pessoa->getNuRg();
        $dados[DT_NASCIMENTO] = (!empty($pessoa->getDtNascimento())) ? Valida::DataShow($pessoa->getDtNascimento()) : null;
        $dados[ST_SEXO] = $pessoa->getStSexo();
        $dados[NO_PESSOA] = $pessoa->getNoPessoa();

        return $dados;
    }


    /**
     * @param array $dados
     * @return bool|int $coPessoa
     */
    public static function verificaSalvaDadosPessoa(array $dados)
    {
        /** @var PessoaService $pessoaService */
        $pessoaService = new PessoaService();
        /** @var ContatoService $ContatoService */
        $ContatoService = new ContatoService();
        /** @var EnderecoService $EnderecoService */
        $EnderecoService = new EnderecoService();
        $dadosPessoa = $pessoaService->getDados($dados, PessoaEntidade::ENTIDADE);
        $dadosContato = $pessoaService->getDados($dados, ContatoEntidade::ENTIDADE);
        $dadosEndereco = $pessoaService->getDados($dados, EnderecoEntidade::ENTIDADE);

        if (!empty($dadosPessoa[NU_CPF])) {
            $dadosPessoa[NU_CPF] = Valida::RetiraMascara($dadosPessoa[NU_CPF]);
            /** @var PessoaEntidade $pessoa */
            $pessoa = $pessoaService->PesquisaUmQuando([
                NU_CPF => $dadosPessoa[NU_CPF]
            ]);

            if (empty($pessoa)) {
                $coPessoa = $pessoaService->Salva($dadosPessoa);
            } else {
                $coPessoa = $pessoa->getCoPessoa();
                $pessoaService->Salva($dadosPessoa, $coPessoa);
            }
        } else {
            if (!empty($dadosPessoa[CO_PESSOA])) {
                $coPessoa = $dadosPessoa[CO_PESSOA];
                unset($dadosPessoa[CO_PESSOA]);
                $pessoaService->Salva($dadosPessoa, $coPessoa);
            } else {
                $coPessoa = $pessoaService->Salva($dadosPessoa);
            }
        }

        /** @var PessoaEntidade $pessoa */
        $pessoa = $pessoaService->PesquisaUmQuando([CO_PESSOA => $coPessoa]);


        $novodado = [];
        if (empty($pessoa->getCoContato())) {
            $novodado[CO_CONTATO] = $ContatoService->Salva($dadosContato);
        } else {
            $ContatoService->Salva($dadosContato, $pessoa->getCoContato()->getCoContato());
            $novodado[CO_CONTATO] = $pessoa->getCoContato()->getCoContato();
        }

        if (empty($pessoa->getCoEndereco())) {
            $novodado[CO_ENDERECO] = $EnderecoService->Salva($dadosEndereco);
        } else {
            $EnderecoService->Salva($dadosEndereco, $pessoa->getCoEndereco()->getCoEndereco());
            $novodado[CO_ENDERECO] = $pessoa->getCoEndereco()->getCoEndereco();
        }

        $pessoaService->Salva($novodado, $coPessoa);

        return $coPessoa;
    }

}