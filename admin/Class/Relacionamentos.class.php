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
                (CO_ALUNO) => array(
                    ('Campo') => CO_PESSOA,
                    ('Entidade') => 'AlunoEntidade',
                    ('Tipo') => '1',
                ),
                (CO_PROFESSOR) => array(
                    ('Campo') => CO_PESSOA,
                    ('Entidade') => 'ProfessorEntidade',
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
                (CO_TURMA) => array(
                    ('Campo') => CO_TURMA,
                    ('Entidade') => 'TurmaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_PESSOA) => array(
                    ('Campo') => CO_PESSOA,
                    ('Entidade') => 'PessoaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_ANOTACAO_ALUNO) => array(
                    ('Campo') => CO_ALUNO,
                    ('Entidade') => 'AnotacaoAlunoEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (TurmaEntidade::TABELA) => array(
                (CO_ALUNO) => array(
                    ('Campo') => CO_TURMA,
                    ('Entidade') => 'AlunoEntidade',
                    ('Tipo') => '1',
                ),
                (CO_MATERIA_TURMA) => array(
                    ('Campo') => CO_TURMA,
                    ('Entidade') => 'MateriaTurmaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_ESCOLA) => array(
                    ('Campo') => CO_ESCOLA,
                    ('Entidade') => 'EscolaEntidade',
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
            (CapituloEntidade::TABELA) => array(
                (CO_LIVRO) => array(
                    ('Campo') => CO_LIVRO,
                    ('Entidade') => 'LivroEntidade',
                    ('Tipo') => '1',
                ),
                (CO_IMAGEM) => array(
                    ('Campo') => CO_IMAGEM,
                    ('Entidade') => 'ImagemEntidade',
                    ('Tipo') => '1',
                ),
                (CO_PAGINA_LIVRO) => array(
                    ('Campo') => CO_CAPITULO,
                    ('Entidade') => 'PaginaLivroEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (LivroEntidade::TABELA) => array(
                (CO_CAPITULO) => array(
                    ('Campo') => CO_LIVRO,
                    ('Entidade') => 'CapituloEntidade',
                    ('Tipo') => '2',
                ),
                (CO_MATERIA) => array(
                    ('Campo') => CO_MATERIA,
                    ('Entidade') => 'MateriaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_IMAGEM) => array(
                    ('Campo') => CO_IMAGEM,
                    ('Entidade') => 'ImagemEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (EscolaEntidade::TABELA) => array(
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
                (CO_USUARIO) => array(
                    ('Campo') => CO_USUARIO,
                    ('Entidade') => 'UsuarioEntidade',
                    ('Tipo') => '1',
                ),
                (CO_TURMA) => array(
                    ('Campo') => CO_ESCOLA,
                    ('Entidade') => 'TurmaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_PROFESSOR) => array(
                    ('Campo') => CO_PROFESSOR,
                    ('Entidade') => 'ProfessorEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (MateriaEntidade::TABELA) => array(
                (CO_LIVRO) => array(
                    ('Campo') => CO_MATERIA,
                    ('Entidade') => 'LivroEntidade',
                    ('Tipo') => '1',
                ),
                (CO_MATERIA_TURMA) => array(
                    ('Campo') => CO_MATERIA,
                    ('Entidade') => 'MateriaTurmaEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (MateriaTurmaEntidade::TABELA) => array(
                (CO_MATERIA) => array(
                    ('Campo') => CO_MATERIA,
                    ('Entidade') => 'MateriaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_TURMA) => array(
                    ('Campo') => CO_TURMA,
                    ('Entidade') => 'TurmaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_PROFESSOR) => array(
                    ('Campo') => CO_PROFESSOR,
                    ('Entidade') => 'ProfessorEntidade',
                    ('Tipo') => '1',
                ),
                (CO_ANOTACAO_PROFESSOR) => array(
                    ('Campo') => CO_MATERIA_TURMA,
                    ('Entidade') => 'AnotacaoProfessorEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (ProfessorEntidade::TABELA) => array(
                (CO_MATERIA_TURMA) => array(
                    ('Campo') => CO_PROFESSOR,
                    ('Entidade') => 'MateriaTurmaEntidade',
                    ('Tipo') => '2',
                ),
                (CO_PESSOA) => array(
                    ('Campo') => CO_PESSOA,
                    ('Entidade') => 'PessoaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_ESCOLA) => array(
                    ('Campo') => CO_ESCOLA,
                    ('Entidade') => 'EscolaEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (PaginaLivroEntidade::TABELA) => array(
                (CO_CAPITULO) => array(
                    ('Campo') => CO_CAPITULO,
                    ('Entidade') => 'CapituloEntidade',
                    ('Tipo') => '1',
                ),
                (CO_ANOTACAO_ALUNO) => array(
                    ('Campo') => CO_PAGINA_LIVRO,
                    ('Entidade') => 'AnotacaoAlunoEntidade',
                    ('Tipo') => '2',
                ),
                (CO_ANOTACAO_PROFESSOR) => array(
                    ('Campo') => CO_PAGINA_LIVRO,
                    ('Entidade') => 'AnotacaoProfessorEntidade',
                    ('Tipo') => '2',
                ),
                (CO_MODAL) => array(
                    ('Campo') => CO_PAGINA_LIVRO,
                    ('Entidade') => 'ModalEntidade',
                    ('Tipo') => '2',
                ),
            ),
            (AnotacaoAlunoEntidade::TABELA) => array(
                (CO_PAGINA_LIVRO) => array(
                    ('Campo') => CO_PAGINA_LIVRO,
                    ('Entidade') => 'PaginaLivroEntidade',
                    ('Tipo') => '1',
                ),
                (CO_ALUNO) => array(
                    ('Campo') => CO_ALUNO,
                    ('Entidade') => 'AlunoEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (AnotacaoProfessorEntidade::TABELA) => array(
                (CO_MATERIA_TURMA) => array(
                    ('Campo') => CO_MATERIA_TURMA,
                    ('Entidade') => 'MateriaTurmaEntidade',
                    ('Tipo') => '1',
                ),
                (CO_PAGINA_LIVRO) => array(
                    ('Campo') => CO_PAGINA_LIVRO,
                    ('Entidade') => 'PaginaLivroEntidade',
                    ('Tipo') => '1',
                ),
            ),
            (ModalEntidade::TABELA) => array(
                (CO_PAGINA_LIVRO) => array(
                    ('Campo') => CO_PAGINA_LIVRO,
                    ('Entidade') => 'PaginaLivroEntidade',
                    ('Tipo') => '1',
                ),
            ),
        );
    }
}




















