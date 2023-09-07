<?php

namespace App\Components;

class Component
{
    protected $data = [];

    public function __construct(array $data = [])
    {
        $this->data = $data;
    }

    public function render()
    {
        ob_start();
        $this->view();
        return ob_get_clean();
    }

    protected function view()
    {
        // Verifica si la vista del componente existe
        $viewFile = $this->getViewFile();
        if (file_exists($viewFile)) {
            // Extrae los datos como variables individuales
            extract($this->data);

            // Carga la vista del componente
            include $viewFile;
        } else {
            throw new \Exception('Component view not found: ' . $viewFile);
        }
    }

    protected function getViewFile()
    {
        // Obtiene el nombre de la clase del componente sin el sufijo "Component"
        $className = str_replace('Component', '', get_class($this));

        // Convierte el nombre de la clase en el nombre de archivo de la vista
        $viewName = strtolower(preg_replace('/([a-zA-Z])(?=[A-Z])/', '$1-', $className));

        // Obtiene la ruta completa del archivo de vista
        return __DIR__ . '/../Views/' . $viewName . '.php';
    }
}
