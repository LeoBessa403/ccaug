$(function () {
    var imgBand = '';
    $('.debito,.credito').parents('.form-group').hide();
    $('.user-edit-image-buttons').hide();

    $("button.btn-success").attr('type', 'button');

    $("#co_plano").change(function () {
        limpaComboParcelas();
        iniciaComboParcelas();
        $(".cartao_credito").val('');
        Funcoes.TiraValidacao('numCartao')
    });
    $("#tp_pagamento").change(function () {
        $(".img-load").show();
        var tpPagamento = $(this).val();
        if (tpPagamento == 3) {
            $('.debito').parents('.form-group').hide();
            $('.credito').parents('.form-group').show();
            carregaSession();
        } else if (tpPagamento == 4) {
            $('.debito').parents('.form-group').show();
            $('.credito').parents('.form-group').hide();
        } else {
            $('.debito,.credito').parents('.form-group').hide();
            carregaSession();
        }
        $(".img-load").hide();
    });
    $(".cartao_credito").keyup(function () {
        var numCartao = $(this).val().replace(/[^0-9]+/g, '');
        var TamNumCartao = numCartao.length;
        if(TamNumCartao == 16){
            numCartao  = $(this).val().replace(/[^0-9]+/g, '').substring(6, 0);
            TamNumCartao = numCartao.length;
        }
        var spanBandeira = $(this).parents('.input-group').children('span.input-group-addon');
        var spanMensagem = $(this).parents('.input-group').parents('.form-group').children('span.help-block');
        if (TamNumCartao == 6) {
            PagSeguroDirectPayment.getBrand({
                cardBin: numCartao, success: function (retorno) {
                    imgBand = retorno.brand.name;
                    spanBandeira.html("<img src='https://stc.pagseguro.uol.com.br/public/img/payment-methods-flags/42x20/" + imgBand + ".png'>")
                }, error: function (retorno) {
                    spanBandeira.empty();
                    spanMensagem.text('Cartão inválido').prepend('<i class="fa clip-checkmark-circle-2"></i> ')
                }, complete: function (retorno) {
                    $(this).focus()
                }
            })
        } else if (TamNumCartao < 6) {
            spanBandeira.empty();
            Funcoes.ValidaErro('numCartao', 'Cartão inválido');
            limpaComboParcelas();
            iniciaComboParcelas()
        }
        var valor = $(this).val().replace(/[^0-9]+/g, '');
        valor = valor.val().replace(/[^.-]+/g, '');
        $(this).val(valor)
    }).focusout(function () {
        var spanBandeira = $(this).parents('.input-group').children('span.input-group-addon');
        var numCartao = $(this).val().replace(/[^0-9]+/g, '');
        var TamNumCartao = numCartao.length;
        if (TamNumCartao < 16) {
            spanBandeira.empty();
            Funcoes.ValidaErro('numCartao', 'Cartão inválido');
            limpaComboParcelas();
            iniciaComboParcelas()
        } else {
            $('#bandeiraCartao').val(imgBand);
            Funcoes.ValidaOK('numCartao', 'Cartão Válido');
            recupParcelas(imgBand)
        }
    });

    function recupParcelas(bandeira) {
        var coCurso = $("#co_curso").val();
        var comboParc = $("#qntParcelas");
        if (coCurso) {
            var dados = Funcoes.Ajax('Inscricao/getValorCurso', coCurso);
            var valorCurso = dados.nu_valor;
            limpaComboParcelas();
            var noIntInstalQuantity = 3;
            PagSeguroDirectPayment.getInstallments({
                amount: valorCurso,
                maxInstallmentNoInterest: noIntInstalQuantity,
                brand: bandeira,
                success: function (retorno) {
                    $.each(retorno.installments, function (ia, obja) {
                        $.each(obja, function (ib, objb) {
                            var valorParcela = objb.installmentAmount.toFixed(2).replace(".", ",");
                            comboParc.append(new Option(objb.quantity + " x R$ " + valorParcela, objb.quantity, !1, !1)).trigger('change')
                        })
                    });
                    iniciaComboParcelas()
                },
                error: function (retorno) {
                },
                complete: function (retorno) {
                }
            })
        }
    }

    $("#qntParcelas").change(function () {
        if ($(this).val() != 'null') {
            var valorParcela = $("#qntParcelas option:selected").text().split(' x R$ ');
            $("#installmentValue").val(valorParcela[1])
        }
    });

    function limpaComboParcelas() {
        var comboParc = $("#qntParcelas");
        comboParc.select2("destroy");
        comboParc.empty();
        var newOptionParc = new Option('Selecione um Parcelamento', null, !1, !1);
        comboParc.append(newOptionParc).trigger('change')
    }

    function iniciaComboParcelas() {
        var comboParc = $("#qntParcelas");
        comboParc.select2({allowClear: !1})
    }

    function carregaBancos() {
        PagSeguroDirectPayment.getPaymentMethods({
            amount: '15.00', success: function (retorno) {
                console.log(retorno);
                var comboBank = $("#bankName");
                comboBank.select2("destroy");
                comboBank.empty();
                var newOptionBank = new Option('Selecione um Banco', null, !1, !1);
                comboBank.append(newOptionBank).trigger('change');
                $.each(retorno.paymentMethods.ONLINE_DEBIT.options, function (i, obj) {
                    comboBank.append(new Option(obj.displayName, obj.name, !1, !1)).trigger('change')
                });
                comboBank.select2({allowClear: !1})
            }, error: function (retorno) {
            }, complete: function (retorno) {
            }
        })
    }

    function carregaSession(){
        var dados = Funcoes.Ajax('Inscricao/getReferenciaPagamentoInscricao', null);
        PagSeguroDirectPayment.setSessionId(dados.id);
    }

    $(".btn-success").click(function () {
        $(".img-load").show();
        var tpPagamento = $("#tp_pagamento").val();
        if (tpPagamento) {
            if (tpPagamento == 3) {
                var validade = $('#validadeCartao').val().split('/');
                var numCartao = $('#numCartao').val().replace(/[^0-9]+/g, '');
                PagSeguroDirectPayment.createCardToken({
                    cardNumber: numCartao,
                    brand: $('#bandeiraCartao').val(),
                    cvv: $('#cvvCartao').val(),
                    expirationMonth: validade[0],
                    expirationYear: validade[1],
                    success: function (retorno) {
                        $('#tokenCartao').val(retorno.card.token);
                        recupHashCartao()
                    },
                    error: function (retorno) {
                        $(".img-load").hide();
                    },
                    complete: function (retorno) {
                    }
                });
            } else if (tpPagamento == 5) {
                recupHashCartao();
            } else if (tpPagamento == 4) {
                recupHashCartao();
            }
        } else {
            recupHashCartao();
        }
    });

    function recupHashCartao() {
        PagSeguroDirectPayment.onSenderHashReady(function (retorno) {
            if (retorno.status == 'error') {
                $(".img-load").hide();
                Funcoes.Erro(retorno.message);
                return 1
            } else {
                $("#hash").val(retorno.senderHash);
                $("#InscricaoCurso").submit()
            }
        })
    }

    $(".btn-primary").click(function () {
        $(".img-load").show();
        location.href = $("#home").attr('data-val');
        return false;
    });
});