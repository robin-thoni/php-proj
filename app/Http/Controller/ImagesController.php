<?php

namespace App\Http\Controller;

use App\Http\DBO\ImageUploadDbo;
use Luticate\Utils\LuController;
use App\Http\Business\ImagesBusiness;
use App\Http\DBO\ImagesDbo;

class ImagesController extends LuController {
    protected function getBusiness()
    {
        return new ImagesBusiness();
    }

    public function upload(ImageUploadDbo $image)
    {
        return ImagesBusiness::upload($image);
    }
}