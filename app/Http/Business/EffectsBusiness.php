<?php

namespace App\Http\Business;

use App\Http\Business\Filters\AbstractFilter;
use App\Http\DBO\EffectApplyDbo;
use Exception;
use ImagickPixel;
use Imagine\Image\Point;
use Luticate\Utils\LuBusiness;
use App\Http\DataAccess\EffectsDataAccess;

class EffectsBusiness extends LuBusiness {
    protected static function getDataAccess()
    {
        return new EffectsDataAccess();
    }

    public static function apply(EffectApplyDbo $data)
    {
        if (!preg_match('/^[a-zA-Z]+$/', $data->getEffect())) {
            self::badInput("Invalid effect");
        }
        $className = 'App\Http\Business\Filters\\' . $data->getEffect() . 'Filter';

        if (!class_exists($className)) {
            self::notFound("Effect does not exist");
        }

        /**
         * @var $filter AbstractFilter
         */
        $filter = new $className();
        $filter->apply($data);

        return $data;
    }

    public static function effectBlackAndWhite(EffectApplyDbo $data) {
        $image = $data->getImage();
        $iterator = $image->getPixelIterator();
        foreach ($iterator as $row => $pixels) {
            /**
             * @var $pixel ImagickPixel
             */
            foreach ( $pixels as $col => $pixel ) {
                $color = $pixel->getColor();
                $g = 0.299 * $color["r"] + 0.587 * $color["g"] + 0.114 * $color["b"];
                $g = ($g < 127 ? 0 : 255);
                $pixel->setColor("rgb($g, $g, $g)");
            }
            $iterator->syncIterator();
        }
    }

    public static function effectGrayScale(EffectApplyDbo $data) {
        $image = $data->getImage();
        $iterator = $image->getPixelIterator();
        foreach ($iterator as $row => $pixels) {
            /**
             * @var $pixel ImagickPixel
             */
            foreach ( $pixels as $col => $pixel ) {
                $color = $pixel->getColor();
                $g = 0.299 * $color["r"] + 0.587 * $color["g"] + 0.114 * $color["b"];
                $pixel->setColor("rgb($g, $g, $g)");
            }
            $iterator->syncIterator();
        }
    }
}