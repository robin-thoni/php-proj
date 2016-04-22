<?php

namespace App\Http\Business;

use App\Http\DBO\ImageUploadDbo;
use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\ImagesDataAccess;
use App\Http\DBO\ImagesDbo;

class ImagesBusiness extends LuBusiness {
    protected static function getDataAccess()
    {
        return new ImagesDataAccess();
    }

    public static function upload(ImageUploadDbo $image)
    {
        return true;
    }
}