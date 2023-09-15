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

    protected function sanitize($value)
    {
        if (is_string($value)) {

            $value = trim($value);
            $value = strip_tags($value);
            $value = $this->db->quote($value);
            $value = htmlspecialchars($value, ENT_QUOTES, 'UTF-8');
            $value = (get_magic_quotes_gpc()) ? stripslashes($value) : $value;
        }

        return $value;
    }

}
