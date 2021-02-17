<?php

function servidor_inicial()
{
    if ($_SERVER['HTTP_HOST'] == 'localhost') {
        $config = array(
            'HOME' => 'http://localhost/ccaug/',
            'HOST' => 'localhost',
            'USER' => 'root',
            'PASS' => '',
            'DBSA' => 'ccaug100',
            'SCHEMA' => 'ccaug100',
            'BANCO' => 1, // 1 = mysql, 2 = postgres
            'DEBUG' => true,
            'PROD' => false,
            'TOKEN_PAGSEGURO' => "5FDD35645CC1412296CE57A3542E48D0",
            'URL_PAGSEGURO' =>
                "https://ws.sandbox.pagseguro.uol.com.br/v2/",
            'JS_PAGSEGURO' =>
                "sandbox.pagseguro.js",
        );
    } else {
        $ambTeste = strstr($_SERVER['SERVER_NAME'], 'dgt.editoraenovus.com.br');
        if ($ambTeste != null) {
            $config = array(
                'HOME' => 'https://dgt.editoraenovus.com.br/livros/',
                'HOST' => '13.72.85.136',
                'USER' => 'postgres',
                'PASS' => '@EnV@2021#digital',
                'DBSA' => 'db_fisica',
                'SCHEMA' => 'sis_enovus',
                'BANCO' => 2, // 1 = mysql, 2 = postgres
                'DEBUG' => false,
                'PROD' => false,
                'TOKEN_PAGSEGURO' => "5FDD35645CC1412296CE57A3542E48D0",
                'URL_PAGSEGURO' =>
                    "https://ws.sandbox.pagseguro.uol.com.br/v2/",
                'JS_PAGSEGURO' =>
                    "sandbox.pagseguro.js",
            );
        } else {
            $config = array(
                'HOME' => 'https://ccaug.com.br/',
                'HOST' => '162.241.2.220',
                'USER' => 'ccaugc68_prd',
                'PASS' => 'unVD8y9f38',
                'DBSA' => 'ccaugc68_prd',
                'SCHEMA' => 'ccaugc68_prd',
                'BANCO' => 1, // 1 = mysql, 2 = postgres
                'DEBUG' => false,
                'PROD' => true,
                'TOKEN_PAGSEGURO' => "7fcf0adc-60fe-4fd2-acc1-ff240d6555b0a3d6c5e54ff39c5eb481991c8f7c58c9c48d-5643-4d23-b8ca-4b470e639b73",
                'URL_PAGSEGURO' =>
                    "https://ws.pagseguro.uol.com.br/v2/",
                'JS_PAGSEGURO' =>
                    "pagseguro.js",
            );
        }
    }

    define('HOME', $config['HOME']);
    define('HOST', $config['HOST']);
    define('USER', $config['USER']);
    define('PASS', $config['PASS']);
    define('DBSA', $config['DBSA']);
    define('SCHEMA', $config['SCHEMA']);
    define('BANCO', $config['BANCO']);
    define('DEBUG', $config['DEBUG']);
    define('PROD', $config['PROD']);
    define('CO_USUARIO_PADRAO', 1);
    define('NO_USUARIO_PADRAO', 'Usuário Enovus');
    define("TOKEN_PAGSEGURO", $config['TOKEN_PAGSEGURO']);
    define("URL_PAGSEGURO", $config['URL_PAGSEGURO']);
    define("JS_PAGSEGURO", HOME . 'library/js/' . $config['JS_PAGSEGURO']);
    define("EMAIL_PAGSEGURO", "leodjx@hotmail.com");
    define("EMAIL_LOJA", "leodjx@hotmail.com");
    define("MOEDA_PAGAMENTO", "BRL");
    define("URL_NOTIFICACAO", HOME . "library/NotificacaoPagSeguro.php");
    define("API_WHATS_SERVER", false);
    define("API_WHATS_URL", "https://api.chat-api.com/instance117133/");
    define("API_WHATS_TOKEN", "wtnx36qqeqbxn21i");
    define("PERFIL_USUARIO_PADRAO", 3);
}
