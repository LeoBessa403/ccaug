<?php

/**
 * MateriaService.class [ SEVICE ]
 * @copyright (c) 2020, Leo Bessa
 */
class  MateriaService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(MateriaEntidade::ENTIDADE);
        $this->ObjetoModel = New MateriaModel();
    }

    public function getMateriasCombo($coEscola = null)
    {
        $comboMaterias = [
            '' => Mensagens::MSG_SEM_ITEM_SELECIONADO
        ];
        $materias = $this->PesquisaTodos([
            CO_ESCOLA => $coEscola
        ]);
        /** @var MateriaEntidade $materia */
        foreach ($materias as $materia) {
            $comboMaterias[$materia->getCoMateria()]
                = $materia->getDsMateria();
        }
        return $comboMaterias;
    }

}