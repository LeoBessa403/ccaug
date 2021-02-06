<?php

/**
 * Relacionamentos.class [ RELACIONAMENTOS DO BANCO ]
 * @copyright (c) 2018, Leo Bessa
 */

class Relacionamentos
{

    public static function getRelacionamentos()
    {
        return array(
            (AcessoEntidade::TABELA) => array(
                (CO_USUARIO) => array(
                    ('Campo') => CO_USUARIO,
                    ('Entidade') => 'UsuarioEntidade',
                    ('Tipo') => '1',
                ),
                (CO_TRAFEGO) => array(
                    ('Campo') => CO_TRAFEGO,
                    ('Entidade') => 'TrafegoEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (UsuarioEntidade::TABELA) => array(
                (CO_ACESSO) => array(
                    ('Campo') => CO_USUARIO,
                    ('Entidade') => 'AcessoEntidade',
                    ('Tipo') => '2',
                ),
                (CO_AUDITORIA) => array(
                    ('Campo') => CO_USUARIO,
                    ('Entidade') => 'AuditoriaEntidade',
                    ('Tipo') => '2',
                ),
                (CO_IMAGEM) => array(
                    ('Campo') => CO_IMAGEM,
                    ('Entidade') => 'ImagemEntidade',
                    ('Tipo') => '1',
                ),
                (CO_PESSOA) => array(
                    ('Campo') => CO_PESSOA,
                    ('Entidade') => 'PessoaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_USUARIO_PERFIL) => array(
                    ('Campo') => CO_USUARIO,
                    ('Entidade') => 'UsuarioPerfilEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (FuncionalidadeEntidade::TABELA) => array(
                (CO_PERFIL_FUNCIONALIDADE) => array(
                    ('Campo') => CO_FUNCIONALIDADE,
                    ('Entidade') => 'PerfilFuncionalidadeEntidade',
                    ('Tipo') => '2',
                ),
                (CO_CONTROLLER) => array(
                    ('Campo') => CO_CONTROLLER,
                    ('Entidade') => 'ControllerEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (AuditoriaEntidade::TABELA) => array(
                (CO_USUARIO) => array(
                    ('Campo') => CO_USUARIO,
                    ('Entidade') => 'UsuarioEntidade',
                    ('Tipo') => '1',
                ),
                (CO_AUDITORIA_TABELA) => array(
                    ('Campo') => CO_AUDITORIA,
                    ('Entidade') => 'AuditoriaTabelaEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (AuditoriaItensEntidade::TABELA) => array(
                (CO_AUDITORIA_TABELA) => array(
                    ('Campo') => CO_AUDITORIA_TABELA,
                    ('Entidade') => 'AuditoriaTabelaEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (AuditoriaTabelaEntidade::TABELA) => array(
                (CO_AUDITORIA_ITENS) => array(
                    ('Campo') => CO_AUDITORIA_TABELA,
                    ('Entidade') => 'AuditoriaItensEntidade',
                    ('Tipo') => '2',
                ),
                (CO_AUDITORIA) => array(
                    ('Campo') => CO_AUDITORIA,
                    ('Entidade') => 'AuditoriaEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (PessoaEntidade::TABELA) => array(
                (CO_ENDERECO) => array(
                    ('Campo') => CO_ENDERECO,
                    ('Entidade') => 'EnderecoEntidade',
                    ('Tipo') => '1',
                ),
                (CO_CONTATO) => array(
                    ('Campo') => CO_CONTATO,
                    ('Entidade') => 'ContatoEntidade',
                    ('Tipo') => '1',
                ),
                (CO_IMAGEM) => array(
                    ('Campo') => CO_IMAGEM,
                    ('Entidade') => 'ImagemEntidade',
                    ('Tipo') => '1',
                ),
                (CO_USUARIO) => array(
                    ('Campo') => CO_PESSOA,
                    ('Entidade') => 'UsuarioEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (ContatoEntidade::TABELA) => array(
                (CO_PESSOA) => array(
                    ('Campo') => CO_CONTATO,
                    ('Entidade') => 'PessoaEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (EnderecoEntidade::TABELA) => array(
                (CO_PESSOA) => array(
                    ('Campo') => CO_ENDERECO,
                    ('Entidade') => 'PessoaEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (ImagemEntidade::TABELA) => array(),
            (PerfilFuncionalidadeEntidade::TABELA) => array(
                (CO_PERFIL) => array(
                    ('Campo') => CO_PERFIL,
                    ('Entidade') => 'PerfilEntidade',
                    ('Tipo') => '1',
                ),
                (CO_FUNCIONALIDADE) => array(
                    ('Campo') => CO_FUNCIONALIDADE,
                    ('Entidade') => 'FuncionalidadeEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (PerfilEntidade::TABELA) => array(
                (CO_PERFIL_FUNCIONALIDADE) => array(
                    ('Campo') => CO_PERFIL,
                    ('Entidade') => 'PerfilFuncionalidadeEntidade',
                    ('Tipo') => '2',
                ),
                (CO_USUARIO_PERFIL) => array(
                    ('Campo') => CO_PERFIL,
                    ('Entidade') => 'UsuarioPerfilEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (UsuarioPerfilEntidade::TABELA) => array(
                (CO_USUARIO) => array(
                    ('Campo') => CO_USUARIO,
                    ('Entidade') => 'UsuarioEntidade',
                    ('Tipo') => '1',
                ),
                (CO_PERFIL) => array(
                    ('Campo') => CO_PERFIL,
                    ('Entidade') => 'PerfilEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (VisitaEntidade::TABELA) => array(
                (CO_TRAFEGO) => array(
                    ('Campo') => CO_TRAFEGO,
                    ('Entidade') => 'TrafegoEntidade',
                    ('Tipo') => '1',
                ),
                (CO_PAGINA_VISITA) => array(
                    ('Campo') => CO_VISITA,
                    ('Entidade') => 'PaginaVisitaEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (PaginaEntidade::TABELA) => array(
                (CO_PAGINA_VISITA) => array(
                    ('Campo') => CO_PAGINA,
                    ('Entidade') => 'PaginaVisitaEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (PaginaVisitaEntidade::TABELA) => array(
                (CO_PAGINA) => array(
                    ('Campo') => CO_PAGINA,
                    ('Entidade') => 'PaginaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_VISITA) => array(
                    ('Campo') => CO_VISITA,
                    ('Entidade') => 'VisitaEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (AnotacaoEntidade::TABELA) => array(
                (CO_HISTORIA) => array(
                    ('Campo') => CO_HISTORIA,
                    ('Entidade') => 'HistoriaEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (HistoricoHistoriaEntidade::TABELA) => array(
                (CO_HISTORIA) => array(
                    ('Campo') => CO_HISTORIA,
                    ('Entidade') => 'HistoriaEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (HistoriaEntidade::TABELA) => array(
                (CO_ANOTACAO) => array(
                    ('Campo') => CO_HISTORIA,
                    ('Entidade') => 'AnotacaoEntidade',
                    ('Tipo') => '2',
                ),
                (CO_SESSAO) => array(
                    ('Campo') => CO_SESSAO,
                    ('Entidade') => 'SessaoEntidade',
                    ('Tipo') => '1',
                ),
                (CO_HISTORICO_HISTORIA) => array(
                    ('Campo') => CO_HISTORIA,
                    ('Entidade') => 'HistoricoHistoriaEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (SessaoEntidade::TABELA) => array(
                (CO_HISTORIA) => array(
                    ('Campo') => CO_SESSAO,
                    ('Entidade') => 'HistoriaEntidade',
                    ('Tipo') => '2',
                ),
                (CO_MODULO) => array(
                    ('Campo') => CO_MODULO,
                    ('Entidade') => 'ModuloEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (ModuloEntidade::TABELA) => array(
                (CO_PROJETO) => array(
                    ('Campo') => CO_PROJETO,
                    ('Entidade') => 'ProjetoEntidade',
                    ('Tipo') => '1',
                ),
                (CO_SESSAO) => array(
                    ('Campo') => CO_MODULO,
                    ('Entidade') => 'SessaoEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (ProjetoEntidade::TABELA) => array(
                (CO_MODULO) => array(
                    ('Campo') => CO_PROJETO,
                    ('Entidade') => 'ModuloEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (TrafegoEntidade::TABELA) => array(),
            (ControllerEntidade::TABELA) => array(
                (CO_FUNCIONALIDADE) => array(
                    ('Campo') => CO_CONTROLLER,
                    ('Entidade') => 'FuncionalidadeEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (SuporteEntidade::TABELA) => array(
                (CO_HISTORICO_SUPORTE) => array(
                    ('Campo') => CO_SUPORTE,
                    ('Entidade') => 'HistoricoSuporteEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (HistoricoSuporteEntidade::TABELA) => array(
                (CO_SUPORTE) => array(
                    ('Campo') => CO_SUPORTE,
                    ('Entidade') => 'SuporteEntidade',
                    ('Tipo') => '1',
                ),
                (CO_USUARIO) => array(
                    ('Campo') => CO_USUARIO,
                    ('Entidade') => 'UsuarioEntidade',
                    ('Tipo') => '1',
                ),
                (CO_IMAGEM) => array(
                    ('Campo') => CO_IMAGEM,
                    ('Entidade') => 'ImagemEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (AlunoEntidade::TABELA) => array(
                (CO_PESSOA) => array(
                    ('Campo') => CO_PESSOA,
                    ('Entidade') => 'PessoaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_INSCRICAO) => array(
                    ('Campo') => CO_ALUNO,
                    ('Entidade') => 'InscricaoEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (CursoEntidade::TABELA) => array(
                (CO_TURMA) => array(
                    ('Campo') => CO_CURSO,
                    ('Entidade') => 'TurmaEntidade',
                    ('Tipo') => '2',
                ),
                (CO_VALOR_CURSO) => array(
                    ('Campo') => CO_CURSO,
                    ('Entidade') => 'ValorCursoEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (InscricaoEntidade::TABELA) => array(
                (CO_TURMA) => array(
                    ('Campo') => CO_TURMA,
                    ('Entidade') => 'TurmaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_ALUNO) => array(
                    ('Campo') => CO_ALUNO,
                    ('Entidade') => 'AlunoEntidade',
                    ('Tipo') => '1',
                ),
                (CO_PAGAMENTO) => array(
                    ('Campo') => CO_INSCRICAO,
                    ('Entidade') => 'PagamentoEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (TurmaEntidade::TABELA) => array(
                (CO_INSCRICAO) => array(
                    ('Campo') => CO_TURMA,
                    ('Entidade') => 'InscricaoEntidade',
                    ('Tipo') => '2',
                ),
                (CO_CURSO) => array(
                    ('Campo') => CO_CURSO,
                    ('Entidade') => 'CursoEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (PagamentoEntidade::TABELA) => array(
                (CO_INSCRICAO) => array(
                    ('Campo') => CO_INSCRICAO,
                    ('Entidade') => 'InscricaoEntidade',
                    ('Tipo') => '1',
                ),
                (CO_PARCELA) => array(
                    ('Campo') => CO_PAGAMENTO,
                    ('Entidade') => 'ParcelaEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (ParcelaEntidade::TABELA) => array(
                (CO_PAGAMENTO) => array(
                    ('Campo') => CO_PAGAMENTO,
                    ('Entidade') => 'PagamentoEntidade',
                    ('Tipo') => '1',
                ),
                (CO_TIPO_PAGAMENTO) => array(
                    ('Campo') => CO_TIPO_PAGAMENTO,
                    ('Entidade') => 'TipoPagamentoEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (TipoPagamentoEntidade::TABELA) => array(),
            (ValorCursoEntidade::TABELA) => array(
                (CO_USUARIO) => array(
                    ('Campo') => CO_USUARIO,
                    ('Entidade') => 'UsuarioEntidade',
                    ('Tipo') => '1',
                ),
            ),
        );
    }
}
