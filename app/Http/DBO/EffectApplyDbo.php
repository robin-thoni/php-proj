<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/22/16
 * Time: 4:57 PM
 */

namespace App\Http\DBO;

use Imagick;
use Luticate\Utils\LuDbo;

class EffectApplyDbo extends LuDbo
{
    /**
     * @var Imagick
     */
    private $image;

    /**
     * @var string
     */
    private $effect;

    /**
     * @var array
     */
    private $data;

    public static function jsonDeserialize($json)
    {
        $dbo = new EffectApplyDbo();
        
        $imagine = new Imagick();
        $imagine->readImageBlob(base64_decode($json["image"]));
        $dbo->setImage($imagine);
        $dbo->setEffect($json["effect"]);
        $dbo->setData($json["data"]);
        
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
            "effect" => $this->effect,
            "data" => $this->data
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
    public function getEffect()
    {
        return $this->effect;
    }

    /**
     * @param string $effect
     */
    public function setEffect($effect)
    {
        $this->effect = $effect;
    }

    /**
     * @return array
     */
    public function getData()
    {
        return $this->data;
    }

    /**
     * @param array $data
     */
    public function setData($data)
    {
        $this->data = $data;
    }
}