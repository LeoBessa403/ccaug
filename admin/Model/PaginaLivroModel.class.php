<?php

/**
 * PaginaLivroModel.class [ MODEL ]
 * @copyright (c) 2020, Leo Bessa
 */
class  PaginaLivroModel extends AbstractModel
{

    public function __construct()
    {
        parent::__construct(PaginaLivroEntidade::ENTIDADE);
    }

    public function PesquisaPaginasCapitulos($coCapitulo)
    {
        $pesquisa = new Pesquisa();
        $pesquisa->Pesquisar(PaginaLivroEntidade::TABELA, " where " . CapituloEntidade::CHAVE .
            " = :id and st_status = 'S' order by " .
           PaginaLivroEntidade::CHAVE . " asc", "id={$coCapitulo}");

        $paginas = [];
        /** @var PaginaLivroEntidade $pagina */
        foreach ($pesquisa->getResult() as $pagina) {
            $pag[0] = $pagina;
            $paginas[] = $this->getUmObjeto(PaginaLivroEntidade::ENTIDADE, $pag);
        }
        return $paginas;
    }

}