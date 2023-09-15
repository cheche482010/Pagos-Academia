<?php

namespace App\Models;

class EstudiantesModel extends BaseModel
{
    private $sql;

    public function __construct()
    {
        parent::__construct();

        $this->sql = [
            'getAll'  => "SELECT * FROM Estudiantes",
            'getById' => "SELECT * FROM Estudiantes WHERE EstudianteID = :estudianteId",
            'create'  => "INSERT INTO Estudiantes (Nombre, Telefono, CorreoElectronico) VALUES (:nombre, :telefono, :correo)",
            'update'  => "UPDATE Estudiantes SET Nombre = :nombre, Telefono = :telefono, CorreoElectronico = :correo WHERE EstudianteID = :estudianteId",
            'delete'  => "DELETE FROM Estudiantes WHERE EstudianteID = :estudianteId",
        ];

    }

    public function execute($sqlKey, $params = [], $fetchOption = "all")
    {
        if (!array_key_exists($sqlKey, $this->sql)) {
            throw new \InvalidArgumentException("Clave SQL no válida: $sqlKey");
        }

        $sanitizedParams = array_map(function ($param) {
            return $this->sanitize($param);
        }, $params);

        if ($fetchOption === "create" || $fetchOption === "update" || $fetchOption === "delete") {
            return $this->db->executeQuery($this->sql[$sqlKey], $sanitizedParams);
        } elseif ($fetchOption === "single" || $fetchOption === "all") {
            return $this->db->getResults($this->sql[$sqlKey], $sanitizedParams, $fetchOption);
        } else {
            throw new \InvalidArgumentException("Opción de obtención no válida: $fetchOption");
        }
    }

}
