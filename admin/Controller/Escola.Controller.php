<?php

class Escola extends AbstractController
{
    public $result;
    public $escola;
    public $gestor;
    public $turma;
    public $form;
    public $mensagem;

    public function ListarEscola()
    {
        /** @var EscolaService $escolaService */
        $escolaService = $this->getService(ESCOLA_SERVICE);

        /** @var Session $session */
        $session = new Session();
        if ($session->CheckSession(PESQUISA_AVANCADA)) {
            $session->FinalizaSession(PESQUISA_AVANCADA);
        }
        $Condicoes = [];
        if (PerfilService::perfilCoordenador()) {
            $Condicoes = [
                CO_USUARIO => UsuarioService::getCoUsuarioLogado()
            ];
            $this->gestor = false;
        } else {
            $this->gestor = true;
        }

        $resultEscola = $escolaService->PesquisaTodos($Condicoes);
        $session->setSession('resultEscola', $resultEscola);

        if (PerfilService::perfilCoordenador()) {
            $this->result = $escolaService->PesquisaTodos($Condicoes);
            $this->gestor = false;
        } else {
            if (!empty($_POST)) {
                $Condicoes[NU_CNPJ] = Valida::RetiraMascara($_POST[NU_CNPJ]);
                $Condicoes[NO_FANTASIA] = trim($_POST[NO_FANTASIA]);
                $Condicoes[CO_USUARIO] = $_POST[CO_USUARIO][0];
            }
            $this->result = $escolaService->PesquisaTodos($Condicoes);
            $session->setSession(PESQUISA_AVANCADA, $Condicoes);
            $this->gestor = true;
        }

        /** @var UsuarioService $usuarioService */
        $usuarioService = $this->getService(USUARIO_SERVICE);
        /** @var EscolaEntidade $escola */
        foreach ($this->result as $escola) {
            $escola->setCoUsuario(
                $usuarioService->PesquisaUmRegistro($escola->getCoUsuario()->getCoUsuario())
            );
        }
    }

    public function CadastroEscola()
    {
        /** @var EscolaService $escolaService */
        $escolaService = $this->getService(ESCOLA_SERVICE);
        /** @var ContatoService $contatoService */
        $contatoService = $this->getService(CONTATO_SERVICE);
        /** @var EnderecoService $enderecoService */
        $enderecoService = $this->getService(ENDERECO_SERVICE);

        if (!empty($_POST[NO_FANTASIA])):
            $retorno = $escolaService->salvaEscola($_POST);
            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/ListarEscola/');
            }
        endif;

        $coEscola = UrlAmigavel::PegaParametro(CO_ESCOLA);

        if (PerfilService::perfilCoordenador() && !$coEscola) {
            Notificacoes::geraMensagem(
                'Url Inválida Facor verificar!',
                TiposMensagemEnum::ALERTA
            );
            Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/ListarEscola/');
        }
        $res = [];
        $res[CO_ESCOLA] = null;
        $res[CO_CONTATO] = null;
        $res[CO_ENDERECO] = null;
        if ($coEscola) {
            /** @var EscolaEntidade $escola */
            $escola = $escolaService->PesquisaUmRegistro($coEscola);

            $res[CO_ESCOLA] = $coEscola;
            $res[NO_FANTASIA] = $escola->getNoFantasia();
            $res[NO_RAZAO_SOCIAL] = $escola->getNoRazaoSocial();
            $res[NU_CNPJ] = $escola->getNuCnpj();
            $res[NU_INSC_ESTADUAL] = $escola->getNuInscEstadual();
            $res[DS_OBSERVACAO] = $escola->getDsObservacao();
            $res[CO_USUARIO] = $escola->getCoUsuario()->getCoUsuario();

            // Aba 2
            $res = $enderecoService->getArrayDadosEndereco($escola->getCoEndereco(), $res);

            // Aba 3
            /** ContatoEntidade $contato */
            $contato = $escola->getCoContato();
            if ($contato) {
                $res = $contatoService->getArrayDadosContato($contato, $res);
            }
        }

        /** @var UsuarioService $usuarioService */
        $usuarioService = $this->getService(USUARIO_SERVICE);
        $coordenadores = $usuarioService->getUsuariosCoordenadoresCombo();

        $this->form = EscolaForm::Cadastrar($res, $coordenadores);
    }

    public function ListarTurma()
    {
        /** @var TurmaService $TurmaService */
        $TurmaService = $this->getService(TURMA_SERVICE);

        $this->escola = static::verificaEscola();

        /** @var Session $session */
        $session = new Session();
        if ($session->CheckSession(PESQUISA_AVANCADA)) {
            $session->FinalizaSession(PESQUISA_AVANCADA);
        }
        $Condicoes = [
            CO_ESCOLA => $this->escola
        ];
        if (!empty($_POST)) {
            $Condicoes[NU_ANO] = trim($_POST[NU_ANO]);
            $Condicoes[DS_TURMA] = trim($_POST[DS_TURMA]);
            $Condicoes[ST_STATUS] = (!empty($_POST[ST_STATUS])) ? SimNaoEnum::SIM : SimNaoEnum::NAO;
            if (!PerfilService::perfilCoordenador()) {
                $Condicoes[CO_ESCOLA] = $_POST[CO_ESCOLA][0];
            }
        }

        $this->result = $TurmaService->PesquisaTodos($Condicoes);

    }

    public function CadastroTurma()
    {
        /** @var TurmaService $TurmaService */
        $TurmaService = $this->getService(TURMA_SERVICE);

        $id = "CadastrarTurma";

        if (!empty($_POST[$id])):
            $retorno = $TurmaService->salvaTurma($_POST);

            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller
                    . '/ListarTurma/' . Valida::GeraParametro(CO_ESCOLA . "/" . $_POST[CO_ESCOLA]));
            }
        endif;

        $coTurma = UrlAmigavel::PegaParametro(CO_TURMA);
        $res = array();
        $res[CO_ESCOLA] = static::verificaEscola();
        $res[CO_TURMA] = $coTurma;
        $res[ST_STATUS] = 'checked';

        if ($coTurma) {
            /** @var TurmaEntidade $turma */
            $turma = $TurmaService->PesquisaUmRegistro($coTurma);
            $res[NU_ANO] = $turma->getNuAno();
            $res[DS_TURMA] = $turma->getDsTurma();
            $res[ST_STATUS] = ($turma->getStStatus() == 'S')
                ? 'checked' : '';
        }

        $this->form = EscolaForm::CadastrarTurma($res);
    }

    public function ListarAluno()
    {
        /** @var AlunoService $alunoService */
        $alunoService = $this->getService(ALUNO_SERVICE);

        $this->escola = static::verificaEscola();
        $this->turma = static::verificaTurma();

        /** @var Session $session */
        $session = new Session();
        if ($session->CheckSession(PESQUISA_AVANCADA)) {
            $session->FinalizaSession(PESQUISA_AVANCADA);
        }
        $Condicoes = [
            "tur." . CO_TURMA => $this->turma,
            "esc." . CO_ESCOLA => $this->escola
        ];
        if (!empty($_POST)) {
            $Condicoes["pes." . NO_PESSOA] = trim($_POST[NO_PESSOA]);
            $Condicoes["pes." . NU_CPF] = Valida::RetiraMascara($_POST[NU_CPF]);
            $Condicoes["alu." . ST_STATUS] = (!empty($_POST[ST_STATUS])) ? SimNaoEnum::SIM : SimNaoEnum::NAO;
            if (!PerfilService::perfilCoordenador()) {
                $Condicoes["tur." . CO_TURMA] = $_POST[CO_TURMA][0];
                $Condicoes["esc." . CO_ESCOLA] = $_POST[CO_ESCOLA][0];
            }
        }

        $this->result = $alunoService->PesquisaAvancada($Condicoes);
    }

    public function CadastroAluno()
    {
        /** @var AlunoService $alunoService */
        $alunoService = $this->getService(ALUNO_SERVICE);
        /** @var ContatoService $contatoService */
        $contatoService = $this->getService(CONTATO_SERVICE);
        /** @var EnderecoService $enderecoService */
        $enderecoService = $this->getService(ENDERECO_SERVICE);
        /** @var PessoaService $PessoaService */
        $PessoaService = $this->getService(PESSOA_SERVICE);

        if (!empty($_POST)):
            $retorno = $alunoService->salvaAluno($_POST);

            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller
                    . '/ListarAluno/' . Valida::GeraParametro(
                        CO_ESCOLA . "/" . $_POST[CO_ESCOLA] . "/" . CO_TURMA . "/" . $_POST[CO_TURMA]));
            }
        endif;

        $coAluno = UrlAmigavel::PegaParametro(CO_ALUNO);
        $res = array();
        $res[CO_ESCOLA] = static::verificaEscola();
        $res[CO_TURMA] = static::verificaTurma();
        $this->escola = static::verificaEscola();
        $this->turma = static::verificaTurma();
        $res[CO_ALUNO] = $coAluno;
        $res[CO_CONTATO] = false;
        $res[CO_PESSOA] = false;
        $res[CO_ENDERECO] = false;
        $res[ST_STATUS] = 'checked';

        if ($coAluno) {
            /** @var AlunoEntidade $aluno */
            $aluno = $alunoService->PesquisaUmRegistro($coAluno);

            $res[CO_ALUNO] = $coAluno;
            $res = $PessoaService->getArrayDadosPessoa($aluno->getCoPessoa(), $res);

            // Aba 2
            $res = $enderecoService->getArrayDadosEndereco($aluno->getCoPessoa()->getCoEndereco(), $res);

            // Aba 3
            /** ContatoEntidade $contato */
            $contato = $aluno->getCoPessoa()->getCoContato();
            if ($contato) {
                $res = $contatoService->getArrayDadosContato($contato, $res);
            }
        }

        $this->form = EscolaForm::CadastroAluno($res);
    }

    public static function verificaEscola()
    {
        $coEscola = UrlAmigavel::PegaParametro(CO_ESCOLA);
        if (!$coEscola) {
            $coEscola = (!empty($_POST[CO_ESCOLA])) ? $_POST[CO_ESCOLA][0] : null;
        }
        if (!$coEscola && PerfilService::perfilCoordenador()) {
            Notificacoes::geraMensagem(
                'Não foi possível localizar a turma!',
                TiposMensagemEnum::ALERTA
            );
            Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/ListarEscola/');
        }
        return $coEscola;
    }

    public static function verificaProfessor()
    {
        $coProfessor = UrlAmigavel::PegaParametro(CO_PROFESSOR);
        if (!$coProfessor) {
            $coProfessor = (!empty($_POST[CO_PROFESSOR])) ? $_POST[CO_PROFESSOR][0] : null;
        }
        if (!$coProfessor && PerfilService::perfilCoordenador()) {
            Notificacoes::geraMensagem(
                'Não foi possível localizar o Professor!',
                TiposMensagemEnum::ALERTA
            );
            Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/ListarProfessor/');
        }
        return $coProfessor;
    }

    public static function verificaTurma()
    {
        $coTurma = UrlAmigavel::PegaParametro(CO_TURMA);
        if (!$coTurma) {
            $coTurma = (!empty($_POST[CO_TURMA])) ? $_POST[CO_TURMA][0] : null;
        }
        if (!$coTurma && PerfilService::perfilCoordenador()) {
            Notificacoes::geraMensagem(
                'Não foi possível localizar o Aluno!',
                TiposMensagemEnum::ALERTA
            );
            Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller . '/ListarEscola/');
        }
        return $coTurma;
    }

    public function ListarEscolaPesquisaAvancada()
    {
        /** @var Session $session */
        $session = new Session();
        $resultEscola = $session::getSession('resultEscola');
        /** @var UsuarioService $usuarioService */
        $usuarioService = $this->getService(USUARIO_SERVICE);
        $coordenadores = $usuarioService->getUsuariosCoordenadoresCombo();

        echo EscolaForm::Pesquisar($resultEscola, $coordenadores);
    }

    public function ListarTurmaPesquisaAvancada()
    {
        /** @var EscolaService $escolaService */
        $escolaService = $this->getService(ESCOLA_SERVICE);

        $comboEscolas = [
            '' => Mensagens::MSG_SEM_ITEM_SELECIONADO
        ];
        $escolas = $escolaService->PesquisaTodos();
        /** @var EscolaEntidade $escola */
        foreach ($escolas as $escola) {
            $comboEscolas[$escola->getCoEscola()]
                = Valida::Resumi(strtoupper($escola->getNoFantasia()), 30);
        }
        $res[CO_ESCOLA] = static::verificaEscola();

        echo EscolaForm::PesquisarTurma($res, $comboEscolas);
    }

    public function ListarAlunoPesquisaAvancada()
    {
        /** @var Session $session */
        $session = new Session();
        /** @var EscolaService $escolaService */
        $escolaService = $this->getService(ESCOLA_SERVICE);
        /** @var TurmaService $TurmaService */
        $TurmaService = $this->getService(TURMA_SERVICE);

        $comboEscolas = $escolaService->getEscolasCombo();
        $comboTurmas = $TurmaService->getTurmasCombo();
        $res[CO_ESCOLA] = static::verificaEscola();
        $res[CO_TURMA] = static::verificaTurma();

        echo EscolaForm::PesquisarAluno($res, $comboEscolas, $comboTurmas);
    }


    public function ListarProfessor()
    {
        /** @var ProfessorService $ProfessorService */
        $ProfessorService = $this->getService(PROFESSOR_SERVICE);

        /** @var Session $session */
        $session = new Session();
        if ($session->CheckSession(PESQUISA_AVANCADA)) {
            $session->FinalizaSession(PESQUISA_AVANCADA);
        }
        $this->escola = static::verificaEscola();

        $Condicoes = [
            CO_ESCOLA => $this->escola
        ];

        $resultProfessor = $ProfessorService->PesquisaTodos($Condicoes);
        $session->setSession('resultEscola', $resultProfessor);

        $this->result = $ProfessorService->PesquisaTodos($Condicoes);


    }

    public function CadastroProfessor()
    {
        /** @var ProfessorService $professorService */
        $professorService = $this->getService(PROFESSOR_SERVICE);
        /** @var ContatoService $contatoService */
        $contatoService = $this->getService(CONTATO_SERVICE);
        /** @var EnderecoService $enderecoService */
        $enderecoService = $this->getService(ENDERECO_SERVICE);
        /** @var PessoaService $PessoaService */
        $PessoaService = $this->getService(PESSOA_SERVICE);
        /** @var TurmaService $TurmaService */
        $TurmaService = $this->getService(TURMA_SERVICE);

        if (!empty($_POST)):
            $retorno = $professorService->salvaProfessor($_POST);

            if ($retorno[SUCESSO]) {
                Redireciona(UrlAmigavel::$modulo . '/' . UrlAmigavel::$controller
                    . '/ListarProfessor/' . Valida::GeraParametro(
                        CO_ESCOLA . "/" . $_POST[CO_ESCOLA][0]));
            }
        endif;

        $res = array();
        $res[CO_ESCOLA] = static::verificaEscola();
        $res[CO_PROFESSOR] = static::verificaProfessor();
        $coProfessor = $res[CO_PROFESSOR];
        $this->escola = static::verificaEscola();
        $res[CO_CONTATO] = false;
        $res[CO_PESSOA] = false;
        $res[CO_ENDERECO] = false;
        $res[ST_STATUS] = 'checked';

        if ($coProfessor) {
            /** @var ProfessorEntidade $professor */
            $professor = $professorService->PesquisaUmRegistro($coProfessor);

            /** @var MateriaTurmaEntidade $materiaTurma */
            foreach ($professor->getCoMateriaTurma() as $materiaTurma) {
                $res[CO_TURMA][] = $materiaTurma->getCoTurma()->getCoTurma();
            }

            $res[CO_PROFESSOR] = $coProfessor;
            $res[CO_MATERIA] = $professor->getCoUltimaMateriaTurma()->getCoMateria()->getCoMateria();
            $res = $PessoaService->getArrayDadosPessoa($professor->getCoPessoa(), $res);

            // Aba 2
            $res = $enderecoService->getArrayDadosEndereco($professor->getCoPessoa()->getCoEndereco(), $res);

            // Aba 3
            /** ContatoEntidade $contato */
            $contato = $professor->getCoPessoa()->getCoContato();
            if ($contato) {
                $res = $contatoService->getArrayDadosContato($contato, $res);
            }
        }

        /** @var EscolaService $escolaService */
        $escolaService = $this->getService(ESCOLA_SERVICE);

        $comboEscolas = [
            '' => Mensagens::MSG_SEM_ITEM_SELECIONADO
        ];
        $escolas = $escolaService->PesquisaTodos();
        /** @var EscolaEntidade $escola */
        foreach ($escolas as $escola) {
            $comboEscolas[$escola->getCoEscola()]
                = Valida::Resumi(strtoupper($escola->getNoFantasia()), 30);
        }

        $comboTurmas = $TurmaService->getTurmasCombo($res[CO_ESCOLA]);


        /** @var MateriaService $materiaService */
        $materiaService = $this->getService(MATERIA_SERVICE);

        $comboMaterias = $materiaService->getMateriasCombo($res[CO_ESCOLA]);

        $this->form = EscolaForm::CadastroProfessor($res, $comboEscolas, $comboTurmas, $comboMaterias);
    }

}