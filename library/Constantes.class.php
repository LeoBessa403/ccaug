<?php

/**
 * Constantes.class [ HELPER ]
 * Classe responável por manipular e validade dados do sistema!
 *
 * @copyright (c) 2018, Leo Bessa
 */
define('CO_ACESSO', 'co_acesso');
define('DS_SESSION_ID', 'ds_session_id');
define('DT_INICIO_ACESSO', 'dt_inicio_acesso');
define('DT_FIM_ACESSO', 'dt_fim_acesso');
define('TP_SITUACAO', 'tp_situacao');
define('DS_NAVEGADOR', 'ds_navegador');
define('DS_SISTEMA_OPERACIONAL', 'ds_sistema_operacional');
define('DS_DISPOSITIVO', 'ds_dispositivo');
define('CO_USUARIO', 'co_usuario');
define('CO_FUNCIONALIDADE', 'co_funcionalidade');
define('CO_AUDITORIA', 'co_auditoria');
define('CO_USUARIO_PERFIL', 'co_usuario_perfil');
define('DS_PERFIL_USUARIO', 'ds_perfil_usuario');
define('CO_AUDITORIA_ITENS', 'co_auditoria_itens');
define('DS_ITEM_ANTERIOR', 'ds_item_anterior');
define('DS_ITEM_ATUAL', 'ds_item_atual');
define('DS_CAMPO', 'ds_campo');
define('CO_AUDITORIA_TABELA', 'co_auditoria_tabela');
define('NO_TABELA', 'no_tabela');
define('TP_OPERACAO', 'tp_operacao');
define('CO_REGISTRO', 'co_registro');
define('ST_STATUS', 'st_status');
define('CO_PESSOA', 'co_pessoa');
define('CO_CONTATO', 'co_contato');
define('NU_TEL1', 'nu_tel1');
define('NU_TEL2', 'nu_tel2');
define('NU_TEL3', 'nu_tel3');
define('NU_TEL_0800', 'nu_tel_0800');
define('NU_TEL_RESPONSAVEL', 'nu_tel_responsavel');
define('DS_EMAIL', 'ds_email');
define('DS_SITE', 'ds_site');
define('DT_CADASTRO', 'dt_cadastro');
define('CO_ENDERECO', 'co_endereco');
define('CO_IMAGEM', 'co_imagem');
define('CO_TIPO_IMAGEM', 'co_tipo_imagem');
define('DS_ENDERECO', 'ds_endereco');
define('DS_COMPLEMENTO', 'ds_complemento');
define('DS_BAIRRO', 'ds_bairro');
define('NU_CEP', 'nu_cep');
define('NO_CIDADE', 'no_cidade');
define('SG_UF', 'sg_uf');
define('NO_FUNCIONALIDADE', 'no_funcionalidade');
define('DS_CAMINHO', 'ds_caminho');
define('CO_PERFIL', 'co_perfil');
define('NO_PERFIL', 'no_perfil');
define('CO_PERFIL_FUNCIONALIDADE', 'co_perfil_funcionalidade');
define('NU_CPF', 'nu_cpf');
define('NO_PESSOA', 'no_pessoa');
define('NU_RG', 'nu_rg');
define('DT_NASCIMENTO', 'dt_nascimento');
define('DT_REALIZADO', 'dt_realizado');
define('ST_SEXO', 'st_sexo');
define('DS_DESCRICAO', 'ds_descricao');
define('DS_LOGIN', 'ds_login');
define('DS_SENHA', 'ds_senha');
define('DS_CODE', 'ds_code');
define('CO_TRAFEGO', 'co_trafego');
define('NU_IP', 'nu_ip');
define('DS_PAIS', 'ds_pais');
define('DS_CODE_PAIS', 'ds_code_pais');
define('DS_UF', 'ds_uf');
define('DS_AGENTE', 'ds_agente');
define('DS_CIDADE', 'ds_cidade');
define('CO_PAGINA_VISITA', 'co_pagina_visita');
define('CO_PAGINA', 'co_pagina');
define('CO_VISITA', 'co_visita');
define('DT_ATUALIZADO', 'dt_atualizado');
define('NU_VISITAS', 'nu_visitas');
define('DS_TITULO_URL_AMIGAVEL', 'ds_titulo_url_amigavel');
define('NU_VISUALIZACAO', 'nu_visualizacao');
define('NU_USUARIO', 'nu_usuario');
define('DS_ESTADO', 'ds_estado');
define('ST_EDICAO', 'st_edicao');
define('ST_TROCA_SENHA', 'st_troca_senha');
define('ST_DADOS_COMPLEMENTARES', 'st_dados_complementares');
define('DS_FACEBOOK', 'ds_facebook');
define('DS_TWITTER', 'ds_twitter');
define('DS_INSTAGRAM', 'ds_instagram');
define('DS_ACTION', 'ds_action');
define('CO_CONTROLLER', 'co_controller');
define('NO_CONTROLLER', 'no_controller');
define('ST_MENU', 'st_menu');
define('DS_CLASS_ICON', 'ds_class_icon');
define('CO_ANOTACAO', 'co_anotacao');
define('CO_HISTORIA', 'co_historia');
define('ST_SITUACAO', 'st_situacao');
define('NU_ESFORCO', 'nu_esforco');
define('NU_ESFORCO_RESTANTE', 'nu_esforco_restante');
define('CO_SESSAO', 'co_sessao');
define('CO_MODULO', 'co_modulo');
define('NO_MODULO', 'no_modulo');
define('CO_PROJETO', 'co_projeto');
define('NO_PROJETO', 'no_projeto');
define('NO_SESSAO', 'no_sessao');
define('DS_TITULO', 'ds_titulo');
define('CO_HISTORICO_HISTORIA', 'co_historico_historia');
define('CO_CRON', 'co_cron');
define('NO_CRON', 'no_cron');
define('DS_SQL', 'ds_sql');
define('DT_MODIFICADO', 'dt_modificado');
define('NU_VALOR_REAL', 'nu_valor_real');
define('DS_LINK_BOLETO', 'ds_link_boleto');
define('DS_CODE_TRANSACAO', 'ds_code_transacao');
define('DT_CONFIRMA_PAGAMENTO', 'dt_confirma_pagamento');
define('CO_SUPORTE', 'co_suporte');
define('DS_ASSUNTO', 'ds_assunto');
define('ST_TIPO_ASSUNTO', 'st_tipo_assunto');
define('CO_HISTORICO_SUPORTE', 'co_historico_suporte');
define('DS_MENSAGEM', 'ds_mensagem');
define('ST_LIDO', 'st_lido');
define('TP_PAGAMENTO', 'tp_pagamento');
define('DS_ACAO', 'ds_acao');
define('DS_USUARIO', 'ds_usuario');





// SERVICES PADRÃO
define('ACESSO_SERVICE', 'AcessoService');
define('AUDITORIA_SERVICE', 'AuditoriaService');
define('AUDITORIA_ITENS_SERVICE', 'AuditoriaItensService');
define('AUDITORIA_TABELA_SERVICE', 'AuditoriaTabelaService');
define('CONTATO_SERVICE', 'ContatoService');
define('ENDERECO_SERVICE', 'EnderecoService');
define('FUNCIONALIDADE_SERVICE', 'FuncionalidadeService');
define('IMAGEM_SERVICE', 'ImagemService');
define('PERFIL_SERVICE', 'PerfilService');
define('PERFIL_FUNCIONALIDADE_SERVICE', 'PerfilFuncionalidadeService');
define('PESSOA_SERVICE', 'PessoaService');
define('USUARIO_SERVICE', 'UsuarioService');
define('USUARIO_PERFIL_SERVICE', 'UsuarioPerfilService');
define('TRAFEGO_SERVICE', 'TrafegoService');
define('PAGINA_SERVICE', 'PaginaService');
define('VISITA_SERVICE', 'VisitaService');
define('PAGINA_VISITA_SERVICE', 'PaginaVisitaService');
define('CONTROLLER_SERVICE', 'ControllerService');
define('ANOTACAO_SERVICE', 'AnotacaoService');
define('HISTORIA_SERVICE', 'HistoriaService');
define('MODULO_SERVICE', 'ModuloService');
define('PROJETO_SERVICE', 'ProjetoService');
define('SESSAO_SERVICE', 'SessaoService');
define('HISTORICO_HISTORIA_SERVICE', 'HistoricoHistoriaService');
define('CRONS_SERVICE', 'CronsService');
define('SUPORTE_SERVICE', 'SuporteService');
define('HISTORICO_SUPORTE_SERVICE', 'HistoricoSuporteService');


// CONSTANTES
define('SUCESSO', 'sucesso');
define('MSG', 'msg');
define('DADOS', 'dados');
define('VALIDOS', 'validos');
define('OBRIGATORIOS', 'obrigatorios');
