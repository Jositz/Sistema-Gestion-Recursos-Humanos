# Documentación del Código PSeInt — Sistema de Gestión RRHH

---

## 1. Variables

### 1.1 Variables de control y utilidad general

| Variable | Tipo | Descripción |
|---|---|---|
| `cantidad` | Entero | Número total de empleados registrados en el sistema. Se inicia en 6 y aumenta o disminuye cuando se agregan o eliminan empleados. |
| `i` | Entero | Índice auxiliar para recorrer arreglos en los ciclos `Para`. |
| `j` | Entero | Índice auxiliar usado específicamente al eliminar un empleado (desplazamiento de datos). |
| `opcion` | Entero | Almacena la opción elegida por el usuario en los menús. |
| `id` | Entero | ID ingresado por el usuario al iniciar sesión. Determina a qué menú accede. |
| `idBuscado` | Entero | ID que se ingresa para buscar un empleado específico (modificar, eliminar, revisar historial, etc.). |
| `pos` | Entero | Posición (índice) del empleado encontrado dentro de los arreglos. Vale -1 si no se encuentra. |
| `encontrado` | Lógico | Bandera que indica si el ID ingresado existe en el arreglo (`Verdadero` / `Falso`). |

### 1.2 Arreglos (datos de los empleados)

Todos los arreglos tienen tamaño máximo de 100 posiciones y se accede a ellos por índice, donde cada posición representa a un empleado diferente.

| Arreglo | Tipo | Descripción |
|---|---|---|
| `ids[]` | Entero | Identificador único de cada empleado (1111, 2222, 3333, etc.). |
| `nombres[]` | Caracter | Nombre del empleado. |
| `antiguedad[]` | Entero | Años de antigüedad en la empresa. |
| `salario[]` | Real | Salario mensual del empleado. |
| `horas[]` | Real | Horas trabajadas por semana. |
| `diasVacaciones[]` | Entero | Días de vacaciones disponibles. Se decrementan cuando se aprueban vacaciones. |
| `diasSolicitados[]` | Entero | Cantidad de días solicitados en la solicitud de vacaciones actual. |
| `estado[]` | Caracter | Estado de la solicitud de vacaciones: `"Sin solicitud"`, `"Pendiente"`, `"Aprobada"` o `"Rechazada"`. |
| `historial[]` | Caracter | Registro de la última acción realizada sobre el empleado. |

---

## 2. Ciclos

### 2.1 Ciclo principal (`Repetir ... Hasta Que Falso`)

```
Repetir
    ... todo el sistema ...
Hasta Que Falso
```

- **Tipo:** Infinito (nunca se sale, el usuario debe cerrar sesión desde los submenús).
- **Propósito:** Mantiene el sistema en ejecución continua. En cada iteración se limpia la pantalla, se solicita el ID de acceso y se redirige al menú correspondiente.

### 2.2 Menú del Empleado (`Repetir ... Hasta Que opcion = 6`)

```
Repetir
    ... mostrar opciones ...
    Leer opcion
    Segun opcion Hacer ... FinSegun
    Esperar Tecla
Hasta Que opcion = 6
```

- **Tipo:** Controlado por el usuario.
- **Propósito:** Permite al empleado realizar múltiples operaciones (solicitar vacaciones, ver salario, etc.) hasta que elige la opción 6 (Salir).

### 2.3 Menú de Recursos Humanos (`Repetir ... Hasta Que opcion = 7`)

```
Repetir
    ... mostrar opciones ...
    Leer opcion
    Segun opcion Hacer ... FinSegun
    Esperar Tecla
Hasta Que opcion = 7
```

- **Tipo:** Controlado por el usuario.
- **Propósito:** Permite al personal de RRHH realizar operaciones administrativas (agregar, modificar, eliminar empleados, etc.) hasta que elige la opción 7 (Salir).

### 2.4 Búsqueda de empleado (`Para i <- 1 Hasta cantidad`)

Se usa en **varios lugares** del código con el mismo patrón:

```
pos <- -1
Para i <- 1 Hasta cantidad Hacer
    Si ids[i] = idBuscado Entonces
        pos <- i
    FinSi
FinPara
```

- **Tipo:** Bucle `Para` (for) que recorre todos los empleados.
- **Propósito:** Buscar la posición de un empleado por su ID. Si lo encuentra, guarda su índice en `pos`; si no lo encuentra, `pos` queda en -1.

### 2.5 Inicialización de datos (`Para i <- 1 Hasta cantidad`)

```
Para i <- 1 Hasta cantidad Hacer
    estado[i] <- "Sin solicitud"
    diasSolicitados[i] <- 0
    historial[i] <- "Sin historial"
FinPara
```

- **Tipo:** Bucle `Para`.
- **Propósito:** Asigna valores por defecto a los campos de estado, días solicitados e historial de cada empleado al iniciar el sistema.

### 2.6 Eliminación de empleado (`Para j <- pos Hasta cantidad - 1`)

```
Para j <- pos Hasta cantidad - 1 Hacer
    ids[j] <- ids[j + 1]
    nombres[j] <- nombres[j + 1]
    ... (todos los arreglos) ...
FinPara
cantidad <- cantidad - 1
```

- **Tipo:** Bucle `Para`.
- **Propósito:** Desplaza todos los elementos posteriores al empleado eliminado una posición hacia atrás para mantener los arreglos compactos sin huecos.

### 2.7 Reportes generales (`Para i <- 1 Hasta cantidad`)

```
Para i <- 1 Hasta cantidad Hacer
    Escribir "ID: ", ids[i]
    Escribir "Nombre: ", nombres[i]
    ... (todos los campos) ...
FinPara
```

- **Tipo:** Bucle `Para`.
- **Propósito:** Recorrer y mostrar la información de todos los empleados registrados.

---

## 3. Condiciones

### 3.1 Validación de ID de acceso

```
Si ids[i] = id Entonces
    encontrado <- Verdadero
    pos <- i
FinSi
```

- **Propósito:** Determinar si el ID ingresado por el usuario corresponde a un empleado registrado.

### 3.2 Distinción de tipo de usuario

```
Si id = 1111 O id = 2222 O id = 3333 Entonces
    // Menú de empleado
SiNo
    Si id = 4444 O id = 5555 O id = 6666 Entonces
        // Menú de RRHH
    SiNo
        // Usuario no autorizado
    FinSi
FinSi
```

- **Propósito:** Redirigir al usuario al menú correspondiente según su ID:
  - **IDs 1111, 2222, 3333** → Menú de empleado.
  - **IDs 4444, 5555, 6666** → Menú de RRHH.
  - **Cualquier otro** → Mensaje de "Usuario no autorizado".

### 3.3 Validación de solicitud de vacaciones

```
Si diasSolicitados[pos] > 0 Y diasSolicitados[pos] <= diasVacaciones[pos] Entonces
    estado[pos] <- "Pendiente"
    historial[pos] <- "Solicitud de vacaciones"
SiNo
    Escribir "Cantidad de dias no valida."
FinSi
```

- **Propósito:** Aceptar la solicitud solo si el empleado pide al menos 1 día y no excede sus días disponibles.

### 3.4 Aprobación o rechazo de vacaciones

```
Si estado[pos] = "Pendiente" Entonces
    Si antiguedad[pos] >= 1 Y horas[pos] >= 35 Y salario[pos] >= 8000 Entonces
        estado[pos] <- "Aprobada"
        diasVacaciones[pos] <- diasVacaciones[pos] - diasSolicitados[pos]
    SiNo
        estado[pos] <- "Rechazada"
    FinSi
SiNo
    Escribir "El empleado no tiene una solicitud pendiente."
FinSi
```

- **Propósito:** Evaluar si el empleado cumple con la política de vacaciones. Los criterios de aprobación son:
  - Antigüedad mínima de **1 año**.
  - Mínimo **35 horas** trabajadas.
  - Salario mínimo de **L. 8,000**.
- Si cumple, se aprueba y se descuentan los días solicitados. Si no cumple, se rechaza.

### 3.5 Verificación de existencia de empleado

Se repite en múltiples opciones del menú de RRHH (modificar, eliminar, revisar historial, aprobar vacaciones):

```
Si pos <> -1 Entonces
    // Operación sobre el empleado
SiNo
    Escribir "Empleado no encontrado."
FinSi
```

- **Propósito:** Confirmar que la búsqueda del ID devolvió una posición válida antes de intentar acceder a los datos del empleado.

---

## 4. Resumen de estructura

```
Algoritmo Inicio_Proyecto
├── Declaración de variables y arreglos
├── Carga inicial de 6 empleados
├── Ciclo principal (Repetir infinito)
│   ├── Lectura de ID
│   ├── Búsqueda de ID en el arreglo
│   ├── Si es empleado (1111, 2222, 3333)
│   │   └── Submenú con opciones 1-6
│   ├── Si es RRHH (4444, 5555, 6666)
│   │   └── Submenú administrativo con opciones 1-7
│   └── Si no existe → "Usuario no autorizado"
FinAlgoritmo
```

> 📊 Para ver los diagramas de flujo completos en Mermaid, consulta:
> - [Diagrama_Flujo_Sistema.md](Diagrama_Flujo_Sistema.md) — Flujo general del sistema
> - [Diagrama_Aprobacion_Vacaciones.md](Diagrama_Aprobacion_Vacaciones.md) — Flujo de aprobación de vacaciones
> - [Diagrama_Estructura_Arreglos.md](Diagrama_Estructura_Arreglos.md) — Estructura de arreglos y acceso a datos
