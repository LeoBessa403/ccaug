<?php

class IndexController extends AbstractController
{
    public function Index()
    {
        $dados = [];

        if (Session::CheckSession(SESSION_USER)) {
//            debug(10);
        }


    }

    public function CronExecute()
    {
//        $this->charset = 'utf8';
//        $conn = new ObjetoPDO();
//        $conn = $conn->inicializarConexao();
//        $sql = '';
//        $result = mysqli_query($conn, $sql);
//
//
//        $agendas = [];
//        while ($row = mysqli_fetch_row($result)) {
//            $agendas[] = $row[0];
//        }

    }
}