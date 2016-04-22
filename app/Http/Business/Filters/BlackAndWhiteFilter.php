<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/22/16
 * Time: 7:57 PM
 */

namespace App\Http\Business\Filters;


class BlackAndWhiteFilter extends AbstractSimpleFilter
{
    protected function applyPixel($pixel)
    {
        $g = GrayScaleFilter::toGrayScale($pixel);
        $g = ($g < 127 ? 0 : 255);
        $pixel->setColor("rgb($g, $g, $g)");
    }
}