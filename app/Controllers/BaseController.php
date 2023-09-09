<?php
namespace App\Controllers;

use Core\BaseModel;

class BaseController
{
    protected $model;
    protected $assets;
    protected $components = [];

    public function __construct()
    {
        $controllerName = substr(get_class($this), strrpos(get_class($this), '\\') + 1);
        $modelName = "App\Models\\" . str_replace("Controller", "Model", $controllerName);
        $this->model = new $modelName();
        $this->assets = $this->Assets();
    }

    protected function createComponent($className, $data = [])
    {
        if (!class_exists($className)) {
            throw new \Exception("Class $className not found.");
        }

        $component = new $className($data);
        $this->components[] = $component;

        return $component;
    }

    public function __call($method, $args)
    {
        $componentName = ucfirst($method) . 'Component';
        $componentClass = "App\\Components\\$componentName";

        if (class_exists($componentClass)) {
            return $this->createComponent($componentClass, ...$args);
        }
        throw new \Exception("Method $method not found.");
    }

    public function Assets()
    {
        $protocol = empty($_SERVER['HTTPS']) ? 'http://' : 'https://';
        $domain   = $_SERVER['HTTP_HOST'];
        $root     = str_replace('/index.php', '', $_SERVER['SCRIPT_NAME']) . "/";
        return $protocol . $domain . $root . "assets/";
        unset($protocol, $domain, $root);
    }
}
