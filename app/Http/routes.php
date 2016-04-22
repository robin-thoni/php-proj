<?php

use Luticate\Auth\Business\LuticateBusiness;
use Luticate\Doc\Business\LuDocBusiness;
use Luticate\Utils\LuRoute;

$route = LuRoute::getInstance();

$int = LuRoute::REG_INT;

LuticateBusiness::setupAuth();
LuticateBusiness::setupRoutes("/api/luticate");
LuDocBusiness::setupRoutes("/api/luticate");

$route->post("/api/effects/{effect}/apply", "Effects", "apply");
