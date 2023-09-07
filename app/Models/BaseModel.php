<?php

namespace App\Models;

use Core\Database\Connection;

class BaseModel
{
    protected $db;

    public function __construct()
    {
        $this->db = Connection::getInstance();
    }
}
