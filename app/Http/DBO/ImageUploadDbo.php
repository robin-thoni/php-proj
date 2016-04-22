<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/22/16
 * Time: 9:25 PM
 */

namespace App\Http\DBO;

use Imagick;
use Luticate\Utils\LuDbo;

class ImageUploadDbo extends LuDbo
{
    /**
     * @var Imagick
     */
    private $image;

    /**
     * @var string
     */
    private $name;

    public static function jsonDeserialize($json)
    {
        $dbo = new ImageUploadDbo();

        $imagine = new Imagick();
        $imagine->readImageBlob(base64_decode($json["image"]));
        $dbo->setImage($imagine);
        $dbo->setName($json["name"]);

        return $dbo;
    }

    function jsonSerialize()
    {
        $imageData = null;
        if (!is_null($this->image)) {
            $imageData = base64_encode($this->image->getImageBlob());
        }
        return [
            "image" => $imageData,
            "name" => $this->name
        ];
    }

    /**
     * @return Imagick
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * @param Imagick $image
     */
    public function setImage($image)
    {
        $this->image = $image;
    }

    /**
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName($name)
    {
        $this->name = $name;
    }
}