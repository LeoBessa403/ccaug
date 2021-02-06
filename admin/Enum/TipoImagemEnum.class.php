<?php
/**
 * Class TipoAssunto
 */
class TipoImagemEnum extends AbstractEnum
{
    const PERFIL_USUARIO = 1;
    const CAPA_CURSO = 2;

    public static $descricao = [
        TipoImagemEnum::PERFIL_USUARIO => 'Perfil Usuário',
        TipoImagemEnum::CAPA_CURSO => 'Capa Curso',
    ];
}