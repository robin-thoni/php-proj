<?php
/**
 * Created by PhpStorm.
 * User: robin
 * Date: 4/22/16
 * Time: 7:25 PM
 */

namespace App\Http\Business\Filters;

use App\Http\DBO\EffectApplyDbo;

abstract class AbstractFilter
{
    /**
     * @param $data EffectApplyDbo
     */
    public abstract function apply($data);
}