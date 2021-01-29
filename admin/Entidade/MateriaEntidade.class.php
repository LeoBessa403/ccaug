<?php

/**
 * Materia.Entidade [ ENTIDADE ]
 * @copyright (c) 2020, Leo Bessa
 */

class MateriaEntidade extends AbstractEntidade
{
	const TABELA = SCHEMA . '.TB_MATERIA';
	const ENTIDADE = 'MateriaEntidade';
	const CHAVE = CO_MATERIA;

	private $co_materia;
	private $ds_materia;
	private $dt_cadastro;
	private $co_livro;
	private $co_materia_turma;


	/**
    * @return array
    */
	public static function getCampos() 
    {
    	return [
			CO_MATERIA,
			DS_MATERIA,
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
	* @return int $co_materia
    */
	public function getCoMateria()
    {
        return $this->co_materia;
    }

	/**
	* @param $co_materia
    * @return mixed
    */
	public function setCoMateria($co_materia)
    {
        return $this->co_materia = $co_materia;
    }

	/**
	* @return mixed $ds_materia
    */
	public function getDsMateria()
    {
        return $this->ds_materia;
    }

	/**
	* @param $ds_materia
    * @return mixed
    */
	public function setDsMateria($ds_materia)
    {
        return $this->ds_materia = $ds_materia;
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
	* @return LivroEntidade $co_livro
     */
	public function getCoLivro()
    {
        return $this->co_livro;
    }

	/**
     * @param $co_livro
     * @return mixed
     */
	public function setCoLivro($co_livro)
    {
        return $this->co_livro = $co_livro;
    }

	/**
	* @return MateriaTurmaEntidade $co_materia_turma
     */
	public function getCoMateriaTurma()
    {
        return $this->co_materia_turma;
    }

	/**
     * @param $co_materia_turma
     * @return mixed
     */
	public function setCoMateriaTurma($co_materia_turma)
    {
        return $this->co_materia_turma = $co_materia_turma;
    }

}