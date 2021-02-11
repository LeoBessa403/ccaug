UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 19:02:12" where co_acesso = 6;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 19:02:13" where co_acesso = 6;

INSERT INTO ccaug100.TB_PESSOA (nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo) VALUES ("22322191191", "Leonardo Machado Carvalho Bessa", "", "2021-02-09 21:24:14", "", "");

INSERT INTO ccaug100.TB_CONTATO (nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES ("5335235535", "", "", "", "arnaldo@gmail.com", "", "", "", "");

INSERT INTO ccaug100.TB_ENDERECO (ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES ("", "", "", "", "", "");

UPDATE ccaug100.TB_PESSOA SET co_contato = "8", co_endereco = "8" where co_pessoa = 8;

INSERT INTO TB_ALUNO (co_pessoa, dt_cadastro, st_status) VALUES ("8", "2021-02-09 21:24:15", "S");

INSERT INTO TB_INSCRICAO (co_aluno, co_turma, dt_cadastro) VALUES ("7", "1", "2021-02-09 21:24:15");

INSERT INTO ccaug100.TB_PESSOA (nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo) VALUES ("22322191191", "Leonardo Machado Carvalho Bessa", "", "2021-02-09 21:24:41", "", "");

INSERT INTO ccaug100.TB_CONTATO (nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES ("5335235535", "", "", "", "arnaldo@gmail.com", "", "", "", "");

INSERT INTO ccaug100.TB_ENDERECO (ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES ("", "", "", "", "", "");

UPDATE ccaug100.TB_PESSOA SET co_contato = "9", co_endereco = "9" where co_pessoa = 9;

INSERT INTO TB_ALUNO (co_pessoa, dt_cadastro, st_status) VALUES ("9", "2021-02-09 21:24:41", "S");

INSERT INTO TB_INSCRICAO (co_aluno, co_turma, dt_cadastro) VALUES ("8", "1", "2021-02-09 21:24:41");

UPDATE ccaug100.TB_PESSOA SET nu_cpf = "12345678909", no_pessoa = "Aluno Post", nu_rg = "", dt_nascimento = "", st_sexo = "" where co_pessoa = 2;

UPDATE ccaug100.TB_CONTATO SET nu_tel1 = "4535435435", nu_tel2 = "", nu_tel3 = "", nu_tel_0800 = "", ds_email = "arnaldo@gmail.com", ds_site = "", ds_facebook = "", ds_twitter = "", ds_instagram = "" where co_contato = 2;

UPDATE ccaug100.TB_ENDERECO SET ds_endereco = "", ds_complemento = "", ds_bairro = "", nu_cep = "", no_cidade = "", sg_uf = "" where co_endereco = 2;

UPDATE ccaug100.TB_PESSOA SET co_contato = "2", co_endereco = "2" where co_pessoa = 2;

INSERT INTO TB_INSCRICAO (co_aluno, co_turma, dt_cadastro) VALUES ("1", "1", "2021-02-09 21:33:50");

INSERT INTO TB_PAGAMENTO (co_inscricao, tp_pagamento, dt_modificado) VALUES ("9", "0", "2021-02-09 21:33:50");

UPDATE TB_PAGAMENTO SET dt_modificado = "2021-02-09 21:33:50", nu_valor_pago = "0.00", nu_valor_total = "0.00", nu_valor_desconto = "0.00" where co_pagamento = 7;

INSERT INTO TB_HISTORICO_PAGAMENTO (co_pagamento, dt_cadastro, ds_acao, ds_usuario, st_pagamento) VALUES ("7", "2021-02-09 21:33:50", "Curso Gratuito", "Usuário SisEnovus Efetivou a Inscrição", "3");

UPDATE ccaug100.TB_ACESSO SET tp_situacao = "F" where co_acesso = 6;

INSERT INTO ccaug100.TB_TRAFEGO (ds_navegador, ds_sistema_operacional, ds_dispositivo, nu_ip, ds_pais, ds_code_pais, ds_estado, ds_uf, ds_cidade, ds_agente) VALUES ("Firefox", "Windows 8.1", "Desktop", "127.0.0.1", "Desconhecido", "Desconhecida", "Desconhecida", "Desconhecida", "Desconhecida", "Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0");

INSERT INTO ccaug100.TB_ACESSO (ds_session_id, co_usuario, tp_situacao, co_trafego, dt_fim_acesso, dt_inicio_acesso) VALUES ("d2aerqdqgibt3d09mufppa0k9p", "1", "A", "7", "2021-02-09 22:06:19", "2021-02-09 21:36:19");

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:06:19" where co_acesso = 7;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:06:20" where co_acesso = 7;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:06:27" where co_acesso = 7;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:06:28" where co_acesso = 7;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:06:33" where co_acesso = 7;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:06:34" where co_acesso = 7;

UPDATE ccaug100.TB_ACESSO SET tp_situacao = "F", dt_fim_acesso = "2021-02-09 21:37:53" where co_acesso = 7;

INSERT INTO ccaug100.TB_PESSOA (nu_cpf, no_pessoa, nu_rg, dt_cadastro, dt_nascimento, st_sexo) VALUES ("01304694160", "Leonardo Machado Carvalho Bessa", "", "2021-02-09 21:38:12", "", "");

INSERT INTO ccaug100.TB_CONTATO (nu_tel1, nu_tel2, nu_tel3, nu_tel_0800, ds_email, ds_site, ds_facebook, ds_twitter, ds_instagram) VALUES ("5325553256", "", "", "", "leonardomcbessa@gmail.com", "", "", "", "");

INSERT INTO ccaug100.TB_ENDERECO (ds_endereco, ds_complemento, ds_bairro, nu_cep, no_cidade, sg_uf) VALUES ("", "", "", "", "", "");

UPDATE ccaug100.TB_PESSOA SET co_contato = "10", co_endereco = "10" where co_pessoa = 10;

INSERT INTO TB_ALUNO (co_pessoa, dt_cadastro, st_status) VALUES ("10", "2021-02-09 21:38:12", "S");

INSERT INTO TB_INSCRICAO (co_aluno, co_turma, dt_cadastro) VALUES ("9", "1", "2021-02-09 21:38:12");

INSERT INTO TB_PAGAMENTO (co_inscricao, tp_pagamento, dt_modificado) VALUES ("10", "0", "2021-02-09 21:38:12");

UPDATE TB_PAGAMENTO SET dt_modificado = "2021-02-09 21:38:13", nu_valor_pago = "0.00", nu_valor_total = "0.00", nu_valor_desconto = "0.00", st_pagamento = "3" where co_pagamento = 8;

INSERT INTO TB_HISTORICO_PAGAMENTO (co_pagamento, dt_cadastro, ds_acao, ds_usuario, st_pagamento) VALUES ("8", "2021-02-09 21:38:13", "Curso Gratuito", "Usuário SisEnovus Efetivou a Inscrição", "3");

INSERT INTO ccaug100.TB_TRAFEGO (ds_navegador, ds_sistema_operacional, ds_dispositivo, nu_ip, ds_pais, ds_code_pais, ds_estado, ds_uf, ds_cidade, ds_agente) VALUES ("Firefox", "Windows 8.1", "Desktop", "127.0.0.1", "Desconhecido", "Desconhecida", "Desconhecida", "Desconhecida", "Desconhecida", "Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:85.0) Gecko/20100101 Firefox/85.0");

INSERT INTO ccaug100.TB_ACESSO (ds_session_id, co_usuario, tp_situacao, co_trafego, dt_fim_acesso, dt_inicio_acesso) VALUES ("36prn41g4rqu12622aimec992k", "1", "A", "8", "2021-02-09 22:11:10", "2021-02-09 21:41:10");

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:10" where co_acesso = 8;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:11" where co_acesso = 8;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:14" where co_acesso = 8;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:15" where co_acesso = 8;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:19" where co_acesso = 8;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:20" where co_acesso = 8;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:22" where co_acesso = 8;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:23" where co_acesso = 8;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:41" where co_acesso = 8;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:41" where co_acesso = 8;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:51" where co_acesso = 8;

UPDATE ccaug100.TB_ACESSO SET dt_fim_acesso = "2021-02-09 22:11:52" where co_acesso = 8;

