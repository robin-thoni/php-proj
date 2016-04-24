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

    public function upload(ImageUploadDbo $image, LuticateUsersDbo $_user)
    {
        return ImagesBusiness::upload($image, $_user);
    }
    
    public function del(LuIntDbo $image_id, LuticateUsersDbo $_user)
    {
        return ImagesBusiness::del($image_id->getInt(), $_user);
    }
}