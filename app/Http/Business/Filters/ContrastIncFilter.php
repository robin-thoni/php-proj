<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/27/16
 * Time: 8:16 PM
 */

namespace App\Http\Business\Filters;


use App\Http\DBO\EffectApplyDbo;

class ContrastIncFilter extends AbstractFilter
{

    /**
     * @param $data EffectApplyDbo
     */
    public function apply($data)
    {
        $data->getImage()->contrastImage(true);
    }
}