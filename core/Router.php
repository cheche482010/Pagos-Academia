<?php

namespace Core;

use App\Controllers\ErrorController;

class Router
{
    private $routes = [];
    private $error;

    public function __construct()
    {
        $this->error = new ErrorController();

        $this->routes = [
            'home'         => 'HomeController@index',
            'users'        => 'UserController@index',
            'users/create' => 'UserController@create',
        ];
    }

    public function route($url)
    {

        $url = $this->removeQueryString($url);
        $url = empty($url) ? 'home' : $url;

        if (array_key_exists($url, $this->routes)) {
            $route          = $this->routes[$url];
            $parts          = explode('@', $route);
            $controllerName = $parts[0];
            $actionName     = $parts[1];

            $controllerClass = "App\Controllers\\$controllerName";
            $controller      = new $controllerClass();
            $controller->$actionName();
        } else {
            $this->error->_404_();
        }
    }

    private function removeQueryString($url)
    {
        if (($pos = strpos($url, '?')) !== false) {
            $url = substr($url, 0, $pos);
        }
        return $url;
    }
}
