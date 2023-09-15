<?php

namespace App\Components;

class VistaComponent extends Component
{
    protected $viewName;

    public function __construct($viewName, $data = [])
    {
        parent::__construct($data);
        $this->viewName = $viewName;
    }

    protected function view()
    {
        $viewFile = $this->getViewFile($this->viewName);

        if (file_exists($viewFile)) {
            extract($this->data);
            include $viewFile;
        } else {
            throw new \Exception('View not found: ' . $viewFile);
        }
    }

    private function getViewFile($viewName)
    {
        $viewsPath = __DIR__ . '/../Views/';

        if (pathinfo($viewName, PATHINFO_EXTENSION) === 'html') {
            $viewName .= '.html';
        } elseif (pathinfo($viewName, PATHINFO_EXTENSION) === 'php') {
            $viewName .= '.php';
        }

        return $viewsPath . $viewName;
    }
}
