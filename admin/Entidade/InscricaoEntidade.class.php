<?php

/**
 * Inscricao.Entidade [ ENTIDADE ]
 * @copyright (c) 2021, Leo Bessa
 */

class InscricaoEntidade extends AbstractEntidade
{
	const TABELA = 'TB_INSCRICAO';
	const ENTIDADE = 'InscricaoEntidade';
	const CHAVE = CO_INSCRICAO;

	private $co_inscricao;
	private $co_turma;
	private $co_aluno;
	private $dt_cadastro;
	private $co_pagamento;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_INSCRICAO,
			CO_TURMA,
			CO_ALUNO,
			DT_CADASTRO,
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
	* @return int $co_inscricao
    */
	public function getCoInscricao()
    {
        return $this->co_inscricao;
    }

	/**
	* @param $co_inscricao
    * @return mixed
    */
	public function setCoInscricao($co_inscricao)
    {
        return $this->co_inscricao = $co_inscricao;
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
	* @return AlunoEntidade $co_aluno
    */
	public function getCoAluno()
    {
        return $this->co_aluno;
    }

	/**
	* @param $co_aluno
    * @return mixed
    */
	public function setCoAluno($co_aluno)
    {
        return $this->co_aluno = $co_aluno;
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
	* @return PagamentoEntidade $co_pagamento
     */
	public function getCoPagamento()
    {
        return $this->co_pagamento;
    }

	/**
     * @param $co_pagamento
     * @return mixed
     */
	public function setCoPagamento($co_pagamento)
    {
        return $this->co_pagamento = $co_pagamento;
    }

}