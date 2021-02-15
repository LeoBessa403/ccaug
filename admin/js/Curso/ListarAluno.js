$(function () {

    // ABRE MODAL DE DETALHAMENTO DO AGENDAMENTO
    $('.btn-visualizar').click(function () {
        var coPagamento = $(this).attr('data-coPagamento');
        var dados = Funcoes.Ajax('Curso/DetalharPagamentoAjax', coPagamento);

        $('.noPessoa b').text(dados.no_pessoa);
        $('.Email b').text(dados.ds_email);
        $('.Telefone b').text(dados.nu_tel1);
        $('.Curso b').text(dados.ds_titulo);
        $('.Turma b').text(dados.ds_turma);
        $('.Code b').text(dados.ds_code_transacao);
        $('.Data_Pagamento b').text(dados.dt_confirma_pagamento);
        $('.Situacao_Pagamento b').text(dados.st_pagamento);
        $('.Meio_Pagamento b').text(dados.tp_pagamento);
        $('.Valor_Total b').text(dados.nu_valor_total);
        $('.Valor_Desconto b').text(dados.nu_valor_desconto);
        $('.Valor_Liquido b').text(dados.nu_valor_pago);
        $('.transacoes').empty();
        $.each(dados.co_historico_pagamento, function (i, obj) {
            $('.transacoes').append('<p>' + obj + '</p>');
        });
        $("#j_listar").click();
    });
});