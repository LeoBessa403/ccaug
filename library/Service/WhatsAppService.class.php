<?php

/**
 * WhatsAppService.class [ SEVICE ]
 * @copyright (c) 2020, Leo Bessa
 */
class  WhatsAppService extends AbstractService
{

    private $urlApiWhats;
    private $tokenApiWhats;


    public function __construct()
    {
        $this->urlApiWhats = API_WHATS_URL;
        $this->tokenApiWhats = API_WHATS_TOKEN;
    }

    public function verificaStatus()
    {
        if(API_WHATS_SERVER){
            $url = $this->urlApiWhats . 'status?token=' . $this->tokenApiWhats;
            $result = file_get_contents($url); // Send a request
            $data = json_decode($result, 1); // Parse JSON
            if ($data["accountStatus"] == 'authenticated') {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }

    private function enviarMensagem($telDestinatario, $msg)
    {
        if ($this->verificaStatus()) {
            $msgZap = urldecode($msg);
            $telDestinatario = filter_var(Valida::RetiraMascara($telDestinatario), FILTER_SANITIZE_NUMBER_INT);
            $url = $this->urlApiWhats . 'sendMessage?token=' . $this->tokenApiWhats;
            $telSendMsg = (PROD) ? '55' . $telDestinatario : WHATSAPP_MSG;
            $data = [
                'phone' => $telSendMsg, // Receivers phone
                'body' => $msgZap, // Message
            ];
            $json = json_encode($data); // Encode data to JSON
            // Make a POST request
            $options = stream_context_create(['http' => [
                'method' => 'POST',
                'header' => 'Content-type: application/json',
                'content' => $json
            ]
            ]);
            // Send a request
            return file_get_contents($url, false, $options);
        } else {
            return false;
        }

    }

    public function enviaMsgUsuarioInicial($dadosEmail, $coUsuario)
    {
        $Mensagem = "  Olá " . strtoupper($dadosEmail[NO_PESSOA]) . ", Seu cadastro no *" . DESC .
            "* foi realizado com sucesso.
                 
   Sua senha é: _*" . $dadosEmail[DS_SENHA] . "*_";
        $Mensagem .= ". 
        _Ao acesso o Sistema pela primeira vez, deve trocar a senha._
              
   Acesse o Nosso _Sistema da Beleza_ agora mesmo e começe a usar-lo para uma melhor organização de sua agenda. Esperamos por você
   
   Acesso o link para a <a href='" . HOME . "admin/Index/AtivacaoUsuario/" .
            Valida::GeraParametro(CO_USUARIO . "/" . $coUsuario) . "'>ATIVAÇÃO DO CADASTRO</a>";
        return $this->enviarMensagem($dadosEmail[NU_TEL1], $Mensagem);
    }


}