<?php

namespace App\Http\DataAccess;

use App\Http\DataAccess\SP\SpGetImages;
use Luticate\Auth\DBO\LuticateUsersDbo;
use Luticate\Utils\LuDataAccess;
use App\Http\DataAccess\Models\Images;
use App\Http\DBO\ImagesDbo;

class ImagesDataAccess extends LuDataAccess {
    protected static function getModel()
    {
        return new Images();
    }

    public static function getAllLite($only_mine, LuticateUsersDbo $_user, $page = 0, $perPage = 20000000)
    {
        return SpGetImages::getMultipleJson($only_mine, $_user->getId(), $page, $perPage);
    }
}