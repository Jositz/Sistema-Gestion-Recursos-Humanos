# Documentación — Menú de Recursos Humanos

---

## 1. Acceso al menú

Para acceder al panel de RRHH se debe iniciar sesión con uno de los IDs autorizados:

| ID | Nombre |
|---|---|
| `4444` | RRHH 1 |
| `5555` | RRHH 2 |
| `6666` | Administrador |

Si se ingresa un ID no válido, el sistema muestra **"Usuario no autorizado"** y regresa al inicio.

### Ejemplo de acceso

```
========================================
       SISTEMA DE GESTION RRHH
========================================
Ingrese su ID:
> 4444
```

---

## 2. Opciones del menú

```
========================================
         MENU RECURSOS HUMANOS
========================================
1. Agregar empleado
2. Modificar empleado
3. Eliminar empleado
4. Reportes
5. Revisar historial
6. Aprobar o rechazar vacaciones
7. Salir
```

---

## 3. Detalle de cada opción con ejemplos

### Opción 1: Agregar empleado

**¿Qué hace?**
Incrementa el contador `cantidad` en 1 y pide al usuario los datos del nuevo empleado. El sistema asigna automáticamente los campos `estado`, `diasSolicitados` e `historial`.

**¿Qué campos se piden?**

| Campo | Tipo | Ejemplo |
|---|---|---|
| ID | Entero | `7777` |
| Nombre | Texto | `"Juan Perez"` |
| Antigüedad (años) | Entero | `2` |
| Salario | Real | `11000` |
| Horas trabajadas | Real | `40` |
| Días de vacaciones | Entero | `15` |

**Valores automáticos asignados:**
- `estado` → `"Sin solicitud"`
- `diasSolicitados` → `0`
- `historial` → `"Empleado registrado"`

**Ejemplo paso a paso:**

```
Opción: 1
Ingrese ID:
> 7777
Ingrese nombre:
> Juan Perez
Ingrese antiguedad:
> 2
Ingrese salario:
> 11000
Ingrese horas trabajadas:
> 40
Ingrese dias de vacaciones:
> 15
Empleado agregado.
```

**Estado del sistema después de esta operación:**

| Posición | ID | Nombre | Antig. | Salario | Horas | Vac. | Estado | Historial |
|---|---|---|---|---|---|---|---|---|
| 1 | 1111 | Empleado 1 | 3 | 12000 | 40 | 20 | Sin solicitud | Sin historial |
| 2 | 2222 | Empleado 2 | 2 | 10000 | 40 | 15 | Sin solicitud | Sin historial |
| 3 | 3333 | Empleado 3 | 1 | 9000 | 35 | 10 | Sin solicitud | Sin historial |
| 4 | 4444 | RRHH 1 | 4 | 15000 | 40 | 15 | Sin solicitud | Sin historial |
| 5 | 5555 | RRHH 2 | 5 | 16000 | 40 | 15 | Sin solicitud | Sin historial |
| 6 | 6666 | Administrador | 6 | 20000 | 40 | 20 | Sin solicitud | Sin historial |
| **7** | **7777** | **Juan Perez** | **2** | **11000** | **40** | **15** | **Sin solicitud** | **Empleado registrado** |

---

### Opción 2: Modificar empleado

**¿Qué hace?**
Busca un empleado por su ID y permite actualizar sus datos personales y laborales. Si el ID no existe, muestra un error.

**¿Qué campos se modifican?**

| Campo | Tipo | Ejemplo |
|---|---|---|
| Nombre | Texto | `"Maria Lopez"` |
| Antigüedad | Entero | `5` |
| Salario | Real | `14000` |
| Horas trabajadas | Real | `42` |
| Días de vacaciones | Entero | `20` |

**Ejemplo paso a paso:**

```
Opción: 2
Ingrese ID del empleado a modificar:
> 3333
Nuevo nombre:
> Maria Lopez
Nueva antiguedad:
> 5
Nuevo salario:
> 14000
Nuevas horas:
> 42
Nuevo total de vacaciones:
> 20
Empleado modificado.
```

**Estado después de la modificación:**

| Posición | ID | Nombre | Antig. | Salario | Horas | Vac. |
|---|---|---|---|---|---|---|
| 3 | 3333 | **Maria Lopez** | **5** | **14000** | **42** | **20** |

**Si el ID no existe:**

```
Opción: 2
Ingrese ID del empleado a modificar:
> 9999
Empleado no encontrado.
```

---

### Opción 3: Eliminar empleado

**¿Qué hace?**
Busca al empleado por ID, desplaza todos los registros posteriores una posición hacia atrás para eliminar el hueco, y reduce `cantidad` en 1. Esta operación **no se puede deshacer**.

**Ejemplo paso a paso:**

```
Opción: 3
Ingrese ID a eliminar:
> 2222
Empleado eliminado.
```

**Estado antes:**

| Posición | ID | Nombre |
|---|---|---|
| 1 | 1111 | Empleado 1 |
| 2 | 2222 | Empleado 2 |
| 3 | 3333 | Empleado 3 |
| ... | ... | ... |

**Estado después (cantidad = 5):**

| Posición | ID | Nombre |
|---|---|---|
| 1 | 1111 | Empleado 1 |
| 2 | 3333 | Empleado 3 ← se movió de la posición 3 a la 2 |
| 3 | 4444 | RRHH 1 ← se movió de la posición 4 a la 3 |
| ... | ... | ... |

**Si el ID no existe:**

```
Opción: 3
Ingrese ID a eliminar:
> 9999
Empleado no encontrado.
```

---

### Opción 4: Reportes

**¿Qué hace?**
Muestra en pantalla la información completa de **todos** los empleados registrados, uno tras otro.

**Ejemplo de salida:**

```
Opción: 4

========== REPORTES ==========
----------------------------------------
ID: 1111
Nombre: Empleado 1
Antiguedad: 3 años
Salario: L. 12000
Horas: 40
Vacaciones disponibles: 20
Estado: Sin solicitud
----------------------------------------
ID: 2222
Nombre: Empleado 2
Antiguedad: 2 años
Salario: L. 10000
Horas: 40
Vacaciones disponibles: 15
Estado: Sin solicitud
----------------------------------------
ID: 3333
Nombre: Empleado 3
Antiguedad: 1 año
Salario: L. 9000
Horas: 35
Vacaciones disponibles: 10
Estado: Sin solicitud
----------------------------------------
ID: 4444
Nombre: RRHH 1
Antiguedad: 4 años
Salario: L. 15000
Horas: 40
Vacaciones disponibles: 15
Estado: Sin solicitud
----------------------------------------
ID: 5555
Nombre: RRHH 2
Antiguedad: 5 años
Salario: L. 16000
Horas: 40
Vacaciones disponibles: 15
Estado: Sin solicitud
----------------------------------------
ID: 6666
Nombre: Administrador
Antiguedad: 6 años
Salario: L. 20000
Horas: 40
Vacaciones disponibles: 20
Estado: Sin solicitud
```

---

### Opción 5: Revisar historial

**¿Qué hace?**
Busca un empleado por ID y muestra la última acción registrada en su campo `historial`.

**Ejemplo paso a paso:**

```
Opción: 5
Ingrese ID del empleado:
> 1111
Historial de Empleado 1:
Sin historial
```

**Después de que el empleado solicite vacaciones:**

```
Opción: 5
Ingrese ID del empleado:
> 1111
Historial de Empleado 1:
Solicitud de vacaciones
```

**Si el ID no existe:**

```
Opción: 5
Ingrese ID del empleado:
> 9999
Empleado no encontrado.
```

---

### Opción 6: Aprobar o rechazar vacaciones

**¿Qué hace?**
Busca al empleado por ID y evalúa su solicitud de vacaciones según la política de la empresa.

**Flujo de la lógica:**

```
¿El empleado existe?
├── NO → "Empleado no encontrado."
└── SÍ
    ¿Tiene solicitud "Pendiente"?
    ├── NO → "El empleado no tiene una solicitud pendiente."
    └── SÍ
        ¿Cumple la política?
        (antigüedad >= 1 AND horas >= 35 AND salario >= 8000)
        ├── SÍ → Estado = "Aprobada"
        │        Se descuentan los días solicitados
        │        Historial = "Vacaciones aprobadas"
        └── NO → Estado = "Rechazada"
                 Historial = "Vacaciones rechazadas por politica"
```

**Criterios de aprobación:**

| Criterio | Valor mínimo requerido |
|---|---|
| Antigüedad | ≥ 1 año |
| Horas trabajadas | ≥ 35 horas/semana |
| Salario | ≥ L. 8,000 |

> 📊 Para ver el diagrama de flujo completo en Mermaid, consulta [Diagrama_Aprobacion_Vacaciones.md](Diagrama_Aprobacion_Vacaciones.md).

#### Ejemplo 1 — Solicitud aprobada

Primero, el empleado con ID 1111 solicita vacaciones desde su menú:

```
(ID 1111, menú empleado)
Opción: 1
Dias disponibles: 20
Cantidad de dias a solicitar:
> 5
Solicitud enviada a Recursos Humanos.
```

Luego, RRHH revisa y aprueba:

```
Opción: 6
Ingrese ID del empleado:
> 1111
Vacaciones aprobadas.
```

**Estado después:**

| Campo | Antes | Después |
|---|---|---|
| `estado` | `"Pendiente"` | `"Aprobada"` |
| `diasVacaciones` | `20` | `15` (20 − 5) |
| `historial` | `"Solicitud de vacaciones"` | `"Vacaciones aprobadas"` |

#### Ejemplo 2 — Solicitud rechazada

El empleado con ID 3333 solicita vacaciones:

```
(ID 3333, menú empleado)
Opción: 1
Dias disponibles: 10
Cantidad de dias a solicitar:
> 7
Solicitud enviada a Recursos Humanos.
```

RRHH revisa:

```
Opción: 6
Ingrese ID del empleado:
> 3333
Vacaciones rechazadas por politica de RRHH.
```

**¿Por qué se rechazó?**

| Criterio | Valor del empleado | Requisito | ¿Cumple? |
|---|---|---|---|
| Antigüedad | 1 año | ≥ 1 | ✅ |
| Horas | 35 | ≥ 35 | ✅ |
| Salario | 9000 | ≥ 8000 | ✅ |

> **Nota:** En este caso sí cumple. El rechazo ocurriría si, por ejemplo, el salario fuera 7000 o las horas 30.

#### Ejemplo 3 — Sin solicitud pendiente

```
Opción: 6
Ingrese ID del empleado:
> 5555
El empleado no tiene una solicitud pendiente.
```

---

### Opción 7: Salir

**¿Qué hace?**
Cierra la sesión de RRHH y regresa al menú principal de login.

```
Opción: 7
Cerrando sesion...
```

---

## 4. Escenario completo de uso

A continuación se muestra un ejemplo de flujo completo de trabajo:

```
--- INICIO ---
ID: 4444  → Accede al menú de RRHH

--- PASO 1: Ver reportes ---
Opción: 4  → Se muestran los 6 empleados iniciales

--- PASO 2: Un empleado solicita vacaciones ---
(ID 1111 solicita 5 días de vacaciones desde su menú)

--- PASO 3: RRHH aprueba la solicitud ---
Opción: 6
ID: 1111
→ "Vacaciones aprobadas." (salario 12000 >= 8000, horas 40 >= 35, antig. 3 >= 1)

--- PASO 4: Revisar historial del empleado ---
Opción: 5
ID: 1111
→ "Historial de Empleado 1: Vacaciones aprobadas"

--- PASO 5: Agregar un nuevo empleado ---
Opción: 1
ID: 7777, Nombre: "Juan Perez", Antig: 2, Salario: 11000, Horas: 40, Vac: 15

--- PASO 6: Ver reportes actualizados ---
Opción: 4  → Ahora se muestran 7 empleados

--- PASO 7: Salir ---
Opción: 7  → "Cerrando sesion..."
```

---

## 5. Resumen visual

```
MENU RECURSOS HUMANOS
│
├── 1. Agregar empleado
│       → Pide 6 datos → Asigna valores por defecto
│
├── 2. Modificar empleado
│       → Busca por ID → Pide nuevos datos → Actualiza
│
├── 3. Eliminar empleado
│       → Busca por ID → Desplaza arreglo → Reduce cantidad
│
├── 4. Reportes
│       → Recorre todo el arreglo → Muestra info completa
│
├── 5. Revisar historial
│       → Busca por ID → Muestra último historial
│
├── 6. Aprobar/Rechazar vacaciones
│       → Busca por ID → Verifica pendiente → Evalúa política
│       → Aprueba o rechaza → Actualiza estado y descuenta días
│
└── 7. Salir
        → Cierra sesión → Regresa al login
```

> 📊 Para ver el diagrama de flujo general del sistema en Mermaid, consulta [Diagrama_Flujo_Sistema.md](Diagrama_Flujo_Sistema.md).
> 📊 Para ver la estructura de arreglos, consulta [Diagrama_Estructura_Arreglos.md](Diagrama_Estructura_Arreglos.md).
