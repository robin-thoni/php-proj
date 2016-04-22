<?php

namespace App\Http\DataAccess;

use Luticate\Utils\LuDataAccess;
use App\Http\DataAccess\Models\Effects;
use App\Http\DBO\EffectsDbo;

class EffectsDataAccess extends LuDataAccess {
    protected static function getModel()
    {
        return new Effects();
    }
}