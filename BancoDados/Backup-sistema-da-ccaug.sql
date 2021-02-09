-- Atualizado em: 08/02/2021 17:56:23
-- AMBIENTE: http://localhost/ccaug/
-- BANCO: ccaug100


DROP TABLE IF EXISTS TB_ACESSO;


CREATE TABLE `TB_ACESSO` (
  `co_acesso` int(11) NOT NULL AUTO_INCREMENT,
  `ds_session_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_inicio_acesso` datetime DEFAULT NULL,
  `dt_fim_acesso` datetime DEFAULT NULL,
  `tp_situacao` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'A - Ativo / F - Finalizado',
  `co_usuario` int(10) NOT NULL,
  `co_trafego` int(11) NOT NULL,
  PRIMARY KEY (`co_acesso`,`co_usuario`,`co_trafego`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_ACESSO VALUES('1','b6g2q21d8pp65ajjlie5dgc5ia','2021-02-08 11:17:38','2021-02-08 13:24:32','F','1','1');

INSERT INTO TB_ACESSO VALUES('2','b6g2q21d8pp65ajjlie5dgc5ia','2021-02-08 15:22:12','2021-02-08 16:14:02','F','1','2');

INSERT INTO TB_ACESSO VALUES('3','b6g2q21d8pp65ajjlie5dgc5ia','2021-02-08 16:18:19','2021-02-08 18:26:23','A','1','3');




DROP TABLE IF EXISTS TB_ALUNO;


CREATE TABLE `TB_ALUNO` (
  `co_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` datetime DEFAULT NULL,
  `st_status` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'S' COMMENT 'S - Sim / N - Não',
  `co_pessoa` int(11) NOT NULL,
  PRIMARY KEY (`co_aluno`,`co_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_ALUNO VALUES('1','2021-02-08 11:45:41','S','2');

INSERT INTO TB_ALUNO VALUES('2','2021-02-08 12:15:44','S','3');

INSERT INTO TB_ALUNO VALUES('3','2021-02-08 12:40:09','S','4');

INSERT INTO TB_ALUNO VALUES('5','2021-02-08 12:49:15','S','6');




DROP TABLE IF EXISTS TB_ANOTACAO;


CREATE TABLE `TB_ANOTACAO` (
  `co_anotacao` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` datetime DEFAULT NULL,
  `ds_observacao` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_titulo` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_historia` int(11) NOT NULL,
  PRIMARY KEY (`co_anotacao`,`co_historia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





DROP TABLE IF EXISTS TB_AUDITORIA;


CREATE TABLE `TB_AUDITORIA` (
  `co_auditoria` int(11) NOT NULL AUTO_INCREMENT,
  `dt_realizado` datetime DEFAULT NULL,
  `ds_perfil_usuario` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_usuario` int(10) NOT NULL,
  PRIMARY KEY (`co_auditoria`,`co_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS TB_AUDITORIA_ITENS;


CREATE TABLE `TB_AUDITORIA_ITENS` (
  `co_auditoria_itens` int(11) NOT NULL AUTO_INCREMENT,
  `ds_item_anterior` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_item_atual` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_campo` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_auditoria_tabela` int(11) NOT NULL,
  PRIMARY KEY (`co_auditoria_itens`,`co_auditoria_tabela`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



DROP TABLE IF EXISTS TB_AUDITORIA_TABELA;


CREATE TABLE `TB_AUDITORIA_TABELA` (
  `co_auditoria_tabela` int(11) NOT NULL AUTO_INCREMENT,
  `no_tabela` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tp_operacao` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_registro` int(11) DEFAULT NULL,
  `co_auditoria` int(11) NOT NULL,
  PRIMARY KEY (`co_auditoria_tabela`,`co_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE IF EXISTS TB_CONTATO;


CREATE TABLE `TB_CONTATO` (
  `co_contato` int(11) NOT NULL AUTO_INCREMENT,
  `nu_tel1` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nu_tel2` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nu_tel3` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nu_tel_0800` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_site` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_facebook` varchar(90) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_twitter` varchar(90) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_instagram` varchar(90) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`co_contato`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_CONTATO VALUES('1','61993274991','6130826060','0','','sisccaug@gmail.com','','','','');

INSERT INTO TB_CONTATO VALUES('2','6199555525','','','','alunonotadez@gmail.com','','','','');

INSERT INTO TB_CONTATO VALUES('3','6525592324','','','','alunonotadez@gmail.com','','','','');

INSERT INTO TB_CONTATO VALUES('4','4564651341','','','','carlossquish@gmail.com','','','','');

INSERT INTO TB_CONTATO VALUES('6','5456465446','','','','leninha.kff@gmail.com','','','','');




DROP TABLE IF EXISTS TB_CONTROLLER;


CREATE TABLE `TB_CONTROLLER` (
  `co_controller` int(11) NOT NULL AUTO_INCREMENT,
  `no_controller` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_class_icon` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Classe do Ícone',
  PRIMARY KEY (`co_controller`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_CONTROLLER VALUES('1','Gestão','clip-data');

INSERT INTO TB_CONTROLLER VALUES('2','Auditoria','fa fa-crosshairs');

INSERT INTO TB_CONTROLLER VALUES('3','Acesso','clip-connection-2');

INSERT INTO TB_CONTROLLER VALUES('4','Funcionalidade','fa fa-outdent');

INSERT INTO TB_CONTROLLER VALUES('5','Perfil','clip-stack-empty');

INSERT INTO TB_CONTROLLER VALUES('6','Usuário','fa fa-group');

INSERT INTO TB_CONTROLLER VALUES('7','Visita','clip-airplane');

INSERT INTO TB_CONTROLLER VALUES('8','Relatorio','fa fa-clipboard');

INSERT INTO TB_CONTROLLER VALUES('9','Suporte','fa fa-envelope');

INSERT INTO TB_CONTROLLER VALUES('10','Curso','clip-stack-2');




DROP TABLE IF EXISTS TB_CRONS;


CREATE TABLE `TB_CRONS` (
  `co_cron` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` datetime DEFAULT NULL,
  `no_cron` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_sql` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`co_cron`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





DROP TABLE IF EXISTS TB_CURSO;


CREATE TABLE `TB_CURSO` (
  `co_curso` int(11) NOT NULL AUTO_INCREMENT,
  `ds_descricao` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`co_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_CURSO VALUES('1','<h3>Conhe&ccedil;a esta Forma&ccedil;&atilde;o!</h3>
\n
\n<div class=\"conteudo\"><strong>Objetivos</strong>:
\n
\n<ul>
\n	<li>Conhecer m&eacute;todos para elaborar prega&ccedil;&otilde;es sem dificuldades</li>
\n	<li>Saber onde encontrar fontes seguras para montar sua prega&ccedil;&atilde;o</li>
\n	<li>Fazer aprofundamento em mensagens b&iacute;blicas</li>
\n	<li>Controlar o nervosismo ao falar em p&uacute;blico</li>
\n	<li>Aprender t&eacute;cnicas de prega&ccedil;&atilde;o para uma boa comunica&ccedil;&atilde;o</li>
\n	<li>Sabe como fazer prega&ccedil;&otilde;es em diversos meios de evangeliza&ccedil;&atilde;o</li>
\n	<li>Aprender de forma interativa e din&acirc;mica</li>
\n	<li>Aprender e partilhar conhecimentos com pessoas de v&aacute;rias localidades do Brasil</li>
\n	<li>Conhecer e estudar com pessoas que desejam assim como voc&ecirc; aprender e aprofundar mais nas coisas de Deus</li>
\n	<li>Tirar suas d&uacute;vidas diretamente com os formadores</li>
\n</ul>
\n</div>
\n
\n<div>&nbsp;</div>
\n
\n<div><strong>Modalidade</strong>: realizado &aacute; distancia, mas com uma metodologia de uma forma&ccedil;&atilde;o interativa e din&acirc;mica.</div>
\n
\n<div>&nbsp;</div>
\n
\n<div><strong>Destinat&aacute;rios</strong>: Pessoas que sentem o chamado para prega&ccedil;&atilde;o, ou deseja conhecer mais sobre o minist&eacute;rio.</div>
\n
\n<div>&nbsp;</div>
\n
\n<div><strong>Carga hor&aacute;ria</strong>: 12 horas.</div>
\n
\n<div>&nbsp;</div>
\n
\n<div><strong>Per&iacute;odo de realiza&ccedil;&atilde;o</strong>: 02/03 a 18/03 de 2021 &ndash; 20h00, (verificar dias)</div>
\n
\n<div>&nbsp;</div>','2021-02-08 11:35:36');

INSERT INTO TB_CURSO VALUES('2','<p style=\"text-align:center\"><img alt=\"\" class=\"image2\" height=\"366\" src=\"http://localhost/ccaug/uploads/Imagens/images/dons_carismaticos.png\" width=\"650\" /></p>
\n
\n<div class=\"col-12 col-lg-8\">
\n<h3>Conhe&ccedil;a esta Forma&ccedil;&atilde;o!</h3>
\n
\n<div class=\"conteudo\"><strong>Objetivos</strong>:
\n
\n<ul>
\n	<li>Conhecer os dons carism&aacute;ticos conforme os ensinamentos da Igreja</li>
\n	<li>Aprimorar e fazer a descoberta de seus dons</li>
\n	<li>Entender como exercer os dons com mais seguran&ccedil;a entendendo cada um deles</li>
\n	<li>Aperfei&ccedil;oar seus minist&eacute;rios</li>
\n	<li>Aprender de forma interativa e din&acirc;mica</li>
\n	<li>Aprender e partilhar conhecimentos com pessoas de v&aacute;rias localidades do Brasil</li>
\n	<li>Conhecer e estudar com pessoas que desejam assim como voc&ecirc; aprender e aprofundar mais nas coisas de Deus</li>
\n	<li>Tirar suas d&uacute;vidas diretamente com os formadores</li>
\n</ul>
\n</div>
\n
\n<div>&nbsp;</div>
\n
\n<div><strong>Modalidade</strong>: realizado &aacute; distancia, mas com uma metodologia de uma forma&ccedil;&atilde;o interativa e din&acirc;mica.</div>
\n
\n<div>&nbsp;</div>
\n
\n<div><strong>Destinat&aacute;rios</strong>: Pessoas que deseja descobrir seus dons e aprimorar seus minist&eacute;rios o minist&eacute;rio.</div>
\n
\n<div>&nbsp;</div>
\n
\n<div><strong>Carga hor&aacute;ria</strong>: 12 horas.</div>
\n
\n<div>&nbsp;</div>
\n
\n<div><strong>Per&iacute;odo de realiza&ccedil;&atilde;o</strong>: 02/03 a 18/03 de 2021 &ndash; 20h00, Ter&ccedil;a e Quinta (dias a confirmar)</div>
\n
\n<div>&nbsp;</div>
\n
\n<div><strong>Investimento</strong>: Gratuito.</div>
\n</div>','2021-02-08 15:24:57');




DROP TABLE IF EXISTS TB_ENDERECO;


CREATE TABLE `TB_ENDERECO` (
  `co_endereco` int(11) NOT NULL AUTO_INCREMENT,
  `ds_endereco` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_complemento` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_bairro` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nu_cep` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_cidade` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sg_uf` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`co_endereco`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_ENDERECO VALUES('1','qr 10 casa 10','','Samambaia','72111111','Brasília','DF');

INSERT INTO TB_ENDERECO VALUES('2','','','','','','');

INSERT INTO TB_ENDERECO VALUES('3','QR 403 Conjunto 10','','Samambaia Norte (Samambaia)','72319111','Brasília','DF');

INSERT INTO TB_ENDERECO VALUES('4','','','','','','');

INSERT INTO TB_ENDERECO VALUES('6','','','','','','');




DROP TABLE IF EXISTS TB_FUNCIONALIDADE;


CREATE TABLE `TB_FUNCIONALIDADE` (
  `co_funcionalidade` int(11) NOT NULL AUTO_INCREMENT,
  `no_funcionalidade` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `ds_action` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `st_status` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'A' COMMENT '''A - Ativo / I - Inativo''',
  `st_menu` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'S' COMMENT 'S - Sim / N - Não (Se apresenta no menu)',
  `co_controller` int(11) NOT NULL,
  PRIMARY KEY (`co_funcionalidade`,`co_controller`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_FUNCIONALIDADE VALUES('1','Perfil Master','PerfilMaster','A','S','0');

INSERT INTO TB_FUNCIONALIDADE VALUES('2','Auditoria Listar','ListarAuditoria','A','S','2');

INSERT INTO TB_FUNCIONALIDADE VALUES('3','Auditoria Detalhar','DetalharAuditoria','A','N','2');

INSERT INTO TB_FUNCIONALIDADE VALUES('4','Usuario Cadastrar','CadastroUsuario','A','N','6');

INSERT INTO TB_FUNCIONALIDADE VALUES('5','Usuario Listar','ListarUsuario','A','S','6');

INSERT INTO TB_FUNCIONALIDADE VALUES('6','Meu Perfil Usuario','MeuPerfilUsuario','A','S','6');

INSERT INTO TB_FUNCIONALIDADE VALUES('7','Perfil Listar','ListarPerfil','A','S','5');

INSERT INTO TB_FUNCIONALIDADE VALUES('8','Perfil Cadastrar','CadastroPerfil','A','S','5');

INSERT INTO TB_FUNCIONALIDADE VALUES('9','Funcionalidade Listar','ListarFuncionalidade','A','S','4');

INSERT INTO TB_FUNCIONALIDADE VALUES('10','Funcionalidade Cadastrar','CadastroFuncionalidade','A','S','4');

INSERT INTO TB_FUNCIONALIDADE VALUES('11','Troca Senha Usuario','TrocaSenhaUsuario','A','S','6');

INSERT INTO TB_FUNCIONALIDADE VALUES('13','Listar Visita','ListarVisita','A','S','7');

INSERT INTO TB_FUNCIONALIDADE VALUES('14','Config Gestao','ConfigGestao','A','S','1');

INSERT INTO TB_FUNCIONALIDADE VALUES('15','Gerar Entidades Gestao','GerarEntidadesGestao','A','S','1');

INSERT INTO TB_FUNCIONALIDADE VALUES('16','Gerar Backup Gestao','GerarBackupGestao','A','S','1');

INSERT INTO TB_FUNCIONALIDADE VALUES('17','Listar Acesso','ListarAcesso','A','S','3');

INSERT INTO TB_FUNCIONALIDADE VALUES('22','Pre Projeto Gestao','PreProjetoGestao','A','S','1');

INSERT INTO TB_FUNCIONALIDADE VALUES('23','Acompanhar Projeto Gestao','AcompanharProjetoGestao','A','N','1');

INSERT INTO TB_FUNCIONALIDADE VALUES('24','Limpar Banco Gestao','LimparBancoGestao','A','S','1');

INSERT INTO TB_FUNCIONALIDADE VALUES('28','Crons','CronsGestao','A','S','1');

INSERT INTO TB_FUNCIONALIDADE VALUES('29','Minificação','MinificacaoGestao','A','S','1');

INSERT INTO TB_FUNCIONALIDADE VALUES('30','Gráfico','GraficoRelatorio','A','S','8');

INSERT INTO TB_FUNCIONALIDADE VALUES('31','Listar Suporte','ListarSuporte','A','S','9');

INSERT INTO TB_FUNCIONALIDADE VALUES('32','Cadastro Suporte','CadastroSuporte','A','N','9');

INSERT INTO TB_FUNCIONALIDADE VALUES('33','Deleta Suporte','DeletaSuporte','A','N','9');

INSERT INTO TB_FUNCIONALIDADE VALUES('34','Listar Curso','ListarCurso','A','S','10');

INSERT INTO TB_FUNCIONALIDADE VALUES('35','Cadastro Curso','CadastroCurso','A','N','10');

INSERT INTO TB_FUNCIONALIDADE VALUES('36','Historico Curso','HistoricoCurso','A','N','10');

INSERT INTO TB_FUNCIONALIDADE VALUES('37','Listar Turma','ListarTurma','A','N','10');

INSERT INTO TB_FUNCIONALIDADE VALUES('38','Cadastro Turma','CadastroTurma','A','N','10');

INSERT INTO TB_FUNCIONALIDADE VALUES('39','Listar Aluno','ListarAluno','A','N','10');

INSERT INTO TB_FUNCIONALIDADE VALUES('40','Notificação PagSeguro','NotificacaoPagSeguro','A','S','10');




DROP TABLE IF EXISTS TB_HISTORIA;


CREATE TABLE `TB_HISTORIA` (
  `co_historia` int(11) NOT NULL AUTO_INCREMENT,
  `ds_titulo` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_observacao` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL,
  `st_situacao` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT 'N - Não iniciada / I - Iniciada / C - Concluida',
  `co_sessao` int(11) NOT NULL,
  PRIMARY KEY (`co_historia`,`co_sessao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





DROP TABLE IF EXISTS TB_HISTORICO_HISTORIA;


CREATE TABLE `TB_HISTORICO_HISTORIA` (
  `co_historico_historia` int(11) NOT NULL AUTO_INCREMENT,
  `nu_esforco` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nu_esforco_restante` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  `co_historia` int(11) NOT NULL,
  PRIMARY KEY (`co_historico_historia`,`co_historia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





DROP TABLE IF EXISTS TB_HISTORICO_PAGAMENTO;


CREATE TABLE `TB_HISTORICO_PAGAMENTO` (
  `co_historico_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` datetime DEFAULT NULL,
  `ds_acao` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_usuario` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `st_pagamento` int(1) DEFAULT NULL COMMENT 'PENDENTE = 0 / AGUARDANDO_PAGAMENTO = 1 / EM_ANALISE = 2 / PAGO = 3 / DISPONIVEL = 4 / EM_DISPUTA = 5 / DEVOLVIDA = 6 / CANCELADA = 7',
  `co_pagamento` int(11) NOT NULL,
  PRIMARY KEY (`co_historico_pagamento`,`co_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_HISTORICO_PAGAMENTO VALUES('1','2021-02-08 11:45:41','Inicia o pagamento','Usuário SisEnovus Iniciou o pagamento','0','1');

INSERT INTO TB_HISTORICO_PAGAMENTO VALUES('2','2021-02-08 10:45:45','Mudou o Status do pagamento para Aguardando pagamento','Retorno da operadora do pagamento','1','1');

INSERT INTO TB_HISTORICO_PAGAMENTO VALUES('3','2021-02-08 10:49:58','Mudou o Status do pagamento para Pago ','Retorno da operadora do pagamento','3','1');

INSERT INTO TB_HISTORICO_PAGAMENTO VALUES('4','2021-02-08 12:15:44','Inicia o pagamento','Usuário SisEnovus Iniciou o pagamento','0','2');

INSERT INTO TB_HISTORICO_PAGAMENTO VALUES('5','2021-02-08 11:15:46','Mudou o Status do pagamento para Em análise','Retorno da operadora do pagamento','2','2');

INSERT INTO TB_HISTORICO_PAGAMENTO VALUES('6','2021-02-08 12:40:09','Inicia o pagamento','Usuário SisEnovus Iniciou o pagamento','0','3');

INSERT INTO TB_HISTORICO_PAGAMENTO VALUES('7','2021-02-08 11:40:11','Mudou o Status do pagamento para Aguardando pagamento','Retorno da operadora do pagamento','1','3');

INSERT INTO TB_HISTORICO_PAGAMENTO VALUES('9','2021-02-08 12:49:15','Inicia o pagamento','Usuário SisEnovus Iniciou o pagamento','0','5');

INSERT INTO TB_HISTORICO_PAGAMENTO VALUES('10','2021-02-08 11:49:17','Mudou o Status do pagamento para Aguardando pagamento','Retorno da operadora do pagamento','1','5');




DROP TABLE IF EXISTS TB_HISTORICO_SUPORTE;


CREATE TABLE `TB_HISTORICO_SUPORTE` (
  `co_historico_suporte` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` datetime DEFAULT NULL,
  `ds_mensagem` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `st_lido` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N' COMMENT 'S - Sim / N - Não',
  `co_suporte` int(11) NOT NULL,
  `co_usuario` int(10) NOT NULL,
  `co_imagem` int(10) NOT NULL COMMENT 'Chave do Anexo.',
  PRIMARY KEY (`co_historico_suporte`,`co_suporte`,`co_usuario`,`co_imagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





DROP TABLE IF EXISTS TB_IMAGEM;


CREATE TABLE `TB_IMAGEM` (
  `co_imagem` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ds_caminho` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `co_tipo_imagem` int(11) NOT NULL,
  PRIMARY KEY (`co_imagem`,`co_tipo_imagem`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_IMAGEM VALUES('1','leonardo-m-c-bessa-56e8920c23ab66.jpg','1');




DROP TABLE IF EXISTS TB_INSCRICAO;


CREATE TABLE `TB_INSCRICAO` (
  `co_inscricao` int(11) NOT NULL AUTO_INCREMENT,
  `co_turma` int(11) NOT NULL,
  `co_aluno` int(11) NOT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`co_inscricao`,`co_turma`,`co_aluno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_INSCRICAO VALUES('1','1','1','2021-02-08 11:45:41');

INSERT INTO TB_INSCRICAO VALUES('2','1','2','2021-02-08 12:15:44');

INSERT INTO TB_INSCRICAO VALUES('3','1','3','2021-02-08 12:40:09');

INSERT INTO TB_INSCRICAO VALUES('5','1','5','2021-02-08 12:49:15');




DROP TABLE IF EXISTS TB_MODULO;


CREATE TABLE `TB_MODULO` (
  `co_modulo` int(11) NOT NULL AUTO_INCREMENT,
  `no_modulo` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  `co_projeto` int(11) NOT NULL,
  PRIMARY KEY (`co_modulo`,`co_projeto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





DROP TABLE IF EXISTS TB_PAGAMENTO;


CREATE TABLE `TB_PAGAMENTO` (
  `co_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `nu_valor_total` decimal(8,2) DEFAULT NULL COMMENT 'Valor total da Inscrição',
  `nu_valor_pago` decimal(8,2) DEFAULT NULL COMMENT 'Valor de Recebimento da pagSeguro',
  `nu_valor_desconto` decimal(8,2) DEFAULT NULL COMMENT 'Valor de Desconto da PagSeguro',
  `dt_pago` datetime DEFAULT NULL COMMENT 'Data que confirmou o pagamento\n',
  `ds_code_transacao` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Código de Transação do PagSeguro',
  `dt_modificado` datetime DEFAULT NULL COMMENT 'Data da Última Modificação',
  `tp_pagamento` int(1) DEFAULT NULL COMMENT 'GRATIS = 0 / DINHEIRO = 1 / CARTAO_DEBITO = 2 / CARTAO_CREDITO = 3 /  DEPOSITO_TRANSFERENCIA = 4 / BOLETO = 5',
  `st_pagamento` int(1) DEFAULT 0 COMMENT 'PENDENTE = 0 / AGUARDANDO_PAGAMENTO = 1 / EM_ANALISE = 2 / PAGO = 3 / DISPONIVEL = 4 / EM_DISPUTA = 5 / DEVOLVIDA = 6 / CANCELADA = 7',
  `ds_link_boleto` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_observacao` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_inscricao` int(11) NOT NULL,
  PRIMARY KEY (`co_pagamento`,`co_inscricao`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_PAGAMENTO VALUES('1','29.99','28.39','1.60','2021-02-08 10:49:58','6FF01E3E-8846-440E-B4F9-2DC27833D1B6','2021-02-08 10:49:58','5','3','https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=2a3bb34d7ec088022b08d11d82b3d0f82f6980e0c0bf0970b754208093840f698dfb3fc43e605dc2','','1');

INSERT INTO TB_PAGAMENTO VALUES('2','29.99','27.51','2.48',null,'DF2AAD11-0F5C-4630-8171-DE287424A32D','2021-02-08 11:15:46','3','2','','','2');

INSERT INTO TB_PAGAMENTO VALUES('3','29.99','28.39','1.60',null,'2030B963-4913-4AA1-A802-E88091FFF36E','2021-02-08 11:40:11','4','1','https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=cdf38438fec01e80935e287819f79ec595e3c402ad0eafbb2914f13450473e8c87ce65ebdc0773e7','','3');

INSERT INTO TB_PAGAMENTO VALUES('5','29.99','28.39','1.60',null,'5B4C74C7-E419-4CAF-97E9-4E7B7C3DDF68','2021-02-08 11:49:17','4','1','https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=efc372c7ab24c91b499d97bb174db4ee2a2f7481ce0d3e514e1da7675ca81dc9f6237a702c58037d','','5');




DROP TABLE IF EXISTS TB_PAGINA;


CREATE TABLE `TB_PAGINA` (
  `co_pagina` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` datetime DEFAULT NULL,
  `ds_titulo_url_amigavel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Url amigável da página',
  `nu_visualizacao` int(11) DEFAULT NULL,
  `nu_usuario` int(11) DEFAULT NULL COMMENT 'Número de usuário que visitou a página',
  PRIMARY KEY (`co_pagina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





DROP TABLE IF EXISTS TB_PAGINA_VISITA;


CREATE TABLE `TB_PAGINA_VISITA` (
  `co_pagina_visita` int(11) NOT NULL AUTO_INCREMENT,
  `co_visita` int(11) NOT NULL,
  `co_pagina` int(11) NOT NULL,
  PRIMARY KEY (`co_pagina_visita`,`co_visita`,`co_pagina`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





DROP TABLE IF EXISTS TB_PERFIL;


CREATE TABLE `TB_PERFIL` (
  `co_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `no_perfil` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Nome do Perfil',
  `st_status` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'A' COMMENT '''A - Ativo / I - Inativo''',
  PRIMARY KEY (`co_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_PERFIL VALUES('1','Master','A');

INSERT INTO TB_PERFIL VALUES('2','Fundador','A');




DROP TABLE IF EXISTS TB_PERFIL_FUNCIONALIDADE;


CREATE TABLE `TB_PERFIL_FUNCIONALIDADE` (
  `co_perfil_funcionalidade` int(11) NOT NULL AUTO_INCREMENT,
  `co_funcionalidade` int(11) NOT NULL,
  `co_perfil` int(11) NOT NULL,
  PRIMARY KEY (`co_perfil_funcionalidade`,`co_funcionalidade`,`co_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('1','1','1');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('2','34','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('3','33','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('4','32','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('5','31','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('6','17','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('7','11','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('8','6','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('9','5','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('10','4','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('11','35','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('12','36','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('13','37','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('14','38','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('15','39','2');

INSERT INTO TB_PERFIL_FUNCIONALIDADE VALUES('16','40','2');




DROP TABLE IF EXISTS TB_PESSOA;


CREATE TABLE `TB_PESSOA` (
  `co_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nu_cpf` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `no_pessoa` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nu_rg` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `st_sexo` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'M - Masculino ou F - Feminino',
  `co_endereco` int(11) NOT NULL,
  `co_contato` int(11) NOT NULL,
  `co_imagem` int(10) NOT NULL,
  PRIMARY KEY (`co_pessoa`,`co_endereco`,`co_contato`,`co_imagem`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_PESSOA VALUES('1','','Usuário SisEnovus','','2016-10-31 00:00:00','2020-10-10','M','1','1','1');

INSERT INTO TB_PESSOA VALUES('2','12345678909','Aluno nota Mil','','2021-02-08 11:45:41',null,'','2','2','0');

INSERT INTO TB_PESSOA VALUES('3','99543885168','Aluno nota Dez','','2021-02-08 12:15:44',null,'','3','3','0');

INSERT INTO TB_PESSOA VALUES('4','12345678909','Lucas Soares','','2021-02-08 12:40:08',null,'','4','4','0');

INSERT INTO TB_PESSOA VALUES('6','12345678909','Lucas Soaresg ert getrh','','2021-02-08 12:49:15',null,'','6','6','0');




DROP TABLE IF EXISTS TB_PROJETO;


CREATE TABLE `TB_PROJETO` (
  `co_projeto` int(11) NOT NULL AUTO_INCREMENT,
  `no_projeto` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`co_projeto`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_PROJETO VALUES('1','Enovus','2020-09-05 11:07:40');




DROP TABLE IF EXISTS TB_SESSAO;


CREATE TABLE `TB_SESSAO` (
  `co_sessao` int(11) NOT NULL AUTO_INCREMENT,
  `no_sessao` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  `co_modulo` int(11) NOT NULL,
  PRIMARY KEY (`co_sessao`,`co_modulo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





DROP TABLE IF EXISTS TB_SUPORTE;


CREATE TABLE `TB_SUPORTE` (
  `co_suporte` int(11) NOT NULL AUTO_INCREMENT,
  `st_status` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'A' COMMENT 'A - Ativa / I - Inativa',
  `dt_cadastro` datetime DEFAULT NULL,
  `ds_assunto` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `st_tipo_assunto` int(1) DEFAULT NULL COMMENT '1 - Sugestão ou Melhorias / 2 - Reclamação / 3 -  Correção no Sistema / 4 - Outros',
  PRIMARY KEY (`co_suporte`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





DROP TABLE IF EXISTS TB_TIPO_IMAGEM;


CREATE TABLE `TB_TIPO_IMAGEM` (
  `co_tipo_imagem` int(11) NOT NULL AUTO_INCREMENT,
  `ds_tipo_imagem` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`co_tipo_imagem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





DROP TABLE IF EXISTS TB_TRAFEGO;


CREATE TABLE `TB_TRAFEGO` (
  `co_trafego` int(11) NOT NULL AUTO_INCREMENT,
  `nu_ip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_pais` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_code_pais` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_uf` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_estado` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_cidade` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_navegador` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_sistema_operacional` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_dispositivo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_agente` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`co_trafego`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_TRAFEGO VALUES('1','127.0.0.1','Desconhecido','Desconhecida','Desconhecida','Desconhecida','Desconhecida','Firefox','Windows 10','Desktop','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0');

INSERT INTO TB_TRAFEGO VALUES('2','127.0.0.1','Desconhecido','Desconhecida','Desconhecida','Desconhecida','Desconhecida','Firefox','Windows 10','Desktop','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0');

INSERT INTO TB_TRAFEGO VALUES('3','127.0.0.1','Desconhecido','Desconhecida','Desconhecida','Desconhecida','Desconhecida','Firefox','Windows 10','Desktop','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0');




DROP TABLE IF EXISTS TB_TURMA;


CREATE TABLE `TB_TURMA` (
  `co_turma` int(11) NOT NULL AUTO_INCREMENT,
  `ds_turma` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  `nu_ano` int(4) DEFAULT NULL,
  `st_status` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'S' COMMENT 'S - Sim / N - Não',
  `dt_inicio` date DEFAULT NULL,
  `dt_fim` date DEFAULT NULL,
  `nu_hora_abertura` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nu_hora_fechamento` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_curso` int(11) NOT NULL,
  PRIMARY KEY (`co_turma`,`co_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_TURMA VALUES('1','2','2021-02-08 11:37:03','2021','S','2021-02-03','2021-02-26','10:00','22:00','1');




DROP TABLE IF EXISTS TB_USUARIO;


CREATE TABLE `TB_USUARIO` (
  `co_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `ds_senha` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ds_code` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Senha criptografada',
  `st_status` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'I' COMMENT '''A - Ativo / I - Inativo''',
  `st_troca_senha` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `dt_cadastro` datetime NOT NULL,
  `co_imagem` int(10) NOT NULL,
  `co_pessoa` int(11) NOT NULL,
  PRIMARY KEY (`co_usuario`,`co_imagem`,`co_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_USUARIO VALUES('1','123456**','TVRJek5EVTJLaW89','A','S','2016-10-31 00:00:00','1','1');




DROP TABLE IF EXISTS TB_USUARIO_PERFIL;


CREATE TABLE `TB_USUARIO_PERFIL` (
  `co_usuario_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `co_usuario` int(10) NOT NULL,
  `co_perfil` int(11) NOT NULL,
  PRIMARY KEY (`co_usuario_perfil`,`co_usuario`,`co_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_USUARIO_PERFIL VALUES('1','1','1');




DROP TABLE IF EXISTS TB_VALOR_CURSO;


CREATE TABLE `TB_VALOR_CURSO` (
  `co_valor_curso` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` datetime DEFAULT NULL,
  `nu_valor` decimal(8,2) DEFAULT NULL,
  `ds_titulo` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nu_carga_horaria` int(3) DEFAULT NULL,
  `nu_duracao` int(3) DEFAULT NULL,
  `st_status` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `st_certificacao` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_objetivo` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_curso` int(11) NOT NULL,
  `co_usuario` int(10) NOT NULL,
  PRIMARY KEY (`co_valor_curso`,`co_curso`,`co_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_VALOR_CURSO VALUES('1','2021-02-08 11:35:36','24.55','CURSO DE PREGADOR','16','2','S','S','Conhecer métodos para elaborar pregações sem dificuldades, Aprender técnicas de pregação para uma boa comunicação...','1','1');

INSERT INTO TB_VALOR_CURSO VALUES('2','2021-02-08 11:35:56','29.99','CURSO DE PREGADOR','16','2','S','S','Conhecer métodos para elaborar pregações sem dificuldades, Aprender técnicas de pregação para uma boa comunicação...','1','1');

INSERT INTO TB_VALOR_CURSO VALUES('3','2021-02-08 15:24:57','0.01','CURSO DE DONS CARISMÁTICOS','12','3','S','S','','2','1');

INSERT INTO TB_VALOR_CURSO VALUES('4','2021-02-08 16:23:23','0.00','CURSO DE DONS CARISMÁTICOS','12','3','S','S','st_gratuito','2','1');

INSERT INTO TB_VALOR_CURSO VALUES('5','2021-02-08 17:12:16','0.00','CURSO DE DONS CARISMÁTICOS','12','3','S','S','Objetivos: Conhecer os dons carismáticos conforme os ensinamentos da Igreja...','2','1');

INSERT INTO TB_VALOR_CURSO VALUES('6','2021-02-08 17:13:47','22.80','CURSO DE PREGADOR','16','2','S','S','Conhecer métodos para elaborar pregações sem dificuldades, Aprender técnicas de pregação para uma boa comunicação...','1','1');

INSERT INTO TB_VALOR_CURSO VALUES('7','2021-02-08 17:15:44','22.80','CURSO DE PREGADOR','16','2','S','S','Conhecer métodos para elaborar pregações sem dificuldades, Aprender técnicas de pregação para uma boa comunicação...','1','1');




DROP TABLE IF EXISTS TB_VISITA;


CREATE TABLE `TB_VISITA` (
  `co_visita` int(11) NOT NULL AUTO_INCREMENT,
  `dt_realizado` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL,
  `nu_visitas` int(11) DEFAULT NULL,
  `co_trafego` int(11) NOT NULL,
  PRIMARY KEY (`co_visita`,`co_trafego`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





