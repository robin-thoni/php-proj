<?php

namespace App\Http\Business;

use App\Http\DBO\ImageUploadDbo;
use Carbon\Carbon;
use Exception;
use Luticate\Auth\DBO\LuticateUsersDbo;
use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\ImagesDataAccess;
use App\Http\DBO\ImagesDbo;
use Luticate\Utils\LuLog;

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

    public static function getAllLite($only_mine, LuticateUsersDbo $_user, $page = 0, $perPage = 20000000)
    {
        return ImagesDataAccess::getAllLite($only_mine, $_user, $page, $perPage);
    }

    public static function getRawById($image_id)
    {
        /**
         * @var $dbo ImagesDbo
         */
        $dbo = self::getById($image_id);
        echo file_get_contents($dbo->getPath());
        exit;
    }

    public static function upload(ImageUploadDbo $image, LuticateUsersDbo $_user)
    {
        $path = self::generateImagePath($image, $_user);

        $dbo = new ImagesDbo();
        $dbo->setUserId($_user->getId());
        $dbo->setPath($path);
        $dbo->setDate(Carbon::now());

        $image->getImage()->scaleImage(420, 420, true);
        $image->getImage()->setImageFormat(self::IMAGES_FORMAT);
        try
        {
            $image->getImage()->writeImage($path);
            return ImagesDataAccess::addId($dbo);
        }
        catch (Exception $e)
        {
            LuLog::log($e);
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
        /**
         * @var $imageDbo ImagesDbo
         */
        $imageDbo = self::getById($image_id);
        if ($imageDbo->getUserId() != $_user->getId()) {
            self::unauthorized("You do not own this image");
        }
        self::deleteById($imageDbo->getId());
        try
        {
            unlink($imageDbo->getPath());
        }
        catch (Exception $e)
        {
            LuLog::log($e);
        }
        return true;
    }
}