$(function () {

    // ABRE MODAL DE DETALHAMENTO DO AGENDAMENTO
    $('.btn-visualizar').click(function () {
        var coPagamento = $(this).attr('data-coPagamento');
        var dados = Funcoes.Ajax('Curso/DetalharPagamentoAjax', coPagamento);

        $('.Code b').text(dados.ds_code_transacao);
        $('.plano b').text(dados.no_plano);
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