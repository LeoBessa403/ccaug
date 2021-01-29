<?php

/**
 * MateriaTurmaService.class [ SEVICE ]
 * @copyright (c) 2020, Leo Bessa
 */
class  MateriaTurmaService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(MateriaTurmaEntidade::ENTIDADE);
        $this->ObjetoModel = new MateriaTurmaModel();
    }

    public function getTurmasProfessorCombo($coProfessor)
    {
        $comboTurmas = [
            '' => Mensagens::MSG_SEM_ITEM_SELECIONADO
        ];
        $materiaTurmas = $this->PesquisaTodos([
            CO_PROFESSOR => $coProfessor
        ]);
        /** @var MateriaTurmaEntidade $materiaTurma */
        foreach ($materiaTurmas as $materiaTurma) {
            $comboTurmas[$materiaTurma->getCoMateriaTurma()]
                = strtoupper($materiaTurma->getCoTurma()->getNuAno() .
                $materiaTurma->getCoTurma()->getDsTurma() . ' - ' . $materiaTurma->getCoMateria()->getDsMateria());
        }
        return $comboTurmas;
    }

}