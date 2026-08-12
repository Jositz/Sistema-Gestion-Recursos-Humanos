# Sistema de Gestión de Recursos Humanos

## Descripción general

Este proyecto tiene como objetivo desarrollar un sistema básico de gestión de recursos humanos en PSeInt, orientado a la administración de empleados, la revisión de vacaciones y la generación de reportes. El programa permite gestionar perfiles de personal, consultar información laboral, registrar solicitudes y validar aprobaciones según criterios internos.

## Integrantes

Grupo 4

## Objetivo del sistema

El sistema está diseñado para apoyar las siguientes funciones:

1. Agregar un empleado.
2. Modificar la información de un empleado.
3. Eliminar a un empleado.
4. Generar reportes de personal.
5. Revisar el historial de un empleado.
6. Aprobar o rechazar solicitudes de vacaciones según el tiempo en la empresa, las horas trabajadas y el salario.

## Módulos principales

### 1. Registro de empleados

El sistema permite registrar la siguiente información de cada trabajador:

- ID del empleado
- Nombre
- Antigüedad
- Salario
- Horas trabajadas
- Días de vacaciones disponibles
- Estado de la solicitud
- Historial de actividades

### 2. Modificación de datos

El administrador o el departamento de RRHH puede actualizar la información del empleado, como:

- Nombre
- Antigüedad
- Salario
- Horas trabajadas
- Días de vacaciones

### 3. Eliminación de empleados

Cuando un empleado ya no forma parte del sistema, se elimina físicamente del arreglo para mantener la información actualizada y ordenada.

### 4. Reportes

Se muestran los datos principales de cada trabajador, como:

- ID
- Nombre
- Antigüedad
- Salario
- Horas laboradas
- Días restantes de vacaciones
- Estado actual

### 5. Historial del empleado

Cada empleado cuenta con un historial de movimientos para registrar acciones del sistema, como:

- Registro de usuario
- Modificación de datos
- Solicitud de vacaciones
- Aprobación o rechazo

### 6. Solicitudes de vacaciones

El empleado puede solicitar días de vacaciones, y el sistema cambia su estado a pendiente. Luego, RRHH revisa la solicitud y la valida con criterios definidos.

## Criterios para aprobación de vacaciones

La solicitud se aprueba o rechaza según las condiciones del empleado:

- Tiempo de servicio en la empresa
- Horas de trabajo
- Salario

Esto permite que la decisión no dependa solo de la solicitud, sino también de la política interna del negocio.

## Estructura lógica del programa

El algoritmo está organizado por bloques para facilitar su lectura y mantenimiento:

1. Variables globales
2. Arreglos
3. Carga inicial de empleados
4. Funciones auxiliares
5. Menú principal
6. Menú de empleados
7. Menú de RRHH
8. Validación de vacaciones
9. Reportes y historial

## Menú principal

El sistema se inicia con la validación del ID del usuario. Dependiendo del ID, se accede a uno de los perfiles:

- Empleado
- Recursos humanos
- Administrador

## Menú del empleado

El empleado puede realizar las siguientes acciones:

1. Solicitar vacaciones
2. Ver estado de vacaciones
3. Ver salario
4. Ver información personal
5. Ver historial
6. Salir

## Menú de RRHH

Recursos humanos puede realizar las siguientes acciones:

1. Agregar empleado
2. Modificar empleado
3. Eliminar empleado
4. Reportes
5. Revisar historial
6. Aprobación o rechazo de vacaciones
7. Salir

## Reglas de funcionamiento

- El sistema trabaja con arreglos para guardar la información de los empleados.
- Cada empleado tiene un identificador único.
- Las vacaciones se registran como solicitudes pendientes y luego se aprueban o rechazan.
- El historial conserva el registro de cambios para auditoría.
- El programa se ejecuta en ciclo para permitir varias operaciones sin reiniciar la aplicación.

## Ejecución

Para ejecutar el proyecto:

1. Abrir el archivo PSeInt.
2. Cargar el archivo principal del proyecto.
3. Ejecutar el algoritmo.
4. Ingresar el ID correspondiente para acceder al menú adecuado.

## Observaciones

Este proyecto sirve como base para un sistema de recursos humanos académico y puede ampliarse con:

- Registro de departamento
- Control de asistencia
- Liquidación de salarios
- Carga de múltiples empleados desde archivo
- Login con usuarios y contraseñas

## Conclusión

Este sistema permite simular una gestión básica de recursos humanos con enfoque en empleados, vacaciones, historial y reportes. La lógica se organiza de forma modular para facilitar la comprensión del proyecto y su futura ampliación.

