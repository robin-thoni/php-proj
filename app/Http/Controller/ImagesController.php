<?php

namespace App\Http\Controller;

use App\Http\DBO\ImageUploadDbo;
use Luticate\Auth\DBO\LuticateUsersDbo;
use Luticate\Utils\Dbo\LuIntDbo;
use Luticate\Utils\LuController;
use App\Http\Business\ImagesBusiness;
use App\Http\DBO\ImagesDbo;

class ImagesController extends LuController {
    protected function getBusiness()
    {
        return new ImagesBusiness();
    }

    public function getAll($only_mine, LuticateUsersDbo $_user, $page = 0, $perPage = 20000000)
    {
        return ImagesBusiness::getAllLite($only_mine == "true", $_user, $page, $perPage);
    }

    public function getRawById($image_id)
    {
        return ImagesBusiness::getRawById($image_id);
    }

    public function upload(ImageUploadDbo $image, LuticateUsersDbo $_user)
    {
        return ImagesBusiness::upload($image, $_user);
    }
    
    public function del(LuIntDbo $image_id, LuticateUsersDbo $_user)
    {
        return ImagesBusiness::del($image_id->getInt(), $_user);
    }
}