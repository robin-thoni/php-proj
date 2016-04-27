<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/27/16
 * Time: 8:16 PM
 */

namespace App\Http\Business\Filters;


use App\Http\DBO\EffectApplyDbo;

class EdgeDetectionFilter extends AbstractFilter
{

    /**
     * @param $data EffectApplyDbo
     */
    public function apply($data)
    {
        $edgeArray = array(-1,-1,-1,-1,8,-1,-1,-1,-1);
        $data->getImage()->convolveImage($edgeArray);
        $data->getImage()->thresholdImage(1);
    }
}