<?php
namespace App\Controllers;

use Core\BaseModel;
use App\Components\ButtonComponent;

class BaseController
{
    protected $model;
    protected $button;

    public function __construct()
    {
        $controllerName = substr(get_class($this), strrpos(get_class($this), '\\') + 1);
        $modelName = "App\Models\\" . str_replace("Controller", "Model", $controllerName);
        $this->model = new $modelName();
    }

    protected function getButton($data = [])
    {
        $this->button = new ButtonComponent($data);
        return $this->button;
    }
}
