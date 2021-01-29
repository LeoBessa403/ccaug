<?php

class Livro extends AbstractController
{
    public $result;
    public $livro;
    public $capitulos;
    public $capitulo;
    public $form;
    public $mensagem;
    public $anotaProf;
    public $pagina;

    public function ListarLivro()
    {
        /** @var LivroService $livroService */
        $livroService = $this->getService(LIVRO_SERVICE);
        $this->result = $livroService->PesquisaTodos();
    }

    public function CadastroLivro()
    {
        /** @var LivroService $livroService */
        $livroService = $this->getService(LIVRO_SERVICE);

        if (!empty($_POST)):
            $retorno = $livroService->salvaLivro($_POST, $_FILES);
            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/ListarLivro/');
            }
        endif;

        $coLivro = UrlAmigavel::PegaParametro(CO_LIVRO);

        $res[ST_STATUS] = 'checked';
        $res[CO_LIVRO] = null;
        if ($coLivro) {
            /** @var LivroEntidade $livro */
            $livro = $livroService->PesquisaUmRegistro($coLivro);

            $res[CO_LIVRO] = $coLivro;
            $res[CO_MATERIA] = $livro->getCoMateria()->getCoMateria();
            $res[ST_STATUS] = ($livro->getStStatus() == 'S')
                ? 'checked' : '';
            $res[DS_TITULO] = $livro->getDsTitulo();
            $res[DS_COR1] = $livro->getDsCor1();
            $res[DS_COR2] = $livro->getDsCor2();
            $res[DS_COR3] = $livro->getDsCor3();
            if (!empty($livro->getCoImagem())):
                if ($livro->getCoImagem()->getDsCaminho()):
                    $res[DS_CAMINHO] = $livro->getCoImagem()->getDsCaminho();
                endif;
            endif;
        }

        $this->form = LivroForm::Cadastrar($res);
    }


    public function ListarCapitulo()
    {
        /** @var CapituloService $CapituloService */
        $CapituloService = $this->getService(CAPITULO_SERVICE);

        $this->livro = static::verificaLivro();

        /** @var Session $session */
        $session = new Session();
        if ($session->CheckSession(PESQUISA_AVANCADA)) {
            $session->FinalizaSession(PESQUISA_AVANCADA);
        }
        $Condicoes = [
            CO_LIVRO => $this->livro
        ];
        $this->result = $CapituloService->PesquisaTodos($Condicoes);

    }

    public function CadastroCapitulo()
    {
        /** @var CapituloService $CapituloService */
        $CapituloService = $this->getService(CAPITULO_SERVICE);

        $id = "CadastroCapitulo";

        if (!empty($_POST[$id])):
            $retorno = $CapituloService->salvaCapitulo($_POST, $_FILES);

            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller
                    . '/ListarCapitulo/' . Valida::GeraParametro(CO_LIVRO . "/" . $_POST[CO_LIVRO]));
            }
        endif;

        $coCapitulo = UrlAmigavel::PegaParametro(CO_CAPITULO);
        $res = array();
        $res[CO_LIVRO] = static::verificaLivro();
        $this->livro = static::verificaLivro();
        $res[CO_CAPITULO] = $coCapitulo;
        $res[ST_STATUS] = 'checked';

        if ($coCapitulo) {
            /** @var CapituloEntidade $Capitulo */
            $Capitulo = $CapituloService->PesquisaUmRegistro($coCapitulo);
            $res[DS_TITULO] = $Capitulo->getDsTitulo();
            $res[ST_STATUS] = ($Capitulo->getStStatus() == 'S')
                ? 'checked' : '';
            if (!empty($Capitulo->getCoImagem())):
                if ($Capitulo->getCoImagem()->getDsCaminho()):
                    $res[DS_CAMINHO] = $Capitulo->getCoImagem()->getDsCaminho();
                endif;
            endif;
        }

        $this->form = LivroForm::CadastroCapitulo($res);
    }


    public function ListarPaginaLivro()
    {
        /** @var PaginaLivroService $PaginaLivroService */
        $PaginaLivroService = $this->getService(PAGINA_LIVRO_SERVICE);

        $this->livro = static::verificaLivro();
        $this->capitulo = static::verificaCapitulo();

        /** @var Session $session */
        $session = new Session();
        if ($session->CheckSession(PESQUISA_AVANCADA)) {
            $session->FinalizaSession(PESQUISA_AVANCADA);
        }
        $Condicoes = [
            CO_CAPITULO => $this->capitulo
        ];

        $this->result = $PaginaLivroService->PesquisaTodos($Condicoes);
    }

    public function CadastroPaginaLivro()
    {
        /** @var PaginaLivroService $PaginaLivroService */
        $PaginaLivroService = $this->getService(PAGINA_LIVRO_SERVICE);
        /** @var LivroService $LivroService */
        $LivroService = $this->getService(LIVRO_SERVICE);

        if (!empty($_POST)):
            $retorno = $PaginaLivroService->salvaPaginaLivro($_POST);
            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller
                    . '/ListarPaginaLivro/' . Valida::GeraParametro(
                        CO_LIVRO . "/" . $_POST[CO_LIVRO] . "/" . CO_CAPITULO . "/" . $_POST[CO_CAPITULO]));
            }
        endif;

        $coPaginaLivro = UrlAmigavel::PegaParametro(CO_PAGINA_LIVRO);
        $res = array();
        $res[CO_LIVRO] = static::verificaLivro();
        $res[CO_CAPITULO] = static::verificaCapitulo();
        $this->livro = static::verificaLivro();
        $this->capitulo = static::verificaCapitulo();
        $res[CO_PAGINA_LIVRO] = $coPaginaLivro;
        $res[ST_STATUS] = 'checked';

        if ($coPaginaLivro) {
            /** @var PaginaLivroEntidade $paginaLivro */
            $paginaLivro = $PaginaLivroService->PesquisaUmRegistro($coPaginaLivro);
            $res[DS_CODE] = $paginaLivro->getDsCode();
            $res[ST_STATUS] = ($paginaLivro->getStStatus() == 'S')
                ? 'checked' : '';
        }
        $this->form = LivroForm::CadastroPaginaLivro($res);

        /** @var LivroEntidade $this->result */
        $this->result = $LivroService->PesquisaUmRegistro($this->livro);
    }

    public function LerLivro()
    {
        /** @var PaginaLivroService $PaginaLivroService */
        $PaginaLivroService = $this->getService(PAGINA_LIVRO_SERVICE);
        /** @var LivroService $LivroService */
        $LivroService = $this->getService(LIVRO_SERVICE);
        /** @var MateriaTurmaService $materiaTurmaService */
        $materiaTurmaService = $this->getService(MATERIA_TURMA_SERVICE);
        /** @var AlunoService $alunoService */
        $alunoService = $this->getService(ALUNO_SERVICE);

        $this->livro = static::verificaLivro();
        $this->capitulos = [];
        $capitulos = [];
        /** @var LivroEntidade $result */
        $result = $LivroService->PesquisaUmRegistro($this->livro);
        if ($result->getCoCapitulo()) {
            /** @var CapituloEntidade $capitulo */
            foreach ($result->getCoCapitulo() as $capitulo) {
                if ($capitulo->getCoPaginaLivro()) {
                    $paginas = [];
                    $paginasLivro = $PaginaLivroService->PesquisaPaginasCapitulos($capitulo->getCoCapitulo());
                    /** @var PaginaLivroEntidade $pagina */
                    foreach ($paginasLivro as $pagina) {
                        $paginas[] = $pagina;
                    }
                    $capitulos[$capitulo->getCoCapitulo()] = $paginas;
                }
            }
            $this->capitulos = $capitulos;
        }

        $this->result = $result;
        $res[CO_PROFESSOR] = null;
        $res[CO_ALUNO] = null;
        $res[CO_PAGINA_LIVRO] = null;
        $res[CO_ANOTACAO_ALUNO] = null;
        $res[CO_ANOTACAO_PROFESSOR] = null;
        $res[CO_MATERIA_TURMA] = null;
        $comboTurmas = [];

        /** @var PessoaEntidade $pessoa */
        $pessoa = UsuarioService::getPessoaCoUsuario(UsuarioService::getCoUsuarioLogado());
        if ($pessoa->getCoAluno()) {
            $res[CO_ALUNO] = $pessoa->getCoAluno()->getCoAluno();
        } else if ($pessoa->getCoProfessor()) {
            $res[CO_PROFESSOR] = $pessoa->getCoProfessor()->getCoProfessor();
            $comboTurmas = $materiaTurmaService->getTurmasProfessorCombo($res[CO_PROFESSOR]);
        }

        $this->form = LivroForm::CadastroAnotacao($res, $comboTurmas);

        if (PerfilService::perfilAluno()) {
            /** @var UsuarioEntidade $usuario */
            $usuario = UsuarioService::getPessoaCoUsuario(UsuarioService::getCoUsuarioLogado());
            /** @var AlunoEntidade $aluno */
            $aluno = $alunoService->PesquisaUmRegistro($usuario->getCoAluno()->getCoAluno());

            /** @var AnotacaoProfessorService $anotacaoProfessorService */
            $anotacaoProfessorService = $this->getService(ANOTACAO_PROFESSOR_SERVICE);
            /** @var AnotacaoProfessorEntidade $anotacaoProfessor */
            $anotacaoProfessor = $anotacaoProfessorService->PesquisaTodos(
                [CO_MATERIA_TURMA => $aluno->getCoTurma()->getCoMateriaTurma()->getCoMateriaTurma()]
            );

            $anotaProf = [];
            /** @var AnotacaoProfessorEntidade $anotProfessor */
            foreach ($anotacaoProfessor as $anotProfessor) {
                $anotaProf[$anotProfessor->getCoPaginaLivro()->getCoPaginaLivro()] =
                    $anotProfessor->getDsAnotacao();
            }
            $this->anotaProf = $anotaProf;
        }
    }

    public static function verificaLivro()
    {
        $coLivro = UrlAmigavel::PegaParametro(CO_LIVRO);
        if (!$coLivro) {
            $coLivro = (!empty($_POST[CO_LIVRO])) ? $_POST[CO_LIVRO][0] : null;
        }
        return $coLivro;
    }

    public static function verificaCapitulo()
    {
        $coCapitulo = UrlAmigavel::PegaParametro(CO_CAPITULO);
        if (!$coCapitulo) {
            $coCapitulo = (!empty($_POST[CO_CAPITULO])) ? $_POST[CO_CAPITULO][0] : null;
        }
        return $coCapitulo;
    }

    public static function verificaPagina()
    {
        $coPagina = UrlAmigavel::PegaParametro(CO_PAGINA_LIVRO);
        if (!$coPagina) {
            $coPagina = (!empty($_POST[CO_PAGINA_LIVRO])) ? $_POST[CO_PAGINA_LIVRO][0] : null;
        }
        return $coPagina;
    }

    public function CadastroAnotacao($dados = null)
    {
        /** @var AnotacaoAlunoService $anotacaoAlunoService */
        $anotacaoAlunoService = $this->getService(ANOTACAO_ALUNO_SERVICE);
        /** @var AnotacaoProfessorService $anotacaoProfessorService */
        $anotacaoProfessorService = $this->getService(ANOTACAO_PROFESSOR_SERVICE);
        if ($dados):
            $dados = Valida::montaArrayAjax($dados);
            if ($dados[CO_ALUNO]) {
                return $anotacaoAlunoService->salvaAnotacaoAlunoAjax($dados);
            } else if ($dados[CO_MATERIA_TURMA]) {
                return $anotacaoProfessorService->salvaAnotacaoProfessorAjax($dados);
            }
        endif;

        return null;
    }

    public function PesquisaAnotacao($dados = null)
    {
        /** @var AnotacaoAlunoService $anotacaoAlunoService */
        $anotacaoAlunoService = $this->getService(ANOTACAO_ALUNO_SERVICE);
        /** @var AnotacaoProfessorService $anotacaoProfessorService */
        $anotacaoProfessorService = $this->getService(ANOTACAO_PROFESSOR_SERVICE);
        $retorno[SUCESSO] = false;

        if ($dados):
            if (!empty($dados[CO_ALUNO])) {
                $Condicoes = [
                    CO_ALUNO => $dados[CO_ALUNO],
                    CO_PAGINA_LIVRO => $dados[CO_PAGINA_LIVRO]
                ];
                /** @var AnotacaoAlunoEntidade $anoAluno */
                $anoAluno = $anotacaoAlunoService->PesquisaUmQuando($Condicoes);
                $retorno[CO_ANOTACAO_ALUNO] = $anoAluno->getCoAnotacaoAluno();
                $retorno[CO_ANOTACAO_PROFESSOR] = null;
                $retorno[DS_ANOTACAO] = $anoAluno->getDsAnotacao();
                $retorno[SUCESSO] = true;

                return $retorno;
            } else if (!empty($dados[CO_MATERIA_TURMA])) {
                $Condicoes = [
                    CO_MATERIA_TURMA => $dados[CO_MATERIA_TURMA],
                    CO_PAGINA_LIVRO => $dados[CO_PAGINA_LIVRO]
                ];
                /** @var AnotacaoProfessorEntidade $anoProf */
                $anoProf = $anotacaoProfessorService->PesquisaUmQuando($Condicoes);
                if ($anoProf) {
                    $retorno[CO_ANOTACAO_ALUNO] = null;
                    $retorno[CO_ANOTACAO_PROFESSOR] = $anoProf->getCoAnotacaoProfessor();
                    $retorno[CO_MATERIA_TURMA] = $anoProf->getCoMateriaTurma()->getCoMateriaTurma();
                    $retorno[DS_ANOTACAO] = $anoProf->getDsAnotacao();
                    $retorno[SUCESSO] = true;
                    return $retorno;
                }
            }
        endif;

        return $retorno;
    }

    public function ListarModalPagina()
    {
        /** @var ModalService $ModalEntidade */
        $ModalEntidade = $this->getService(MODAL_SERVICE);
        $this->pagina = static::verificaPagina();
        $Condicoes = [
            CO_PAGINA_LIVRO => $this->pagina
        ];
        $this->result = $ModalEntidade->PesquisaTodos($Condicoes);
    }


    public function CadastroModalPagina()
    {
        /** @var ModalService $ModalEntidade */
        $ModalEntidade = $this->getService(MODAL_SERVICE);

        if (!empty($_POST)):
            $retorno = $ModalEntidade->salvaModalPagina($_POST);
            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller
                    . '/ListarModalPagina/' . Valida::GeraParametro( CO_PAGINA_LIVRO . "/" . $_POST[CO_PAGINA_LIVRO]));
            }
        endif;

        $coPaginaLivro = UrlAmigavel::PegaParametro(CO_PAGINA_LIVRO);
        $coModalPagina = UrlAmigavel::PegaParametro(CO_MODAL);
        $res = array();
        $res[CO_PAGINA_LIVRO] = $coPaginaLivro;
        $res[ST_STATUS] = 'checked';
        $res[CO_MODAL] = $coModalPagina;
        $this->livro = static::verificaLivro();
        $this->capitulo = static::verificaCapitulo();

        if ($coModalPagina) {
            /** @var ModalEntidade $modalPagina */
            $modalPagina = $ModalEntidade->PesquisaUmRegistro($coModalPagina);
            $res[DS_CODE] = $modalPagina->getDsCode();
            $res[DS_TITULO] = $modalPagina->getDsTitulo();
            $res[DS_IDENTIFICADOR] = $modalPagina->getDsIdentificador();
            $res[ST_STATUS] = ($modalPagina->getStStatus() == 'S')
                ? 'checked' : '';
        }


        $this->form = LivroForm::CadastroModalPagina($res);
    }

}