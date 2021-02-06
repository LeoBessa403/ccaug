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
            ->setId(DS_TITULO)
            ->setClasses("ob")
            ->setTamanhoInput(12)
            ->setLabel("Nome do Curso")
            ->CriaInpunt();

        $formulario
            ->setLabel("Carga Horário")
            ->setId(NU_CARGA_HORARIA)
            ->setClasses('ob numero')
            ->setInfo('Em Horas')
            ->setTamanhoInput(6)
            ->CriaInpunt();

        $formulario
            ->setId(NU_DURACAO)
            ->setClasses("ob numero")
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

    public static function CadastrarTurma($res = false)
    {
        $id = "CadastrarTurma";

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

        $formulario
            ->setLabel("Ano")
            ->setId(NU_ANO)
            ->setClasses('ob numero')
            ->setTamanhoInput(4)
            ->CriaInpunt();

        $formulario
            ->setId(DS_TURMA)
            ->setClasses("ob")
            ->setLabel("Turma")
            ->setTamanhoInput(4)
            ->CriaInpunt();


        $formulario
            ->setId(DT_INICIO)
            ->setTamanhoInput(6)
            ->setClasses("data dt1 ob")
            ->setIcon("clip-calendar-3")
            ->setLabel("Data de Inicio")
            ->CriaInpunt();

        $formulario
            ->setId(DT_FIM)
            ->setTamanhoInput(6)
            ->setClasses("data dt2 ob")
            ->setIcon("clip-calendar-3")
            ->setLabel("Data de Termino")
            ->CriaInpunt();

        $formulario
            ->setId(NU_HORA_ABERTURA)
            ->setTamanhoInput(6)
            ->setClasses("horas ob")
            ->setPlace("Formato 24Hrs")
            ->setIcon("clip-clock-2", "dir")
            ->setLabel("Hórario de Início")
            ->CriaInpunt();

        $formulario
            ->setId(NU_HORA_FECHAMENTO)
            ->setTamanhoInput(6)
            ->setClasses("horas ob")
            ->setPlace("Formato 24Hrs")
            ->setIcon("clip-clock-2", "dir")
            ->setLabel("Hórario de Término")
            ->CriaInpunt();

        Form::CriaInputHidden($formulario, $res, [CO_TURMA, CO_CURSO]);

        return $formulario->finalizaForm('Curso/ListarTurma/' .
            Valida::GeraParametro(CO_TURMA . "/" . $res[CO_TURMA] . "/"
                . CO_CURSO . "/" . $res[CO_CURSO]));
    }

}

?>
   