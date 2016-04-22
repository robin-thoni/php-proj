<?php

namespace App\Http\DataAccess;

use Luticate\Utils\LuDataAccess;
use App\Http\DataAccess\Models\Images;
use App\Http\DBO\ImagesDbo;

class ImagesDataAccess extends LuDataAccess {
    protected static function getModel()
    {
        return new Images();
    }
}