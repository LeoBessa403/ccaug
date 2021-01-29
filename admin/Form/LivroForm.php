<?php

/**
 * LivroForm [ FORM ]
 * @copyright (c) 2017, Leo Bessa
 */
class LivroForm
{
    public static function Cadastrar($res)
    {
        $id = "cadastroLivro";

        $formulario = new Form($id, ADMIN . "/" . UrlAmigavel::$controller . "/" . UrlAmigavel::$action,
            "Enviar", 8);

        if ($res):
            $formulario->setValor($res);
        endif;

        $label_options2 = array("<i class='fa fa-check fa-white'></i>", "<i class='fa fa-times fa-white'></i>", "verde", "vermelho");
        $formulario
            ->setLabel("Status do Livro")
            ->setId(ST_STATUS)
            ->setClasses($res[ST_STATUS])
            ->setType(TiposCampoEnum::CHECKBOX)
            ->setTamanhoInput(6)
            ->setOptions($label_options2)
            ->CriaInpunt();

        $label_options2 = array("<i class='fa fa-check fa-white'></i>", "<i class='fa fa-times fa-white'></i>", "verde", "vermelho");
        $formulario
            ->setLabel("Nova Matéria?")
            ->setId('nova_materia')
            ->setType(TiposCampoEnum::CHECKBOX)
            ->setTamanhoInput(6)
            ->setOptions($label_options2)
            ->CriaInpunt();

        $formulario
            ->setId(CO_MATERIA)
            ->setAutocomplete(
                MateriaEntidade::TABELA,
                DS_MATERIA,
                MateriaEntidade::CHAVE
            )
            ->setType(TiposCampoEnum::SELECT)
            ->setLabel("Matéria do livro")
            ->setClasses("ob")
            ->CriaInpunt();

        $formulario
            ->setId(DS_MATERIA)
            ->setClasses("ob")
            ->setLabel("Nova Matéria")
            ->setTamanhoInput(12)
            ->CriaInpunt();

        $formulario
            ->setId(DS_TITULO)
            ->setClasses("ob")
            ->setLabel("Título do Livro")
            ->setTamanhoInput(12)
            ->CriaInpunt();


        $formulario
            ->setId(DS_COR1)
            ->setType('color')
            ->setClasses("ob")
            ->setLabel("Cor Primária")
            ->setTamanhoInput(4)
            ->CriaInpunt();


        $formulario
            ->setId(DS_COR2)
            ->setType('color')
            ->setClasses("ob")
            ->setLabel("Cor Secundária")
            ->setTamanhoInput(4)
            ->CriaInpunt();

        $formulario
            ->setId(DS_COR3)
            ->setType('color')
            ->setClasses("ob")
            ->setLabel("Cor Terciária")
            ->setTamanhoInput(4)
            ->CriaInpunt();

        $formulario
            ->setId(DS_CAMINHO)
            ->setType(TiposCampoEnum::SINGLEFILE)
            ->setLabel("Capa do Livro")
            ->CriaInpunt();

        Form::CriaInputHidden($formulario, $res, [CO_LIVRO]);

        return $formulario->finalizaForm();
    }


    public static function CadastroCapitulo($res = false)
    {
        $id = "CadastroCapitulo";

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
            ->setTamanhoInput(12)
            ->setOptions($label_options2)
            ->CriaInpunt();

        $formulario
            ->setId(DS_TITULO)
            ->setClasses("ob")
            ->setLabel("Título do Capítulo")
            ->setTamanhoInput(12)
            ->CriaInpunt();

        $formulario
            ->setId(DS_CAMINHO)
            ->setType(TiposCampoEnum::SINGLEFILE)
            ->setLabel("Capa do Capítulo")
            ->CriaInpunt();

        Form::CriaInputHidden($formulario, $res, [CO_CAPITULO, CO_LIVRO]);

        return $formulario->finalizaForm('Livro/ListarCapitulo/' .
            Valida::GeraParametro(CO_CAPITULO . "/" . $res[CO_CAPITULO] . "/"
                . CO_LIVRO . "/" . $res[CO_LIVRO]));
    }

    public static function CadastroPaginaLivro($res = false)
    {
        $id = "CadastroPaginaLivro";

        $formulario = new Form($id, ADMIN . "/" . UrlAmigavel::$controller . "/" . UrlAmigavel::$action,
            "Cadastrar", 6);
        if ($res):
            $formulario->setValor($res);
        endif;

        $label_options2 = array("<i class='fa fa-check fa-white'></i>", "<i class='fa fa-times fa-white'></i>", "verde", "vermelho");
        $formulario
            ->setLabel("Página Visível")
            ->setId(ST_STATUS)
            ->setClasses($res[ST_STATUS])
            ->setType(TiposCampoEnum::CHECKBOX)
            ->setTamanhoInput(12)
            ->setOptions($label_options2)
            ->CriaInpunt();

        $formulario
            ->setLabel("Conteúdo da Página")
            ->setType(TiposCampoEnum::TEXTAREA)
            ->setClasses("editor")
            ->setId(DS_CODE)
            ->CriaInpunt();

        Form::CriaInputHidden($formulario, $res, [CO_PAGINA_LIVRO, CO_LIVRO, CO_CAPITULO]);

        return $formulario->finalizaForm('Livro/ListarPaginaLivro/' .
            Valida::GeraParametro(CO_LIVRO . "/" . $res[CO_LIVRO]
                . "/" . CO_CAPITULO . "/" . $res[CO_CAPITULO]));
    }

    public static function CadastroAnotacao($res = false, $turmas = [])
    {
        $id = "CadastroAnotacao";

        $formulario = new Form($id, ADMIN . "/" . UrlAmigavel::$controller . "/" . UrlAmigavel::$action,
            "Cadastrar", 12);
        if ($res):
            $formulario->setValor($res);
        endif;

        if (PerfilService::perfilProfessor()) {
            $formulario
                ->setId(CO_MATERIA_TURMA)
                ->setTamanhoInput(12)
                ->setLabel("Turma")
                ->setType(TiposCampoEnum::SELECT)
                ->setOptions($turmas)
                ->CriaInpunt();
        } else {
            Form::CriaInputHidden($formulario, $res, [
                CO_MATERIA_TURMA
            ]);
        }

        $formulario
            ->setLabel("Anotação")
            ->setType(TiposCampoEnum::TEXTAREA)
//            ->setClasses("editor")
            ->setId(DS_ANOTACAO)
            ->CriaInpunt();

        Form::CriaInputHidden($formulario, $res, [
            CO_PAGINA_LIVRO, CO_ANOTACAO_ALUNO, CO_ANOTACAO_PROFESSOR, CO_ALUNO, CO_PROFESSOR
        ]);

        return $formulario->finalizaForm(false, false);
    }



    public static function CadastroModalPagina($res = false)
    {
        $id = "CadastroModalPagina";

        $formulario = new Form($id, ADMIN . "/" . UrlAmigavel::$controller . "/" . UrlAmigavel::$action,
            "Cadastrar", 6);
        if ($res):
            $formulario->setValor($res);
        endif;

        $label_options2 = array("<i class='fa fa-check fa-white'></i>", "<i class='fa fa-times fa-white'></i>", "verde", "vermelho");
        $formulario
            ->setLabel("Modal Ativa?")
            ->setId(ST_STATUS)
            ->setClasses($res[ST_STATUS])
            ->setType(TiposCampoEnum::CHECKBOX)
            ->setTamanhoInput(2)
            ->setOptions($label_options2)
            ->CriaInpunt();

        $formulario
            ->setId(DS_TITULO)
            ->setClasses("ob")
            ->setLabel("Título da Modal")
            ->setTamanhoInput(5)
            ->setOptions($label_options2)
            ->CriaInpunt();

        $formulario
            ->setId(DS_IDENTIFICADOR)
            ->setClasses("ob")
            ->setLabel("Identificador da Modal")
            ->setTamanhoInput(5)
            ->CriaInpunt();

        $formulario
            ->setLabel("Conteúdo da Página")
            ->setType(TiposCampoEnum::TEXTAREA)
            ->setClasses("editor")
            ->setId(DS_CODE)
            ->CriaInpunt();

        Form::CriaInputHidden($formulario, $res, [CO_PAGINA_LIVRO, CO_MODAL]);

        return $formulario->finalizaForm('Livro/ListarPaginaLivro/' .
            Valida::GeraParametro(CO_PAGINA_LIVRO . "/" . $res[CO_PAGINA_LIVRO]));
    }


}