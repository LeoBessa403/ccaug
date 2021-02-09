-- Atualizado em: 09/02/2021 18:32:12
-- AMBIENTE: http://localhost/ccaug/
-- BANCO: ccaug100

CREATE DATABASE IF NOT EXISTS ccaug100;

USE ccaug100;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_ACESSO VALUES('6','uvulk300kskkoveq0qmoekvvoh','2021-02-09 18:31:53','2021-02-09 19:02:12','A','1','6');




DROP TABLE IF EXISTS TB_ALUNO;


CREATE TABLE `TB_ALUNO` (
  `co_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `dt_cadastro` datetime DEFAULT NULL,
  `st_status` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'S' COMMENT 'S - Sim / N - Não',
  `co_pessoa` int(11) NOT NULL,
  PRIMARY KEY (`co_aluno`,`co_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_AUDITORIA VALUES('38','2021-02-09 18:32:05','Master','1');

INSERT INTO TB_AUDITORIA VALUES('39','2021-02-09 18:32:05','Master','1');

INSERT INTO TB_AUDITORIA VALUES('40','2021-02-09 18:32:09','Master','1');

INSERT INTO TB_AUDITORIA VALUES('41','2021-02-09 18:32:09','Master','1');

INSERT INTO TB_AUDITORIA VALUES('42','2021-02-09 18:32:11','Master','1');

INSERT INTO TB_AUDITORIA VALUES('43','2021-02-09 18:32:12','Master','1');




DROP TABLE IF EXISTS TB_AUDITORIA_ITENS;


CREATE TABLE `TB_AUDITORIA_ITENS` (
  `co_auditoria_itens` int(11) NOT NULL AUTO_INCREMENT,
  `ds_item_anterior` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_item_atual` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ds_campo` varchar(120) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_auditoria_tabela` int(11) NOT NULL,
  PRIMARY KEY (`co_auditoria_itens`,`co_auditoria_tabela`)
) ENGINE=InnoDB AUTO_INCREMENT=2619 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_AUDITORIA_ITENS VALUES('403','1','','co_auditoria_itens','58');

INSERT INTO TB_AUDITORIA_ITENS VALUES('404','3','','ds_item_anterior','58');

INSERT INTO TB_AUDITORIA_ITENS VALUES('405','','','ds_item_atual','58');

INSERT INTO TB_AUDITORIA_ITENS VALUES('406','co_acesso','','ds_campo','58');

INSERT INTO TB_AUDITORIA_ITENS VALUES('407','1','','co_auditoria_tabela','58');

INSERT INTO TB_AUDITORIA_ITENS VALUES('408','2','','co_auditoria_itens','59');

INSERT INTO TB_AUDITORIA_ITENS VALUES('409','b6g2q21d8pp65ajjlie5dgc5ia','','ds_item_anterior','59');

INSERT INTO TB_AUDITORIA_ITENS VALUES('410','','','ds_item_atual','59');

INSERT INTO TB_AUDITORIA_ITENS VALUES('411','ds_session_id','','ds_campo','59');

INSERT INTO TB_AUDITORIA_ITENS VALUES('412','1','','co_auditoria_tabela','59');

INSERT INTO TB_AUDITORIA_ITENS VALUES('413','3','','co_auditoria_itens','60');

INSERT INTO TB_AUDITORIA_ITENS VALUES('414','2021-02-08 16:18:19','','ds_item_anterior','60');

INSERT INTO TB_AUDITORIA_ITENS VALUES('415','','','ds_item_atual','60');

INSERT INTO TB_AUDITORIA_ITENS VALUES('416','dt_inicio_acesso','','ds_campo','60');

INSERT INTO TB_AUDITORIA_ITENS VALUES('417','1','','co_auditoria_tabela','60');

INSERT INTO TB_AUDITORIA_ITENS VALUES('418','4','','co_auditoria_itens','61');

INSERT INTO TB_AUDITORIA_ITENS VALUES('419','2021-02-08 18:26:23','','ds_item_anterior','61');

INSERT INTO TB_AUDITORIA_ITENS VALUES('420','','','ds_item_atual','61');

INSERT INTO TB_AUDITORIA_ITENS VALUES('421','dt_fim_acesso','','ds_campo','61');

INSERT INTO TB_AUDITORIA_ITENS VALUES('422','1','','co_auditoria_tabela','61');

INSERT INTO TB_AUDITORIA_ITENS VALUES('423','5','','co_auditoria_itens','62');

INSERT INTO TB_AUDITORIA_ITENS VALUES('424','A','','ds_item_anterior','62');

INSERT INTO TB_AUDITORIA_ITENS VALUES('425','F','','ds_item_atual','62');

INSERT INTO TB_AUDITORIA_ITENS VALUES('426','tp_situacao','','ds_campo','62');

INSERT INTO TB_AUDITORIA_ITENS VALUES('427','1','','co_auditoria_tabela','62');

INSERT INTO TB_AUDITORIA_ITENS VALUES('428','6','','co_auditoria_itens','63');

INSERT INTO TB_AUDITORIA_ITENS VALUES('429','1','','ds_item_anterior','63');

INSERT INTO TB_AUDITORIA_ITENS VALUES('430','','','ds_item_atual','63');

INSERT INTO TB_AUDITORIA_ITENS VALUES('431','co_usuario','','ds_campo','63');

INSERT INTO TB_AUDITORIA_ITENS VALUES('432','1','','co_auditoria_tabela','63');

INSERT INTO TB_AUDITORIA_ITENS VALUES('433','7','','co_auditoria_itens','64');

INSERT INTO TB_AUDITORIA_ITENS VALUES('434','3','','ds_item_anterior','64');

INSERT INTO TB_AUDITORIA_ITENS VALUES('435','','','ds_item_atual','64');

INSERT INTO TB_AUDITORIA_ITENS VALUES('436','co_trafego','','ds_campo','64');

INSERT INTO TB_AUDITORIA_ITENS VALUES('437','1','','co_auditoria_tabela','64');

INSERT INTO TB_AUDITORIA_ITENS VALUES('438','8','','co_auditoria_itens','65');

INSERT INTO TB_AUDITORIA_ITENS VALUES('439','','','ds_item_anterior','65');

INSERT INTO TB_AUDITORIA_ITENS VALUES('440','Firefox','','ds_item_atual','65');

INSERT INTO TB_AUDITORIA_ITENS VALUES('441','ds_navegador','','ds_campo','65');

INSERT INTO TB_AUDITORIA_ITENS VALUES('442','2','','co_auditoria_tabela','65');

INSERT INTO TB_AUDITORIA_ITENS VALUES('443','9','','co_auditoria_itens','66');

INSERT INTO TB_AUDITORIA_ITENS VALUES('444','','','ds_item_anterior','66');

INSERT INTO TB_AUDITORIA_ITENS VALUES('445','Windows 10','','ds_item_atual','66');

INSERT INTO TB_AUDITORIA_ITENS VALUES('446','ds_sistema_operacional','','ds_campo','66');

INSERT INTO TB_AUDITORIA_ITENS VALUES('447','2','','co_auditoria_tabela','66');

INSERT INTO TB_AUDITORIA_ITENS VALUES('448','10','','co_auditoria_itens','67');

INSERT INTO TB_AUDITORIA_ITENS VALUES('449','','','ds_item_anterior','67');

INSERT INTO TB_AUDITORIA_ITENS VALUES('450','Desktop','','ds_item_atual','67');

INSERT INTO TB_AUDITORIA_ITENS VALUES('451','ds_dispositivo','','ds_campo','67');

INSERT INTO TB_AUDITORIA_ITENS VALUES('452','2','','co_auditoria_tabela','67');

INSERT INTO TB_AUDITORIA_ITENS VALUES('453','11','','co_auditoria_itens','68');

INSERT INTO TB_AUDITORIA_ITENS VALUES('454','','','ds_item_anterior','68');

INSERT INTO TB_AUDITORIA_ITENS VALUES('455','127.0.0.1','','ds_item_atual','68');

INSERT INTO TB_AUDITORIA_ITENS VALUES('456','nu_ip','','ds_campo','68');

INSERT INTO TB_AUDITORIA_ITENS VALUES('457','2','','co_auditoria_tabela','68');

INSERT INTO TB_AUDITORIA_ITENS VALUES('458','12','','co_auditoria_itens','69');

INSERT INTO TB_AUDITORIA_ITENS VALUES('459','','','ds_item_anterior','69');

INSERT INTO TB_AUDITORIA_ITENS VALUES('460','Desconhecido','','ds_item_atual','69');

INSERT INTO TB_AUDITORIA_ITENS VALUES('461','ds_pais','','ds_campo','69');

INSERT INTO TB_AUDITORIA_ITENS VALUES('462','2','','co_auditoria_tabela','69');

INSERT INTO TB_AUDITORIA_ITENS VALUES('463','13','','co_auditoria_itens','70');

INSERT INTO TB_AUDITORIA_ITENS VALUES('464','','','ds_item_anterior','70');

INSERT INTO TB_AUDITORIA_ITENS VALUES('465','Desconhecida','','ds_item_atual','70');

INSERT INTO TB_AUDITORIA_ITENS VALUES('466','ds_code_pais','','ds_campo','70');

INSERT INTO TB_AUDITORIA_ITENS VALUES('467','2','','co_auditoria_tabela','70');

INSERT INTO TB_AUDITORIA_ITENS VALUES('468','14','','co_auditoria_itens','71');

INSERT INTO TB_AUDITORIA_ITENS VALUES('469','','','ds_item_anterior','71');

INSERT INTO TB_AUDITORIA_ITENS VALUES('470','Desconhecida','','ds_item_atual','71');

INSERT INTO TB_AUDITORIA_ITENS VALUES('471','ds_estado','','ds_campo','71');

INSERT INTO TB_AUDITORIA_ITENS VALUES('472','2','','co_auditoria_tabela','71');

INSERT INTO TB_AUDITORIA_ITENS VALUES('473','15','','co_auditoria_itens','72');

INSERT INTO TB_AUDITORIA_ITENS VALUES('474','','','ds_item_anterior','72');

INSERT INTO TB_AUDITORIA_ITENS VALUES('475','Desconhecida','','ds_item_atual','72');

INSERT INTO TB_AUDITORIA_ITENS VALUES('476','ds_uf','','ds_campo','72');

INSERT INTO TB_AUDITORIA_ITENS VALUES('477','2','','co_auditoria_tabela','72');

INSERT INTO TB_AUDITORIA_ITENS VALUES('478','16','','co_auditoria_itens','73');

INSERT INTO TB_AUDITORIA_ITENS VALUES('479','','','ds_item_anterior','73');

INSERT INTO TB_AUDITORIA_ITENS VALUES('480','Desconhecida','','ds_item_atual','73');

INSERT INTO TB_AUDITORIA_ITENS VALUES('481','ds_cidade','','ds_campo','73');

INSERT INTO TB_AUDITORIA_ITENS VALUES('482','2','','co_auditoria_tabela','73');

INSERT INTO TB_AUDITORIA_ITENS VALUES('483','17','','co_auditoria_itens','74');

INSERT INTO TB_AUDITORIA_ITENS VALUES('484','','','ds_item_anterior','74');

INSERT INTO TB_AUDITORIA_ITENS VALUES('485','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','','ds_item_atual','74');

INSERT INTO TB_AUDITORIA_ITENS VALUES('486','ds_agente','','ds_campo','74');

INSERT INTO TB_AUDITORIA_ITENS VALUES('487','2','','co_auditoria_tabela','74');

INSERT INTO TB_AUDITORIA_ITENS VALUES('488','18','','co_auditoria_itens','75');

INSERT INTO TB_AUDITORIA_ITENS VALUES('489','','','ds_item_anterior','75');

INSERT INTO TB_AUDITORIA_ITENS VALUES('490','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_atual','75');

INSERT INTO TB_AUDITORIA_ITENS VALUES('491','ds_session_id','','ds_campo','75');

INSERT INTO TB_AUDITORIA_ITENS VALUES('492','3','','co_auditoria_tabela','75');

INSERT INTO TB_AUDITORIA_ITENS VALUES('493','19','','co_auditoria_itens','76');

INSERT INTO TB_AUDITORIA_ITENS VALUES('494','','','ds_item_anterior','76');

INSERT INTO TB_AUDITORIA_ITENS VALUES('495','1','','ds_item_atual','76');

INSERT INTO TB_AUDITORIA_ITENS VALUES('496','co_usuario','','ds_campo','76');

INSERT INTO TB_AUDITORIA_ITENS VALUES('497','3','','co_auditoria_tabela','76');

INSERT INTO TB_AUDITORIA_ITENS VALUES('498','20','','co_auditoria_itens','77');

INSERT INTO TB_AUDITORIA_ITENS VALUES('499','','','ds_item_anterior','77');

INSERT INTO TB_AUDITORIA_ITENS VALUES('500','A','','ds_item_atual','77');

INSERT INTO TB_AUDITORIA_ITENS VALUES('501','tp_situacao','','ds_campo','77');

INSERT INTO TB_AUDITORIA_ITENS VALUES('502','3','','co_auditoria_tabela','77');

INSERT INTO TB_AUDITORIA_ITENS VALUES('503','21','','co_auditoria_itens','78');

INSERT INTO TB_AUDITORIA_ITENS VALUES('504','','','ds_item_anterior','78');

INSERT INTO TB_AUDITORIA_ITENS VALUES('505','4','','ds_item_atual','78');

INSERT INTO TB_AUDITORIA_ITENS VALUES('506','co_trafego','','ds_campo','78');

INSERT INTO TB_AUDITORIA_ITENS VALUES('507','3','','co_auditoria_tabela','78');

INSERT INTO TB_AUDITORIA_ITENS VALUES('508','22','','co_auditoria_itens','79');

INSERT INTO TB_AUDITORIA_ITENS VALUES('509','','','ds_item_anterior','79');

INSERT INTO TB_AUDITORIA_ITENS VALUES('510','2021-02-09 12:14:11','','ds_item_atual','79');

INSERT INTO TB_AUDITORIA_ITENS VALUES('511','dt_fim_acesso','','ds_campo','79');

INSERT INTO TB_AUDITORIA_ITENS VALUES('512','3','','co_auditoria_tabela','79');

INSERT INTO TB_AUDITORIA_ITENS VALUES('513','23','','co_auditoria_itens','80');

INSERT INTO TB_AUDITORIA_ITENS VALUES('514','','','ds_item_anterior','80');

INSERT INTO TB_AUDITORIA_ITENS VALUES('515','2021-02-09 11:44:11','','ds_item_atual','80');

INSERT INTO TB_AUDITORIA_ITENS VALUES('516','dt_inicio_acesso','','ds_campo','80');

INSERT INTO TB_AUDITORIA_ITENS VALUES('517','3','','co_auditoria_tabela','80');

INSERT INTO TB_AUDITORIA_ITENS VALUES('518','24','','co_auditoria_itens','81');

INSERT INTO TB_AUDITORIA_ITENS VALUES('519','4','','ds_item_anterior','81');

INSERT INTO TB_AUDITORIA_ITENS VALUES('520','','','ds_item_atual','81');

INSERT INTO TB_AUDITORIA_ITENS VALUES('521','co_acesso','','ds_campo','81');

INSERT INTO TB_AUDITORIA_ITENS VALUES('522','4','','co_auditoria_tabela','81');

INSERT INTO TB_AUDITORIA_ITENS VALUES('523','25','','co_auditoria_itens','82');

INSERT INTO TB_AUDITORIA_ITENS VALUES('524','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','82');

INSERT INTO TB_AUDITORIA_ITENS VALUES('525','','','ds_item_atual','82');

INSERT INTO TB_AUDITORIA_ITENS VALUES('526','ds_session_id','','ds_campo','82');

INSERT INTO TB_AUDITORIA_ITENS VALUES('527','4','','co_auditoria_tabela','82');

INSERT INTO TB_AUDITORIA_ITENS VALUES('528','26','','co_auditoria_itens','83');

INSERT INTO TB_AUDITORIA_ITENS VALUES('529','2021-02-09 11:44:11','','ds_item_anterior','83');

INSERT INTO TB_AUDITORIA_ITENS VALUES('530','','','ds_item_atual','83');

INSERT INTO TB_AUDITORIA_ITENS VALUES('531','dt_inicio_acesso','','ds_campo','83');

INSERT INTO TB_AUDITORIA_ITENS VALUES('532','4','','co_auditoria_tabela','83');

INSERT INTO TB_AUDITORIA_ITENS VALUES('533','27','','co_auditoria_itens','84');

INSERT INTO TB_AUDITORIA_ITENS VALUES('534','2021-02-09 12:14:11','','ds_item_anterior','84');

INSERT INTO TB_AUDITORIA_ITENS VALUES('535','2021-02-09 12:14:11','','ds_item_atual','84');

INSERT INTO TB_AUDITORIA_ITENS VALUES('536','dt_fim_acesso','','ds_campo','84');

INSERT INTO TB_AUDITORIA_ITENS VALUES('537','4','','co_auditoria_tabela','84');

INSERT INTO TB_AUDITORIA_ITENS VALUES('538','28','','co_auditoria_itens','85');

INSERT INTO TB_AUDITORIA_ITENS VALUES('539','A','','ds_item_anterior','85');

INSERT INTO TB_AUDITORIA_ITENS VALUES('540','','','ds_item_atual','85');

INSERT INTO TB_AUDITORIA_ITENS VALUES('541','tp_situacao','','ds_campo','85');

INSERT INTO TB_AUDITORIA_ITENS VALUES('542','4','','co_auditoria_tabela','85');

INSERT INTO TB_AUDITORIA_ITENS VALUES('543','29','','co_auditoria_itens','86');

INSERT INTO TB_AUDITORIA_ITENS VALUES('544','1','','ds_item_anterior','86');

INSERT INTO TB_AUDITORIA_ITENS VALUES('545','','','ds_item_atual','86');

INSERT INTO TB_AUDITORIA_ITENS VALUES('546','co_usuario','','ds_campo','86');

INSERT INTO TB_AUDITORIA_ITENS VALUES('547','4','','co_auditoria_tabela','86');

INSERT INTO TB_AUDITORIA_ITENS VALUES('548','30','','co_auditoria_itens','87');

INSERT INTO TB_AUDITORIA_ITENS VALUES('549','4','','ds_item_anterior','87');

INSERT INTO TB_AUDITORIA_ITENS VALUES('550','','','ds_item_atual','87');

INSERT INTO TB_AUDITORIA_ITENS VALUES('551','co_trafego','','ds_campo','87');

INSERT INTO TB_AUDITORIA_ITENS VALUES('552','4','','co_auditoria_tabela','87');

INSERT INTO TB_AUDITORIA_ITENS VALUES('553','31','','co_auditoria_itens','88');

INSERT INTO TB_AUDITORIA_ITENS VALUES('554','4','','ds_item_anterior','88');

INSERT INTO TB_AUDITORIA_ITENS VALUES('555','','','ds_item_atual','88');

INSERT INTO TB_AUDITORIA_ITENS VALUES('556','co_acesso','','ds_campo','88');

INSERT INTO TB_AUDITORIA_ITENS VALUES('557','5','','co_auditoria_tabela','88');

INSERT INTO TB_AUDITORIA_ITENS VALUES('558','32','','co_auditoria_itens','89');

INSERT INTO TB_AUDITORIA_ITENS VALUES('559','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','89');

INSERT INTO TB_AUDITORIA_ITENS VALUES('560','','','ds_item_atual','89');

INSERT INTO TB_AUDITORIA_ITENS VALUES('561','ds_session_id','','ds_campo','89');

INSERT INTO TB_AUDITORIA_ITENS VALUES('562','5','','co_auditoria_tabela','89');

INSERT INTO TB_AUDITORIA_ITENS VALUES('563','33','','co_auditoria_itens','90');

INSERT INTO TB_AUDITORIA_ITENS VALUES('564','2021-02-09 11:44:11','','ds_item_anterior','90');

INSERT INTO TB_AUDITORIA_ITENS VALUES('565','','','ds_item_atual','90');

INSERT INTO TB_AUDITORIA_ITENS VALUES('566','dt_inicio_acesso','','ds_campo','90');

INSERT INTO TB_AUDITORIA_ITENS VALUES('567','5','','co_auditoria_tabela','90');

INSERT INTO TB_AUDITORIA_ITENS VALUES('568','34','','co_auditoria_itens','91');

INSERT INTO TB_AUDITORIA_ITENS VALUES('569','2021-02-09 12:14:11','','ds_item_anterior','91');

INSERT INTO TB_AUDITORIA_ITENS VALUES('570','2021-02-09 12:14:12','','ds_item_atual','91');

INSERT INTO TB_AUDITORIA_ITENS VALUES('571','dt_fim_acesso','','ds_campo','91');

INSERT INTO TB_AUDITORIA_ITENS VALUES('572','5','','co_auditoria_tabela','91');

INSERT INTO TB_AUDITORIA_ITENS VALUES('573','35','','co_auditoria_itens','92');

INSERT INTO TB_AUDITORIA_ITENS VALUES('574','A','','ds_item_anterior','92');

INSERT INTO TB_AUDITORIA_ITENS VALUES('575','','','ds_item_atual','92');

INSERT INTO TB_AUDITORIA_ITENS VALUES('576','tp_situacao','','ds_campo','92');

INSERT INTO TB_AUDITORIA_ITENS VALUES('577','5','','co_auditoria_tabela','92');

INSERT INTO TB_AUDITORIA_ITENS VALUES('578','36','','co_auditoria_itens','93');

INSERT INTO TB_AUDITORIA_ITENS VALUES('579','1','','ds_item_anterior','93');

INSERT INTO TB_AUDITORIA_ITENS VALUES('580','','','ds_item_atual','93');

INSERT INTO TB_AUDITORIA_ITENS VALUES('581','co_usuario','','ds_campo','93');

INSERT INTO TB_AUDITORIA_ITENS VALUES('582','5','','co_auditoria_tabela','93');

INSERT INTO TB_AUDITORIA_ITENS VALUES('583','37','','co_auditoria_itens','94');

INSERT INTO TB_AUDITORIA_ITENS VALUES('584','4','','ds_item_anterior','94');

INSERT INTO TB_AUDITORIA_ITENS VALUES('585','','','ds_item_atual','94');

INSERT INTO TB_AUDITORIA_ITENS VALUES('586','co_trafego','','ds_campo','94');

INSERT INTO TB_AUDITORIA_ITENS VALUES('587','5','','co_auditoria_tabela','94');

INSERT INTO TB_AUDITORIA_ITENS VALUES('588','38','','co_auditoria_itens','95');

INSERT INTO TB_AUDITORIA_ITENS VALUES('589','4','','ds_item_anterior','95');

INSERT INTO TB_AUDITORIA_ITENS VALUES('590','','','ds_item_atual','95');

INSERT INTO TB_AUDITORIA_ITENS VALUES('591','co_acesso','','ds_campo','95');

INSERT INTO TB_AUDITORIA_ITENS VALUES('592','6','','co_auditoria_tabela','95');

INSERT INTO TB_AUDITORIA_ITENS VALUES('593','39','','co_auditoria_itens','96');

INSERT INTO TB_AUDITORIA_ITENS VALUES('594','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','96');

INSERT INTO TB_AUDITORIA_ITENS VALUES('595','','','ds_item_atual','96');

INSERT INTO TB_AUDITORIA_ITENS VALUES('596','ds_session_id','','ds_campo','96');

INSERT INTO TB_AUDITORIA_ITENS VALUES('597','6','','co_auditoria_tabela','96');

INSERT INTO TB_AUDITORIA_ITENS VALUES('598','40','','co_auditoria_itens','97');

INSERT INTO TB_AUDITORIA_ITENS VALUES('599','2021-02-09 11:44:11','','ds_item_anterior','97');

INSERT INTO TB_AUDITORIA_ITENS VALUES('600','','','ds_item_atual','97');

INSERT INTO TB_AUDITORIA_ITENS VALUES('601','dt_inicio_acesso','','ds_campo','97');

INSERT INTO TB_AUDITORIA_ITENS VALUES('602','6','','co_auditoria_tabela','97');

INSERT INTO TB_AUDITORIA_ITENS VALUES('603','41','','co_auditoria_itens','98');

INSERT INTO TB_AUDITORIA_ITENS VALUES('604','2021-02-09 12:14:12','','ds_item_anterior','98');

INSERT INTO TB_AUDITORIA_ITENS VALUES('605','2021-02-09 12:14:16','','ds_item_atual','98');

INSERT INTO TB_AUDITORIA_ITENS VALUES('606','dt_fim_acesso','','ds_campo','98');

INSERT INTO TB_AUDITORIA_ITENS VALUES('607','6','','co_auditoria_tabela','98');

INSERT INTO TB_AUDITORIA_ITENS VALUES('608','42','','co_auditoria_itens','99');

INSERT INTO TB_AUDITORIA_ITENS VALUES('609','A','','ds_item_anterior','99');

INSERT INTO TB_AUDITORIA_ITENS VALUES('610','','','ds_item_atual','99');

INSERT INTO TB_AUDITORIA_ITENS VALUES('611','tp_situacao','','ds_campo','99');

INSERT INTO TB_AUDITORIA_ITENS VALUES('612','6','','co_auditoria_tabela','99');

INSERT INTO TB_AUDITORIA_ITENS VALUES('613','43','','co_auditoria_itens','100');

INSERT INTO TB_AUDITORIA_ITENS VALUES('614','1','','ds_item_anterior','100');

INSERT INTO TB_AUDITORIA_ITENS VALUES('615','','','ds_item_atual','100');

INSERT INTO TB_AUDITORIA_ITENS VALUES('616','co_usuario','','ds_campo','100');

INSERT INTO TB_AUDITORIA_ITENS VALUES('617','6','','co_auditoria_tabela','100');

INSERT INTO TB_AUDITORIA_ITENS VALUES('618','44','','co_auditoria_itens','101');

INSERT INTO TB_AUDITORIA_ITENS VALUES('619','4','','ds_item_anterior','101');

INSERT INTO TB_AUDITORIA_ITENS VALUES('620','','','ds_item_atual','101');

INSERT INTO TB_AUDITORIA_ITENS VALUES('621','co_trafego','','ds_campo','101');

INSERT INTO TB_AUDITORIA_ITENS VALUES('622','6','','co_auditoria_tabela','101');

INSERT INTO TB_AUDITORIA_ITENS VALUES('623','45','','co_auditoria_itens','102');

INSERT INTO TB_AUDITORIA_ITENS VALUES('624','4','','ds_item_anterior','102');

INSERT INTO TB_AUDITORIA_ITENS VALUES('625','','','ds_item_atual','102');

INSERT INTO TB_AUDITORIA_ITENS VALUES('626','co_acesso','','ds_campo','102');

INSERT INTO TB_AUDITORIA_ITENS VALUES('627','7','','co_auditoria_tabela','102');

INSERT INTO TB_AUDITORIA_ITENS VALUES('628','46','','co_auditoria_itens','103');

INSERT INTO TB_AUDITORIA_ITENS VALUES('629','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','103');

INSERT INTO TB_AUDITORIA_ITENS VALUES('630','','','ds_item_atual','103');

INSERT INTO TB_AUDITORIA_ITENS VALUES('631','ds_session_id','','ds_campo','103');

INSERT INTO TB_AUDITORIA_ITENS VALUES('632','7','','co_auditoria_tabela','103');

INSERT INTO TB_AUDITORIA_ITENS VALUES('633','47','','co_auditoria_itens','104');

INSERT INTO TB_AUDITORIA_ITENS VALUES('634','2021-02-09 11:44:11','','ds_item_anterior','104');

INSERT INTO TB_AUDITORIA_ITENS VALUES('635','','','ds_item_atual','104');

INSERT INTO TB_AUDITORIA_ITENS VALUES('636','dt_inicio_acesso','','ds_campo','104');

INSERT INTO TB_AUDITORIA_ITENS VALUES('637','7','','co_auditoria_tabela','104');

INSERT INTO TB_AUDITORIA_ITENS VALUES('638','48','','co_auditoria_itens','105');

INSERT INTO TB_AUDITORIA_ITENS VALUES('639','2021-02-09 12:14:16','','ds_item_anterior','105');

INSERT INTO TB_AUDITORIA_ITENS VALUES('640','2021-02-09 12:14:16','','ds_item_atual','105');

INSERT INTO TB_AUDITORIA_ITENS VALUES('641','dt_fim_acesso','','ds_campo','105');

INSERT INTO TB_AUDITORIA_ITENS VALUES('642','7','','co_auditoria_tabela','105');

INSERT INTO TB_AUDITORIA_ITENS VALUES('643','49','','co_auditoria_itens','106');

INSERT INTO TB_AUDITORIA_ITENS VALUES('644','A','','ds_item_anterior','106');

INSERT INTO TB_AUDITORIA_ITENS VALUES('645','','','ds_item_atual','106');

INSERT INTO TB_AUDITORIA_ITENS VALUES('646','tp_situacao','','ds_campo','106');

INSERT INTO TB_AUDITORIA_ITENS VALUES('647','7','','co_auditoria_tabela','106');

INSERT INTO TB_AUDITORIA_ITENS VALUES('648','50','','co_auditoria_itens','107');

INSERT INTO TB_AUDITORIA_ITENS VALUES('649','1','','ds_item_anterior','107');

INSERT INTO TB_AUDITORIA_ITENS VALUES('650','','','ds_item_atual','107');

INSERT INTO TB_AUDITORIA_ITENS VALUES('651','co_usuario','','ds_campo','107');

INSERT INTO TB_AUDITORIA_ITENS VALUES('652','7','','co_auditoria_tabela','107');

INSERT INTO TB_AUDITORIA_ITENS VALUES('653','51','','co_auditoria_itens','108');

INSERT INTO TB_AUDITORIA_ITENS VALUES('654','4','','ds_item_anterior','108');

INSERT INTO TB_AUDITORIA_ITENS VALUES('655','','','ds_item_atual','108');

INSERT INTO TB_AUDITORIA_ITENS VALUES('656','co_trafego','','ds_campo','108');

INSERT INTO TB_AUDITORIA_ITENS VALUES('657','7','','co_auditoria_tabela','108');

INSERT INTO TB_AUDITORIA_ITENS VALUES('658','52','','co_auditoria_itens','109');

INSERT INTO TB_AUDITORIA_ITENS VALUES('659','4','','ds_item_anterior','109');

INSERT INTO TB_AUDITORIA_ITENS VALUES('660','','','ds_item_atual','109');

INSERT INTO TB_AUDITORIA_ITENS VALUES('661','co_acesso','','ds_campo','109');

INSERT INTO TB_AUDITORIA_ITENS VALUES('662','8','','co_auditoria_tabela','109');

INSERT INTO TB_AUDITORIA_ITENS VALUES('663','53','','co_auditoria_itens','110');

INSERT INTO TB_AUDITORIA_ITENS VALUES('664','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','110');

INSERT INTO TB_AUDITORIA_ITENS VALUES('665','','','ds_item_atual','110');

INSERT INTO TB_AUDITORIA_ITENS VALUES('666','ds_session_id','','ds_campo','110');

INSERT INTO TB_AUDITORIA_ITENS VALUES('667','8','','co_auditoria_tabela','110');

INSERT INTO TB_AUDITORIA_ITENS VALUES('668','54','','co_auditoria_itens','111');

INSERT INTO TB_AUDITORIA_ITENS VALUES('669','2021-02-09 11:44:11','','ds_item_anterior','111');

INSERT INTO TB_AUDITORIA_ITENS VALUES('670','','','ds_item_atual','111');

INSERT INTO TB_AUDITORIA_ITENS VALUES('671','dt_inicio_acesso','','ds_campo','111');

INSERT INTO TB_AUDITORIA_ITENS VALUES('672','8','','co_auditoria_tabela','111');

INSERT INTO TB_AUDITORIA_ITENS VALUES('673','55','','co_auditoria_itens','112');

INSERT INTO TB_AUDITORIA_ITENS VALUES('674','2021-02-09 12:14:16','','ds_item_anterior','112');

INSERT INTO TB_AUDITORIA_ITENS VALUES('675','2021-02-09 12:14:18','','ds_item_atual','112');

INSERT INTO TB_AUDITORIA_ITENS VALUES('676','dt_fim_acesso','','ds_campo','112');

INSERT INTO TB_AUDITORIA_ITENS VALUES('677','8','','co_auditoria_tabela','112');

INSERT INTO TB_AUDITORIA_ITENS VALUES('678','56','','co_auditoria_itens','113');

INSERT INTO TB_AUDITORIA_ITENS VALUES('679','A','','ds_item_anterior','113');

INSERT INTO TB_AUDITORIA_ITENS VALUES('680','','','ds_item_atual','113');

INSERT INTO TB_AUDITORIA_ITENS VALUES('681','tp_situacao','','ds_campo','113');

INSERT INTO TB_AUDITORIA_ITENS VALUES('682','8','','co_auditoria_tabela','113');

INSERT INTO TB_AUDITORIA_ITENS VALUES('683','57','','co_auditoria_itens','114');

INSERT INTO TB_AUDITORIA_ITENS VALUES('684','1','','ds_item_anterior','114');

INSERT INTO TB_AUDITORIA_ITENS VALUES('685','','','ds_item_atual','114');

INSERT INTO TB_AUDITORIA_ITENS VALUES('686','co_usuario','','ds_campo','114');

INSERT INTO TB_AUDITORIA_ITENS VALUES('687','8','','co_auditoria_tabela','114');

INSERT INTO TB_AUDITORIA_ITENS VALUES('688','58','','co_auditoria_itens','115');

INSERT INTO TB_AUDITORIA_ITENS VALUES('689','4','','ds_item_anterior','115');

INSERT INTO TB_AUDITORIA_ITENS VALUES('690','','','ds_item_atual','115');

INSERT INTO TB_AUDITORIA_ITENS VALUES('691','co_trafego','','ds_campo','115');

INSERT INTO TB_AUDITORIA_ITENS VALUES('692','8','','co_auditoria_tabela','115');

INSERT INTO TB_AUDITORIA_ITENS VALUES('693','59','','co_auditoria_itens','116');

INSERT INTO TB_AUDITORIA_ITENS VALUES('694','4','','ds_item_anterior','116');

INSERT INTO TB_AUDITORIA_ITENS VALUES('695','','','ds_item_atual','116');

INSERT INTO TB_AUDITORIA_ITENS VALUES('696','co_acesso','','ds_campo','116');

INSERT INTO TB_AUDITORIA_ITENS VALUES('697','9','','co_auditoria_tabela','116');

INSERT INTO TB_AUDITORIA_ITENS VALUES('698','60','','co_auditoria_itens','117');

INSERT INTO TB_AUDITORIA_ITENS VALUES('699','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','117');

INSERT INTO TB_AUDITORIA_ITENS VALUES('700','','','ds_item_atual','117');

INSERT INTO TB_AUDITORIA_ITENS VALUES('701','ds_session_id','','ds_campo','117');

INSERT INTO TB_AUDITORIA_ITENS VALUES('702','9','','co_auditoria_tabela','117');

INSERT INTO TB_AUDITORIA_ITENS VALUES('703','61','','co_auditoria_itens','118');

INSERT INTO TB_AUDITORIA_ITENS VALUES('704','2021-02-09 11:44:11','','ds_item_anterior','118');

INSERT INTO TB_AUDITORIA_ITENS VALUES('705','','','ds_item_atual','118');

INSERT INTO TB_AUDITORIA_ITENS VALUES('706','dt_inicio_acesso','','ds_campo','118');

INSERT INTO TB_AUDITORIA_ITENS VALUES('707','9','','co_auditoria_tabela','118');

INSERT INTO TB_AUDITORIA_ITENS VALUES('708','62','','co_auditoria_itens','119');

INSERT INTO TB_AUDITORIA_ITENS VALUES('709','2021-02-09 12:14:18','','ds_item_anterior','119');

INSERT INTO TB_AUDITORIA_ITENS VALUES('710','2021-02-09 12:14:19','','ds_item_atual','119');

INSERT INTO TB_AUDITORIA_ITENS VALUES('711','dt_fim_acesso','','ds_campo','119');

INSERT INTO TB_AUDITORIA_ITENS VALUES('712','9','','co_auditoria_tabela','119');

INSERT INTO TB_AUDITORIA_ITENS VALUES('713','63','','co_auditoria_itens','120');

INSERT INTO TB_AUDITORIA_ITENS VALUES('714','A','','ds_item_anterior','120');

INSERT INTO TB_AUDITORIA_ITENS VALUES('715','','','ds_item_atual','120');

INSERT INTO TB_AUDITORIA_ITENS VALUES('716','tp_situacao','','ds_campo','120');

INSERT INTO TB_AUDITORIA_ITENS VALUES('717','9','','co_auditoria_tabela','120');

INSERT INTO TB_AUDITORIA_ITENS VALUES('718','64','','co_auditoria_itens','121');

INSERT INTO TB_AUDITORIA_ITENS VALUES('719','1','','ds_item_anterior','121');

INSERT INTO TB_AUDITORIA_ITENS VALUES('720','','','ds_item_atual','121');

INSERT INTO TB_AUDITORIA_ITENS VALUES('721','co_usuario','','ds_campo','121');

INSERT INTO TB_AUDITORIA_ITENS VALUES('722','9','','co_auditoria_tabela','121');

INSERT INTO TB_AUDITORIA_ITENS VALUES('723','65','','co_auditoria_itens','122');

INSERT INTO TB_AUDITORIA_ITENS VALUES('724','4','','ds_item_anterior','122');

INSERT INTO TB_AUDITORIA_ITENS VALUES('725','','','ds_item_atual','122');

INSERT INTO TB_AUDITORIA_ITENS VALUES('726','co_trafego','','ds_campo','122');

INSERT INTO TB_AUDITORIA_ITENS VALUES('727','9','','co_auditoria_tabela','122');

INSERT INTO TB_AUDITORIA_ITENS VALUES('728','66','','co_auditoria_itens','123');

INSERT INTO TB_AUDITORIA_ITENS VALUES('729','4','','ds_item_anterior','123');

INSERT INTO TB_AUDITORIA_ITENS VALUES('730','','','ds_item_atual','123');

INSERT INTO TB_AUDITORIA_ITENS VALUES('731','co_acesso','','ds_campo','123');

INSERT INTO TB_AUDITORIA_ITENS VALUES('732','10','','co_auditoria_tabela','123');

INSERT INTO TB_AUDITORIA_ITENS VALUES('733','67','','co_auditoria_itens','124');

INSERT INTO TB_AUDITORIA_ITENS VALUES('734','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','124');

INSERT INTO TB_AUDITORIA_ITENS VALUES('735','','','ds_item_atual','124');

INSERT INTO TB_AUDITORIA_ITENS VALUES('736','ds_session_id','','ds_campo','124');

INSERT INTO TB_AUDITORIA_ITENS VALUES('737','10','','co_auditoria_tabela','124');

INSERT INTO TB_AUDITORIA_ITENS VALUES('738','68','','co_auditoria_itens','125');

INSERT INTO TB_AUDITORIA_ITENS VALUES('739','2021-02-09 11:44:11','','ds_item_anterior','125');

INSERT INTO TB_AUDITORIA_ITENS VALUES('740','','','ds_item_atual','125');

INSERT INTO TB_AUDITORIA_ITENS VALUES('741','dt_inicio_acesso','','ds_campo','125');

INSERT INTO TB_AUDITORIA_ITENS VALUES('742','10','','co_auditoria_tabela','125');

INSERT INTO TB_AUDITORIA_ITENS VALUES('743','69','','co_auditoria_itens','126');

INSERT INTO TB_AUDITORIA_ITENS VALUES('744','2021-02-09 12:14:19','','ds_item_anterior','126');

INSERT INTO TB_AUDITORIA_ITENS VALUES('745','2021-02-09 12:14:41','','ds_item_atual','126');

INSERT INTO TB_AUDITORIA_ITENS VALUES('746','dt_fim_acesso','','ds_campo','126');

INSERT INTO TB_AUDITORIA_ITENS VALUES('747','10','','co_auditoria_tabela','126');

INSERT INTO TB_AUDITORIA_ITENS VALUES('748','70','','co_auditoria_itens','127');

INSERT INTO TB_AUDITORIA_ITENS VALUES('749','A','','ds_item_anterior','127');

INSERT INTO TB_AUDITORIA_ITENS VALUES('750','','','ds_item_atual','127');

INSERT INTO TB_AUDITORIA_ITENS VALUES('751','tp_situacao','','ds_campo','127');

INSERT INTO TB_AUDITORIA_ITENS VALUES('752','10','','co_auditoria_tabela','127');

INSERT INTO TB_AUDITORIA_ITENS VALUES('753','71','','co_auditoria_itens','128');

INSERT INTO TB_AUDITORIA_ITENS VALUES('754','1','','ds_item_anterior','128');

INSERT INTO TB_AUDITORIA_ITENS VALUES('755','','','ds_item_atual','128');

INSERT INTO TB_AUDITORIA_ITENS VALUES('756','co_usuario','','ds_campo','128');

INSERT INTO TB_AUDITORIA_ITENS VALUES('757','10','','co_auditoria_tabela','128');

INSERT INTO TB_AUDITORIA_ITENS VALUES('758','72','','co_auditoria_itens','129');

INSERT INTO TB_AUDITORIA_ITENS VALUES('759','4','','ds_item_anterior','129');

INSERT INTO TB_AUDITORIA_ITENS VALUES('760','','','ds_item_atual','129');

INSERT INTO TB_AUDITORIA_ITENS VALUES('761','co_trafego','','ds_campo','129');

INSERT INTO TB_AUDITORIA_ITENS VALUES('762','10','','co_auditoria_tabela','129');

INSERT INTO TB_AUDITORIA_ITENS VALUES('763','73','','co_auditoria_itens','130');

INSERT INTO TB_AUDITORIA_ITENS VALUES('764','4','','ds_item_anterior','130');

INSERT INTO TB_AUDITORIA_ITENS VALUES('765','','','ds_item_atual','130');

INSERT INTO TB_AUDITORIA_ITENS VALUES('766','co_acesso','','ds_campo','130');

INSERT INTO TB_AUDITORIA_ITENS VALUES('767','11','','co_auditoria_tabela','130');

INSERT INTO TB_AUDITORIA_ITENS VALUES('768','74','','co_auditoria_itens','131');

INSERT INTO TB_AUDITORIA_ITENS VALUES('769','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','131');

INSERT INTO TB_AUDITORIA_ITENS VALUES('770','','','ds_item_atual','131');

INSERT INTO TB_AUDITORIA_ITENS VALUES('771','ds_session_id','','ds_campo','131');

INSERT INTO TB_AUDITORIA_ITENS VALUES('772','11','','co_auditoria_tabela','131');

INSERT INTO TB_AUDITORIA_ITENS VALUES('773','75','','co_auditoria_itens','132');

INSERT INTO TB_AUDITORIA_ITENS VALUES('774','2021-02-09 11:44:11','','ds_item_anterior','132');

INSERT INTO TB_AUDITORIA_ITENS VALUES('775','','','ds_item_atual','132');

INSERT INTO TB_AUDITORIA_ITENS VALUES('776','dt_inicio_acesso','','ds_campo','132');

INSERT INTO TB_AUDITORIA_ITENS VALUES('777','11','','co_auditoria_tabela','132');

INSERT INTO TB_AUDITORIA_ITENS VALUES('778','76','','co_auditoria_itens','133');

INSERT INTO TB_AUDITORIA_ITENS VALUES('779','2021-02-09 12:14:41','','ds_item_anterior','133');

INSERT INTO TB_AUDITORIA_ITENS VALUES('780','2021-02-09 12:14:42','','ds_item_atual','133');

INSERT INTO TB_AUDITORIA_ITENS VALUES('781','dt_fim_acesso','','ds_campo','133');

INSERT INTO TB_AUDITORIA_ITENS VALUES('782','11','','co_auditoria_tabela','133');

INSERT INTO TB_AUDITORIA_ITENS VALUES('783','77','','co_auditoria_itens','134');

INSERT INTO TB_AUDITORIA_ITENS VALUES('784','A','','ds_item_anterior','134');

INSERT INTO TB_AUDITORIA_ITENS VALUES('785','','','ds_item_atual','134');

INSERT INTO TB_AUDITORIA_ITENS VALUES('786','tp_situacao','','ds_campo','134');

INSERT INTO TB_AUDITORIA_ITENS VALUES('787','11','','co_auditoria_tabela','134');

INSERT INTO TB_AUDITORIA_ITENS VALUES('788','78','','co_auditoria_itens','135');

INSERT INTO TB_AUDITORIA_ITENS VALUES('789','1','','ds_item_anterior','135');

INSERT INTO TB_AUDITORIA_ITENS VALUES('790','','','ds_item_atual','135');

INSERT INTO TB_AUDITORIA_ITENS VALUES('791','co_usuario','','ds_campo','135');

INSERT INTO TB_AUDITORIA_ITENS VALUES('792','11','','co_auditoria_tabela','135');

INSERT INTO TB_AUDITORIA_ITENS VALUES('793','79','','co_auditoria_itens','136');

INSERT INTO TB_AUDITORIA_ITENS VALUES('794','4','','ds_item_anterior','136');

INSERT INTO TB_AUDITORIA_ITENS VALUES('795','','','ds_item_atual','136');

INSERT INTO TB_AUDITORIA_ITENS VALUES('796','co_trafego','','ds_campo','136');

INSERT INTO TB_AUDITORIA_ITENS VALUES('797','11','','co_auditoria_tabela','136');

INSERT INTO TB_AUDITORIA_ITENS VALUES('798','80','','co_auditoria_itens','137');

INSERT INTO TB_AUDITORIA_ITENS VALUES('799','','','ds_item_anterior','137');

INSERT INTO TB_AUDITORIA_ITENS VALUES('800','Curso/curso-de-dons-carismaticos-602291ca5b5a7.png','','ds_item_atual','137');

INSERT INTO TB_AUDITORIA_ITENS VALUES('801','ds_caminho','','ds_campo','137');

INSERT INTO TB_AUDITORIA_ITENS VALUES('802','12','','co_auditoria_tabela','137');

INSERT INTO TB_AUDITORIA_ITENS VALUES('803','81','','co_auditoria_itens','138');

INSERT INTO TB_AUDITORIA_ITENS VALUES('804','','','ds_item_anterior','138');

INSERT INTO TB_AUDITORIA_ITENS VALUES('805','2','','ds_item_atual','138');

INSERT INTO TB_AUDITORIA_ITENS VALUES('806','co_tipo_imagem','','ds_campo','138');

INSERT INTO TB_AUDITORIA_ITENS VALUES('807','12','','co_auditoria_tabela','138');

INSERT INTO TB_AUDITORIA_ITENS VALUES('808','82','','co_auditoria_itens','139');

INSERT INTO TB_AUDITORIA_ITENS VALUES('809','2','','ds_item_anterior','139');

INSERT INTO TB_AUDITORIA_ITENS VALUES('810','2','','ds_item_atual','139');

INSERT INTO TB_AUDITORIA_ITENS VALUES('811','co_curso','','ds_campo','139');

INSERT INTO TB_AUDITORIA_ITENS VALUES('812','13','','co_auditoria_tabela','139');

INSERT INTO TB_AUDITORIA_ITENS VALUES('813','83','','co_auditoria_itens','140');

INSERT INTO TB_AUDITORIA_ITENS VALUES('814','<p style=\"text-align:center\"><img alt=\"\" class=\"image2\" height=\"366\" src=\"http://localhost/ccaug/uploads/Imagens/images/dons_carismaticos.png\" width=\"650\" /></p>\n\n\n\n<div class=\"col-12 col-lg-8\">\n\n<h3>Conhe&ccedil;a esta Forma&ccedil;&atilde;o!</h3>\n\n\n\n<div class=\"conteudo\"><strong>Objetivos</strong>:\n\n\n\n<ul>\n\n	<li>Conhecer os dons carism&aacute;ticos conforme os ensinamentos da Igreja</li>\n\n	<li>Aprimorar e fazer a descoberta de seus dons</li>\n\n	<li>Entender como exercer os dons com mais seguran&ccedil;a entendendo cada um deles</li>\n\n	<li>Aperfei&ccedil;oar seus minist&eacute;rios</li>\n\n	<li>Aprender de forma interativa e din&acirc;mica</li>\n\n	<li>Aprender e partilhar conhecimentos com pessoas de v&aacute;rias localidades do Brasil</li>\n\n	<li>Conhecer e estudar com pessoas que desejam assim como voc&ecirc; aprender e aprofundar mais nas coisas de Deus</li>\n\n	<li>Tirar suas d&uacute;vidas diretamente com os formadores</li>\n\n</ul>\n\n</div>\n\n\n\n<div>&nbsp;</div>\n\n\n\n<div><strong>Modalidade</strong>: realizado &aacute; distancia, mas com uma metodologia de uma forma&ccedil;&atilde;o interativa e din&acirc;mica.</div>\n\n\n\n<div>&nbsp;</div>\n\n\n\n<div><strong>Destinat&aacute;rios</strong>: Pessoas que deseja descobrir seus dons e aprimorar seus minist&eacute;rios o minist&eacute;rio.</div>\n\n\n\n<div>&nbsp;</div>\n\n\n\n<div><strong>Carga hor&aacute;ria</strong>: 12 horas.</div>\n\n\n\n<div>&nbsp;</div>\n\n\n\n<div><strong>Per&iacute;odo de realiza&ccedil;&atilde;o</strong>: 02/03 a 18/03 de 2021 &ndash; 20h00, Ter&ccedil;a e Quinta (dias a confirmar)</div>\n\n\n\n<div>&nbsp;</div>\n\n\n\n<div><strong>Investimento</strong>: Gratuito.</div>\n\n</div>','','ds_item_anterior','140');

INSERT INTO TB_AUDITORIA_ITENS VALUES('815','<div class=\"col-12 col-lg-8\">\n<div class=\"conteudo\"><strong>Objetivos</strong>:\n<ul>\n	<li>Conhecer os dons carism&aacute;ticos conforme os ensinamentos da Igreja</li>\n	<li>Aprimorar e fazer a descoberta de seus dons</li>\n	<li>Entender como exercer os dons com mais seguran&ccedil;a entendendo cada um deles</li>\n	<li>Aperfei&ccedil;oar seus minist&eacute;rios</li>\n	<li>Aprender de forma interativa e din&acirc;mica</li>\n	<li>Aprender e partilhar conhecimentos com pessoas de v&aacute;rias localidades do Brasil</li>\n	<li>Conhecer e estudar com pessoas que desejam assim como voc&ecirc; aprender e aprofundar mais nas coisas de Deus</li>\n	<li>Tirar suas d&uacute;vidas diretamente com os formadores</li>\n</ul>\n</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Modalidade</strong>: realizado &aacute; distancia, mas com uma metodologia de uma forma&ccedil;&atilde;o interativa e din&acirc;mica.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Destinat&aacute;rios</strong>: Pessoas que deseja descobrir seus dons e aprimorar seus minist&eacute;rios o minist&eacute;rio.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Carga hor&aacute;ria</strong>: 12 horas.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Per&iacute;odo de realiza&ccedil;&atilde;o</strong>: 02/03 a 18/03 de 2021 &ndash; 20h00, Ter&ccedil;a e Quinta (dias a confirmar)</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Investimento</strong>: Gratuito.</div>\n</div>','','ds_item_atual','140');

INSERT INTO TB_AUDITORIA_ITENS VALUES('816','ds_descricao','','ds_campo','140');

INSERT INTO TB_AUDITORIA_ITENS VALUES('817','13','','co_auditoria_tabela','140');

INSERT INTO TB_AUDITORIA_ITENS VALUES('818','84','','co_auditoria_itens','141');

INSERT INTO TB_AUDITORIA_ITENS VALUES('819','2021-02-08 15:24:57','','ds_item_anterior','141');

INSERT INTO TB_AUDITORIA_ITENS VALUES('820','','','ds_item_atual','141');

INSERT INTO TB_AUDITORIA_ITENS VALUES('821','dt_cadastro','','ds_campo','141');

INSERT INTO TB_AUDITORIA_ITENS VALUES('822','13','','co_auditoria_tabela','141');

INSERT INTO TB_AUDITORIA_ITENS VALUES('823','85','','co_auditoria_itens','142');

INSERT INTO TB_AUDITORIA_ITENS VALUES('824','','','ds_item_anterior','142');

INSERT INTO TB_AUDITORIA_ITENS VALUES('825','2','','ds_item_atual','142');

INSERT INTO TB_AUDITORIA_ITENS VALUES('826','co_imagem','','ds_campo','142');

INSERT INTO TB_AUDITORIA_ITENS VALUES('827','13','','co_auditoria_tabela','142');

INSERT INTO TB_AUDITORIA_ITENS VALUES('828','86','','co_auditoria_itens','143');

INSERT INTO TB_AUDITORIA_ITENS VALUES('829','','','ds_item_anterior','143');

INSERT INTO TB_AUDITORIA_ITENS VALUES('830','2021-02-09 11:44:42','','ds_item_atual','143');

INSERT INTO TB_AUDITORIA_ITENS VALUES('831','dt_cadastro','','ds_campo','143');

INSERT INTO TB_AUDITORIA_ITENS VALUES('832','14','','co_auditoria_tabela','143');

INSERT INTO TB_AUDITORIA_ITENS VALUES('833','87','','co_auditoria_itens','144');

INSERT INTO TB_AUDITORIA_ITENS VALUES('834','','','ds_item_anterior','144');

INSERT INTO TB_AUDITORIA_ITENS VALUES('835','0.00','','ds_item_atual','144');

INSERT INTO TB_AUDITORIA_ITENS VALUES('836','nu_valor','','ds_campo','144');

INSERT INTO TB_AUDITORIA_ITENS VALUES('837','14','','co_auditoria_tabela','144');

INSERT INTO TB_AUDITORIA_ITENS VALUES('838','88','','co_auditoria_itens','145');

INSERT INTO TB_AUDITORIA_ITENS VALUES('839','','','ds_item_anterior','145');

INSERT INTO TB_AUDITORIA_ITENS VALUES('840','CURSO DE DONS CARISMÁTICOS','','ds_item_atual','145');

INSERT INTO TB_AUDITORIA_ITENS VALUES('841','ds_titulo','','ds_campo','145');

INSERT INTO TB_AUDITORIA_ITENS VALUES('842','14','','co_auditoria_tabela','145');

INSERT INTO TB_AUDITORIA_ITENS VALUES('843','89','','co_auditoria_itens','146');

INSERT INTO TB_AUDITORIA_ITENS VALUES('844','','','ds_item_anterior','146');

INSERT INTO TB_AUDITORIA_ITENS VALUES('845','12','','ds_item_atual','146');

INSERT INTO TB_AUDITORIA_ITENS VALUES('846','nu_carga_horaria','','ds_campo','146');

INSERT INTO TB_AUDITORIA_ITENS VALUES('847','14','','co_auditoria_tabela','146');

INSERT INTO TB_AUDITORIA_ITENS VALUES('848','90','','co_auditoria_itens','147');

INSERT INTO TB_AUDITORIA_ITENS VALUES('849','','','ds_item_anterior','147');

INSERT INTO TB_AUDITORIA_ITENS VALUES('850','3','','ds_item_atual','147');

INSERT INTO TB_AUDITORIA_ITENS VALUES('851','nu_duracao','','ds_campo','147');

INSERT INTO TB_AUDITORIA_ITENS VALUES('852','14','','co_auditoria_tabela','147');

INSERT INTO TB_AUDITORIA_ITENS VALUES('853','91','','co_auditoria_itens','148');

INSERT INTO TB_AUDITORIA_ITENS VALUES('854','','','ds_item_anterior','148');

INSERT INTO TB_AUDITORIA_ITENS VALUES('855','S','','ds_item_atual','148');

INSERT INTO TB_AUDITORIA_ITENS VALUES('856','st_certificacao','','ds_campo','148');

INSERT INTO TB_AUDITORIA_ITENS VALUES('857','14','','co_auditoria_tabela','148');

INSERT INTO TB_AUDITORIA_ITENS VALUES('858','92','','co_auditoria_itens','149');

INSERT INTO TB_AUDITORIA_ITENS VALUES('859','','','ds_item_anterior','149');

INSERT INTO TB_AUDITORIA_ITENS VALUES('860','S','','ds_item_atual','149');

INSERT INTO TB_AUDITORIA_ITENS VALUES('861','st_status','','ds_campo','149');

INSERT INTO TB_AUDITORIA_ITENS VALUES('862','14','','co_auditoria_tabela','149');

INSERT INTO TB_AUDITORIA_ITENS VALUES('863','93','','co_auditoria_itens','150');

INSERT INTO TB_AUDITORIA_ITENS VALUES('864','','','ds_item_anterior','150');

INSERT INTO TB_AUDITORIA_ITENS VALUES('865','2','','ds_item_atual','150');

INSERT INTO TB_AUDITORIA_ITENS VALUES('866','co_curso','','ds_campo','150');

INSERT INTO TB_AUDITORIA_ITENS VALUES('867','14','','co_auditoria_tabela','150');

INSERT INTO TB_AUDITORIA_ITENS VALUES('868','94','','co_auditoria_itens','151');

INSERT INTO TB_AUDITORIA_ITENS VALUES('869','','','ds_item_anterior','151');

INSERT INTO TB_AUDITORIA_ITENS VALUES('870','1','','ds_item_atual','151');

INSERT INTO TB_AUDITORIA_ITENS VALUES('871','co_usuario','','ds_campo','151');

INSERT INTO TB_AUDITORIA_ITENS VALUES('872','14','','co_auditoria_tabela','151');

INSERT INTO TB_AUDITORIA_ITENS VALUES('873','95','','co_auditoria_itens','152');

INSERT INTO TB_AUDITORIA_ITENS VALUES('874','4','','ds_item_anterior','152');

INSERT INTO TB_AUDITORIA_ITENS VALUES('875','','','ds_item_atual','152');

INSERT INTO TB_AUDITORIA_ITENS VALUES('876','co_acesso','','ds_campo','152');

INSERT INTO TB_AUDITORIA_ITENS VALUES('877','15','','co_auditoria_tabela','152');

INSERT INTO TB_AUDITORIA_ITENS VALUES('878','96','','co_auditoria_itens','153');

INSERT INTO TB_AUDITORIA_ITENS VALUES('879','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','153');

INSERT INTO TB_AUDITORIA_ITENS VALUES('880','','','ds_item_atual','153');

INSERT INTO TB_AUDITORIA_ITENS VALUES('881','ds_session_id','','ds_campo','153');

INSERT INTO TB_AUDITORIA_ITENS VALUES('882','15','','co_auditoria_tabela','153');

INSERT INTO TB_AUDITORIA_ITENS VALUES('883','97','','co_auditoria_itens','154');

INSERT INTO TB_AUDITORIA_ITENS VALUES('884','2021-02-09 11:44:11','','ds_item_anterior','154');

INSERT INTO TB_AUDITORIA_ITENS VALUES('885','','','ds_item_atual','154');

INSERT INTO TB_AUDITORIA_ITENS VALUES('886','dt_inicio_acesso','','ds_campo','154');

INSERT INTO TB_AUDITORIA_ITENS VALUES('887','15','','co_auditoria_tabela','154');

INSERT INTO TB_AUDITORIA_ITENS VALUES('888','98','','co_auditoria_itens','155');

INSERT INTO TB_AUDITORIA_ITENS VALUES('889','2021-02-09 12:14:42','','ds_item_anterior','155');

INSERT INTO TB_AUDITORIA_ITENS VALUES('890','2021-02-09 12:14:42','','ds_item_atual','155');

INSERT INTO TB_AUDITORIA_ITENS VALUES('891','dt_fim_acesso','','ds_campo','155');

INSERT INTO TB_AUDITORIA_ITENS VALUES('892','15','','co_auditoria_tabela','155');

INSERT INTO TB_AUDITORIA_ITENS VALUES('893','99','','co_auditoria_itens','156');

INSERT INTO TB_AUDITORIA_ITENS VALUES('894','A','','ds_item_anterior','156');

INSERT INTO TB_AUDITORIA_ITENS VALUES('895','','','ds_item_atual','156');

INSERT INTO TB_AUDITORIA_ITENS VALUES('896','tp_situacao','','ds_campo','156');

INSERT INTO TB_AUDITORIA_ITENS VALUES('897','15','','co_auditoria_tabela','156');

INSERT INTO TB_AUDITORIA_ITENS VALUES('898','100','','co_auditoria_itens','157');

INSERT INTO TB_AUDITORIA_ITENS VALUES('899','1','','ds_item_anterior','157');

INSERT INTO TB_AUDITORIA_ITENS VALUES('900','','','ds_item_atual','157');

INSERT INTO TB_AUDITORIA_ITENS VALUES('901','co_usuario','','ds_campo','157');

INSERT INTO TB_AUDITORIA_ITENS VALUES('902','15','','co_auditoria_tabela','157');

INSERT INTO TB_AUDITORIA_ITENS VALUES('903','101','','co_auditoria_itens','158');

INSERT INTO TB_AUDITORIA_ITENS VALUES('904','4','','ds_item_anterior','158');

INSERT INTO TB_AUDITORIA_ITENS VALUES('905','','','ds_item_atual','158');

INSERT INTO TB_AUDITORIA_ITENS VALUES('906','co_trafego','','ds_campo','158');

INSERT INTO TB_AUDITORIA_ITENS VALUES('907','15','','co_auditoria_tabela','158');

INSERT INTO TB_AUDITORIA_ITENS VALUES('908','102','','co_auditoria_itens','159');

INSERT INTO TB_AUDITORIA_ITENS VALUES('909','4','','ds_item_anterior','159');

INSERT INTO TB_AUDITORIA_ITENS VALUES('910','','','ds_item_atual','159');

INSERT INTO TB_AUDITORIA_ITENS VALUES('911','co_acesso','','ds_campo','159');

INSERT INTO TB_AUDITORIA_ITENS VALUES('912','16','','co_auditoria_tabela','159');

INSERT INTO TB_AUDITORIA_ITENS VALUES('913','103','','co_auditoria_itens','160');

INSERT INTO TB_AUDITORIA_ITENS VALUES('914','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','160');

INSERT INTO TB_AUDITORIA_ITENS VALUES('915','','','ds_item_atual','160');

INSERT INTO TB_AUDITORIA_ITENS VALUES('916','ds_session_id','','ds_campo','160');

INSERT INTO TB_AUDITORIA_ITENS VALUES('917','16','','co_auditoria_tabela','160');

INSERT INTO TB_AUDITORIA_ITENS VALUES('918','104','','co_auditoria_itens','161');

INSERT INTO TB_AUDITORIA_ITENS VALUES('919','2021-02-09 11:44:11','','ds_item_anterior','161');

INSERT INTO TB_AUDITORIA_ITENS VALUES('920','','','ds_item_atual','161');

INSERT INTO TB_AUDITORIA_ITENS VALUES('921','dt_inicio_acesso','','ds_campo','161');

INSERT INTO TB_AUDITORIA_ITENS VALUES('922','16','','co_auditoria_tabela','161');

INSERT INTO TB_AUDITORIA_ITENS VALUES('923','105','','co_auditoria_itens','162');

INSERT INTO TB_AUDITORIA_ITENS VALUES('924','2021-02-09 12:14:42','','ds_item_anterior','162');

INSERT INTO TB_AUDITORIA_ITENS VALUES('925','2021-02-09 12:14:43','','ds_item_atual','162');

INSERT INTO TB_AUDITORIA_ITENS VALUES('926','dt_fim_acesso','','ds_campo','162');

INSERT INTO TB_AUDITORIA_ITENS VALUES('927','16','','co_auditoria_tabela','162');

INSERT INTO TB_AUDITORIA_ITENS VALUES('928','106','','co_auditoria_itens','163');

INSERT INTO TB_AUDITORIA_ITENS VALUES('929','A','','ds_item_anterior','163');

INSERT INTO TB_AUDITORIA_ITENS VALUES('930','','','ds_item_atual','163');

INSERT INTO TB_AUDITORIA_ITENS VALUES('931','tp_situacao','','ds_campo','163');

INSERT INTO TB_AUDITORIA_ITENS VALUES('932','16','','co_auditoria_tabela','163');

INSERT INTO TB_AUDITORIA_ITENS VALUES('933','107','','co_auditoria_itens','164');

INSERT INTO TB_AUDITORIA_ITENS VALUES('934','1','','ds_item_anterior','164');

INSERT INTO TB_AUDITORIA_ITENS VALUES('935','','','ds_item_atual','164');

INSERT INTO TB_AUDITORIA_ITENS VALUES('936','co_usuario','','ds_campo','164');

INSERT INTO TB_AUDITORIA_ITENS VALUES('937','16','','co_auditoria_tabela','164');

INSERT INTO TB_AUDITORIA_ITENS VALUES('938','108','','co_auditoria_itens','165');

INSERT INTO TB_AUDITORIA_ITENS VALUES('939','4','','ds_item_anterior','165');

INSERT INTO TB_AUDITORIA_ITENS VALUES('940','','','ds_item_atual','165');

INSERT INTO TB_AUDITORIA_ITENS VALUES('941','co_trafego','','ds_campo','165');

INSERT INTO TB_AUDITORIA_ITENS VALUES('942','16','','co_auditoria_tabela','165');

INSERT INTO TB_AUDITORIA_ITENS VALUES('943','109','','co_auditoria_itens','166');

INSERT INTO TB_AUDITORIA_ITENS VALUES('944','4','','ds_item_anterior','166');

INSERT INTO TB_AUDITORIA_ITENS VALUES('945','','','ds_item_atual','166');

INSERT INTO TB_AUDITORIA_ITENS VALUES('946','co_acesso','','ds_campo','166');

INSERT INTO TB_AUDITORIA_ITENS VALUES('947','17','','co_auditoria_tabela','166');

INSERT INTO TB_AUDITORIA_ITENS VALUES('948','110','','co_auditoria_itens','167');

INSERT INTO TB_AUDITORIA_ITENS VALUES('949','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','167');

INSERT INTO TB_AUDITORIA_ITENS VALUES('950','','','ds_item_atual','167');

INSERT INTO TB_AUDITORIA_ITENS VALUES('951','ds_session_id','','ds_campo','167');

INSERT INTO TB_AUDITORIA_ITENS VALUES('952','17','','co_auditoria_tabela','167');

INSERT INTO TB_AUDITORIA_ITENS VALUES('953','111','','co_auditoria_itens','168');

INSERT INTO TB_AUDITORIA_ITENS VALUES('954','2021-02-09 11:44:11','','ds_item_anterior','168');

INSERT INTO TB_AUDITORIA_ITENS VALUES('955','','','ds_item_atual','168');

INSERT INTO TB_AUDITORIA_ITENS VALUES('956','dt_inicio_acesso','','ds_campo','168');

INSERT INTO TB_AUDITORIA_ITENS VALUES('957','17','','co_auditoria_tabela','168');

INSERT INTO TB_AUDITORIA_ITENS VALUES('958','112','','co_auditoria_itens','169');

INSERT INTO TB_AUDITORIA_ITENS VALUES('959','2021-02-09 12:14:43','','ds_item_anterior','169');

INSERT INTO TB_AUDITORIA_ITENS VALUES('960','2021-02-09 12:14:45','','ds_item_atual','169');

INSERT INTO TB_AUDITORIA_ITENS VALUES('961','dt_fim_acesso','','ds_campo','169');

INSERT INTO TB_AUDITORIA_ITENS VALUES('962','17','','co_auditoria_tabela','169');

INSERT INTO TB_AUDITORIA_ITENS VALUES('963','113','','co_auditoria_itens','170');

INSERT INTO TB_AUDITORIA_ITENS VALUES('964','A','','ds_item_anterior','170');

INSERT INTO TB_AUDITORIA_ITENS VALUES('965','','','ds_item_atual','170');

INSERT INTO TB_AUDITORIA_ITENS VALUES('966','tp_situacao','','ds_campo','170');

INSERT INTO TB_AUDITORIA_ITENS VALUES('967','17','','co_auditoria_tabela','170');

INSERT INTO TB_AUDITORIA_ITENS VALUES('968','114','','co_auditoria_itens','171');

INSERT INTO TB_AUDITORIA_ITENS VALUES('969','1','','ds_item_anterior','171');

INSERT INTO TB_AUDITORIA_ITENS VALUES('970','','','ds_item_atual','171');

INSERT INTO TB_AUDITORIA_ITENS VALUES('971','co_usuario','','ds_campo','171');

INSERT INTO TB_AUDITORIA_ITENS VALUES('972','17','','co_auditoria_tabela','171');

INSERT INTO TB_AUDITORIA_ITENS VALUES('973','115','','co_auditoria_itens','172');

INSERT INTO TB_AUDITORIA_ITENS VALUES('974','4','','ds_item_anterior','172');

INSERT INTO TB_AUDITORIA_ITENS VALUES('975','','','ds_item_atual','172');

INSERT INTO TB_AUDITORIA_ITENS VALUES('976','co_trafego','','ds_campo','172');

INSERT INTO TB_AUDITORIA_ITENS VALUES('977','17','','co_auditoria_tabela','172');

INSERT INTO TB_AUDITORIA_ITENS VALUES('978','116','','co_auditoria_itens','173');

INSERT INTO TB_AUDITORIA_ITENS VALUES('979','4','','ds_item_anterior','173');

INSERT INTO TB_AUDITORIA_ITENS VALUES('980','','','ds_item_atual','173');

INSERT INTO TB_AUDITORIA_ITENS VALUES('981','co_acesso','','ds_campo','173');

INSERT INTO TB_AUDITORIA_ITENS VALUES('982','18','','co_auditoria_tabela','173');

INSERT INTO TB_AUDITORIA_ITENS VALUES('983','117','','co_auditoria_itens','174');

INSERT INTO TB_AUDITORIA_ITENS VALUES('984','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','174');

INSERT INTO TB_AUDITORIA_ITENS VALUES('985','','','ds_item_atual','174');

INSERT INTO TB_AUDITORIA_ITENS VALUES('986','ds_session_id','','ds_campo','174');

INSERT INTO TB_AUDITORIA_ITENS VALUES('987','18','','co_auditoria_tabela','174');

INSERT INTO TB_AUDITORIA_ITENS VALUES('988','118','','co_auditoria_itens','175');

INSERT INTO TB_AUDITORIA_ITENS VALUES('989','2021-02-09 11:44:11','','ds_item_anterior','175');

INSERT INTO TB_AUDITORIA_ITENS VALUES('990','','','ds_item_atual','175');

INSERT INTO TB_AUDITORIA_ITENS VALUES('991','dt_inicio_acesso','','ds_campo','175');

INSERT INTO TB_AUDITORIA_ITENS VALUES('992','18','','co_auditoria_tabela','175');

INSERT INTO TB_AUDITORIA_ITENS VALUES('993','119','','co_auditoria_itens','176');

INSERT INTO TB_AUDITORIA_ITENS VALUES('994','2021-02-09 12:14:45','','ds_item_anterior','176');

INSERT INTO TB_AUDITORIA_ITENS VALUES('995','2021-02-09 12:14:45','','ds_item_atual','176');

INSERT INTO TB_AUDITORIA_ITENS VALUES('996','dt_fim_acesso','','ds_campo','176');

INSERT INTO TB_AUDITORIA_ITENS VALUES('997','18','','co_auditoria_tabela','176');

INSERT INTO TB_AUDITORIA_ITENS VALUES('998','120','','co_auditoria_itens','177');

INSERT INTO TB_AUDITORIA_ITENS VALUES('999','A','','ds_item_anterior','177');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1000','','','ds_item_atual','177');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1001','tp_situacao','','ds_campo','177');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1002','18','','co_auditoria_tabela','177');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1003','121','','co_auditoria_itens','178');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1004','1','','ds_item_anterior','178');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1005','','','ds_item_atual','178');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1006','co_usuario','','ds_campo','178');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1007','18','','co_auditoria_tabela','178');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1008','122','','co_auditoria_itens','179');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1009','4','','ds_item_anterior','179');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1010','','','ds_item_atual','179');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1011','co_trafego','','ds_campo','179');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1012','18','','co_auditoria_tabela','179');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1013','123','','co_auditoria_itens','180');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1014','4','','ds_item_anterior','180');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1015','','','ds_item_atual','180');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1016','co_acesso','','ds_campo','180');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1017','19','','co_auditoria_tabela','180');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1018','124','','co_auditoria_itens','181');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1019','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','181');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1020','','','ds_item_atual','181');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1021','ds_session_id','','ds_campo','181');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1022','19','','co_auditoria_tabela','181');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1023','125','','co_auditoria_itens','182');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1024','2021-02-09 11:44:11','','ds_item_anterior','182');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1025','','','ds_item_atual','182');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1026','dt_inicio_acesso','','ds_campo','182');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1027','19','','co_auditoria_tabela','182');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1028','126','','co_auditoria_itens','183');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1029','2021-02-09 12:14:45','','ds_item_anterior','183');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1030','2021-02-09 12:18:48','','ds_item_atual','183');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1031','dt_fim_acesso','','ds_campo','183');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1032','19','','co_auditoria_tabela','183');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1033','127','','co_auditoria_itens','184');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1034','A','','ds_item_anterior','184');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1035','','','ds_item_atual','184');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1036','tp_situacao','','ds_campo','184');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1037','19','','co_auditoria_tabela','184');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1038','128','','co_auditoria_itens','185');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1039','1','','ds_item_anterior','185');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1040','','','ds_item_atual','185');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1041','co_usuario','','ds_campo','185');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1042','19','','co_auditoria_tabela','185');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1043','129','','co_auditoria_itens','186');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1044','4','','ds_item_anterior','186');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1045','','','ds_item_atual','186');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1046','co_trafego','','ds_campo','186');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1047','19','','co_auditoria_tabela','186');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1048','130','','co_auditoria_itens','187');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1049','4','','ds_item_anterior','187');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1050','','','ds_item_atual','187');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1051','co_acesso','','ds_campo','187');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1052','20','','co_auditoria_tabela','187');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1053','131','','co_auditoria_itens','188');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1054','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','188');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1055','','','ds_item_atual','188');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1056','ds_session_id','','ds_campo','188');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1057','20','','co_auditoria_tabela','188');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1058','132','','co_auditoria_itens','189');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1059','2021-02-09 11:44:11','','ds_item_anterior','189');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1060','','','ds_item_atual','189');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1061','dt_inicio_acesso','','ds_campo','189');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1062','20','','co_auditoria_tabela','189');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1063','133','','co_auditoria_itens','190');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1064','2021-02-09 12:18:48','','ds_item_anterior','190');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1065','2021-02-09 12:18:49','','ds_item_atual','190');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1066','dt_fim_acesso','','ds_campo','190');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1067','20','','co_auditoria_tabela','190');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1068','134','','co_auditoria_itens','191');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1069','A','','ds_item_anterior','191');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1070','','','ds_item_atual','191');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1071','tp_situacao','','ds_campo','191');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1072','20','','co_auditoria_tabela','191');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1073','135','','co_auditoria_itens','192');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1074','1','','ds_item_anterior','192');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1075','','','ds_item_atual','192');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1076','co_usuario','','ds_campo','192');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1077','20','','co_auditoria_tabela','192');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1078','136','','co_auditoria_itens','193');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1079','4','','ds_item_anterior','193');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1080','','','ds_item_atual','193');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1081','co_trafego','','ds_campo','193');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1082','20','','co_auditoria_tabela','193');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1083','137','','co_auditoria_itens','194');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1084','','','ds_item_anterior','194');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1085','Curso/curso-de-pregador-602292c167e06.png','','ds_item_atual','194');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1086','ds_caminho','','ds_campo','194');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1087','21','','co_auditoria_tabela','194');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1088','138','','co_auditoria_itens','195');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1089','','','ds_item_anterior','195');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1090','2','','ds_item_atual','195');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1091','co_tipo_imagem','','ds_campo','195');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1092','21','','co_auditoria_tabela','195');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1093','139','','co_auditoria_itens','196');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1094','1','','ds_item_anterior','196');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1095','1','','ds_item_atual','196');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1096','co_curso','','ds_campo','196');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1097','22','','co_auditoria_tabela','196');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1098','140','','co_auditoria_itens','197');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1099','<h3>Conhe&ccedil;a esta Forma&ccedil;&atilde;o!</h3>\n\n\n\n<div class=\"conteudo\"><strong>Objetivos</strong>:\n\n\n\n<ul>\n\n	<li>Conhecer m&eacute;todos para elaborar prega&ccedil;&otilde;es sem dificuldades</li>\n\n	<li>Saber onde encontrar fontes seguras para montar sua prega&ccedil;&atilde;o</li>\n\n	<li>Fazer aprofundamento em mensagens b&iacute;blicas</li>\n\n	<li>Controlar o nervosismo ao falar em p&uacute;blico</li>\n\n	<li>Aprender t&eacute;cnicas de prega&ccedil;&atilde;o para uma boa comunica&ccedil;&atilde;o</li>\n\n	<li>Sabe como fazer prega&ccedil;&otilde;es em diversos meios de evangeliza&ccedil;&atilde;o</li>\n\n	<li>Aprender de forma interativa e din&acirc;mica</li>\n\n	<li>Aprender e partilhar conhecimentos com pessoas de v&aacute;rias localidades do Brasil</li>\n\n	<li>Conhecer e estudar com pessoas que desejam assim como voc&ecirc; aprender e aprofundar mais nas coisas de Deus</li>\n\n	<li>Tirar suas d&uacute;vidas diretamente com os formadores</li>\n\n</ul>\n\n</div>\n\n\n\n<div>&nbsp;</div>\n\n\n\n<div><strong>Modalidade</strong>: realizado &aacute; distancia, mas com uma metodologia de uma forma&ccedil;&atilde;o interativa e din&acirc;mica.</div>\n\n\n\n<div>&nbsp;</div>\n\n\n\n<div><strong>Destinat&aacute;rios</strong>: Pessoas que sentem o chamado para prega&ccedil;&atilde;o, ou deseja conhecer mais sobre o minist&eacute;rio.</div>\n\n\n\n<div>&nbsp;</div>\n\n\n\n<div><strong>Carga hor&aacute;ria</strong>: 12 horas.</div>\n\n\n\n<div>&nbsp;</div>\n\n\n\n<div><strong>Per&iacute;odo de realiza&ccedil;&atilde;o</strong>: 02/03 a 18/03 de 2021 &ndash; 20h00, (verificar dias)</div>\n\n\n\n<div>&nbsp;</div>','','ds_item_anterior','197');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1100','<div class=\"conteudo\"><strong>Objetivos</strong>:\n<ul>\n	<li>Conhecer m&eacute;todos para elaborar prega&ccedil;&otilde;es sem dificuldades</li>\n	<li>Saber onde encontrar fontes seguras para montar sua prega&ccedil;&atilde;o</li>\n	<li>Fazer aprofundamento em mensagens b&iacute;blicas</li>\n	<li>Controlar o nervosismo ao falar em p&uacute;blico</li>\n	<li>Aprender t&eacute;cnicas de prega&ccedil;&atilde;o para uma boa comunica&ccedil;&atilde;o</li>\n	<li>Sabe como fazer prega&ccedil;&otilde;es em diversos meios de evangeliza&ccedil;&atilde;o</li>\n	<li>Aprender de forma interativa e din&acirc;mica</li>\n	<li>Aprender e partilhar conhecimentos com pessoas de v&aacute;rias localidades do Brasil</li>\n	<li>Conhecer e estudar com pessoas que desejam assim como voc&ecirc; aprender e aprofundar mais nas coisas de Deus</li>\n	<li>Tirar suas d&uacute;vidas diretamente com os formadores</li>\n</ul>\n</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Modalidade</strong>: realizado &aacute; distancia, mas com uma metodologia de uma forma&ccedil;&atilde;o interativa e din&acirc;mica.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Destinat&aacute;rios</strong>: Pessoas que sentem o chamado para prega&ccedil;&atilde;o, ou deseja conhecer mais sobre o minist&eacute;rio.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Carga hor&aacute;ria</strong>: 12 horas.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Per&iacute;odo de realiza&ccedil;&atilde;o</strong>: 02/03 a 18/03 de 2021 &ndash; 20h00, (verificar dias)</div>\n\n<div>&nbsp;</div>','','ds_item_atual','197');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1101','ds_descricao','','ds_campo','197');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1102','22','','co_auditoria_tabela','197');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1103','141','','co_auditoria_itens','198');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1104','2021-02-08 11:35:36','','ds_item_anterior','198');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1105','','','ds_item_atual','198');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1106','dt_cadastro','','ds_campo','198');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1107','22','','co_auditoria_tabela','198');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1108','142','','co_auditoria_itens','199');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1109','','','ds_item_anterior','199');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1110','3','','ds_item_atual','199');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1111','co_imagem','','ds_campo','199');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1112','22','','co_auditoria_tabela','199');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1113','143','','co_auditoria_itens','200');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1114','','','ds_item_anterior','200');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1115','2021-02-09 11:48:49','','ds_item_atual','200');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1116','dt_cadastro','','ds_campo','200');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1117','23','','co_auditoria_tabela','200');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1118','144','','co_auditoria_itens','201');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1119','','','ds_item_anterior','201');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1120','22.80','','ds_item_atual','201');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1121','nu_valor','','ds_campo','201');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1122','23','','co_auditoria_tabela','201');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1123','145','','co_auditoria_itens','202');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1124','','','ds_item_anterior','202');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1125','CURSO DE PREGADOR','','ds_item_atual','202');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1126','ds_titulo','','ds_campo','202');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1127','23','','co_auditoria_tabela','202');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1128','146','','co_auditoria_itens','203');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1129','','','ds_item_anterior','203');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1130','16','','ds_item_atual','203');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1131','nu_carga_horaria','','ds_campo','203');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1132','23','','co_auditoria_tabela','203');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1133','147','','co_auditoria_itens','204');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1134','','','ds_item_anterior','204');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1135','2','','ds_item_atual','204');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1136','nu_duracao','','ds_campo','204');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1137','23','','co_auditoria_tabela','204');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1138','148','','co_auditoria_itens','205');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1139','','','ds_item_anterior','205');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1140','S','','ds_item_atual','205');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1141','st_certificacao','','ds_campo','205');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1142','23','','co_auditoria_tabela','205');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1143','149','','co_auditoria_itens','206');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1144','','','ds_item_anterior','206');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1145','S','','ds_item_atual','206');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1146','st_status','','ds_campo','206');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1147','23','','co_auditoria_tabela','206');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1148','150','','co_auditoria_itens','207');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1149','','','ds_item_anterior','207');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1150','1','','ds_item_atual','207');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1151','co_curso','','ds_campo','207');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1152','23','','co_auditoria_tabela','207');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1153','151','','co_auditoria_itens','208');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1154','','','ds_item_anterior','208');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1155','1','','ds_item_atual','208');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1156','co_usuario','','ds_campo','208');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1157','23','','co_auditoria_tabela','208');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1158','152','','co_auditoria_itens','209');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1159','4','','ds_item_anterior','209');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1160','','','ds_item_atual','209');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1161','co_acesso','','ds_campo','209');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1162','24','','co_auditoria_tabela','209');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1163','153','','co_auditoria_itens','210');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1164','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','210');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1165','','','ds_item_atual','210');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1166','ds_session_id','','ds_campo','210');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1167','24','','co_auditoria_tabela','210');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1168','154','','co_auditoria_itens','211');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1169','2021-02-09 11:44:11','','ds_item_anterior','211');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1170','','','ds_item_atual','211');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1171','dt_inicio_acesso','','ds_campo','211');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1172','24','','co_auditoria_tabela','211');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1173','155','','co_auditoria_itens','212');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1174','2021-02-09 12:18:49','','ds_item_anterior','212');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1175','2021-02-09 12:18:49','','ds_item_atual','212');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1176','dt_fim_acesso','','ds_campo','212');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1177','24','','co_auditoria_tabela','212');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1178','156','','co_auditoria_itens','213');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1179','A','','ds_item_anterior','213');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1180','','','ds_item_atual','213');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1181','tp_situacao','','ds_campo','213');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1182','24','','co_auditoria_tabela','213');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1183','157','','co_auditoria_itens','214');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1184','1','','ds_item_anterior','214');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1185','','','ds_item_atual','214');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1186','co_usuario','','ds_campo','214');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1187','24','','co_auditoria_tabela','214');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1188','158','','co_auditoria_itens','215');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1189','4','','ds_item_anterior','215');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1190','','','ds_item_atual','215');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1191','co_trafego','','ds_campo','215');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1192','24','','co_auditoria_tabela','215');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1193','159','','co_auditoria_itens','216');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1194','4','','ds_item_anterior','216');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1195','','','ds_item_atual','216');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1196','co_acesso','','ds_campo','216');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1197','25','','co_auditoria_tabela','216');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1198','160','','co_auditoria_itens','217');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1199','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','217');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1200','','','ds_item_atual','217');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1201','ds_session_id','','ds_campo','217');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1202','25','','co_auditoria_tabela','217');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1203','161','','co_auditoria_itens','218');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1204','2021-02-09 11:44:11','','ds_item_anterior','218');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1205','','','ds_item_atual','218');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1206','dt_inicio_acesso','','ds_campo','218');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1207','25','','co_auditoria_tabela','218');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1208','162','','co_auditoria_itens','219');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1209','2021-02-09 12:18:49','','ds_item_anterior','219');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1210','2021-02-09 12:18:50','','ds_item_atual','219');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1211','dt_fim_acesso','','ds_campo','219');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1212','25','','co_auditoria_tabela','219');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1213','163','','co_auditoria_itens','220');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1214','A','','ds_item_anterior','220');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1215','','','ds_item_atual','220');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1216','tp_situacao','','ds_campo','220');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1217','25','','co_auditoria_tabela','220');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1218','164','','co_auditoria_itens','221');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1219','1','','ds_item_anterior','221');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1220','','','ds_item_atual','221');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1221','co_usuario','','ds_campo','221');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1222','25','','co_auditoria_tabela','221');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1223','165','','co_auditoria_itens','222');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1224','4','','ds_item_anterior','222');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1225','','','ds_item_atual','222');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1226','co_trafego','','ds_campo','222');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1227','25','','co_auditoria_tabela','222');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1228','166','','co_auditoria_itens','223');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1229','4','','ds_item_anterior','223');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1230','','','ds_item_atual','223');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1231','co_acesso','','ds_campo','223');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1232','26','','co_auditoria_tabela','223');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1233','167','','co_auditoria_itens','224');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1234','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','224');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1235','','','ds_item_atual','224');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1236','ds_session_id','','ds_campo','224');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1237','26','','co_auditoria_tabela','224');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1238','168','','co_auditoria_itens','225');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1239','2021-02-09 11:44:11','','ds_item_anterior','225');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1240','','','ds_item_atual','225');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1241','dt_inicio_acesso','','ds_campo','225');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1242','26','','co_auditoria_tabela','225');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1243','169','','co_auditoria_itens','226');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1244','2021-02-09 12:18:50','','ds_item_anterior','226');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1245','2021-02-09 12:18:52','','ds_item_atual','226');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1246','dt_fim_acesso','','ds_campo','226');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1247','26','','co_auditoria_tabela','226');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1248','170','','co_auditoria_itens','227');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1249','A','','ds_item_anterior','227');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1250','F','','ds_item_atual','227');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1251','tp_situacao','','ds_campo','227');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1252','26','','co_auditoria_tabela','227');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1253','171','','co_auditoria_itens','228');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1254','1','','ds_item_anterior','228');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1255','','','ds_item_atual','228');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1256','co_usuario','','ds_campo','228');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1257','26','','co_auditoria_tabela','228');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1258','172','','co_auditoria_itens','229');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1259','4','','ds_item_anterior','229');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1260','','','ds_item_atual','229');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1261','co_trafego','','ds_campo','229');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1262','26','','co_auditoria_tabela','229');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1263','173','','co_auditoria_itens','230');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1264','','','ds_item_anterior','230');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1265','Firefox','','ds_item_atual','230');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1266','ds_navegador','','ds_campo','230');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1267','27','','co_auditoria_tabela','230');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1268','174','','co_auditoria_itens','231');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1269','','','ds_item_anterior','231');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1270','Windows 10','','ds_item_atual','231');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1271','ds_sistema_operacional','','ds_campo','231');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1272','27','','co_auditoria_tabela','231');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1273','175','','co_auditoria_itens','232');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1274','','','ds_item_anterior','232');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1275','Desktop','','ds_item_atual','232');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1276','ds_dispositivo','','ds_campo','232');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1277','27','','co_auditoria_tabela','232');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1278','176','','co_auditoria_itens','233');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1279','','','ds_item_anterior','233');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1280','127.0.0.1','','ds_item_atual','233');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1281','nu_ip','','ds_campo','233');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1282','27','','co_auditoria_tabela','233');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1283','177','','co_auditoria_itens','234');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1284','','','ds_item_anterior','234');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1285','Desconhecido','','ds_item_atual','234');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1286','ds_pais','','ds_campo','234');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1287','27','','co_auditoria_tabela','234');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1288','178','','co_auditoria_itens','235');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1289','','','ds_item_anterior','235');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1290','Desconhecida','','ds_item_atual','235');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1291','ds_code_pais','','ds_campo','235');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1292','27','','co_auditoria_tabela','235');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1293','179','','co_auditoria_itens','236');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1294','','','ds_item_anterior','236');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1295','Desconhecida','','ds_item_atual','236');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1296','ds_estado','','ds_campo','236');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1297','27','','co_auditoria_tabela','236');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1298','180','','co_auditoria_itens','237');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1299','','','ds_item_anterior','237');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1300','Desconhecida','','ds_item_atual','237');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1301','ds_uf','','ds_campo','237');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1302','27','','co_auditoria_tabela','237');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1303','181','','co_auditoria_itens','238');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1304','','','ds_item_anterior','238');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1305','Desconhecida','','ds_item_atual','238');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1306','ds_cidade','','ds_campo','238');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1307','27','','co_auditoria_tabela','238');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1308','182','','co_auditoria_itens','239');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1309','','','ds_item_anterior','239');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1310','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','','ds_item_atual','239');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1311','ds_agente','','ds_campo','239');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1312','27','','co_auditoria_tabela','239');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1313','183','','co_auditoria_itens','240');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1314','','','ds_item_anterior','240');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1315','uvulk300kskkoveq0qmoekvvoh','','ds_item_atual','240');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1316','ds_session_id','','ds_campo','240');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1317','28','','co_auditoria_tabela','240');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1318','184','','co_auditoria_itens','241');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1319','','','ds_item_anterior','241');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1320','1','','ds_item_atual','241');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1321','co_usuario','','ds_campo','241');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1322','28','','co_auditoria_tabela','241');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1323','185','','co_auditoria_itens','242');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1324','','','ds_item_anterior','242');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1325','A','','ds_item_atual','242');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1326','tp_situacao','','ds_campo','242');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1327','28','','co_auditoria_tabela','242');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1328','186','','co_auditoria_itens','243');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1329','','','ds_item_anterior','243');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1330','5','','ds_item_atual','243');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1331','co_trafego','','ds_campo','243');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1332','28','','co_auditoria_tabela','243');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1333','187','','co_auditoria_itens','244');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1334','','','ds_item_anterior','244');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1335','2021-02-09 14:45:04','','ds_item_atual','244');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1336','dt_fim_acesso','','ds_campo','244');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1337','28','','co_auditoria_tabela','244');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1338','188','','co_auditoria_itens','245');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1339','','','ds_item_anterior','245');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1340','2021-02-09 14:15:04','','ds_item_atual','245');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1341','dt_inicio_acesso','','ds_campo','245');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1342','28','','co_auditoria_tabela','245');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1343','189','','co_auditoria_itens','246');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1344','5','','ds_item_anterior','246');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1345','','','ds_item_atual','246');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1346','co_acesso','','ds_campo','246');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1347','29','','co_auditoria_tabela','246');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1348','190','','co_auditoria_itens','247');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1349','uvulk300kskkoveq0qmoekvvoh','','ds_item_anterior','247');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1350','','','ds_item_atual','247');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1351','ds_session_id','','ds_campo','247');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1352','29','','co_auditoria_tabela','247');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1353','191','','co_auditoria_itens','248');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1354','2021-02-09 14:15:04','','ds_item_anterior','248');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1355','','','ds_item_atual','248');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1356','dt_inicio_acesso','','ds_campo','248');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1357','29','','co_auditoria_tabela','248');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1358','192','','co_auditoria_itens','249');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1359','2021-02-09 14:45:04','','ds_item_anterior','249');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1360','2021-02-09 14:45:04','','ds_item_atual','249');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1361','dt_fim_acesso','','ds_campo','249');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1362','29','','co_auditoria_tabela','249');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1363','193','','co_auditoria_itens','250');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1364','A','','ds_item_anterior','250');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1365','','','ds_item_atual','250');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1366','tp_situacao','','ds_campo','250');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1367','29','','co_auditoria_tabela','250');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1368','194','','co_auditoria_itens','251');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1369','1','','ds_item_anterior','251');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1370','','','ds_item_atual','251');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1371','co_usuario','','ds_campo','251');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1372','29','','co_auditoria_tabela','251');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1373','195','','co_auditoria_itens','252');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1374','5','','ds_item_anterior','252');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1375','','','ds_item_atual','252');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1376','co_trafego','','ds_campo','252');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1377','29','','co_auditoria_tabela','252');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1378','196','','co_auditoria_itens','253');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1379','5','','ds_item_anterior','253');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1380','','','ds_item_atual','253');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1381','co_acesso','','ds_campo','253');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1382','30','','co_auditoria_tabela','253');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1383','197','','co_auditoria_itens','254');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1384','uvulk300kskkoveq0qmoekvvoh','','ds_item_anterior','254');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1385','','','ds_item_atual','254');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1386','ds_session_id','','ds_campo','254');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1387','30','','co_auditoria_tabela','254');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1388','198','','co_auditoria_itens','255');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1389','2021-02-09 14:15:04','','ds_item_anterior','255');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1390','','','ds_item_atual','255');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1391','dt_inicio_acesso','','ds_campo','255');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1392','30','','co_auditoria_tabela','255');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1393','199','','co_auditoria_itens','256');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1394','2021-02-09 14:45:04','','ds_item_anterior','256');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1395','2021-02-09 14:45:05','','ds_item_atual','256');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1396','dt_fim_acesso','','ds_campo','256');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1397','30','','co_auditoria_tabela','256');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1398','200','','co_auditoria_itens','257');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1399','A','','ds_item_anterior','257');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1400','','','ds_item_atual','257');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1401','tp_situacao','','ds_campo','257');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1402','30','','co_auditoria_tabela','257');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1403','201','','co_auditoria_itens','258');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1404','1','','ds_item_anterior','258');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1405','','','ds_item_atual','258');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1406','co_usuario','','ds_campo','258');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1407','30','','co_auditoria_tabela','258');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1408','202','','co_auditoria_itens','259');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1409','5','','ds_item_anterior','259');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1410','','','ds_item_atual','259');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1411','co_trafego','','ds_campo','259');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1412','30','','co_auditoria_tabela','259');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1413','248','','co_auditoria_itens','260');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1414','5','','ds_item_anterior','260');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1415','','','ds_item_atual','260');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1416','co_acesso','','ds_campo','260');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1417','39','','co_auditoria_tabela','260');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1418','249','','co_auditoria_itens','261');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1419','uvulk300kskkoveq0qmoekvvoh','','ds_item_anterior','261');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1420','','','ds_item_atual','261');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1421','ds_session_id','','ds_campo','261');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1422','39','','co_auditoria_tabela','261');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1423','250','','co_auditoria_itens','262');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1424','2021-02-09 14:15:04','','ds_item_anterior','262');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1425','','','ds_item_atual','262');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1426','dt_inicio_acesso','','ds_campo','262');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1427','39','','co_auditoria_tabela','262');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1428','251','','co_auditoria_itens','263');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1429','2021-02-09 14:45:05','','ds_item_anterior','263');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1430','','','ds_item_atual','263');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1431','dt_fim_acesso','','ds_campo','263');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1432','39','','co_auditoria_tabela','263');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1433','252','','co_auditoria_itens','264');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1434','A','','ds_item_anterior','264');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1435','F','','ds_item_atual','264');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1436','tp_situacao','','ds_campo','264');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1437','39','','co_auditoria_tabela','264');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1438','253','','co_auditoria_itens','265');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1439','1','','ds_item_anterior','265');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1440','','','ds_item_atual','265');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1441','co_usuario','','ds_campo','265');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1442','39','','co_auditoria_tabela','265');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1443','254','','co_auditoria_itens','266');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1444','5','','ds_item_anterior','266');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1445','','','ds_item_atual','266');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1446','co_trafego','','ds_campo','266');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1447','39','','co_auditoria_tabela','266');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1448','255','','co_auditoria_itens','267');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1449','','','ds_item_anterior','267');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1450','Firefox','','ds_item_atual','267');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1451','ds_navegador','','ds_campo','267');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1452','40','','co_auditoria_tabela','267');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1453','256','','co_auditoria_itens','268');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1454','','','ds_item_anterior','268');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1455','Windows 10','','ds_item_atual','268');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1456','ds_sistema_operacional','','ds_campo','268');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1457','40','','co_auditoria_tabela','268');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1458','257','','co_auditoria_itens','269');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1459','','','ds_item_anterior','269');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1460','Desktop','','ds_item_atual','269');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1461','ds_dispositivo','','ds_campo','269');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1462','40','','co_auditoria_tabela','269');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1463','258','','co_auditoria_itens','270');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1464','','','ds_item_anterior','270');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1465','127.0.0.1','','ds_item_atual','270');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1466','nu_ip','','ds_campo','270');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1467','40','','co_auditoria_tabela','270');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1468','259','','co_auditoria_itens','271');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1469','','','ds_item_anterior','271');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1470','Desconhecido','','ds_item_atual','271');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1471','ds_pais','','ds_campo','271');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1472','40','','co_auditoria_tabela','271');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1473','260','','co_auditoria_itens','272');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1474','','','ds_item_anterior','272');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1475','Desconhecida','','ds_item_atual','272');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1476','ds_code_pais','','ds_campo','272');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1477','40','','co_auditoria_tabela','272');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1478','261','','co_auditoria_itens','273');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1479','','','ds_item_anterior','273');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1480','Desconhecida','','ds_item_atual','273');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1481','ds_estado','','ds_campo','273');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1482','40','','co_auditoria_tabela','273');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1483','262','','co_auditoria_itens','274');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1484','','','ds_item_anterior','274');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1485','Desconhecida','','ds_item_atual','274');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1486','ds_uf','','ds_campo','274');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1487','40','','co_auditoria_tabela','274');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1488','263','','co_auditoria_itens','275');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1489','','','ds_item_anterior','275');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1490','Desconhecida','','ds_item_atual','275');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1491','ds_cidade','','ds_campo','275');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1492','40','','co_auditoria_tabela','275');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1493','264','','co_auditoria_itens','276');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1494','','','ds_item_anterior','276');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1495','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','','ds_item_atual','276');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1496','ds_agente','','ds_campo','276');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1497','40','','co_auditoria_tabela','276');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1498','265','','co_auditoria_itens','277');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1499','','','ds_item_anterior','277');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1500','uvulk300kskkoveq0qmoekvvoh','','ds_item_atual','277');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1501','ds_session_id','','ds_campo','277');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1502','41','','co_auditoria_tabela','277');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1503','266','','co_auditoria_itens','278');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1504','','','ds_item_anterior','278');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1505','1','','ds_item_atual','278');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1506','co_usuario','','ds_campo','278');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1507','41','','co_auditoria_tabela','278');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1508','267','','co_auditoria_itens','279');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1509','','','ds_item_anterior','279');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1510','A','','ds_item_atual','279');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1511','tp_situacao','','ds_campo','279');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1512','41','','co_auditoria_tabela','279');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1513','268','','co_auditoria_itens','280');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1514','','','ds_item_anterior','280');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1515','6','','ds_item_atual','280');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1516','co_trafego','','ds_campo','280');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1517','41','','co_auditoria_tabela','280');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1518','269','','co_auditoria_itens','281');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1519','','','ds_item_anterior','281');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1520','2021-02-09 19:01:53','','ds_item_atual','281');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1521','dt_fim_acesso','','ds_campo','281');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1522','41','','co_auditoria_tabela','281');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1523','270','','co_auditoria_itens','282');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1524','','','ds_item_anterior','282');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1525','2021-02-09 18:31:53','','ds_item_atual','282');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1526','dt_inicio_acesso','','ds_campo','282');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1527','41','','co_auditoria_tabela','282');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1528','271','','co_auditoria_itens','283');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1529','6','','ds_item_anterior','283');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1530','','','ds_item_atual','283');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1531','co_acesso','','ds_campo','283');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1532','42','','co_auditoria_tabela','283');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1533','272','','co_auditoria_itens','284');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1534','uvulk300kskkoveq0qmoekvvoh','','ds_item_anterior','284');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1535','','','ds_item_atual','284');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1536','ds_session_id','','ds_campo','284');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1537','42','','co_auditoria_tabela','284');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1538','273','','co_auditoria_itens','285');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1539','2021-02-09 18:31:53','','ds_item_anterior','285');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1540','','','ds_item_atual','285');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1541','dt_inicio_acesso','','ds_campo','285');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1542','42','','co_auditoria_tabela','285');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1543','274','','co_auditoria_itens','286');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1544','2021-02-09 19:01:53','','ds_item_anterior','286');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1545','2021-02-09 19:01:54','','ds_item_atual','286');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1546','dt_fim_acesso','','ds_campo','286');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1547','42','','co_auditoria_tabela','286');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1548','275','','co_auditoria_itens','287');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1549','A','','ds_item_anterior','287');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1550','','','ds_item_atual','287');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1551','tp_situacao','','ds_campo','287');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1552','42','','co_auditoria_tabela','287');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1553','276','','co_auditoria_itens','288');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1554','1','','ds_item_anterior','288');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1555','','','ds_item_atual','288');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1556','co_usuario','','ds_campo','288');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1557','42','','co_auditoria_tabela','288');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1558','277','','co_auditoria_itens','289');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1559','6','','ds_item_anterior','289');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1560','','','ds_item_atual','289');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1561','co_trafego','','ds_campo','289');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1562','42','','co_auditoria_tabela','289');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1563','278','','co_auditoria_itens','290');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1564','6','','ds_item_anterior','290');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1565','','','ds_item_atual','290');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1566','co_acesso','','ds_campo','290');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1567','43','','co_auditoria_tabela','290');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1568','279','','co_auditoria_itens','291');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1569','uvulk300kskkoveq0qmoekvvoh','','ds_item_anterior','291');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1570','','','ds_item_atual','291');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1571','ds_session_id','','ds_campo','291');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1572','43','','co_auditoria_tabela','291');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1573','280','','co_auditoria_itens','292');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1574','2021-02-09 18:31:53','','ds_item_anterior','292');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1575','','','ds_item_atual','292');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1576','dt_inicio_acesso','','ds_campo','292');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1577','43','','co_auditoria_tabela','292');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1578','281','','co_auditoria_itens','293');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1579','2021-02-09 19:01:54','','ds_item_anterior','293');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1580','2021-02-09 19:01:54','','ds_item_atual','293');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1581','dt_fim_acesso','','ds_campo','293');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1582','43','','co_auditoria_tabela','293');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1583','282','','co_auditoria_itens','294');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1584','A','','ds_item_anterior','294');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1585','','','ds_item_atual','294');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1586','tp_situacao','','ds_campo','294');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1587','43','','co_auditoria_tabela','294');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1588','283','','co_auditoria_itens','295');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1589','1','','ds_item_anterior','295');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1590','','','ds_item_atual','295');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1591','co_usuario','','ds_campo','295');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1592','43','','co_auditoria_tabela','295');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1593','284','','co_auditoria_itens','296');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1594','6','','ds_item_anterior','296');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1595','','','ds_item_atual','296');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1596','co_trafego','','ds_campo','296');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1597','43','','co_auditoria_tabela','296');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1598','285','','co_auditoria_itens','297');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1599','6','','ds_item_anterior','297');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1600','','','ds_item_atual','297');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1601','co_acesso','','ds_campo','297');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1602','44','','co_auditoria_tabela','297');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1603','286','','co_auditoria_itens','298');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1604','uvulk300kskkoveq0qmoekvvoh','','ds_item_anterior','298');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1605','','','ds_item_atual','298');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1606','ds_session_id','','ds_campo','298');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1607','44','','co_auditoria_tabela','298');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1608','287','','co_auditoria_itens','299');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1609','2021-02-09 18:31:53','','ds_item_anterior','299');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1610','','','ds_item_atual','299');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1611','dt_inicio_acesso','','ds_campo','299');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1612','44','','co_auditoria_tabela','299');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1613','288','','co_auditoria_itens','300');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1614','2021-02-09 19:01:54','','ds_item_anterior','300');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1615','2021-02-09 19:01:59','','ds_item_atual','300');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1616','dt_fim_acesso','','ds_campo','300');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1617','44','','co_auditoria_tabela','300');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1618','289','','co_auditoria_itens','301');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1619','A','','ds_item_anterior','301');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1620','','','ds_item_atual','301');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1621','tp_situacao','','ds_campo','301');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1622','44','','co_auditoria_tabela','301');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1623','290','','co_auditoria_itens','302');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1624','1','','ds_item_anterior','302');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1625','','','ds_item_atual','302');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1626','co_usuario','','ds_campo','302');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1627','44','','co_auditoria_tabela','302');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1628','291','','co_auditoria_itens','303');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1629','6','','ds_item_anterior','303');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1630','','','ds_item_atual','303');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1631','co_trafego','','ds_campo','303');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1632','44','','co_auditoria_tabela','303');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1633','292','','co_auditoria_itens','304');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1634','6','','ds_item_anterior','304');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1635','','','ds_item_atual','304');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1636','co_acesso','','ds_campo','304');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1637','45','','co_auditoria_tabela','304');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1638','293','','co_auditoria_itens','305');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1639','uvulk300kskkoveq0qmoekvvoh','','ds_item_anterior','305');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1640','','','ds_item_atual','305');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1641','ds_session_id','','ds_campo','305');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1642','45','','co_auditoria_tabela','305');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1643','294','','co_auditoria_itens','306');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1644','2021-02-09 18:31:53','','ds_item_anterior','306');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1645','','','ds_item_atual','306');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1646','dt_inicio_acesso','','ds_campo','306');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1647','45','','co_auditoria_tabela','306');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1648','295','','co_auditoria_itens','307');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1649','2021-02-09 19:01:59','','ds_item_anterior','307');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1650','2021-02-09 19:01:59','','ds_item_atual','307');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1651','dt_fim_acesso','','ds_campo','307');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1652','45','','co_auditoria_tabela','307');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1653','296','','co_auditoria_itens','308');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1654','A','','ds_item_anterior','308');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1655','','','ds_item_atual','308');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1656','tp_situacao','','ds_campo','308');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1657','45','','co_auditoria_tabela','308');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1658','297','','co_auditoria_itens','309');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1659','1','','ds_item_anterior','309');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1660','','','ds_item_atual','309');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1661','co_usuario','','ds_campo','309');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1662','45','','co_auditoria_tabela','309');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1663','298','','co_auditoria_itens','310');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1664','6','','ds_item_anterior','310');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1665','','','ds_item_atual','310');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1666','co_trafego','','ds_campo','310');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1667','45','','co_auditoria_tabela','310');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1668','299','','co_auditoria_itens','311');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1669','6','','ds_item_anterior','311');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1670','','','ds_item_atual','311');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1671','co_acesso','','ds_campo','311');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1672','46','','co_auditoria_tabela','311');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1673','300','','co_auditoria_itens','312');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1674','uvulk300kskkoveq0qmoekvvoh','','ds_item_anterior','312');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1675','','','ds_item_atual','312');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1676','ds_session_id','','ds_campo','312');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1677','46','','co_auditoria_tabela','312');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1678','301','','co_auditoria_itens','313');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1679','2021-02-09 18:31:53','','ds_item_anterior','313');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1680','','','ds_item_atual','313');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1681','dt_inicio_acesso','','ds_campo','313');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1682','46','','co_auditoria_tabela','313');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1683','302','','co_auditoria_itens','314');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1684','2021-02-09 19:01:59','','ds_item_anterior','314');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1685','2021-02-09 19:02:03','','ds_item_atual','314');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1686','dt_fim_acesso','','ds_campo','314');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1687','46','','co_auditoria_tabela','314');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1688','303','','co_auditoria_itens','315');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1689','A','','ds_item_anterior','315');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1690','','','ds_item_atual','315');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1691','tp_situacao','','ds_campo','315');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1692','46','','co_auditoria_tabela','315');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1693','304','','co_auditoria_itens','316');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1694','1','','ds_item_anterior','316');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1695','','','ds_item_atual','316');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1696','co_usuario','','ds_campo','316');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1697','46','','co_auditoria_tabela','316');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1698','305','','co_auditoria_itens','317');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1699','6','','ds_item_anterior','317');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1700','','','ds_item_atual','317');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1701','co_trafego','','ds_campo','317');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1702','46','','co_auditoria_tabela','317');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1703','306','','co_auditoria_itens','318');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1704','6','','ds_item_anterior','318');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1705','','','ds_item_atual','318');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1706','co_acesso','','ds_campo','318');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1707','47','','co_auditoria_tabela','318');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1708','307','','co_auditoria_itens','319');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1709','uvulk300kskkoveq0qmoekvvoh','','ds_item_anterior','319');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1710','','','ds_item_atual','319');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1711','ds_session_id','','ds_campo','319');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1712','47','','co_auditoria_tabela','319');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1713','308','','co_auditoria_itens','320');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1714','2021-02-09 18:31:53','','ds_item_anterior','320');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1715','','','ds_item_atual','320');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1716','dt_inicio_acesso','','ds_campo','320');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1717','47','','co_auditoria_tabela','320');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1718','309','','co_auditoria_itens','321');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1719','2021-02-09 19:02:03','','ds_item_anterior','321');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1720','2021-02-09 19:02:04','','ds_item_atual','321');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1721','dt_fim_acesso','','ds_campo','321');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1722','47','','co_auditoria_tabela','321');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1723','310','','co_auditoria_itens','322');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1724','A','','ds_item_anterior','322');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1725','','','ds_item_atual','322');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1726','tp_situacao','','ds_campo','322');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1727','47','','co_auditoria_tabela','322');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1728','311','','co_auditoria_itens','323');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1729','1','','ds_item_anterior','323');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1730','','','ds_item_atual','323');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1731','co_usuario','','ds_campo','323');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1732','47','','co_auditoria_tabela','323');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1733','312','','co_auditoria_itens','324');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1734','6','','ds_item_anterior','324');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1735','','','ds_item_atual','324');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1736','co_trafego','','ds_campo','324');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1737','47','','co_auditoria_tabela','324');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1738','313','','co_auditoria_itens','325');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1739','1','','ds_item_anterior','325');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1740','','','ds_item_atual','325');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1741','co_trafego','','ds_campo','325');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1742','48','','co_auditoria_tabela','325');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1743','314','','co_auditoria_itens','326');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1744','127.0.0.1','','ds_item_anterior','326');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1745','','','ds_item_atual','326');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1746','nu_ip','','ds_campo','326');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1747','48','','co_auditoria_tabela','326');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1748','315','','co_auditoria_itens','327');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1749','Desconhecido','','ds_item_anterior','327');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1750','','','ds_item_atual','327');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1751','ds_pais','','ds_campo','327');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1752','48','','co_auditoria_tabela','327');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1753','316','','co_auditoria_itens','328');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1754','Desconhecida','','ds_item_anterior','328');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1755','','','ds_item_atual','328');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1756','ds_code_pais','','ds_campo','328');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1757','48','','co_auditoria_tabela','328');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1758','317','','co_auditoria_itens','329');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1759','Desconhecida','','ds_item_anterior','329');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1760','','','ds_item_atual','329');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1761','ds_uf','','ds_campo','329');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1762','48','','co_auditoria_tabela','329');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1763','318','','co_auditoria_itens','330');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1764','Desconhecida','','ds_item_anterior','330');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1765','','','ds_item_atual','330');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1766','ds_estado','','ds_campo','330');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1767','48','','co_auditoria_tabela','330');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1768','319','','co_auditoria_itens','331');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1769','Desconhecida','','ds_item_anterior','331');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1770','','','ds_item_atual','331');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1771','ds_cidade','','ds_campo','331');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1772','48','','co_auditoria_tabela','331');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1773','320','','co_auditoria_itens','332');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1774','Firefox','','ds_item_anterior','332');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1775','','','ds_item_atual','332');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1776','ds_navegador','','ds_campo','332');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1777','48','','co_auditoria_tabela','332');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1778','321','','co_auditoria_itens','333');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1779','Windows 10','','ds_item_anterior','333');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1780','','','ds_item_atual','333');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1781','ds_sistema_operacional','','ds_campo','333');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1782','48','','co_auditoria_tabela','333');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1783','322','','co_auditoria_itens','334');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1784','Desktop','','ds_item_anterior','334');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1785','','','ds_item_atual','334');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1786','ds_dispositivo','','ds_campo','334');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1787','48','','co_auditoria_tabela','334');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1788','323','','co_auditoria_itens','335');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1789','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','','ds_item_anterior','335');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1790','','','ds_item_atual','335');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1791','ds_agente','','ds_campo','335');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1792','48','','co_auditoria_tabela','335');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1793','324','','co_auditoria_itens','336');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1794','1','','ds_item_anterior','336');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1795','','','ds_item_atual','336');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1796','co_acesso','','ds_campo','336');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1797','49','','co_auditoria_tabela','336');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1798','325','','co_auditoria_itens','337');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1799','b6g2q21d8pp65ajjlie5dgc5ia','','ds_item_anterior','337');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1800','','','ds_item_atual','337');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1801','ds_session_id','','ds_campo','337');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1802','49','','co_auditoria_tabela','337');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1803','326','','co_auditoria_itens','338');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1804','2021-02-08 11:17:38','','ds_item_anterior','338');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1805','','','ds_item_atual','338');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1806','dt_inicio_acesso','','ds_campo','338');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1807','49','','co_auditoria_tabela','338');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1808','327','','co_auditoria_itens','339');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1809','2021-02-08 13:24:32','','ds_item_anterior','339');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1810','','','ds_item_atual','339');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1811','dt_fim_acesso','','ds_campo','339');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1812','49','','co_auditoria_tabela','339');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1813','328','','co_auditoria_itens','340');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1814','F','','ds_item_anterior','340');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1815','','','ds_item_atual','340');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1816','tp_situacao','','ds_campo','340');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1817','49','','co_auditoria_tabela','340');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1818','329','','co_auditoria_itens','341');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1819','1','','ds_item_anterior','341');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1820','','','ds_item_atual','341');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1821','co_usuario','','ds_campo','341');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1822','49','','co_auditoria_tabela','341');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1823','330','','co_auditoria_itens','342');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1824','1','','ds_item_anterior','342');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1825','','','ds_item_atual','342');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1826','co_trafego','','ds_campo','342');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1827','49','','co_auditoria_tabela','342');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1828','331','','co_auditoria_itens','343');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1829','2','','ds_item_anterior','343');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1830','','','ds_item_atual','343');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1831','co_trafego','','ds_campo','343');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1832','50','','co_auditoria_tabela','343');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1833','332','','co_auditoria_itens','344');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1834','127.0.0.1','','ds_item_anterior','344');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1835','','','ds_item_atual','344');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1836','nu_ip','','ds_campo','344');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1837','50','','co_auditoria_tabela','344');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1838','333','','co_auditoria_itens','345');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1839','Desconhecido','','ds_item_anterior','345');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1840','','','ds_item_atual','345');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1841','ds_pais','','ds_campo','345');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1842','50','','co_auditoria_tabela','345');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1843','334','','co_auditoria_itens','346');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1844','Desconhecida','','ds_item_anterior','346');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1845','','','ds_item_atual','346');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1846','ds_code_pais','','ds_campo','346');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1847','50','','co_auditoria_tabela','346');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1848','335','','co_auditoria_itens','347');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1849','Desconhecida','','ds_item_anterior','347');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1850','','','ds_item_atual','347');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1851','ds_uf','','ds_campo','347');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1852','50','','co_auditoria_tabela','347');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1853','336','','co_auditoria_itens','348');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1854','Desconhecida','','ds_item_anterior','348');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1855','','','ds_item_atual','348');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1856','ds_estado','','ds_campo','348');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1857','50','','co_auditoria_tabela','348');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1858','337','','co_auditoria_itens','349');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1859','Desconhecida','','ds_item_anterior','349');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1860','','','ds_item_atual','349');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1861','ds_cidade','','ds_campo','349');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1862','50','','co_auditoria_tabela','349');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1863','338','','co_auditoria_itens','350');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1864','Firefox','','ds_item_anterior','350');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1865','','','ds_item_atual','350');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1866','ds_navegador','','ds_campo','350');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1867','50','','co_auditoria_tabela','350');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1868','339','','co_auditoria_itens','351');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1869','Windows 10','','ds_item_anterior','351');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1870','','','ds_item_atual','351');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1871','ds_sistema_operacional','','ds_campo','351');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1872','50','','co_auditoria_tabela','351');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1873','340','','co_auditoria_itens','352');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1874','Desktop','','ds_item_anterior','352');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1875','','','ds_item_atual','352');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1876','ds_dispositivo','','ds_campo','352');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1877','50','','co_auditoria_tabela','352');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1878','341','','co_auditoria_itens','353');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1879','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','','ds_item_anterior','353');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1880','','','ds_item_atual','353');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1881','ds_agente','','ds_campo','353');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1882','50','','co_auditoria_tabela','353');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1883','342','','co_auditoria_itens','354');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1884','2','','ds_item_anterior','354');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1885','','','ds_item_atual','354');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1886','co_acesso','','ds_campo','354');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1887','51','','co_auditoria_tabela','354');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1888','343','','co_auditoria_itens','355');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1889','b6g2q21d8pp65ajjlie5dgc5ia','','ds_item_anterior','355');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1890','','','ds_item_atual','355');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1891','ds_session_id','','ds_campo','355');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1892','51','','co_auditoria_tabela','355');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1893','344','','co_auditoria_itens','356');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1894','2021-02-08 15:22:12','','ds_item_anterior','356');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1895','','','ds_item_atual','356');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1896','dt_inicio_acesso','','ds_campo','356');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1897','51','','co_auditoria_tabela','356');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1898','345','','co_auditoria_itens','357');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1899','2021-02-08 16:14:02','','ds_item_anterior','357');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1900','','','ds_item_atual','357');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1901','dt_fim_acesso','','ds_campo','357');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1902','51','','co_auditoria_tabela','357');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1903','346','','co_auditoria_itens','358');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1904','F','','ds_item_anterior','358');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1905','','','ds_item_atual','358');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1906','tp_situacao','','ds_campo','358');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1907','51','','co_auditoria_tabela','358');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1908','347','','co_auditoria_itens','359');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1909','1','','ds_item_anterior','359');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1910','','','ds_item_atual','359');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1911','co_usuario','','ds_campo','359');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1912','51','','co_auditoria_tabela','359');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1913','348','','co_auditoria_itens','360');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1914','2','','ds_item_anterior','360');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1915','','','ds_item_atual','360');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1916','co_trafego','','ds_campo','360');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1917','51','','co_auditoria_tabela','360');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1918','349','','co_auditoria_itens','361');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1919','3','','ds_item_anterior','361');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1920','','','ds_item_atual','361');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1921','co_trafego','','ds_campo','361');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1922','52','','co_auditoria_tabela','361');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1923','350','','co_auditoria_itens','362');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1924','127.0.0.1','','ds_item_anterior','362');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1925','','','ds_item_atual','362');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1926','nu_ip','','ds_campo','362');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1927','52','','co_auditoria_tabela','362');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1928','351','','co_auditoria_itens','363');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1929','Desconhecido','','ds_item_anterior','363');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1930','','','ds_item_atual','363');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1931','ds_pais','','ds_campo','363');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1932','52','','co_auditoria_tabela','363');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1933','352','','co_auditoria_itens','364');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1934','Desconhecida','','ds_item_anterior','364');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1935','','','ds_item_atual','364');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1936','ds_code_pais','','ds_campo','364');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1937','52','','co_auditoria_tabela','364');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1938','353','','co_auditoria_itens','365');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1939','Desconhecida','','ds_item_anterior','365');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1940','','','ds_item_atual','365');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1941','ds_uf','','ds_campo','365');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1942','52','','co_auditoria_tabela','365');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1943','354','','co_auditoria_itens','366');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1944','Desconhecida','','ds_item_anterior','366');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1945','','','ds_item_atual','366');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1946','ds_estado','','ds_campo','366');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1947','52','','co_auditoria_tabela','366');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1948','355','','co_auditoria_itens','367');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1949','Desconhecida','','ds_item_anterior','367');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1950','','','ds_item_atual','367');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1951','ds_cidade','','ds_campo','367');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1952','52','','co_auditoria_tabela','367');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1953','356','','co_auditoria_itens','368');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1954','Firefox','','ds_item_anterior','368');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1955','','','ds_item_atual','368');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1956','ds_navegador','','ds_campo','368');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1957','52','','co_auditoria_tabela','368');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1958','357','','co_auditoria_itens','369');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1959','Windows 10','','ds_item_anterior','369');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1960','','','ds_item_atual','369');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1961','ds_sistema_operacional','','ds_campo','369');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1962','52','','co_auditoria_tabela','369');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1963','358','','co_auditoria_itens','370');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1964','Desktop','','ds_item_anterior','370');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1965','','','ds_item_atual','370');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1966','ds_dispositivo','','ds_campo','370');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1967','52','','co_auditoria_tabela','370');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1968','359','','co_auditoria_itens','371');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1969','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','','ds_item_anterior','371');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1970','','','ds_item_atual','371');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1971','ds_agente','','ds_campo','371');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1972','52','','co_auditoria_tabela','371');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1973','360','','co_auditoria_itens','372');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1974','3','','ds_item_anterior','372');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1975','','','ds_item_atual','372');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1976','co_acesso','','ds_campo','372');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1977','53','','co_auditoria_tabela','372');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1978','361','','co_auditoria_itens','373');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1979','b6g2q21d8pp65ajjlie5dgc5ia','','ds_item_anterior','373');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1980','','','ds_item_atual','373');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1981','ds_session_id','','ds_campo','373');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1982','53','','co_auditoria_tabela','373');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1983','362','','co_auditoria_itens','374');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1984','2021-02-08 16:18:19','','ds_item_anterior','374');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1985','','','ds_item_atual','374');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1986','dt_inicio_acesso','','ds_campo','374');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1987','53','','co_auditoria_tabela','374');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1988','363','','co_auditoria_itens','375');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1989','2021-02-08 18:26:23','','ds_item_anterior','375');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1990','','','ds_item_atual','375');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1991','dt_fim_acesso','','ds_campo','375');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1992','53','','co_auditoria_tabela','375');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1993','364','','co_auditoria_itens','376');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1994','F','','ds_item_anterior','376');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1995','','','ds_item_atual','376');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1996','tp_situacao','','ds_campo','376');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1997','53','','co_auditoria_tabela','376');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1998','365','','co_auditoria_itens','377');

INSERT INTO TB_AUDITORIA_ITENS VALUES('1999','1','','ds_item_anterior','377');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2000','','','ds_item_atual','377');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2001','co_usuario','','ds_campo','377');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2002','53','','co_auditoria_tabela','377');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2003','366','','co_auditoria_itens','378');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2004','3','','ds_item_anterior','378');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2005','','','ds_item_atual','378');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2006','co_trafego','','ds_campo','378');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2007','53','','co_auditoria_tabela','378');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2008','367','','co_auditoria_itens','379');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2009','4','','ds_item_anterior','379');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2010','','','ds_item_atual','379');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2011','co_trafego','','ds_campo','379');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2012','54','','co_auditoria_tabela','379');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2013','368','','co_auditoria_itens','380');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2014','127.0.0.1','','ds_item_anterior','380');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2015','','','ds_item_atual','380');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2016','nu_ip','','ds_campo','380');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2017','54','','co_auditoria_tabela','380');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2018','369','','co_auditoria_itens','381');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2019','Desconhecido','','ds_item_anterior','381');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2020','','','ds_item_atual','381');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2021','ds_pais','','ds_campo','381');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2022','54','','co_auditoria_tabela','381');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2023','370','','co_auditoria_itens','382');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2024','Desconhecida','','ds_item_anterior','382');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2025','','','ds_item_atual','382');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2026','ds_code_pais','','ds_campo','382');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2027','54','','co_auditoria_tabela','382');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2028','371','','co_auditoria_itens','383');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2029','Desconhecida','','ds_item_anterior','383');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2030','','','ds_item_atual','383');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2031','ds_uf','','ds_campo','383');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2032','54','','co_auditoria_tabela','383');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2033','372','','co_auditoria_itens','384');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2034','Desconhecida','','ds_item_anterior','384');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2035','','','ds_item_atual','384');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2036','ds_estado','','ds_campo','384');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2037','54','','co_auditoria_tabela','384');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2038','373','','co_auditoria_itens','385');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2039','Desconhecida','','ds_item_anterior','385');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2040','','','ds_item_atual','385');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2041','ds_cidade','','ds_campo','385');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2042','54','','co_auditoria_tabela','385');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2043','374','','co_auditoria_itens','386');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2044','Firefox','','ds_item_anterior','386');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2045','','','ds_item_atual','386');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2046','ds_navegador','','ds_campo','386');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2047','54','','co_auditoria_tabela','386');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2048','375','','co_auditoria_itens','387');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2049','Windows 10','','ds_item_anterior','387');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2050','','','ds_item_atual','387');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2051','ds_sistema_operacional','','ds_campo','387');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2052','54','','co_auditoria_tabela','387');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2053','376','','co_auditoria_itens','388');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2054','Desktop','','ds_item_anterior','388');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2055','','','ds_item_atual','388');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2056','ds_dispositivo','','ds_campo','388');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2057','54','','co_auditoria_tabela','388');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2058','377','','co_auditoria_itens','389');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2059','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','','ds_item_anterior','389');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2060','','','ds_item_atual','389');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2061','ds_agente','','ds_campo','389');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2062','54','','co_auditoria_tabela','389');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2063','378','','co_auditoria_itens','390');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2064','4','','ds_item_anterior','390');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2065','','','ds_item_atual','390');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2066','co_acesso','','ds_campo','390');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2067','55','','co_auditoria_tabela','390');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2068','379','','co_auditoria_itens','391');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2069','5mnts00d9t1v7qpi0k9c7q3oiq','','ds_item_anterior','391');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2070','','','ds_item_atual','391');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2071','ds_session_id','','ds_campo','391');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2072','55','','co_auditoria_tabela','391');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2073','380','','co_auditoria_itens','392');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2074','2021-02-09 11:44:11','','ds_item_anterior','392');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2075','','','ds_item_atual','392');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2076','dt_inicio_acesso','','ds_campo','392');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2077','55','','co_auditoria_tabela','392');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2078','381','','co_auditoria_itens','393');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2079','2021-02-09 12:18:52','','ds_item_anterior','393');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2080','','','ds_item_atual','393');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2081','dt_fim_acesso','','ds_campo','393');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2082','55','','co_auditoria_tabela','393');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2083','382','','co_auditoria_itens','394');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2084','F','','ds_item_anterior','394');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2085','','','ds_item_atual','394');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2086','tp_situacao','','ds_campo','394');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2087','55','','co_auditoria_tabela','394');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2088','383','','co_auditoria_itens','395');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2089','1','','ds_item_anterior','395');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2090','','','ds_item_atual','395');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2091','co_usuario','','ds_campo','395');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2092','55','','co_auditoria_tabela','395');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2093','384','','co_auditoria_itens','396');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2094','4','','ds_item_anterior','396');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2095','','','ds_item_atual','396');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2096','co_trafego','','ds_campo','396');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2097','55','','co_auditoria_tabela','396');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2098','385','','co_auditoria_itens','397');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2099','5','','ds_item_anterior','397');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2100','','','ds_item_atual','397');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2101','co_trafego','','ds_campo','397');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2102','56','','co_auditoria_tabela','397');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2103','386','','co_auditoria_itens','398');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2104','127.0.0.1','','ds_item_anterior','398');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2105','','','ds_item_atual','398');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2106','nu_ip','','ds_campo','398');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2107','56','','co_auditoria_tabela','398');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2108','387','','co_auditoria_itens','399');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2109','Desconhecido','','ds_item_anterior','399');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2110','','','ds_item_atual','399');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2111','ds_pais','','ds_campo','399');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2112','56','','co_auditoria_tabela','399');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2113','388','','co_auditoria_itens','400');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2114','Desconhecida','','ds_item_anterior','400');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2115','','','ds_item_atual','400');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2116','ds_code_pais','','ds_campo','400');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2117','56','','co_auditoria_tabela','400');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2118','389','','co_auditoria_itens','401');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2119','Desconhecida','','ds_item_anterior','401');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2120','','','ds_item_atual','401');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2121','ds_uf','','ds_campo','401');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2122','56','','co_auditoria_tabela','401');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2123','390','','co_auditoria_itens','402');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2124','Desconhecida','','ds_item_anterior','402');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2125','','','ds_item_atual','402');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2126','ds_estado','','ds_campo','402');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2127','56','','co_auditoria_tabela','402');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2128','391','','co_auditoria_itens','403');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2129','Desconhecida','','ds_item_anterior','403');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2130','','','ds_item_atual','403');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2131','ds_cidade','','ds_campo','403');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2132','56','','co_auditoria_tabela','403');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2133','392','','co_auditoria_itens','404');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2134','Firefox','','ds_item_anterior','404');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2135','','','ds_item_atual','404');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2136','ds_navegador','','ds_campo','404');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2137','56','','co_auditoria_tabela','404');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2138','393','','co_auditoria_itens','405');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2139','Windows 10','','ds_item_anterior','405');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2140','','','ds_item_atual','405');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2141','ds_sistema_operacional','','ds_campo','405');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2142','56','','co_auditoria_tabela','405');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2143','394','','co_auditoria_itens','406');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2144','Desktop','','ds_item_anterior','406');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2145','','','ds_item_atual','406');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2146','ds_dispositivo','','ds_campo','406');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2147','56','','co_auditoria_tabela','406');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2148','395','','co_auditoria_itens','407');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2149','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0','','ds_item_anterior','407');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2150','','','ds_item_atual','407');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2151','ds_agente','','ds_campo','407');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2152','56','','co_auditoria_tabela','407');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2153','396','','co_auditoria_itens','408');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2154','5','','ds_item_anterior','408');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2155','','','ds_item_atual','408');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2156','co_acesso','','ds_campo','408');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2157','57','','co_auditoria_tabela','408');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2158','397','','co_auditoria_itens','409');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2159','uvulk300kskkoveq0qmoekvvoh','','ds_item_anterior','409');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2160','','','ds_item_atual','409');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2161','ds_session_id','','ds_campo','409');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2162','57','','co_auditoria_tabela','409');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2163','398','','co_auditoria_itens','410');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2164','2021-02-09 14:15:04','','ds_item_anterior','410');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2165','','','ds_item_atual','410');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2166','dt_inicio_acesso','','ds_campo','410');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2167','57','','co_auditoria_tabela','410');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2168','399','','co_auditoria_itens','411');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2169','2021-02-09 14:45:05','','ds_item_anterior','411');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2170','','','ds_item_atual','411');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2171','dt_fim_acesso','','ds_campo','411');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2172','57','','co_auditoria_tabela','411');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2173','400','','co_auditoria_itens','412');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2174','F','','ds_item_anterior','412');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2175','','','ds_item_atual','412');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2176','tp_situacao','','ds_campo','412');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2177','57','','co_auditoria_tabela','412');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2178','401','','co_auditoria_itens','413');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2179','1','','ds_item_anterior','413');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2180','','','ds_item_atual','413');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2181','co_usuario','','ds_campo','413');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2182','57','','co_auditoria_tabela','413');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2183','402','','co_auditoria_itens','414');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2184','5','','ds_item_anterior','414');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2185','','','ds_item_atual','414');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2186','co_trafego','','ds_campo','414');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2187','57','','co_auditoria_tabela','414');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2188','1','','co_auditoria_tabela','415');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2189','ccaug100.TB_ACESSO','','no_tabela','415');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2190','U','','tp_operacao','415');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2191','3','','co_registro','415');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2192','1','','co_auditoria','415');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2193','2','','co_auditoria_tabela','416');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2194','ccaug100.TB_TRAFEGO','','no_tabela','416');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2195','I','','tp_operacao','416');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2196','4','','co_registro','416');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2197','2','','co_auditoria','416');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2198','3','','co_auditoria_tabela','417');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2199','ccaug100.TB_ACESSO','','no_tabela','417');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2200','I','','tp_operacao','417');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2201','4','','co_registro','417');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2202','3','','co_auditoria','417');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2203','4','','co_auditoria_tabela','418');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2204','ccaug100.TB_ACESSO','','no_tabela','418');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2205','U','','tp_operacao','418');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2206','4','','co_registro','418');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2207','4','','co_auditoria','418');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2208','5','','co_auditoria_tabela','419');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2209','ccaug100.TB_ACESSO','','no_tabela','419');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2210','U','','tp_operacao','419');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2211','4','','co_registro','419');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2212','5','','co_auditoria','419');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2213','6','','co_auditoria_tabela','420');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2214','ccaug100.TB_ACESSO','','no_tabela','420');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2215','U','','tp_operacao','420');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2216','4','','co_registro','420');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2217','6','','co_auditoria','420');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2218','7','','co_auditoria_tabela','421');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2219','ccaug100.TB_ACESSO','','no_tabela','421');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2220','U','','tp_operacao','421');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2221','4','','co_registro','421');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2222','7','','co_auditoria','421');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2223','8','','co_auditoria_tabela','422');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2224','ccaug100.TB_ACESSO','','no_tabela','422');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2225','U','','tp_operacao','422');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2226','4','','co_registro','422');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2227','8','','co_auditoria','422');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2228','9','','co_auditoria_tabela','423');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2229','ccaug100.TB_ACESSO','','no_tabela','423');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2230','U','','tp_operacao','423');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2231','4','','co_registro','423');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2232','9','','co_auditoria','423');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2233','10','','co_auditoria_tabela','424');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2234','ccaug100.TB_ACESSO','','no_tabela','424');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2235','U','','tp_operacao','424');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2236','4','','co_registro','424');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2237','10','','co_auditoria','424');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2238','11','','co_auditoria_tabela','425');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2239','ccaug100.TB_ACESSO','','no_tabela','425');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2240','U','','tp_operacao','425');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2241','4','','co_registro','425');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2242','11','','co_auditoria','425');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2243','12','','co_auditoria_tabela','426');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2244','ccaug100.TB_IMAGEM','','no_tabela','426');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2245','I','','tp_operacao','426');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2246','2','','co_registro','426');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2247','12','','co_auditoria','426');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2248','13','','co_auditoria_tabela','427');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2249','TB_CURSO','','no_tabela','427');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2250','U','','tp_operacao','427');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2251','2','','co_registro','427');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2252','12','','co_auditoria','427');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2253','14','','co_auditoria_tabela','428');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2254','TB_VALOR_CURSO','','no_tabela','428');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2255','I','','tp_operacao','428');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2256','8','','co_registro','428');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2257','12','','co_auditoria','428');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2258','15','','co_auditoria_tabela','429');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2259','ccaug100.TB_ACESSO','','no_tabela','429');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2260','U','','tp_operacao','429');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2261','4','','co_registro','429');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2262','13','','co_auditoria','429');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2263','16','','co_auditoria_tabela','430');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2264','ccaug100.TB_ACESSO','','no_tabela','430');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2265','U','','tp_operacao','430');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2266','4','','co_registro','430');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2267','14','','co_auditoria','430');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2268','17','','co_auditoria_tabela','431');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2269','ccaug100.TB_ACESSO','','no_tabela','431');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2270','U','','tp_operacao','431');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2271','4','','co_registro','431');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2272','15','','co_auditoria','431');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2273','18','','co_auditoria_tabela','432');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2274','ccaug100.TB_ACESSO','','no_tabela','432');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2275','U','','tp_operacao','432');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2276','4','','co_registro','432');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2277','16','','co_auditoria','432');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2278','19','','co_auditoria_tabela','433');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2279','ccaug100.TB_ACESSO','','no_tabela','433');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2280','U','','tp_operacao','433');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2281','4','','co_registro','433');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2282','17','','co_auditoria','433');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2283','20','','co_auditoria_tabela','434');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2284','ccaug100.TB_ACESSO','','no_tabela','434');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2285','U','','tp_operacao','434');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2286','4','','co_registro','434');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2287','18','','co_auditoria','434');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2288','21','','co_auditoria_tabela','435');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2289','ccaug100.TB_IMAGEM','','no_tabela','435');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2290','I','','tp_operacao','435');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2291','3','','co_registro','435');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2292','19','','co_auditoria','435');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2293','22','','co_auditoria_tabela','436');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2294','TB_CURSO','','no_tabela','436');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2295','U','','tp_operacao','436');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2296','1','','co_registro','436');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2297','19','','co_auditoria','436');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2298','23','','co_auditoria_tabela','437');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2299','TB_VALOR_CURSO','','no_tabela','437');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2300','I','','tp_operacao','437');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2301','9','','co_registro','437');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2302','19','','co_auditoria','437');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2303','24','','co_auditoria_tabela','438');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2304','ccaug100.TB_ACESSO','','no_tabela','438');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2305','U','','tp_operacao','438');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2306','4','','co_registro','438');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2307','20','','co_auditoria','438');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2308','25','','co_auditoria_tabela','439');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2309','ccaug100.TB_ACESSO','','no_tabela','439');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2310','U','','tp_operacao','439');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2311','4','','co_registro','439');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2312','21','','co_auditoria','439');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2313','26','','co_auditoria_tabela','440');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2314','ccaug100.TB_ACESSO','','no_tabela','440');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2315','U','','tp_operacao','440');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2316','4','','co_registro','440');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2317','22','','co_auditoria','440');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2318','27','','co_auditoria_tabela','441');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2319','ccaug100.TB_TRAFEGO','','no_tabela','441');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2320','I','','tp_operacao','441');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2321','5','','co_registro','441');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2322','23','','co_auditoria','441');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2323','28','','co_auditoria_tabela','442');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2324','ccaug100.TB_ACESSO','','no_tabela','442');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2325','I','','tp_operacao','442');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2326','5','','co_registro','442');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2327','24','','co_auditoria','442');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2328','29','','co_auditoria_tabela','443');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2329','ccaug100.TB_ACESSO','','no_tabela','443');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2330','U','','tp_operacao','443');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2331','5','','co_registro','443');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2332','25','','co_auditoria','443');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2333','30','','co_auditoria_tabela','444');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2334','ccaug100.TB_ACESSO','','no_tabela','444');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2335','U','','tp_operacao','444');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2336','5','','co_registro','444');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2337','26','','co_auditoria','444');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2338','39','','co_auditoria_tabela','445');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2339','ccaug100.TB_ACESSO','','no_tabela','445');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2340','U','','tp_operacao','445');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2341','5','','co_registro','445');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2342','28','','co_auditoria','445');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2343','40','','co_auditoria_tabela','446');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2344','ccaug100.TB_TRAFEGO','','no_tabela','446');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2345','I','','tp_operacao','446');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2346','6','','co_registro','446');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2347','29','','co_auditoria','446');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2348','41','','co_auditoria_tabela','447');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2349','ccaug100.TB_ACESSO','','no_tabela','447');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2350','I','','tp_operacao','447');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2351','6','','co_registro','447');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2352','30','','co_auditoria','447');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2353','42','','co_auditoria_tabela','448');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2354','ccaug100.TB_ACESSO','','no_tabela','448');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2355','U','','tp_operacao','448');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2356','6','','co_registro','448');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2357','31','','co_auditoria','448');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2358','43','','co_auditoria_tabela','449');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2359','ccaug100.TB_ACESSO','','no_tabela','449');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2360','U','','tp_operacao','449');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2361','6','','co_registro','449');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2362','32','','co_auditoria','449');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2363','44','','co_auditoria_tabela','450');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2364','ccaug100.TB_ACESSO','','no_tabela','450');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2365','U','','tp_operacao','450');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2366','6','','co_registro','450');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2367','33','','co_auditoria','450');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2368','45','','co_auditoria_tabela','451');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2369','ccaug100.TB_ACESSO','','no_tabela','451');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2370','U','','tp_operacao','451');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2371','6','','co_registro','451');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2372','34','','co_auditoria','451');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2373','46','','co_auditoria_tabela','452');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2374','ccaug100.TB_ACESSO','','no_tabela','452');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2375','U','','tp_operacao','452');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2376','6','','co_registro','452');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2377','35','','co_auditoria','452');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2378','47','','co_auditoria_tabela','453');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2379','ccaug100.TB_ACESSO','','no_tabela','453');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2380','U','','tp_operacao','453');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2381','6','','co_registro','453');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2382','36','','co_auditoria','453');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2383','48','','co_auditoria_tabela','454');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2384','ccaug100.TB_TRAFEGO','','no_tabela','454');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2385','D','','tp_operacao','454');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2386','1','','co_registro','454');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2387','37','','co_auditoria','454');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2388','49','','co_auditoria_tabela','455');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2389','ccaug100.TB_ACESSO','','no_tabela','455');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2390','D','','tp_operacao','455');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2391','1','','co_registro','455');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2392','37','','co_auditoria','455');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2393','50','','co_auditoria_tabela','456');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2394','ccaug100.TB_TRAFEGO','','no_tabela','456');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2395','D','','tp_operacao','456');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2396','2','','co_registro','456');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2397','37','','co_auditoria','456');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2398','51','','co_auditoria_tabela','457');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2399','ccaug100.TB_ACESSO','','no_tabela','457');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2400','D','','tp_operacao','457');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2401','2','','co_registro','457');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2402','37','','co_auditoria','457');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2403','52','','co_auditoria_tabela','458');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2404','ccaug100.TB_TRAFEGO','','no_tabela','458');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2405','D','','tp_operacao','458');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2406','3','','co_registro','458');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2407','37','','co_auditoria','458');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2408','53','','co_auditoria_tabela','459');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2409','ccaug100.TB_ACESSO','','no_tabela','459');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2410','D','','tp_operacao','459');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2411','3','','co_registro','459');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2412','37','','co_auditoria','459');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2413','54','','co_auditoria_tabela','460');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2414','ccaug100.TB_TRAFEGO','','no_tabela','460');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2415','D','','tp_operacao','460');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2416','4','','co_registro','460');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2417','37','','co_auditoria','460');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2418','55','','co_auditoria_tabela','461');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2419','ccaug100.TB_ACESSO','','no_tabela','461');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2420','D','','tp_operacao','461');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2421','4','','co_registro','461');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2422','37','','co_auditoria','461');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2423','56','','co_auditoria_tabela','462');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2424','ccaug100.TB_TRAFEGO','','no_tabela','462');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2425','D','','tp_operacao','462');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2426','5','','co_registro','462');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2427','37','','co_auditoria','462');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2428','57','','co_auditoria_tabela','463');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2429','ccaug100.TB_ACESSO','','no_tabela','463');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2430','D','','tp_operacao','463');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2431','5','','co_registro','463');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2432','37','','co_auditoria','463');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2433','1','','co_auditoria','464');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2434','2021-02-09 11:44:10','','dt_realizado','464');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2435','Usuário Enovus','','ds_perfil_usuario','464');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2436','1','','co_usuario','464');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2437','2','','co_auditoria','465');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2438','2021-02-09 11:44:11','','dt_realizado','465');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2439','Usuário Enovus','','ds_perfil_usuario','465');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2440','1','','co_usuario','465');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2441','3','','co_auditoria','466');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2442','2021-02-09 11:44:11','','dt_realizado','466');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2443','Usuário Enovus','','ds_perfil_usuario','466');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2444','1','','co_usuario','466');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2445','4','','co_auditoria','467');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2446','2021-02-09 11:44:11','','dt_realizado','467');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2447','Master','','ds_perfil_usuario','467');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2448','1','','co_usuario','467');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2449','5','','co_auditoria','468');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2450','2021-02-09 11:44:12','','dt_realizado','468');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2451','Master','','ds_perfil_usuario','468');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2452','1','','co_usuario','468');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2453','6','','co_auditoria','469');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2454','2021-02-09 11:44:16','','dt_realizado','469');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2455','Master','','ds_perfil_usuario','469');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2456','1','','co_usuario','469');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2457','7','','co_auditoria','470');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2458','2021-02-09 11:44:16','','dt_realizado','470');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2459','Master','','ds_perfil_usuario','470');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2460','1','','co_usuario','470');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2461','8','','co_auditoria','471');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2462','2021-02-09 11:44:18','','dt_realizado','471');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2463','Master','','ds_perfil_usuario','471');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2464','1','','co_usuario','471');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2465','9','','co_auditoria','472');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2466','2021-02-09 11:44:19','','dt_realizado','472');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2467','Master','','ds_perfil_usuario','472');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2468','1','','co_usuario','472');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2469','10','','co_auditoria','473');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2470','2021-02-09 11:44:41','','dt_realizado','473');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2471','Master','','ds_perfil_usuario','473');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2472','1','','co_usuario','473');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2473','11','','co_auditoria','474');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2474','2021-02-09 11:44:42','','dt_realizado','474');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2475','Master','','ds_perfil_usuario','474');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2476','1','','co_usuario','474');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2477','12','','co_auditoria','475');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2478','2021-02-09 11:44:42','','dt_realizado','475');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2479','Master','','ds_perfil_usuario','475');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2480','1','','co_usuario','475');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2481','13','','co_auditoria','476');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2482','2021-02-09 11:44:42','','dt_realizado','476');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2483','Master','','ds_perfil_usuario','476');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2484','1','','co_usuario','476');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2485','14','','co_auditoria','477');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2486','2021-02-09 11:44:43','','dt_realizado','477');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2487','Master','','ds_perfil_usuario','477');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2488','1','','co_usuario','477');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2489','15','','co_auditoria','478');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2490','2021-02-09 11:44:45','','dt_realizado','478');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2491','Master','','ds_perfil_usuario','478');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2492','1','','co_usuario','478');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2493','16','','co_auditoria','479');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2494','2021-02-09 11:44:45','','dt_realizado','479');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2495','Master','','ds_perfil_usuario','479');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2496','1','','co_usuario','479');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2497','17','','co_auditoria','480');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2498','2021-02-09 11:48:48','','dt_realizado','480');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2499','Master','','ds_perfil_usuario','480');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2500','1','','co_usuario','480');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2501','18','','co_auditoria','481');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2502','2021-02-09 11:48:49','','dt_realizado','481');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2503','Master','','ds_perfil_usuario','481');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2504','1','','co_usuario','481');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2505','19','','co_auditoria','482');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2506','2021-02-09 11:48:49','','dt_realizado','482');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2507','Master','','ds_perfil_usuario','482');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2508','1','','co_usuario','482');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2509','20','','co_auditoria','483');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2510','2021-02-09 11:48:49','','dt_realizado','483');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2511','Master','','ds_perfil_usuario','483');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2512','1','','co_usuario','483');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2513','21','','co_auditoria','484');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2514','2021-02-09 11:48:50','','dt_realizado','484');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2515','Master','','ds_perfil_usuario','484');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2516','1','','co_usuario','484');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2517','22','','co_auditoria','485');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2518','2021-02-09 12:18:52','','dt_realizado','485');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2519','Master','','ds_perfil_usuario','485');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2520','1','','co_usuario','485');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2521','23','','co_auditoria','486');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2522','2021-02-09 14:15:04','','dt_realizado','486');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2523','Usuário Enovus','','ds_perfil_usuario','486');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2524','1','','co_usuario','486');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2525','24','','co_auditoria','487');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2526','2021-02-09 14:15:04','','dt_realizado','487');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2527','Usuário Enovus','','ds_perfil_usuario','487');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2528','1','','co_usuario','487');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2529','25','','co_auditoria','488');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2530','2021-02-09 14:15:04','','dt_realizado','488');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2531','Master','','ds_perfil_usuario','488');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2532','1','','co_usuario','488');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2533','26','','co_auditoria','489');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2534','2021-02-09 14:15:05','','dt_realizado','489');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2535','Master','','ds_perfil_usuario','489');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2536','1','','co_usuario','489');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2537','28','','co_auditoria','490');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2538','2021-02-09 18:31:53','','dt_realizado','490');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2539','Usuário Enovus','','ds_perfil_usuario','490');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2540','1','','co_usuario','490');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2541','29','','co_auditoria','491');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2542','2021-02-09 18:31:53','','dt_realizado','491');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2543','Usuário Enovus','','ds_perfil_usuario','491');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2544','1','','co_usuario','491');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2545','30','','co_auditoria','492');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2546','2021-02-09 18:31:53','','dt_realizado','492');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2547','Usuário Enovus','','ds_perfil_usuario','492');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2548','1','','co_usuario','492');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2549','31','','co_auditoria','493');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2550','2021-02-09 18:31:54','','dt_realizado','493');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2551','Master','','ds_perfil_usuario','493');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2552','1','','co_usuario','493');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2553','32','','co_auditoria','494');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2554','2021-02-09 18:31:54','','dt_realizado','494');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2555','Master','','ds_perfil_usuario','494');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2556','1','','co_usuario','494');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2557','33','','co_auditoria','495');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2558','2021-02-09 18:31:59','','dt_realizado','495');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2559','Master','','ds_perfil_usuario','495');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2560','1','','co_usuario','495');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2561','34','','co_auditoria','496');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2562','2021-02-09 18:31:59','','dt_realizado','496');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2563','Master','','ds_perfil_usuario','496');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2564','1','','co_usuario','496');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2565','35','','co_auditoria','497');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2566','2021-02-09 18:32:03','','dt_realizado','497');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2567','Master','','ds_perfil_usuario','497');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2568','1','','co_usuario','497');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2569','36','','co_auditoria','498');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2570','2021-02-09 18:32:04','','dt_realizado','498');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2571','Master','','ds_perfil_usuario','498');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2572','1','','co_usuario','498');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2573','37','','co_auditoria','499');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2574','2021-02-09 18:32:04','','dt_realizado','499');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2575','Master','','ds_perfil_usuario','499');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2576','1','','co_usuario','499');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2577','6','','co_acesso','500');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2578','uvulk300kskkoveq0qmoekvvoh','','ds_session_id','500');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2579','2021-02-09 18:31:53','','dt_inicio_acesso','500');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2580','2021-02-09 19:02:04','2021-02-09 19:02:05','dt_fim_acesso','500');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2581','A','','tp_situacao','500');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2582','1','','co_usuario','500');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2583','6','','co_trafego','500');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2584','6','','co_acesso','501');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2585','uvulk300kskkoveq0qmoekvvoh','','ds_session_id','501');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2586','2021-02-09 18:31:53','','dt_inicio_acesso','501');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2587','2021-02-09 19:02:05','2021-02-09 19:02:05','dt_fim_acesso','501');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2588','A','','tp_situacao','501');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2589','1','','co_usuario','501');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2590','6','','co_trafego','501');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2591','6','','co_acesso','502');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2592','uvulk300kskkoveq0qmoekvvoh','','ds_session_id','502');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2593','2021-02-09 18:31:53','','dt_inicio_acesso','502');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2594','2021-02-09 19:02:05','2021-02-09 19:02:09','dt_fim_acesso','502');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2595','A','','tp_situacao','502');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2596','1','','co_usuario','502');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2597','6','','co_trafego','502');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2598','6','','co_acesso','503');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2599','uvulk300kskkoveq0qmoekvvoh','','ds_session_id','503');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2600','2021-02-09 18:31:53','','dt_inicio_acesso','503');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2601','2021-02-09 19:02:09','2021-02-09 19:02:09','dt_fim_acesso','503');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2602','A','','tp_situacao','503');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2603','1','','co_usuario','503');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2604','6','','co_trafego','503');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2605','6','','co_acesso','504');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2606','uvulk300kskkoveq0qmoekvvoh','','ds_session_id','504');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2607','2021-02-09 18:31:53','','dt_inicio_acesso','504');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2608','2021-02-09 19:02:09','2021-02-09 19:02:11','dt_fim_acesso','504');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2609','A','','tp_situacao','504');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2610','1','','co_usuario','504');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2611','6','','co_trafego','504');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2612','6','','co_acesso','505');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2613','uvulk300kskkoveq0qmoekvvoh','','ds_session_id','505');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2614','2021-02-09 18:31:53','','dt_inicio_acesso','505');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2615','2021-02-09 19:02:11','2021-02-09 19:02:12','dt_fim_acesso','505');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2616','A','','tp_situacao','505');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2617','1','','co_usuario','505');

INSERT INTO TB_AUDITORIA_ITENS VALUES('2618','6','','co_trafego','505');




DROP TABLE IF EXISTS TB_AUDITORIA_TABELA;


CREATE TABLE `TB_AUDITORIA_TABELA` (
  `co_auditoria_tabela` int(11) NOT NULL AUTO_INCREMENT,
  `no_tabela` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tp_operacao` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `co_registro` int(11) DEFAULT NULL,
  `co_auditoria` int(11) NOT NULL,
  PRIMARY KEY (`co_auditoria_tabela`,`co_auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=506 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_AUDITORIA_TABELA VALUES('58','ccaug100.TB_AUDITORIA_ITENS','D','1','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('59','ccaug100.TB_AUDITORIA_ITENS','D','2','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('60','ccaug100.TB_AUDITORIA_ITENS','D','3','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('61','ccaug100.TB_AUDITORIA_ITENS','D','4','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('62','ccaug100.TB_AUDITORIA_ITENS','D','5','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('63','ccaug100.TB_AUDITORIA_ITENS','D','6','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('64','ccaug100.TB_AUDITORIA_ITENS','D','7','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('65','ccaug100.TB_AUDITORIA_ITENS','D','8','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('66','ccaug100.TB_AUDITORIA_ITENS','D','9','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('67','ccaug100.TB_AUDITORIA_ITENS','D','10','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('68','ccaug100.TB_AUDITORIA_ITENS','D','11','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('69','ccaug100.TB_AUDITORIA_ITENS','D','12','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('70','ccaug100.TB_AUDITORIA_ITENS','D','13','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('71','ccaug100.TB_AUDITORIA_ITENS','D','14','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('72','ccaug100.TB_AUDITORIA_ITENS','D','15','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('73','ccaug100.TB_AUDITORIA_ITENS','D','16','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('74','ccaug100.TB_AUDITORIA_ITENS','D','17','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('75','ccaug100.TB_AUDITORIA_ITENS','D','18','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('76','ccaug100.TB_AUDITORIA_ITENS','D','19','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('77','ccaug100.TB_AUDITORIA_ITENS','D','20','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('78','ccaug100.TB_AUDITORIA_ITENS','D','21','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('79','ccaug100.TB_AUDITORIA_ITENS','D','22','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('80','ccaug100.TB_AUDITORIA_ITENS','D','23','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('81','ccaug100.TB_AUDITORIA_ITENS','D','24','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('82','ccaug100.TB_AUDITORIA_ITENS','D','25','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('83','ccaug100.TB_AUDITORIA_ITENS','D','26','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('84','ccaug100.TB_AUDITORIA_ITENS','D','27','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('85','ccaug100.TB_AUDITORIA_ITENS','D','28','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('86','ccaug100.TB_AUDITORIA_ITENS','D','29','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('87','ccaug100.TB_AUDITORIA_ITENS','D','30','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('88','ccaug100.TB_AUDITORIA_ITENS','D','31','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('89','ccaug100.TB_AUDITORIA_ITENS','D','32','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('90','ccaug100.TB_AUDITORIA_ITENS','D','33','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('91','ccaug100.TB_AUDITORIA_ITENS','D','34','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('92','ccaug100.TB_AUDITORIA_ITENS','D','35','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('93','ccaug100.TB_AUDITORIA_ITENS','D','36','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('94','ccaug100.TB_AUDITORIA_ITENS','D','37','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('95','ccaug100.TB_AUDITORIA_ITENS','D','38','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('96','ccaug100.TB_AUDITORIA_ITENS','D','39','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('97','ccaug100.TB_AUDITORIA_ITENS','D','40','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('98','ccaug100.TB_AUDITORIA_ITENS','D','41','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('99','ccaug100.TB_AUDITORIA_ITENS','D','42','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('100','ccaug100.TB_AUDITORIA_ITENS','D','43','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('101','ccaug100.TB_AUDITORIA_ITENS','D','44','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('102','ccaug100.TB_AUDITORIA_ITENS','D','45','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('103','ccaug100.TB_AUDITORIA_ITENS','D','46','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('104','ccaug100.TB_AUDITORIA_ITENS','D','47','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('105','ccaug100.TB_AUDITORIA_ITENS','D','48','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('106','ccaug100.TB_AUDITORIA_ITENS','D','49','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('107','ccaug100.TB_AUDITORIA_ITENS','D','50','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('108','ccaug100.TB_AUDITORIA_ITENS','D','51','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('109','ccaug100.TB_AUDITORIA_ITENS','D','52','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('110','ccaug100.TB_AUDITORIA_ITENS','D','53','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('111','ccaug100.TB_AUDITORIA_ITENS','D','54','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('112','ccaug100.TB_AUDITORIA_ITENS','D','55','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('113','ccaug100.TB_AUDITORIA_ITENS','D','56','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('114','ccaug100.TB_AUDITORIA_ITENS','D','57','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('115','ccaug100.TB_AUDITORIA_ITENS','D','58','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('116','ccaug100.TB_AUDITORIA_ITENS','D','59','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('117','ccaug100.TB_AUDITORIA_ITENS','D','60','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('118','ccaug100.TB_AUDITORIA_ITENS','D','61','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('119','ccaug100.TB_AUDITORIA_ITENS','D','62','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('120','ccaug100.TB_AUDITORIA_ITENS','D','63','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('121','ccaug100.TB_AUDITORIA_ITENS','D','64','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('122','ccaug100.TB_AUDITORIA_ITENS','D','65','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('123','ccaug100.TB_AUDITORIA_ITENS','D','66','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('124','ccaug100.TB_AUDITORIA_ITENS','D','67','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('125','ccaug100.TB_AUDITORIA_ITENS','D','68','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('126','ccaug100.TB_AUDITORIA_ITENS','D','69','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('127','ccaug100.TB_AUDITORIA_ITENS','D','70','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('128','ccaug100.TB_AUDITORIA_ITENS','D','71','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('129','ccaug100.TB_AUDITORIA_ITENS','D','72','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('130','ccaug100.TB_AUDITORIA_ITENS','D','73','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('131','ccaug100.TB_AUDITORIA_ITENS','D','74','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('132','ccaug100.TB_AUDITORIA_ITENS','D','75','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('133','ccaug100.TB_AUDITORIA_ITENS','D','76','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('134','ccaug100.TB_AUDITORIA_ITENS','D','77','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('135','ccaug100.TB_AUDITORIA_ITENS','D','78','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('136','ccaug100.TB_AUDITORIA_ITENS','D','79','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('137','ccaug100.TB_AUDITORIA_ITENS','D','80','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('138','ccaug100.TB_AUDITORIA_ITENS','D','81','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('139','ccaug100.TB_AUDITORIA_ITENS','D','82','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('140','ccaug100.TB_AUDITORIA_ITENS','D','83','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('141','ccaug100.TB_AUDITORIA_ITENS','D','84','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('142','ccaug100.TB_AUDITORIA_ITENS','D','85','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('143','ccaug100.TB_AUDITORIA_ITENS','D','86','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('144','ccaug100.TB_AUDITORIA_ITENS','D','87','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('145','ccaug100.TB_AUDITORIA_ITENS','D','88','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('146','ccaug100.TB_AUDITORIA_ITENS','D','89','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('147','ccaug100.TB_AUDITORIA_ITENS','D','90','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('148','ccaug100.TB_AUDITORIA_ITENS','D','91','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('149','ccaug100.TB_AUDITORIA_ITENS','D','92','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('150','ccaug100.TB_AUDITORIA_ITENS','D','93','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('151','ccaug100.TB_AUDITORIA_ITENS','D','94','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('152','ccaug100.TB_AUDITORIA_ITENS','D','95','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('153','ccaug100.TB_AUDITORIA_ITENS','D','96','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('154','ccaug100.TB_AUDITORIA_ITENS','D','97','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('155','ccaug100.TB_AUDITORIA_ITENS','D','98','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('156','ccaug100.TB_AUDITORIA_ITENS','D','99','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('157','ccaug100.TB_AUDITORIA_ITENS','D','100','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('158','ccaug100.TB_AUDITORIA_ITENS','D','101','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('159','ccaug100.TB_AUDITORIA_ITENS','D','102','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('160','ccaug100.TB_AUDITORIA_ITENS','D','103','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('161','ccaug100.TB_AUDITORIA_ITENS','D','104','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('162','ccaug100.TB_AUDITORIA_ITENS','D','105','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('163','ccaug100.TB_AUDITORIA_ITENS','D','106','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('164','ccaug100.TB_AUDITORIA_ITENS','D','107','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('165','ccaug100.TB_AUDITORIA_ITENS','D','108','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('166','ccaug100.TB_AUDITORIA_ITENS','D','109','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('167','ccaug100.TB_AUDITORIA_ITENS','D','110','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('168','ccaug100.TB_AUDITORIA_ITENS','D','111','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('169','ccaug100.TB_AUDITORIA_ITENS','D','112','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('170','ccaug100.TB_AUDITORIA_ITENS','D','113','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('171','ccaug100.TB_AUDITORIA_ITENS','D','114','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('172','ccaug100.TB_AUDITORIA_ITENS','D','115','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('173','ccaug100.TB_AUDITORIA_ITENS','D','116','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('174','ccaug100.TB_AUDITORIA_ITENS','D','117','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('175','ccaug100.TB_AUDITORIA_ITENS','D','118','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('176','ccaug100.TB_AUDITORIA_ITENS','D','119','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('177','ccaug100.TB_AUDITORIA_ITENS','D','120','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('178','ccaug100.TB_AUDITORIA_ITENS','D','121','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('179','ccaug100.TB_AUDITORIA_ITENS','D','122','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('180','ccaug100.TB_AUDITORIA_ITENS','D','123','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('181','ccaug100.TB_AUDITORIA_ITENS','D','124','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('182','ccaug100.TB_AUDITORIA_ITENS','D','125','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('183','ccaug100.TB_AUDITORIA_ITENS','D','126','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('184','ccaug100.TB_AUDITORIA_ITENS','D','127','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('185','ccaug100.TB_AUDITORIA_ITENS','D','128','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('186','ccaug100.TB_AUDITORIA_ITENS','D','129','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('187','ccaug100.TB_AUDITORIA_ITENS','D','130','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('188','ccaug100.TB_AUDITORIA_ITENS','D','131','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('189','ccaug100.TB_AUDITORIA_ITENS','D','132','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('190','ccaug100.TB_AUDITORIA_ITENS','D','133','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('191','ccaug100.TB_AUDITORIA_ITENS','D','134','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('192','ccaug100.TB_AUDITORIA_ITENS','D','135','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('193','ccaug100.TB_AUDITORIA_ITENS','D','136','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('194','ccaug100.TB_AUDITORIA_ITENS','D','137','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('195','ccaug100.TB_AUDITORIA_ITENS','D','138','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('196','ccaug100.TB_AUDITORIA_ITENS','D','139','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('197','ccaug100.TB_AUDITORIA_ITENS','D','140','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('198','ccaug100.TB_AUDITORIA_ITENS','D','141','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('199','ccaug100.TB_AUDITORIA_ITENS','D','142','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('200','ccaug100.TB_AUDITORIA_ITENS','D','143','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('201','ccaug100.TB_AUDITORIA_ITENS','D','144','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('202','ccaug100.TB_AUDITORIA_ITENS','D','145','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('203','ccaug100.TB_AUDITORIA_ITENS','D','146','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('204','ccaug100.TB_AUDITORIA_ITENS','D','147','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('205','ccaug100.TB_AUDITORIA_ITENS','D','148','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('206','ccaug100.TB_AUDITORIA_ITENS','D','149','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('207','ccaug100.TB_AUDITORIA_ITENS','D','150','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('208','ccaug100.TB_AUDITORIA_ITENS','D','151','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('209','ccaug100.TB_AUDITORIA_ITENS','D','152','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('210','ccaug100.TB_AUDITORIA_ITENS','D','153','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('211','ccaug100.TB_AUDITORIA_ITENS','D','154','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('212','ccaug100.TB_AUDITORIA_ITENS','D','155','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('213','ccaug100.TB_AUDITORIA_ITENS','D','156','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('214','ccaug100.TB_AUDITORIA_ITENS','D','157','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('215','ccaug100.TB_AUDITORIA_ITENS','D','158','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('216','ccaug100.TB_AUDITORIA_ITENS','D','159','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('217','ccaug100.TB_AUDITORIA_ITENS','D','160','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('218','ccaug100.TB_AUDITORIA_ITENS','D','161','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('219','ccaug100.TB_AUDITORIA_ITENS','D','162','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('220','ccaug100.TB_AUDITORIA_ITENS','D','163','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('221','ccaug100.TB_AUDITORIA_ITENS','D','164','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('222','ccaug100.TB_AUDITORIA_ITENS','D','165','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('223','ccaug100.TB_AUDITORIA_ITENS','D','166','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('224','ccaug100.TB_AUDITORIA_ITENS','D','167','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('225','ccaug100.TB_AUDITORIA_ITENS','D','168','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('226','ccaug100.TB_AUDITORIA_ITENS','D','169','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('227','ccaug100.TB_AUDITORIA_ITENS','D','170','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('228','ccaug100.TB_AUDITORIA_ITENS','D','171','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('229','ccaug100.TB_AUDITORIA_ITENS','D','172','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('230','ccaug100.TB_AUDITORIA_ITENS','D','173','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('231','ccaug100.TB_AUDITORIA_ITENS','D','174','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('232','ccaug100.TB_AUDITORIA_ITENS','D','175','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('233','ccaug100.TB_AUDITORIA_ITENS','D','176','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('234','ccaug100.TB_AUDITORIA_ITENS','D','177','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('235','ccaug100.TB_AUDITORIA_ITENS','D','178','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('236','ccaug100.TB_AUDITORIA_ITENS','D','179','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('237','ccaug100.TB_AUDITORIA_ITENS','D','180','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('238','ccaug100.TB_AUDITORIA_ITENS','D','181','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('239','ccaug100.TB_AUDITORIA_ITENS','D','182','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('240','ccaug100.TB_AUDITORIA_ITENS','D','183','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('241','ccaug100.TB_AUDITORIA_ITENS','D','184','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('242','ccaug100.TB_AUDITORIA_ITENS','D','185','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('243','ccaug100.TB_AUDITORIA_ITENS','D','186','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('244','ccaug100.TB_AUDITORIA_ITENS','D','187','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('245','ccaug100.TB_AUDITORIA_ITENS','D','188','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('246','ccaug100.TB_AUDITORIA_ITENS','D','189','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('247','ccaug100.TB_AUDITORIA_ITENS','D','190','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('248','ccaug100.TB_AUDITORIA_ITENS','D','191','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('249','ccaug100.TB_AUDITORIA_ITENS','D','192','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('250','ccaug100.TB_AUDITORIA_ITENS','D','193','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('251','ccaug100.TB_AUDITORIA_ITENS','D','194','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('252','ccaug100.TB_AUDITORIA_ITENS','D','195','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('253','ccaug100.TB_AUDITORIA_ITENS','D','196','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('254','ccaug100.TB_AUDITORIA_ITENS','D','197','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('255','ccaug100.TB_AUDITORIA_ITENS','D','198','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('256','ccaug100.TB_AUDITORIA_ITENS','D','199','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('257','ccaug100.TB_AUDITORIA_ITENS','D','200','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('258','ccaug100.TB_AUDITORIA_ITENS','D','201','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('259','ccaug100.TB_AUDITORIA_ITENS','D','202','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('260','ccaug100.TB_AUDITORIA_ITENS','D','248','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('261','ccaug100.TB_AUDITORIA_ITENS','D','249','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('262','ccaug100.TB_AUDITORIA_ITENS','D','250','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('263','ccaug100.TB_AUDITORIA_ITENS','D','251','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('264','ccaug100.TB_AUDITORIA_ITENS','D','252','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('265','ccaug100.TB_AUDITORIA_ITENS','D','253','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('266','ccaug100.TB_AUDITORIA_ITENS','D','254','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('267','ccaug100.TB_AUDITORIA_ITENS','D','255','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('268','ccaug100.TB_AUDITORIA_ITENS','D','256','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('269','ccaug100.TB_AUDITORIA_ITENS','D','257','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('270','ccaug100.TB_AUDITORIA_ITENS','D','258','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('271','ccaug100.TB_AUDITORIA_ITENS','D','259','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('272','ccaug100.TB_AUDITORIA_ITENS','D','260','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('273','ccaug100.TB_AUDITORIA_ITENS','D','261','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('274','ccaug100.TB_AUDITORIA_ITENS','D','262','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('275','ccaug100.TB_AUDITORIA_ITENS','D','263','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('276','ccaug100.TB_AUDITORIA_ITENS','D','264','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('277','ccaug100.TB_AUDITORIA_ITENS','D','265','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('278','ccaug100.TB_AUDITORIA_ITENS','D','266','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('279','ccaug100.TB_AUDITORIA_ITENS','D','267','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('280','ccaug100.TB_AUDITORIA_ITENS','D','268','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('281','ccaug100.TB_AUDITORIA_ITENS','D','269','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('282','ccaug100.TB_AUDITORIA_ITENS','D','270','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('283','ccaug100.TB_AUDITORIA_ITENS','D','271','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('284','ccaug100.TB_AUDITORIA_ITENS','D','272','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('285','ccaug100.TB_AUDITORIA_ITENS','D','273','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('286','ccaug100.TB_AUDITORIA_ITENS','D','274','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('287','ccaug100.TB_AUDITORIA_ITENS','D','275','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('288','ccaug100.TB_AUDITORIA_ITENS','D','276','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('289','ccaug100.TB_AUDITORIA_ITENS','D','277','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('290','ccaug100.TB_AUDITORIA_ITENS','D','278','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('291','ccaug100.TB_AUDITORIA_ITENS','D','279','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('292','ccaug100.TB_AUDITORIA_ITENS','D','280','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('293','ccaug100.TB_AUDITORIA_ITENS','D','281','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('294','ccaug100.TB_AUDITORIA_ITENS','D','282','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('295','ccaug100.TB_AUDITORIA_ITENS','D','283','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('296','ccaug100.TB_AUDITORIA_ITENS','D','284','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('297','ccaug100.TB_AUDITORIA_ITENS','D','285','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('298','ccaug100.TB_AUDITORIA_ITENS','D','286','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('299','ccaug100.TB_AUDITORIA_ITENS','D','287','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('300','ccaug100.TB_AUDITORIA_ITENS','D','288','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('301','ccaug100.TB_AUDITORIA_ITENS','D','289','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('302','ccaug100.TB_AUDITORIA_ITENS','D','290','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('303','ccaug100.TB_AUDITORIA_ITENS','D','291','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('304','ccaug100.TB_AUDITORIA_ITENS','D','292','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('305','ccaug100.TB_AUDITORIA_ITENS','D','293','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('306','ccaug100.TB_AUDITORIA_ITENS','D','294','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('307','ccaug100.TB_AUDITORIA_ITENS','D','295','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('308','ccaug100.TB_AUDITORIA_ITENS','D','296','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('309','ccaug100.TB_AUDITORIA_ITENS','D','297','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('310','ccaug100.TB_AUDITORIA_ITENS','D','298','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('311','ccaug100.TB_AUDITORIA_ITENS','D','299','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('312','ccaug100.TB_AUDITORIA_ITENS','D','300','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('313','ccaug100.TB_AUDITORIA_ITENS','D','301','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('314','ccaug100.TB_AUDITORIA_ITENS','D','302','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('315','ccaug100.TB_AUDITORIA_ITENS','D','303','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('316','ccaug100.TB_AUDITORIA_ITENS','D','304','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('317','ccaug100.TB_AUDITORIA_ITENS','D','305','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('318','ccaug100.TB_AUDITORIA_ITENS','D','306','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('319','ccaug100.TB_AUDITORIA_ITENS','D','307','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('320','ccaug100.TB_AUDITORIA_ITENS','D','308','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('321','ccaug100.TB_AUDITORIA_ITENS','D','309','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('322','ccaug100.TB_AUDITORIA_ITENS','D','310','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('323','ccaug100.TB_AUDITORIA_ITENS','D','311','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('324','ccaug100.TB_AUDITORIA_ITENS','D','312','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('325','ccaug100.TB_AUDITORIA_ITENS','D','313','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('326','ccaug100.TB_AUDITORIA_ITENS','D','314','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('327','ccaug100.TB_AUDITORIA_ITENS','D','315','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('328','ccaug100.TB_AUDITORIA_ITENS','D','316','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('329','ccaug100.TB_AUDITORIA_ITENS','D','317','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('330','ccaug100.TB_AUDITORIA_ITENS','D','318','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('331','ccaug100.TB_AUDITORIA_ITENS','D','319','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('332','ccaug100.TB_AUDITORIA_ITENS','D','320','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('333','ccaug100.TB_AUDITORIA_ITENS','D','321','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('334','ccaug100.TB_AUDITORIA_ITENS','D','322','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('335','ccaug100.TB_AUDITORIA_ITENS','D','323','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('336','ccaug100.TB_AUDITORIA_ITENS','D','324','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('337','ccaug100.TB_AUDITORIA_ITENS','D','325','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('338','ccaug100.TB_AUDITORIA_ITENS','D','326','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('339','ccaug100.TB_AUDITORIA_ITENS','D','327','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('340','ccaug100.TB_AUDITORIA_ITENS','D','328','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('341','ccaug100.TB_AUDITORIA_ITENS','D','329','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('342','ccaug100.TB_AUDITORIA_ITENS','D','330','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('343','ccaug100.TB_AUDITORIA_ITENS','D','331','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('344','ccaug100.TB_AUDITORIA_ITENS','D','332','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('345','ccaug100.TB_AUDITORIA_ITENS','D','333','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('346','ccaug100.TB_AUDITORIA_ITENS','D','334','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('347','ccaug100.TB_AUDITORIA_ITENS','D','335','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('348','ccaug100.TB_AUDITORIA_ITENS','D','336','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('349','ccaug100.TB_AUDITORIA_ITENS','D','337','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('350','ccaug100.TB_AUDITORIA_ITENS','D','338','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('351','ccaug100.TB_AUDITORIA_ITENS','D','339','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('352','ccaug100.TB_AUDITORIA_ITENS','D','340','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('353','ccaug100.TB_AUDITORIA_ITENS','D','341','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('354','ccaug100.TB_AUDITORIA_ITENS','D','342','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('355','ccaug100.TB_AUDITORIA_ITENS','D','343','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('356','ccaug100.TB_AUDITORIA_ITENS','D','344','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('357','ccaug100.TB_AUDITORIA_ITENS','D','345','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('358','ccaug100.TB_AUDITORIA_ITENS','D','346','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('359','ccaug100.TB_AUDITORIA_ITENS','D','347','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('360','ccaug100.TB_AUDITORIA_ITENS','D','348','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('361','ccaug100.TB_AUDITORIA_ITENS','D','349','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('362','ccaug100.TB_AUDITORIA_ITENS','D','350','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('363','ccaug100.TB_AUDITORIA_ITENS','D','351','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('364','ccaug100.TB_AUDITORIA_ITENS','D','352','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('365','ccaug100.TB_AUDITORIA_ITENS','D','353','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('366','ccaug100.TB_AUDITORIA_ITENS','D','354','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('367','ccaug100.TB_AUDITORIA_ITENS','D','355','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('368','ccaug100.TB_AUDITORIA_ITENS','D','356','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('369','ccaug100.TB_AUDITORIA_ITENS','D','357','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('370','ccaug100.TB_AUDITORIA_ITENS','D','358','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('371','ccaug100.TB_AUDITORIA_ITENS','D','359','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('372','ccaug100.TB_AUDITORIA_ITENS','D','360','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('373','ccaug100.TB_AUDITORIA_ITENS','D','361','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('374','ccaug100.TB_AUDITORIA_ITENS','D','362','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('375','ccaug100.TB_AUDITORIA_ITENS','D','363','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('376','ccaug100.TB_AUDITORIA_ITENS','D','364','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('377','ccaug100.TB_AUDITORIA_ITENS','D','365','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('378','ccaug100.TB_AUDITORIA_ITENS','D','366','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('379','ccaug100.TB_AUDITORIA_ITENS','D','367','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('380','ccaug100.TB_AUDITORIA_ITENS','D','368','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('381','ccaug100.TB_AUDITORIA_ITENS','D','369','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('382','ccaug100.TB_AUDITORIA_ITENS','D','370','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('383','ccaug100.TB_AUDITORIA_ITENS','D','371','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('384','ccaug100.TB_AUDITORIA_ITENS','D','372','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('385','ccaug100.TB_AUDITORIA_ITENS','D','373','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('386','ccaug100.TB_AUDITORIA_ITENS','D','374','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('387','ccaug100.TB_AUDITORIA_ITENS','D','375','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('388','ccaug100.TB_AUDITORIA_ITENS','D','376','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('389','ccaug100.TB_AUDITORIA_ITENS','D','377','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('390','ccaug100.TB_AUDITORIA_ITENS','D','378','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('391','ccaug100.TB_AUDITORIA_ITENS','D','379','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('392','ccaug100.TB_AUDITORIA_ITENS','D','380','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('393','ccaug100.TB_AUDITORIA_ITENS','D','381','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('394','ccaug100.TB_AUDITORIA_ITENS','D','382','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('395','ccaug100.TB_AUDITORIA_ITENS','D','383','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('396','ccaug100.TB_AUDITORIA_ITENS','D','384','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('397','ccaug100.TB_AUDITORIA_ITENS','D','385','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('398','ccaug100.TB_AUDITORIA_ITENS','D','386','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('399','ccaug100.TB_AUDITORIA_ITENS','D','387','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('400','ccaug100.TB_AUDITORIA_ITENS','D','388','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('401','ccaug100.TB_AUDITORIA_ITENS','D','389','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('402','ccaug100.TB_AUDITORIA_ITENS','D','390','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('403','ccaug100.TB_AUDITORIA_ITENS','D','391','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('404','ccaug100.TB_AUDITORIA_ITENS','D','392','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('405','ccaug100.TB_AUDITORIA_ITENS','D','393','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('406','ccaug100.TB_AUDITORIA_ITENS','D','394','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('407','ccaug100.TB_AUDITORIA_ITENS','D','395','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('408','ccaug100.TB_AUDITORIA_ITENS','D','396','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('409','ccaug100.TB_AUDITORIA_ITENS','D','397','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('410','ccaug100.TB_AUDITORIA_ITENS','D','398','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('411','ccaug100.TB_AUDITORIA_ITENS','D','399','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('412','ccaug100.TB_AUDITORIA_ITENS','D','400','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('413','ccaug100.TB_AUDITORIA_ITENS','D','401','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('414','ccaug100.TB_AUDITORIA_ITENS','D','402','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('415','ccaug100.TB_AUDITORIA_TABELA','D','1','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('416','ccaug100.TB_AUDITORIA_TABELA','D','2','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('417','ccaug100.TB_AUDITORIA_TABELA','D','3','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('418','ccaug100.TB_AUDITORIA_TABELA','D','4','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('419','ccaug100.TB_AUDITORIA_TABELA','D','5','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('420','ccaug100.TB_AUDITORIA_TABELA','D','6','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('421','ccaug100.TB_AUDITORIA_TABELA','D','7','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('422','ccaug100.TB_AUDITORIA_TABELA','D','8','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('423','ccaug100.TB_AUDITORIA_TABELA','D','9','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('424','ccaug100.TB_AUDITORIA_TABELA','D','10','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('425','ccaug100.TB_AUDITORIA_TABELA','D','11','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('426','ccaug100.TB_AUDITORIA_TABELA','D','12','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('427','ccaug100.TB_AUDITORIA_TABELA','D','13','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('428','ccaug100.TB_AUDITORIA_TABELA','D','14','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('429','ccaug100.TB_AUDITORIA_TABELA','D','15','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('430','ccaug100.TB_AUDITORIA_TABELA','D','16','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('431','ccaug100.TB_AUDITORIA_TABELA','D','17','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('432','ccaug100.TB_AUDITORIA_TABELA','D','18','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('433','ccaug100.TB_AUDITORIA_TABELA','D','19','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('434','ccaug100.TB_AUDITORIA_TABELA','D','20','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('435','ccaug100.TB_AUDITORIA_TABELA','D','21','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('436','ccaug100.TB_AUDITORIA_TABELA','D','22','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('437','ccaug100.TB_AUDITORIA_TABELA','D','23','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('438','ccaug100.TB_AUDITORIA_TABELA','D','24','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('439','ccaug100.TB_AUDITORIA_TABELA','D','25','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('440','ccaug100.TB_AUDITORIA_TABELA','D','26','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('441','ccaug100.TB_AUDITORIA_TABELA','D','27','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('442','ccaug100.TB_AUDITORIA_TABELA','D','28','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('443','ccaug100.TB_AUDITORIA_TABELA','D','29','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('444','ccaug100.TB_AUDITORIA_TABELA','D','30','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('445','ccaug100.TB_AUDITORIA_TABELA','D','39','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('446','ccaug100.TB_AUDITORIA_TABELA','D','40','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('447','ccaug100.TB_AUDITORIA_TABELA','D','41','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('448','ccaug100.TB_AUDITORIA_TABELA','D','42','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('449','ccaug100.TB_AUDITORIA_TABELA','D','43','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('450','ccaug100.TB_AUDITORIA_TABELA','D','44','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('451','ccaug100.TB_AUDITORIA_TABELA','D','45','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('452','ccaug100.TB_AUDITORIA_TABELA','D','46','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('453','ccaug100.TB_AUDITORIA_TABELA','D','47','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('454','ccaug100.TB_AUDITORIA_TABELA','D','48','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('455','ccaug100.TB_AUDITORIA_TABELA','D','49','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('456','ccaug100.TB_AUDITORIA_TABELA','D','50','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('457','ccaug100.TB_AUDITORIA_TABELA','D','51','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('458','ccaug100.TB_AUDITORIA_TABELA','D','52','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('459','ccaug100.TB_AUDITORIA_TABELA','D','53','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('460','ccaug100.TB_AUDITORIA_TABELA','D','54','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('461','ccaug100.TB_AUDITORIA_TABELA','D','55','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('462','ccaug100.TB_AUDITORIA_TABELA','D','56','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('463','ccaug100.TB_AUDITORIA_TABELA','D','57','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('464','ccaug100.TB_AUDITORIA','D','1','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('465','ccaug100.TB_AUDITORIA','D','2','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('466','ccaug100.TB_AUDITORIA','D','3','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('467','ccaug100.TB_AUDITORIA','D','4','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('468','ccaug100.TB_AUDITORIA','D','5','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('469','ccaug100.TB_AUDITORIA','D','6','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('470','ccaug100.TB_AUDITORIA','D','7','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('471','ccaug100.TB_AUDITORIA','D','8','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('472','ccaug100.TB_AUDITORIA','D','9','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('473','ccaug100.TB_AUDITORIA','D','10','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('474','ccaug100.TB_AUDITORIA','D','11','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('475','ccaug100.TB_AUDITORIA','D','12','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('476','ccaug100.TB_AUDITORIA','D','13','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('477','ccaug100.TB_AUDITORIA','D','14','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('478','ccaug100.TB_AUDITORIA','D','15','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('479','ccaug100.TB_AUDITORIA','D','16','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('480','ccaug100.TB_AUDITORIA','D','17','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('481','ccaug100.TB_AUDITORIA','D','18','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('482','ccaug100.TB_AUDITORIA','D','19','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('483','ccaug100.TB_AUDITORIA','D','20','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('484','ccaug100.TB_AUDITORIA','D','21','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('485','ccaug100.TB_AUDITORIA','D','22','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('486','ccaug100.TB_AUDITORIA','D','23','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('487','ccaug100.TB_AUDITORIA','D','24','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('488','ccaug100.TB_AUDITORIA','D','25','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('489','ccaug100.TB_AUDITORIA','D','26','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('490','ccaug100.TB_AUDITORIA','D','28','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('491','ccaug100.TB_AUDITORIA','D','29','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('492','ccaug100.TB_AUDITORIA','D','30','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('493','ccaug100.TB_AUDITORIA','D','31','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('494','ccaug100.TB_AUDITORIA','D','32','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('495','ccaug100.TB_AUDITORIA','D','33','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('496','ccaug100.TB_AUDITORIA','D','34','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('497','ccaug100.TB_AUDITORIA','D','35','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('498','ccaug100.TB_AUDITORIA','D','36','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('499','ccaug100.TB_AUDITORIA','D','37','37');

INSERT INTO TB_AUDITORIA_TABELA VALUES('500','ccaug100.TB_ACESSO','U','6','38');

INSERT INTO TB_AUDITORIA_TABELA VALUES('501','ccaug100.TB_ACESSO','U','6','39');

INSERT INTO TB_AUDITORIA_TABELA VALUES('502','ccaug100.TB_ACESSO','U','6','40');

INSERT INTO TB_AUDITORIA_TABELA VALUES('503','ccaug100.TB_ACESSO','U','6','41');

INSERT INTO TB_AUDITORIA_TABELA VALUES('504','ccaug100.TB_ACESSO','U','6','42');

INSERT INTO TB_AUDITORIA_TABELA VALUES('505','ccaug100.TB_ACESSO','U','6','43');




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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


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
  `co_imagem` int(11) DEFAULT NULL,
  PRIMARY KEY (`co_curso`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_CURSO VALUES('1','<div class=\"conteudo\"><strong>Objetivos</strong>:\n<ul>\n	<li>Conhecer m&eacute;todos para elaborar prega&ccedil;&otilde;es sem dificuldades</li>\n	<li>Saber onde encontrar fontes seguras para montar sua prega&ccedil;&atilde;o</li>\n	<li>Fazer aprofundamento em mensagens b&iacute;blicas</li>\n	<li>Controlar o nervosismo ao falar em p&uacute;blico</li>\n	<li>Aprender t&eacute;cnicas de prega&ccedil;&atilde;o para uma boa comunica&ccedil;&atilde;o</li>\n	<li>Sabe como fazer prega&ccedil;&otilde;es em diversos meios de evangeliza&ccedil;&atilde;o</li>\n	<li>Aprender de forma interativa e din&acirc;mica</li>\n	<li>Aprender e partilhar conhecimentos com pessoas de v&aacute;rias localidades do Brasil</li>\n	<li>Conhecer e estudar com pessoas que desejam assim como voc&ecirc; aprender e aprofundar mais nas coisas de Deus</li>\n	<li>Tirar suas d&uacute;vidas diretamente com os formadores</li>\n</ul>\n</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Modalidade</strong>: realizado &aacute; distancia, mas com uma metodologia de uma forma&ccedil;&atilde;o interativa e din&acirc;mica.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Destinat&aacute;rios</strong>: Pessoas que sentem o chamado para prega&ccedil;&atilde;o, ou deseja conhecer mais sobre o minist&eacute;rio.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Carga hor&aacute;ria</strong>: 12 horas.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Per&iacute;odo de realiza&ccedil;&atilde;o</strong>: 02/03 a 18/03 de 2021 &ndash; 20h00, (verificar dias)</div>\n\n<div>&nbsp;</div>','2021-02-08 11:35:36','3');

INSERT INTO TB_CURSO VALUES('2','<div class=\"col-12 col-lg-8\">\n<div class=\"conteudo\"><strong>Objetivos</strong>:\n<ul>\n	<li>Conhecer os dons carism&aacute;ticos conforme os ensinamentos da Igreja</li>\n	<li>Aprimorar e fazer a descoberta de seus dons</li>\n	<li>Entender como exercer os dons com mais seguran&ccedil;a entendendo cada um deles</li>\n	<li>Aperfei&ccedil;oar seus minist&eacute;rios</li>\n	<li>Aprender de forma interativa e din&acirc;mica</li>\n	<li>Aprender e partilhar conhecimentos com pessoas de v&aacute;rias localidades do Brasil</li>\n	<li>Conhecer e estudar com pessoas que desejam assim como voc&ecirc; aprender e aprofundar mais nas coisas de Deus</li>\n	<li>Tirar suas d&uacute;vidas diretamente com os formadores</li>\n</ul>\n</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Modalidade</strong>: realizado &aacute; distancia, mas com uma metodologia de uma forma&ccedil;&atilde;o interativa e din&acirc;mica.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Destinat&aacute;rios</strong>: Pessoas que deseja descobrir seus dons e aprimorar seus minist&eacute;rios o minist&eacute;rio.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Carga hor&aacute;ria</strong>: 12 horas.</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Per&iacute;odo de realiza&ccedil;&atilde;o</strong>: 02/03 a 18/03 de 2021 &ndash; 20h00, Ter&ccedil;a e Quinta (dias a confirmar)</div>\n\n<div>&nbsp;</div>\n\n<div><strong>Investimento</strong>: Gratuito.</div>\n</div>','2021-02-08 15:24:57','2');




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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_IMAGEM VALUES('1','leonardo-m-c-bessa-56e8920c23ab66.jpg','1');

INSERT INTO TB_IMAGEM VALUES('2','Curso/curso-de-dons-carismaticos-602291ca5b5a7.png','2');

INSERT INTO TB_IMAGEM VALUES('3','Curso/curso-de-pregador-602292c167e06.png','2');




DROP TABLE IF EXISTS TB_INSCRICAO;


CREATE TABLE `TB_INSCRICAO` (
  `co_inscricao` int(11) NOT NULL AUTO_INCREMENT,
  `co_turma` int(11) NOT NULL,
  `co_aluno` int(11) NOT NULL,
  `dt_cadastro` datetime DEFAULT NULL,
  PRIMARY KEY (`co_inscricao`,`co_turma`,`co_aluno`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_PAGAMENTO VALUES('1','29.99','28.39','1.60','2021-02-08 10:49:58','6FF01E3E-8846-440E-B4F9-2DC27833D1B6','2021-02-08 10:49:58','5','3','https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=2a3bb34d7ec088022b08d11d82b3d0f82f6980e0c0bf0970b754208093840f698dfb3fc43e605dc2','','1');

INSERT INTO TB_PAGAMENTO VALUES('2','29.99','27.51','2.48','','DF2AAD11-0F5C-4630-8171-DE287424A32D','2021-02-08 11:15:46','3','2','','','2');

INSERT INTO TB_PAGAMENTO VALUES('3','29.99','28.39','1.60','','2030B963-4913-4AA1-A802-E88091FFF36E','2021-02-08 11:40:11','4','1','https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=cdf38438fec01e80935e287819f79ec595e3c402ad0eafbb2914f13450473e8c87ce65ebdc0773e7','','3');

INSERT INTO TB_PAGAMENTO VALUES('5','29.99','28.39','1.60','','5B4C74C7-E419-4CAF-97E9-4E7B7C3DDF68','2021-02-08 11:49:17','4','1','https://sandbox.pagseguro.uol.com.br/checkout/payment/eft/print.jhtml?c=efc372c7ab24c91b499d97bb174db4ee2a2f7481ce0d3e514e1da7675ca81dc9f6237a702c58037d','','5');




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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_PESSOA VALUES('1','','Usuário SisEnovus','','2016-10-31 00:00:00','2020-10-10','M','1','1','1');

INSERT INTO TB_PESSOA VALUES('2','12345678909','Aluno nota Mil','','2021-02-08 11:45:41','','','2','2','0');

INSERT INTO TB_PESSOA VALUES('3','99543885168','Aluno nota Dez','','2021-02-08 12:15:44','','','3','3','0');

INSERT INTO TB_PESSOA VALUES('4','12345678909','Lucas Soares','','2021-02-08 12:40:08','','','4','4','0');

INSERT INTO TB_PESSOA VALUES('6','12345678909','Lucas Soaresg ert getrh','','2021-02-08 12:49:15','','','6','6','0');




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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_TRAFEGO VALUES('6','127.0.0.1','Desconhecido','Desconhecida','Desconhecida','Desconhecida','Desconhecida','Firefox','Windows 10','Desktop','Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0');




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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO TB_VALOR_CURSO VALUES('1','2021-02-08 11:35:36','24.55','CURSO DE PREGADOR','16','2','S','S','Conhecer métodos para elaborar pregações sem dificuldades, Aprender técnicas de pregação para uma boa comunicação...','1','1');

INSERT INTO TB_VALOR_CURSO VALUES('2','2021-02-08 11:35:56','29.99','CURSO DE PREGADOR','16','2','S','S','Conhecer métodos para elaborar pregações sem dificuldades, Aprender técnicas de pregação para uma boa comunicação...','1','1');

INSERT INTO TB_VALOR_CURSO VALUES('3','2021-02-08 15:24:57','0.01','CURSO DE DONS CARISMÁTICOS','12','3','S','S','','2','1');

INSERT INTO TB_VALOR_CURSO VALUES('4','2021-02-08 16:23:23','0.00','CURSO DE DONS CARISMÁTICOS','12','3','S','S','st_gratuito','2','1');

INSERT INTO TB_VALOR_CURSO VALUES('5','2021-02-08 17:12:16','0.00','CURSO DE DONS CARISMÁTICOS','12','3','S','S','Objetivos: Conhecer os dons carismáticos conforme os ensinamentos da Igreja...','2','1');

INSERT INTO TB_VALOR_CURSO VALUES('6','2021-02-08 17:13:47','22.80','CURSO DE PREGADOR','16','2','S','S','Conhecer métodos para elaborar pregações sem dificuldades, Aprender técnicas de pregação para uma boa comunicação...','1','1');

INSERT INTO TB_VALOR_CURSO VALUES('7','2021-02-08 17:15:44','22.80','CURSO DE PREGADOR','16','2','S','S','Conhecer métodos para elaborar pregações sem dificuldades, Aprender técnicas de pregação para uma boa comunicação...','1','1');

INSERT INTO TB_VALOR_CURSO VALUES('8','2021-02-09 11:44:42','0.00','CURSO DE DONS CARISMÁTICOS','12','3','S','S','','2','1');

INSERT INTO TB_VALOR_CURSO VALUES('9','2021-02-09 11:48:49','22.80','CURSO DE PREGADOR','16','2','S','S','','1','1');




DROP TABLE IF EXISTS TB_VISITA;


CREATE TABLE `TB_VISITA` (
  `co_visita` int(11) NOT NULL AUTO_INCREMENT,
  `dt_realizado` datetime DEFAULT NULL,
  `dt_atualizado` datetime DEFAULT NULL,
  `nu_visitas` int(11) DEFAULT NULL,
  `co_trafego` int(11) NOT NULL,
  PRIMARY KEY (`co_visita`,`co_trafego`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;





