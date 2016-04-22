<?php

namespace App\Http\Controller;

use Luticate\Utils\LuController;
use App\Http\Business\ImagesBusiness;
use App\Http\DBO\ImagesDbo;

class ImagesController extends LuController {
    protected function getBusiness()
    {
        return new ImagesBusiness();
    }
}