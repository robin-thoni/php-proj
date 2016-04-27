<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/27/16
 * Time: 8:14 PM
 */

namespace App\Http\Business\Filters;


use App\Http\DBO\EffectApplyDbo;

class SepiaFilter extends AbstractFilter
{

    /**
     * @param $data EffectApplyDbo
     */
    public function apply($data)
    {
        $data->getImage()->sepiaToneImage(80);
    }
}