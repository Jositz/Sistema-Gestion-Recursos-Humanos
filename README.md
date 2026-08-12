# Sistema de Gestión de Recursos Humanos

## 1. Descripción general

Este proyecto consiste en un sistema básico de gestión de recursos humanos desarrollado en PSeInt. Su finalidad es administrar la información de los empleados, registrar solicitudes de vacaciones, revisar su estado y generar reportes que permitan apoyar la toma de decisiones del área de RRHH.

El programa está pensado como un prototipo funcional, con acceso diferenciado según el tipo de usuario, y usa estructuras de datos tipo arreglos para almacenar la información de cada trabajador.

## 2. Objetivo del proyecto

El sistema busca cubrir las siguientes funciones principales:

1. Registrar empleados.
2. Modificar información personal o laboral.
3. Eliminar empleados del sistema.
4. Mostrar reportes generales.
5. Revisar el historial de cada empleado.
6. Gestionar solicitudes de vacaciones, aprobándolas o rechazándolas según criterios definidos.

## 3. Alcance funcional

### 3.1 Registro de empleados

El sistema permite almacenar la siguiente información por empleado:

- ID
- Nombre
- Antigüedad
- Salario
- Horas trabajadas
- Días de vacaciones disponibles
- Estado de la solicitud
- Historial de actividades

### 3.2 Modificación de información

El área de RRHH puede actualizar los datos de un empleado cuando sea necesario, como:

- Nombre
- Antigüedad
- Salario
- Horas de trabajo
- Días de vacaciones disponibles

### 3.3 Eliminación de empleados

La eliminación se realiza mediante el ID del empleado, y la información restante del arreglo se reacomoda para mantener la estructura ordenada y consistente.

### 3.4 Reportes

El sistema permite visualizar la información principal de cada empleado, incluyendo:

- ID
- Nombre
- Antigüedad
- Salario
- Horas trabajadas
- Vacaciones disponibles
- Estado actual

### 3.5 Historial

Cada empleado cuenta con un historial donde se registran acciones relevantes como:

- Registro inicial
- Modificación de datos
- Solicitud de vacaciones
- Aprobación o rechazo

### 3.6 Solicitudes de vacaciones

El empleado puede solicitar días de vacaciones. La solicitud queda en estado pendiente hasta que RRHH la aprueba o rechaza de acuerdo con la política establecida.

## 4. Criterios de aprobación de vacaciones

La solicitud se aprueba o rechaza según criterios del empleado, con base en:

- Tiempo de permanencia en la empresa
- Horas trabajadas
- Salario

La validación se realiza con una regla general en la que la solicitud solo puede aprobarse si cumple con los requisitos mínimos definidos por la organización.

## 5. Estructura lógica del programa

El algoritmo está organizado en bloques para facilitar su lectura y mantenimiento:

1. Declaración de variables
2. Dimensionamiento de arreglos
3. Carga inicial de datos
4. Validación de acceso por ID
5. Menú de empleado
6. Menú de RRHH
7. Gestión de solicitudes de vacaciones
8. Reportes e historial
9. Ciclo principal del sistema

## 6. Perfiles de acceso

El sistema identifica al usuario por su ID y según este accede a un menú diferente.

### 6.1 Empleado

Se consideran empleados los IDs:

- 1111
- 2222
- 3333

Estas cuentas permiten:

- Solicitar vacaciones
- Ver estado de vacaciones
- Ver salario
- Consultar información personal
- Revisar historial
- Salir

### 6.2 Recursos Humanos

Se consideran usuarios de RRHH los IDs:

- 4444
- 5555
- 6666

Estas cuentas permiten:

- Agregar empleado
- Modificar datos
- Eliminar empleado
- Ver reportes
- Revisar historial
- Aprobar o rechazar vacaciones
- Salir

## 7. Menú principal

Al iniciar el programa, se solicita ingresar el ID. Luego se evalúa:

- Si el ID es válido y corresponde a un empleado, se muestra el menú del empleado.
- Si corresponde a RRHH, se muestra el menú de recursos humanos.
- Si el ID no existe, el sistema informa que el usuario no está autorizado.

## 8. Reglas de funcionamiento

- La información se almacena en arreglos.
- Cada empleado tiene un identificador único.
- El sistema trabaja en un ciclo repetitivo para permitir múltiples operaciones sin reiniciar la aplicación.
- Las solicitudes quedan pendientes hasta ser revisadas.
- El historial registra las acciones más relevantes.

## 9. Ejecución del proyecto

Para ejecutar el proyecto en PSeInt:

1. Abrir PSeInt.
2. Cargar el archivo principal del proyecto.
3. Ejecutar el algoritmo.
4. Ingresar el ID de acceso.
5. Navegar por el menú correspondiente.

## 10. Observaciones

Este proyecto funciona como una base para un sistema académico de gestión de personal. Puede ampliarse con funcionalidades como:

- Control de asistencia
- Registro por departamentos
- Liquidación de salarios
- Login con usuarios y contraseñas
- Carga de información desde archivos externos

## 11. Conclusión

El sistema desarrollado permite simular una gestión básica de recursos humanos con enfoque en personal, vacaciones, reportes e historial. Su estructura modular facilita la comprensión del programa y ofrece una base sólida para futuras ampliaciones.

