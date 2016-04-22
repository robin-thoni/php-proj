<?php

namespace App\Http\Business;

use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\ImagesDataAccess;
use App\Http\DBO\ImagesDbo;

class ImagesBusiness extends LuBusiness {
    protected static function getDataAccess()
    {
        return new ImagesDataAccess();
    }
}