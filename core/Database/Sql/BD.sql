-- Tabla para almacenar la información de los estudiantes
CREATE TABLE Estudiantes (
    EstudianteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL,
    Telefono VARCHAR(15),
    CorreoElectronico VARCHAR(255),
    Status TINYINT DEFAULT 1

);

-- Tabla para almacenar la información de las catedras (cursos)
CREATE TABLE Catedras (
    CatedraID INT AUTO_INCREMENT PRIMARY KEY,
    NombreCatedra VARCHAR(255) NOT NULL,
    Status TINYINT DEFAULT 1
);

-- Tabla para relacionar estudiantes con las catedras (cursos)
CREATE TABLE EstudiantesCatedras (
    EstudianteCatedraID INT AUTO_INCREMENT PRIMARY KEY,
    EstudianteID INT, -- Referencia al Estudiante correspondiente
    CatedraID INT, -- Referencia a la Catedra correspondiente
    CodigoUnico VARCHAR(15) NOT NULL, -- Código único asociado al estudiante y la catedra
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (CatedraID) REFERENCES Catedras(CatedraID),
    Status TINYINT DEFAULT 1
);

-- Tabla para registrar los pagos de los estudiantes
CREATE TABLE Pagos (
    PagoID INT AUTO_INCREMENT PRIMARY KEY,
    EstudianteCatedraID INT, -- Referencia a la relación Estudiante-Catedra correspondiente
    FechaPago DATE,
    Monto DECIMAL(10, 2),
    ComprobantePago BLOB,
    TipoMovimiento ENUM('Pago', 'Deuda'),
    FOREIGN KEY (EstudianteCatedraID) REFERENCES EstudiantesCatedras(EstudianteCatedraID),
    Status TINYINT DEFAULT 1
);

-- Tabla para registrar las cuentas de usuario de los estudiantes (para acceso en línea)
CREATE TABLE CuentasUsuarios (
    UsuarioID INT AUTO_INCREMENT PRIMARY KEY,
    EstudianteID INT, -- Referencia al Estudiante correspondiente
    Usuario VARCHAR(255) NOT NULL,
    Contraseña VARCHAR(255) NOT NULL,
    PermisoID INT, -- Referencia al Permiso correspondiente
    FOREIGN KEY (EstudianteID) REFERENCES Estudiantes(EstudianteID),
    FOREIGN KEY (PermisoID) REFERENCES Permisos(PermisoID),
    Status TINYINT DEFAULT 1
);

-- Tabla para gestionar los permisos de acceso
CREATE TABLE Permisos (
    PermisoID INT AUTO_INCREMENT PRIMARY KEY,
    Rol VARCHAR(50) NOT NULL, -- Por ejemplo, "Estudiante" o "Admin"
    AccesoPagos BOOLEAN,
    AccesoCuentas BOOLEAN,
    AccesoBitacora BOOLEAN
);

-- Tabla para registrar la bitácora de acciones
CREATE TABLE Bitacora (
    BitacoraID INT AUTO_INCREMENT PRIMARY KEY,
    FechaHora TIMESTAMP,
    UsuarioID INT, -- Referencia al Usuario que realizó la acción
    Accion VARCHAR(255), -- Descripción de la acción realizada
    FOREIGN KEY (UsuarioID) REFERENCES CuentasUsuarios(UsuarioID)
);

-- Otras tablas y relaciones pueden ser necesarias según los detalles de tu implementación.

-- Tabla para almacenar la configuración de la web
CREATE TABLE ConfiguracionWeb (
    ConfiguracionID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(255) NOT NULL, -- Nombre de la configuración, por ejemplo, "Título" o "Menú"
    Valor TEXT NOT NULL -- Valor de la configuración
);
