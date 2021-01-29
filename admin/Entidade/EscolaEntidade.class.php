<?php

/**
 * Escola.Entidade [ ENTIDADE ]
 * @copyright (c) 2020, Leo Bessa
 */

class EscolaEntidade extends AbstractEntidade
{
    const TABELA = SCHEMA . '.TB_ESCOLA';
    const ENTIDADE = 'EscolaEntidade';
    const CHAVE = CO_ESCOLA;

    private $co_escola;
    private $nu_cnpj;
    private $no_fantasia;
    private $no_razao_social;
    private $dt_cadastro;
    private $ds_observacao;
    private $nu_insc_estadual;
    private $co_endereco;
    private $co_contato;
    private $co_usuario;
    private $co_turma;
    private $co_professor;
    private $co_materia;


    /**
     * @return array
     */
    public static function getCampos()
    {
        return [
            CO_ESCOLA,
            NU_CNPJ,
            NO_FANTASIA,
            NO_RAZAO_SOCIAL,
            DT_CADASTRO,
            DS_OBSERVACAO,
            NU_INSC_ESTADUAL,
            CO_ENDERECO,
            CO_CONTATO,
            CO_USUARIO,
        ];
    }

    /**
     * @return array $relacionamentos
     */
    public static function getRelacionamentos()
    {
        $relacionamentos = Relacionamentos::getRelacionamentos();
        return $relacionamentos[static::TABELA];
    }


    /**
     * @return int $co_escola
     */
    public function getCoEscola()
    {
        return $this->co_escola;
    }

    /**
     * @param $co_escola
     * @return mixed
     */
    public function setCoEscola($co_escola)
    {
        return $this->co_escola = $co_escola;
    }

    /**
     * @return mixed $nu_cnpj
     */
    public function getNuCnpj()
    {
        return $this->nu_cnpj;
    }

    /**
     * @param $nu_cnpj
     * @return mixed
     */
    public function setNuCnpj($nu_cnpj)
    {
        return $this->nu_cnpj = $nu_cnpj;
    }

    /**
     * @return mixed $no_fantasia
     */
    public function getNoFantasia()
    {
        return $this->no_fantasia;
    }

    /**
     * @param $no_fantasia
     * @return mixed
     */
    public function setNoFantasia($no_fantasia)
    {
        return $this->no_fantasia = $no_fantasia;
    }

    /**
     * @return mixed $no_razao_social
     */
    public function getNoRazaoSocial()
    {
        return $this->no_razao_social;
    }

    /**
     * @param $no_razao_social
     * @return mixed
     */
    public function setNoRazaoSocial($no_razao_social)
    {
        return $this->no_razao_social = $no_razao_social;
    }

    /**
     * @return mixed $dt_cadastro
     */
    public function getDtCadastro()
    {
        return $this->dt_cadastro;
    }

    /**
     * @param $dt_cadastro
     * @return mixed
     */
    public function setDtCadastro($dt_cadastro)
    {
        return $this->dt_cadastro = $dt_cadastro;
    }

    /**
     * @return mixed
     */
    public function getDsObservacao()
    {
        return $this->ds_observacao;
    }

    /**
     * @param mixed $ds_observacao
     */
    public function setDsObservacao($ds_observacao)
    {
        $this->ds_observacao = $ds_observacao;
    }

    /**
     * @return mixed
     */
    public function getNuInscEstadual()
    {
        return $this->nu_insc_estadual;
    }

    /**
     * @param mixed $nu_insc_estadual
     */
    public function setNuInscEstadual($nu_insc_estadual)
    {
        $this->nu_insc_estadual = $nu_insc_estadual;
    }

    /**
     * @return EnderecoEntidade $co_endereco
     */
    public function getCoEndereco()
    {
        return $this->co_endereco;
    }

    /**
     * @param $co_endereco
     * @return mixed
     */
    public function setCoEndereco($co_endereco)
    {
        return $this->co_endereco = $co_endereco;
    }

    /**
     * @return ContatoEntidade $co_contato
     */
    public function getCoContato()
    {
        return $this->co_contato;
    }

    /**
     * @param $co_contato
     * @return mixed
     */
    public function setCoContato($co_contato)
    {
        return $this->co_contato = $co_contato;
    }

    /**
     * @return UsuarioEntidade $co_usuario
     */
    public function getCoUsuario()
    {
        return $this->co_usuario;
    }

    /**
     * @param $co_usuario
     * @return mixed
     */
    public function setCoUsuario($co_usuario)
    {
        return $this->co_usuario = $co_usuario;
    }

    /**
     * @return TurmaEntidade $co_turma
     */
    public function getCoTurma()
    {
        return $this->co_turma;
    }

    /**
     * @param $co_turma
     * @return mixed
     */
    public function setCoTurma($co_turma)
    {
        return $this->co_turma = $co_turma;
    }

    /**
     * @return ProfessorEntidade $co_professor
     */
    public function getCoProfessor()
    {
        return $this->co_professor;
    }

    /**
     * @param mixed $co_professor
     */
    public function setCoProfessor($co_professor)
    {
        $this->co_professor = $co_professor;
    }

    /**
     * @return MateriaEntidade $co_materia
     */
    public function getCoMateria()
    {
        return $this->co_materia;
    }

    /**
     * @param mixed $co_materia
     */
    public function setCoMateria($co_materia)
    {
        $this->co_materia = $co_materia;
    }

}