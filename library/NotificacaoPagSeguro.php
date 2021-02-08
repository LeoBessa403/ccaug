<?php
require_once 'library/Config.inc.php';

/** @var PagamentoService $PagamentoService */
$PagamentoService = new PagamentoService();
print_r($PagamentoService->notificacaoPagSeguro());

