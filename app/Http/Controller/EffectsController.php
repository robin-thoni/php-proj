<?php

namespace App\Http\Controller;

use App\Http\DBO\EffectApplyDbo;
use Luticate\Utils\LuController;
use App\Http\Business\EffectsBusiness;

class EffectsController extends LuController {
    protected function getBusiness()
    {
        return new EffectsBusiness();
    }

    public function apply($effect, EffectApplyDbo $data)
    {
        $data->setEffect($effect);
        return EffectsBusiness::apply($data);
    }
}