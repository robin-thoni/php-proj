<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/22/16
 * Time: 7:40 PM
 */

namespace App\Http\Business\Filters;

use App\Http\DBO\EffectApplyDbo;
use ImagickPixel;

abstract class AbstractSimpleFilter extends AbstractFilter
{
    /**
     * @param EffectApplyDbo $data
     */
    public function apply($data)
    {
        $image = $data->getImage();
        $iterator = $image->getPixelIterator();
        foreach ($iterator as $row => $pixels) {
            /**
             * @var $pixel ImagickPixel
             */
            foreach ($pixels as $col => $pixel) {
                $this->applyPixel($pixel);
            }
            $iterator->syncIterator();
        }
    }

    /**
     * @param $pixel ImagickPixel
     */
    protected abstract function applyPixel($pixel);
}