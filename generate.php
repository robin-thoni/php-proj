<?php

use Luticate\Generator\LuGenerator;

require_once('vendor/autoload.php');
Dotenv::load(".");

$gen = new LuGenerator(getenv("DB_CONNECTION"), getenv("DB_DATABASE"), getenv("DB_HOST"),
    getenv("DB_PORT"), getenv("DB_USERNAME"), getenv("DB_PASSWORD"));

$gen->setConfig(array("dbo" =>
    array(
        "namespace" => 'App\Http\DBO',
        "folder" => 'app/Http/DBO'
    ),
    "models" =>
        array(
            "namespace" => 'App\Http\DataAccess\Models',
            "folder" => 'app/Http/DataAccess/Models'
        ),
    "sp" =>
        array(
            "namespace" => 'App\Http\DataAccess\SP',
            "folder" => 'app/Http/DataAccess/SP'
        ),
    "dataaccess" =>
        array(
            "namespace" => 'App\Http\DataAccess',
            "folder" => 'app/Http/DataAccess'
        ),
    "business" =>
        array(
            "namespace" => 'App\Http\Business',
            "folder" => 'app/Http/Business'
        ),
    "controller" =>
        array(
            "namespace" => 'App\Http\Controller',
            "folder" => 'app/Http/Controller'
        ),
    "mode" => 0775,
    "ignore" => array(
        "tables" => array(
            "/^luticate_.*/"
        ),
        "sp" => array(
            "/^sp_lu_.*/"
        ),
        "controllers" => array(
        )
    )
));

$gen->run();