<?php

/**
 * SuporteModel.class [ MODEL ]
 * @copyright (c) 2020, Leo Bessa
 */
class  SuporteModel extends AbstractModel
{

    public function __construct()
    {
        parent::__construct(SuporteEntidade::ENTIDADE);
    }

    public function PesquisaSuportes($Condicoes)
    {
        $Condicoes['ths.co_historico_suporte'] =
            'select max(ths2.co_historico_suporte) from ' . HistoricoSuporteEntidade::TABELA . ' ths2
    where ths2.co_suporte = ts.co_suporte';
        $tabela = SuporteEntidade::TABELA . ' ts inner join ' . HistoricoSuporteEntidade::TABELA . ' ths on ts.co_suporte = ths.co_suporte';

        $campos = "*";

        $pesquisa = new Pesquisa();
        $where = $pesquisa->getClausula($Condicoes);
        $pesquisa->Pesquisar($tabela, $where . ' order by ths.dt_cadastro desc', null, $campos);
        $suportes = [];
        foreach ($pesquisa->getResult() as $suporte) {
            $sup[0] = $suporte;
            $suportes[] = $this->getUmObjeto(SuporteEntidade::ENTIDADE, $sup);
        }
        return $suportes;
    }


}