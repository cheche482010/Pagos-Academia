# Sistema de Gestión de Academia de Música

Este es un sistema de gestión de una academia de música que permite administrar estudiantes, catedras, pagos, cuentas de usuario y permisos de acceso. El sistema ha sido diseñado utilizando una base de datos relacional y proporciona funcionalidades clave para la administración de la academia.

## Tablas de la Base de Datos

### Estudiantes

La tabla `Estudiantes` almacena información básica sobre los estudiantes, como nombre, teléfono, correo electrónico y estado (activo o inactivo).

### Catedras

La tabla `Catedras` registra información sobre las catedras o cursos disponibles, como su nombre y estado (activo o inactivo).

### EstudiantesCatedras

La tabla `EstudiantesCatedras` relaciona estudiantes con las catedras en las que están inscritos. También almacena códigos únicos para cada combinación estudiante-catedra.

### Pagos

La tabla `Pagos` registra los pagos realizados por los estudiantes, incluyendo la fecha, el monto y el comprobante de pago en formato de imagen. También se utiliza para registrar deudas pendientes.

### CuentasUsuarios

La tabla `CuentasUsuarios` gestiona las cuentas de usuario para los estudiantes y el personal de administración. Contiene información de acceso, como nombre de usuario y contraseña, y se asocia con un permiso que determina el nivel de acceso del usuario.

### Permisos

La tabla `Permisos` define los niveles de acceso dentro del sistema, como "Estudiante" o "Admin". Cada permiso tiene configuraciones de acceso específicas.

### Bitacora

La tabla `Bitacora` registra las acciones realizadas en el sistema, incluyendo la fecha y hora, el usuario que realizó la acción y una descripción de la acción.

### ConfiguracionWeb

La tabla `ConfiguracionWeb` se utiliza para almacenar configuraciones generales del sistema, como el título y el menú, que pueden ser modificadas desde la interfaz de administración.

## Uso del Sistema

El sistema proporciona las siguientes funcionalidades:

- Registro y gestión de estudiantes y catedras.
- Registro de pagos y seguimiento de deudas.
- Creación y administración de cuentas de usuario con diferentes permisos.
- Registro de acciones en la bitácora para fines de auditoría.
- Configuración de aspectos visuales del sitio web, como el título y el menú.

## Requisitos de Instalación

Para instalar y ejecutar el sistema, asegúrate de tener un entorno de base de datos compatible (por ejemplo, MySQL) y un servidor web configurado. Además, asegúrate de contar con PHP instalado para la lógica del servidor.

## Configuración

Antes de utilizar el sistema, debes configurar la conexión a la base de datos en el archivo de configuración correspondiente.

## Contribuciones

Las contribuciones a este proyecto son bienvenidas. Si deseas mejorar o agregar nuevas características al sistema, te animamos a que lo hagas.

## Licencia

Este sistema está bajo la licencia MIT. Consulta el archivo LICENSE para obtener más detalles.

