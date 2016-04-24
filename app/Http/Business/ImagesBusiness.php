<?php

namespace App\Http\Business;

use App\Http\DBO\ImageUploadDbo;
use Exception;
use Luticate\Auth\DBO\LuticateUsersDbo;
use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\ImagesDataAccess;
use App\Http\DBO\ImagesDbo;

class ImagesBusiness extends LuBusiness {
    
    const IMAGES_PATH = "../storage/images/";

    const IMAGES_FORMAT = "jpeg";
    
    protected static function getDataAccess()
    {
        return new ImagesDataAccess();
    }

    public static function generateImagePath(ImageUploadDbo $image, LuticateUsersDbo $_user)
    {
        return self::IMAGES_PATH . $_user->getId() . "-" . hash("sha256", $image->getName()) .
        "-" . time() . "." . self::IMAGES_FORMAT;
    }

    public static function upload(ImageUploadDbo $image, LuticateUsersDbo $_user)
    {
        $path = self::generateImagePath($image, $_user);

        $dbo = new ImagesDbo();
        $dbo->setUserId($_user->getId());
        $dbo->setPath($path);

        $image->getImage()->scaleImage(420, 420, true);
        $image->getImage()->setImageFormat(self::IMAGES_FORMAT);
        try
        {
            $image->getImage()->writeImage($path);
            return ImagesDataAccess::addId($dbo);
        }
        catch (Exception $e)
        {
            try
            {
                unlink($path);
            }
            catch (Exception $e)
            {
            }
            abort(500, "Failed to save image");
        }

        return null;
    }

    public static function del($image_id, LuticateUsersDbo $_user)
    {
        $imageDbo = self::getById($image_id);
        if ($imageDbo->getUserId() != $_user->getId()) {
            self::unauthorized("You do not own this image");
        }
        return true;
    }
}