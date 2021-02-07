<?php

/**
 * AlunoService.class [ SEVICE ]
 * @copyright (c) 2021, Leo Bessa
 */
class  AlunoService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(AlunoEntidade::ENTIDADE);
        $this->ObjetoModel = new AlunoModel();
    }


    /**
     * @param int $coPessoa
     * @return bool|int $coAluno
     */
    public static function verificaSalvaDadosAluno($coPessoa)
    {
        /** @var AlunoService $AlunoService */
        $AlunoService = new AlunoService();

        /** @var AlunoEntidade $pessoa */
        $aluno = $AlunoService->PesquisaUmQuando([
            CO_PESSOA => $coPessoa
        ]);
        if (empty($aluno)) {
            $alunoDados[CO_PESSOA] = $coPessoa;
            $alunoDados[DT_CADASTRO] = Valida::DataHoraAtualBanco();
            $alunoDados[ST_STATUS] = SimNaoEnum::SIM;

            $coAluno = $AlunoService->Salva($alunoDados);
        } else {
            $coAluno = $aluno->getCoAluno();
        }

        return $coAluno;
    }

}