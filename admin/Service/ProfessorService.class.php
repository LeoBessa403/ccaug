<?php

/**
 * ProfessorService.class [ SEVICE ]
 * @copyright (c) 2020, Leo Bessa
 */
class  ProfessorService extends AbstractService
{

    private $ObjetoModel;


    public function __construct()
    {
        parent::__construct(ProfessorEntidade::ENTIDADE);
        $this->ObjetoModel = New ProfessorModel();
    }

    public function salvaProfessor($dados)
    {
        /** @var ContatoService $contatoService */
        $contatoService = $this->getService(CONTATO_SERVICE);
        /** @var PessoaService $pessoaService */
        $pessoaService = $this->getService(PESSOA_SERVICE);
        /** @var EnderecoService $enderecoService */
        $enderecoService = $this->getService(ENDERECO_SERVICE);
        /** @var UsuarioService $usuarioService */
        $usuarioService = $this->getService(USUARIO_SERVICE);
        /** @var UsuarioPerfilService $usuarioPerfilService */
        $usuarioPerfilService = $this->getService(USUARIO_PERFIL_SERVICE);
        /** @var MateriaTurmaService $materiaTurmaService */
        $materiaTurmaService = $this->getService(MATERIA_TURMA_SERVICE);
        /** @var PDO $PDO */
        $PDO = $this->getPDO();
        $session = new Session();
        $retorno = [
            SUCESSO => false,
            MSG => null
        ];

        $professorValidador = new ProfessorValidador();
        /** @var ProfessorValidador $validador */
        $validador = $professorValidador->validarCadastro($dados);
        if ($validador[SUCESSO]) {

            $endereco = $this->getDados($dados, EnderecoEntidade::ENTIDADE);
            $contato = $this->getDados($dados, ContatoEntidade::ENTIDADE);
            $pessoa = $this->getDados($dados, PessoaEntidade::ENTIDADE);
            $professor = $this->getDados($dados, ProfessorEntidade::ENTIDADE);
            $professor[ST_STATUS] = SimNaoEnum::SIM;
            $pessoa[DT_NASCIMENTO] = Valida::DataDBDate($pessoa[DT_NASCIMENTO]);

            $PDO->beginTransaction();
            if (!empty($dados[CO_PROFESSOR])):
                $contatoService->Salva($contato, $dados[CO_CONTATO]);
                $enderecoService->Salva($endereco, $dados[CO_ENDERECO]);
                $pessoaService->Salva($pessoa, $dados[CO_PESSOA]);
                $retorno[SUCESSO] = $this->Salva($professor, $dados[CO_PROFESSOR]);
                $session->setSession(MENSAGEM, ATUALIZADO);//
            else:
                $pessoa[CO_CONTATO] = $contatoService->Salva($contato);
                $pessoa[DT_CADASTRO] = Valida::DataHoraAtualBanco();
                $pessoa[CO_ENDERECO] = $enderecoService->Salva($endereco);

                $dadosEmail[NO_PESSOA] = $pessoa[NO_PESSOA];
                $dadosEmail[DS_EMAIL] = $contato[DS_EMAIL];
                $dadosEmail[NU_TEL1] = $contato[NU_TEL1];

                $coPessoa = $pessoaService->Salva($pessoa);
                $coUsuario = $usuarioService->salvaUsuarioInicial($coPessoa, $dadosEmail);
                $professor[CO_PESSOA] = $coPessoa;
                $professor[ST_STATUS] = StatusUsuarioEnum::ATIVO;

                $dados[CO_PROFESSOR] = $this->Salva($professor);

                $usuarioPerfil[CO_PERFIL] = PERFIL_USUARIO_PADRAO;
                $usuarioPerfil[CO_USUARIO] = $coUsuario;
                $usuarioPerfilService->Salva($usuarioPerfil);

                $usuarioPerfil[CO_PERFIL] = 4;
                $usuarioPerfil[CO_USUARIO] = $coUsuario;
                $retorno[SUCESSO] = $usuarioPerfilService->Salva($usuarioPerfil);

                $session->setSession(MENSAGEM, CADASTRADO);
            endif;

            $materiaTurmaService->DeletaQuando([
               CO_PROFESSOR =>  $dados[CO_PROFESSOR]
            ]);

            $materiaTurma[CO_MATERIA] = $dados[CO_MATERIA][0];
            $materiaTurma[CO_PROFESSOR] = $dados[CO_PROFESSOR];
            foreach ($dados[CO_TURMA] as $turma){
                $materiaTurma[CO_TURMA] = $turma;
                $materiaTurmaService->Salva($materiaTurma);
            }

            if ($retorno[SUCESSO]) {
                $retorno[SUCESSO] = true;
                $PDO->commit();
            } else {
                Notificacoes::geraMensagem(
                    'Não foi possível realizar a ação',
                    TiposMensagemEnum::ERRO
                );
                $retorno[SUCESSO] = false;
                $PDO->rollBack();
            }
        } else {
            Notificacoes::geraMensagem(
                $validador[MSG],
                TiposMensagemEnum::ALERTA
            );
            $retorno = $validador;
        }

        return $retorno;
    }

}