<?php
/** @var ValorCursoEntidade $valor */
$valor = $historico;
/** @var UsuarioService $usuarioService */
$usuarioService = new UsuarioService();
/** @var UsuarioEntidade $usuario */
$usuario = $usuarioService->PesquisaUmRegistro($valor->getCoUsuario()->getCoUsuario());
?>
<div class="content">
    Título: <b><?= Valida::Resumi($valor->getDsTitulo(), 40); ?></b></br>
    Valor R$: <b><?= Valida::FormataMoeda($valor->getNuValor()); ?></b></br>
    Status: <b><?= Valida::SituacaoSimNao($valor->getStStatus()); ?></b></br>
    Certificado: <b><?= Valida::SituacaoSimNao($valor->getStCertificacao()); ?></b></br>
    Duração: <b><?= $valor->getNuDuracao() ?> Semanas</b></br>
    Carga Horária: <b><?= $valor->getNuCargaHoraria() ?> Horas</b></br>
    Cadastrado em: <b><?=
        Valida::DataShow(
            $valor->getDtCadastro(), 'd/m/Y H:i'
        )
        ?></b></br>
    Cadastrado por: <b><?= Valida::Resumi($usuario->getCoPessoa()->getNoPessoa(), 30); ?></b></br>
</div>