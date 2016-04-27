<?php

use App\Http\DBO\Permissions;
use Luticate\Auth\Business\LuticateBusiness;
use Luticate\Doc\Business\LuDocBusiness;
use Luticate\Utils\LuRoute;

$route = LuRoute::getInstance();

$int = LuRoute::REG_INT;

LuticateBusiness::setupAuth();
LuticateBusiness::setupRoutes("/api/luticate");
LuDocBusiness::setupRoutes("/api/luticate");

$image_id = "{image_id:$int}";

$route->post("/api/effects/{effect}/apply", "Effects", "apply", Permissions::UPLOAD);

$route->get("/api/images", "Images", "getAll");
$route->get("/api/images/$image_id", "Images", "getRawById");
$route->post("/api/images/upload", "Images", "upload", Permissions::UPLOAD);
$route->post("/api/images/$image_id/del", "Images", "del", Permissions::UPLOAD);
