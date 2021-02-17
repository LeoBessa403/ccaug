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
            ->setTamanhoInput(3)
            ->setOptions($label_options2)
            ->CriaInpunt();

        $label_options2 = array("Sim", "Não", "azul", "amarelo");
        $formulario
            ->setLabel("Certificado")
            ->setId(ST_CERTIFICACAO)
            ->setClasses($res[ST_CERTIFICACAO])
            ->setType(TiposCampoEnum::CHECKBOX)
            ->setTamanhoInput(3)
            ->setOptions($label_options2)
            ->CriaInpunt();

        $label_options2 = array("Sim", "Não", "vermelho", "branco");
        $formulario
            ->setLabel("Gratuito")
            ->setId('st_gratuito')
            ->setClasses($res['st_gratuito'])
            ->setType(TiposCampoEnum::CHECKBOX)
            ->setTamanhoInput(3)
            ->setOptions($label_options2)
            ->CriaInpunt();

        $formulario
            ->setId(NU_VALOR)
            ->setClasses("moeda ob disabilita")
            ->setLabel("Investimento R$")
            ->setTamanhoInput(3)
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
            ->setId(DS_CAMINHO)
            ->setType(TiposCampoEnum::SINGLEFILE)
            ->setLabel("Imagem do Curso")
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
            ->setId(DS_TURMA)
            ->setClasses("ob")
            ->setLabel("Turma")
            ->setTamanhoInput(4)
            ->CriaInpunt();

        $formulario
            ->setLabel("Ano")
            ->setId(NU_ANO)
            ->setClasses('ob numero')
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


    public static function Pagamento($res = false, $eGratuito = false)
    {
        $id = "InscricaoCurso";

        $formulario = new Form($id, ADMIN . "/" . UrlAmigavel::$controller . "/" . UrlAmigavel::$action,
            "Cadastrar", 12);
        $formulario->setValor($res);

        $formulario
            ->setId(NO_PESSOA)
            ->setClasses("ob nome")
            ->setInfo("O Nome deve ser Completo Mínimo de 10 Caracteres")
            ->setLabel("Nome do Aluno")
            ->CriaInpunt();

        $formulario
            ->setId(NU_CPF)
            ->setClasses("cpf ob")
            ->setInfo('Somente números')
            ->setTamanhoInput(6)
            ->setLabel("CPF do Aluno")
            ->CriaInpunt();

        $formulario
            ->setId(NU_TEL1)
            ->setIcon("fa fa-mobile-phone")
            ->setLabel("Celular do Aluno")
            ->setInfo("Com <i class=\"fa fa-whatsapp\" style='color: green;'></i> WhatSapp")
            ->setClasses("tel ob")
            ->setTamanhoInput(6)
            ->CriaInpunt();

        $formulario
            ->setId(DS_EMAIL)
            ->setIcon("fa-envelope fa")
            ->setClasses("email ob")
            ->setLabel("Email do Aluno")
            ->CriaInpunt();


        if (!$eGratuito) {
            $tp_pagamentos = [
                null => Mensagens::MSG_SEM_ITEM_SELECIONADO,
                TipoPagamentoEnum::CARTAO_CREDITO =>
                    TipoPagamentoEnum::getDescricaoValor(TipoPagamentoEnum::CARTAO_CREDITO),
                TipoPagamentoEnum::PIX =>
                    TipoPagamentoEnum::getDescricaoValor(TipoPagamentoEnum::PIX),
                TipoPagamentoEnum::BOLETO =>
                    TipoPagamentoEnum::getDescricaoValor(TipoPagamentoEnum::BOLETO)
            ];
            $formulario
                ->setId(TP_PAGAMENTO)
                ->setType(TiposCampoEnum::SELECT)
                ->setLabel("Tipo de Pagamento")
                ->setTamanhoInput(12)
                ->setClasses("ob")
                ->setOptions($tp_pagamentos)
                ->CriaInpunt();
        }

        $formulario
            ->setId(DS_CAMINHO)
            ->setType(TiposCampoEnum::SINGLEFILE)
            ->setInfo("Chave PIX: <b>linnekerlima@hotmail.com</b>")
            ->setClasses("debito")
            ->setLabel("QR Code PIX (Enviar Comprovante No WhatsApp no Site)")
            ->setTamanhoInput(12)
            ->CriaInpunt();

        $formulario
            ->setId('numCartao')
            ->setTamanhoInput(6)
            ->setIcon("fa fa-whatsapp", 'dir')
            ->setLabel("Número do Cartão")
            ->setInfo("Somente Números")
            ->setClasses("cartao_credito credito")
            ->CriaInpunt();

        $formulario
            ->setId('validadeCartao')
            ->setTamanhoInput(3)
            ->setLabel("Validade do Cartão")
            ->setInfo("Somente Números")
            ->setClasses("validade_cartao credito")
            ->CriaInpunt();

        $formulario
            ->setId('cvvCartao')
            ->setTamanhoInput(3)
            ->setLabel("CVV do cartão")
            ->setInfo("Somente Números")
            ->setClasses("cvv credito")
            ->CriaInpunt();

        $parcelas = [
            null => Mensagens::MSG_SEM_ITEM_SELECIONADO,
        ];
        $formulario
            ->setId('qntParcelas')
            ->setType(TiposCampoEnum::SELECT)
            ->setLabel("Número de Parcelas")
            ->setClasses("credito")
            ->setTamanhoInput(12)
            ->setOptions($parcelas)
            ->CriaInpunt();

        $formulario
            ->setId('creditCardHolderName')
            ->setTamanhoInput(12)
            ->setLabel("Nome no Cartão")
            ->setClasses("nome credito")
            ->CriaInpunt();

        $formulario
            ->setId('creditCardHolderCPF')
            ->setTamanhoInput(6)
            ->setLabel("CPF do dono do Cartão")
            ->setClasses("cpf credito")
            ->CriaInpunt();

        $formulario
            ->setId('creditCardHolderBirthDate')
            ->setTamanhoInput(6)
            ->setLabel("Nascimento do dono do Cartão")
            ->setClasses("data credito")
            ->CriaInpunt();

        $formulario
            ->setId(NU_CEP)
            ->setLabel("CEP do dono do Cartão")
            ->setClasses("cep credito")
            ->setTamanhoInput(12)
            ->CriaInpunt();

        $formulario
            ->setId(DS_ENDERECO)
            ->setIcon("clip-home-2")
            ->setClasses("credito")
            ->setTamanhoInput(12)
            ->setLabel("Endereço do dono do Cartão")
            ->CriaInpunt();

        $formulario
            ->setId(DS_COMPLEMENTO)
            ->setTamanhoInput(12)
            ->setClasses("credito")
            ->setLabel("Complemento do dono do Cartão")
            ->CriaInpunt();

        $formulario
            ->setId(DS_BAIRRO)
            ->setTamanhoInput(12)
            ->setClasses("credito")
            ->setLabel("Bairro do dono do Cartão")
            ->CriaInpunt();

        $formulario
            ->setId(NO_CIDADE)
            ->setTamanhoInput(12)
            ->setClasses("credito")
            ->setLabel("Cidade do dono do Cartão")
            ->CriaInpunt();

        $options = EnderecoService::montaComboEstadosDescricao();
        $formulario
            ->setId(SG_UF)
            ->setType(TiposCampoEnum::SELECT)
            ->setClasses("credito")
            ->setTamanhoInput(12)
            ->setLabel("Estado do dono do Cartão")
            ->setOptions($options)
            ->CriaInpunt();

        Form::CriaInputHidden($formulario, $res, [CO_CURSO]);

        $formulario
            ->setType(TiposCampoEnum::HIDDEN)
            ->setId('bandeiraCartao')
            ->setValues(null)
            ->CriaInpunt();

        $formulario
            ->setType(TiposCampoEnum::HIDDEN)
            ->setId('hash')
            ->setValues(null)
            ->CriaInpunt();

        $formulario
            ->setType(TiposCampoEnum::HIDDEN)
            ->setId('tokenCartao')
            ->setValues(null)
            ->CriaInpunt();

        $formulario
            ->setType(TiposCampoEnum::HIDDEN)
            ->setId('installmentValue')
            ->setValues(null)
            ->CriaInpunt();
        return $formulario->finalizaForm();
    }


    public static function CadastrarNotificaacao()
    {
        $id = "CadastrarNotificaacao";

        $formulario = new Form($id, ADMIN . "/" . UrlAmigavel::$controller . "/" . UrlAmigavel::$action,
            "Notificar", 6);

        $formulario
            ->setId('notificationCode')
            ->setClasses("ob")
            ->setLabel("Código de Notificação")
            ->CriaInpunt();

        return $formulario->finalizaForm();
    }

}

?>
   