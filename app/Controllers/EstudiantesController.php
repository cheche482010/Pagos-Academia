<?php

namespace App\Controllers;

class EstudiantesController extends BaseController
{
    private $model;
    private $datos;
    private $respuesta;

    public function __construct()
    {
        parent::__construct();
        $this->respuesta = [];
    }

    public function __call($method, $arguments)
    {

        $operation = lcfirst($method);

        if (in_array($operation, ['getAll', 'getById', 'create', 'update', 'delete'])) {
            if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                $fetchOption     = count($arguments) > 2 ? $arguments[2] : 'all';
                $this->respuesta = $this->model->execute($operation, $arguments, $fetchOption);
                return $this->respuesta;
            }
        }
        throw new \BadMethodCallException("Método no encontrado: $method");
    }

    public function Validacion()
    {
        if ($this->validacion()) {
            try {
                $this->delete($_POST['id']);
                $this->respuesta = ['message' => 'Estudiante eliminado con éxito'];
                return json_encode($this->respuesta);
            } catch (\Exception $e) {
                $this->respuesta = ['error' => 'Error al eliminar al estudiante: ' . $e->getMessage()];
                return json_encode($this->respuesta);
            }
        } else {
            $this->respuesta = ['error' => 'Error de validación, no se pudo eliminar al estudiante'];
            return json_encode($this->respuesta);
        }
    }

}
