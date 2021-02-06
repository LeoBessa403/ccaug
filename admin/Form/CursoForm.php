<?php

/**
 * HistoriaForm [ FORM ]
 * @copyright (c) 2017, Leo Bessa
 */
class CursoForm
{

    public static function CadastrarCurso($res = false)
    {
        $id = "CadastrarCurso";

        $formulario = new Form($id, ADMIN . "/" . UrlAmigavel::$controller . "/" . UrlAmigavel::$action,
            "Cadastrar", 6);
        if ($res):
            $formulario->setValor($res);
        endif;

        $label_options2 = array("<i class='fa fa-check fa-white'></i>", "<i class='fa fa-times fa-white'></i>", "verde", "vermelho");
        $formulario
            ->setLabel("Status")
            ->setId(ST_STATUS)
            ->setClasses($res[ST_STATUS])
            ->setType(TiposCampoEnum::CHECKBOX)
            ->setTamanhoInput(4)
            ->setOptions($label_options2)
            ->CriaInpunt();

        $label_options2 = array("Sim", "Não", "azul", "amarelo");
        $formulario
            ->setLabel("Certificado")
            ->setId(ST_CERTIFICACAO)
            ->setClasses($res[ST_CERTIFICACAO])
            ->setType(TiposCampoEnum::CHECKBOX)
            ->setTamanhoInput(4)
            ->setOptions($label_options2)
            ->CriaInpunt();

        $formulario
            ->setId(NU_VALOR)
            ->setClasses("moeda ob")
            ->setLabel("Investimento R$")
            ->setTamanhoInput(4)
            ->CriaInpunt();

        $formulario
            ->setLabel("Carga Horário")
            ->setId(NU_ANO)
            ->setClasses('ob numero')
            ->setInfo('Em Horas')
            ->setTamanhoInput(6)
            ->CriaInpunt();

        $formulario
            ->setId(DS_TURMA)
            ->setClasses("ob")
            ->setLabel("Duração")
            ->setInfo('Em Semanas')
            ->setTamanhoInput(6)
            ->CriaInpunt();


        $formulario
            ->setLabel("Descrição do Curso")
            ->setType(TiposCampoEnum::TEXTAREA)
            ->setClasses("editor")
            ->setId(DS_DESCRICAO)
            ->CriaInpunt();


        Form::CriaInputHidden($formulario, $res, [CO_CURSO]);

        return $formulario->finalizaForm();
    }


}

?>
   