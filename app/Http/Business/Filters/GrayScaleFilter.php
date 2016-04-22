<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/22/16
 * Time: 7:58 PM
 */

namespace App\Http\Business\Filters;

use ImagickPixel;

class GrayScaleFilter extends AbstractSimpleFilter
{
    /**
     * @param $pixel ImagickPixel
     * @return int
     */
    public static function toGrayScale($pixel)
    {
        $color = $pixel->getColor();
        return 0.299 * $color["r"] + 0.587 * $color["g"] + 0.114 * $color["b"];
    }

    /**
     * @param ImagickPixel $pixel
     */
    protected function applyPixel($pixel)
    {
        $g = self::toGrayScale($pixel);
        $pixel->setColor("rgb($g, $g, $g)");
    }
}