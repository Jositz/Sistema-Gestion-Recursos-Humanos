# Documentación — Menú de Empleado

---

## 1. Acceso al menú

Para acceder al panel de empleado se debe iniciar sesión con uno de los IDs autorizados:

| ID | Nombre |
|---|---|
| `1111` | Empleado 1 |
| `2222` | Empleado 2 |
| `3333` | Empleado 3 |

Si se ingresa un ID no válido, el sistema muestra **"ID incorrecto"** o **"Usuario no autorizado"** y regresa al inicio.

### Ejemplo de acceso

```
========================================
       SISTEMA DE GESTION RRHH
========================================
Ingrese su ID:
> 1111
```

Al acceder, el sistema muestra el nombre del empleado en la bienvenida:

```
========================================
            MENU EMPLEADO
========================================
Bienvenido: Empleado 1
1. Solicitar vacaciones
2. Ver vacaciones
3. Ver salario
4. Ver informacion
5. Ver historial
6. Salir
```

---

## 2. Datos iniciales de cada empleado

Antes de interactuar con el menú, cada empleado cuenta con los siguientes valores por defecto:

| ID | Nombre | Antig. | Salario | Horas | Vacaciones | Estado | Historial |
|---|---|---|---|---|---|---|---|
| 1111 | Empleado 1 | 3 años | L. 12,000 | 40 | 20 días | Sin solicitud | Sin historial |
| 2222 | Empleado 2 | 2 años | L. 10,000 | 40 | 15 días | Sin solicitud | Sin historial |
| 3333 | Empleado 3 | 1 año | L. 9,000 | 35 | 10 días | Sin solicitud | Sin historial |

---

## 3. Opciones del menú

```
========================================
            MENU EMPLEADO
========================================
1. Solicitar vacaciones
2. Ver vacaciones
3. Ver salario
4. Ver informacion
5. Ver historial
6. Salir
```

---

## 4. Detalle de cada opción con ejemplos

### Opción 1: Solicitar vacaciones

**¿Qué hace?**
Muestra los días de vacaciones disponibles y pide al empleado cuántos días desea solicitar. Si la cantidad es válida (mayor a 0 y sin exceder los disponibles), la solicitud queda en estado `"Pendiente"` y se envía a RRHH para su revisión.

**Validación:**

| Condición | Resultado |
|---|---|
| `días solicitados > 0` **Y** `días solicitados ≤ días disponibles` | ✅ Solicitud aceptada → Estado = `"Pendiente"` |
| Cualquier otro valor | ❌ "Cantidad de días no valida" |

**Ejemplo 1 — Solicitud válida:**

```
Opción: 1
Dias disponibles: 20
Cantidad de dias a solicitar:
> 5
Solicitud enviada a Recursos Humanos.
```

**Estado después:**

| Campo | Antes | Después |
|---|---|---|
| `diasSolicitados` | `0` | `5` |
| `estado` | `"Sin solicitud"` | `"Pendiente"` |
| `historial` | `"Sin historial"` | `"Solicitud de vacaciones"` |
| `diasVacaciones` | `20` | `20` *(no se descuenta aún, se descuenta cuando RRHH aprueba)* |

**Ejemplo 2 — Solicitud con cantidad inválida (0 o negativa):**

```
Opción: 1
Dias disponibles: 20
Cantidad de dias a solicitar:
> 0
Cantidad de dias no valida.
```

**Ejemplo 3 — Solicitud que excede los disponibles:**

```
Opción: 1
Dias disponibles: 10
Cantidad de dias a solicitar:
> 15
Cantidad de dias no valida.
```

**¿Qué pasa después?**
La solicitud queda en `"Pendiente"` hasta que un usuario de RRHH (IDs 4444, 5555, 6666) la revise desde la **opción 6 de su menú**. Dependiendo de los criterios de la empresa, la solicitud será aprobada o rechazada.

---

### Opción 2: Ver vacaciones

**¿Qué hace?**
Muestra el estado actual de la solicitud de vacaciones y los días que aún le quedan disponibles.

**Ejemplo 1 — Sin solicitud activa:**

```
Opción: 2
Estado: Sin solicitud
Dias disponibles: 20
```

**Ejemplo 2 — Solicitud pendiente (después de usar la opción 1):**

```
Opción: 2
Estado: Pendiente
Dias disponibles: 20
```

**Ejemplo 3 — Solicitud aprobada por RRHH:**

```
Opción: 2
Estado: Aprobada
Dias disponibles: 15
```

> Los días se redujeron de 20 a 15 porque RRHH aprobó 5 días de vacaciones.

**Ejemplo 4 — Solicitud rechazada por RRHH:**

```
Opción: 2
Estado: Rechazada
Dias disponibles: 20
```

> Los días no se descuentan porque la solicitud fue rechazada.

---

### Opción 3: Ver salario

**¿Qué hace?**
Muestra el salario mensual y las horas trabajadas por semana del empleado.

**Ejemplo — Empleado 1:**

```
Opción: 3
Salario: L. 12000
Horas trabajadas: 40
```

**Ejemplo — Empleado 3:**

```
Opción: 3
Salario: L. 9000
Horas trabajadas: 35
```

---

### Opción 4: Ver información

**¿Qué hace?**
Muestra la información personal y laboral completa del empleado: ID, nombre, antigüedad, salario y horas.

**Ejemplo — Empleado 1:**

```
Opción: 4
ID: 1111
Nombre: Empleado 1
Antiguedad: 3 años
Salario: L. 12000
Horas: 40
```

**Ejemplo — Empleado 2:**

```
Opción: 4
ID: 2222
Nombre: Empleado 2
Antiguedad: 2 años
Salario: L. 10000
Horas: 40
```

---

### Opción 5: Ver historial

**¿Qué hace?**
Muestra la última acción que se ha registrado sobre el empleado. El historial se actualiza cuando:

- Se solicitan vacaciones → `"Solicitud de vacaciones"`
- RRHH aprueba → `"Vacaciones aprobadas"`
- RRHH rechaza → `"Vacaciones rechazadas por politica"`

**Ejemplo 1 — Sin actividad:**

```
Opción: 5
Historial:
Sin historial
```

**Ejemplo 2 — Después de solicitar vacaciones:**

```
Opción: 5
Historial:
Solicitud de vacaciones
```

**Ejemplo 3 — Después de que RRHH aprueba:**

```
Opción: 5
Historial:
Vacaciones aprobadas
```

**Ejemplo 4 — Después de que RRHH rechaza:**

```
Opción: 5
Historial:
Vacaciones rechazadas por politica
```

---

### Opción 6: Salir

**¿Qué hace?**
Cierra la sesión del empleado y regresa al menú principal de login.

```
Opción: 6
Cerrando sesion...
```

---

## 5. Escenarios completos de uso

### Escenario 1 — Solicitud de vacaciones exitosa

```
--- ACCESO ---
ID: 1111  → "Bienvenido: Empleado 1"

--- VERIFICAR DÍAS DISPONIBLES ---
Opción: 2
Estado: Sin solicitud
Dias disponibles: 20

--- SOLICITAR 5 DÍAS DE VACACIONES ---
Opción: 1
Dias disponibles: 20
Cantidad de dias a solicitar: 5
Solicitud enviada a Recursos Humanos.

--- VERIFICAR ESTADO ---
Opción: 2
Estado: Pendiente
Dias disponibles: 20

--- VER HISTORIAL ---
Opción: 5
Historial: Solicitud de vacaciones

--- ESPERAR A QUE RRHH APRUEBE...

--- VERIFICAR DESPUÉS DE APROBACIÓN ---
Opción: 2
Estado: Aprobada
Dias disponibles: 15

--- VER HISTORIAL ACTUALIZADO ---
Opción: 5
Historial: Vacaciones aprobadas

--- SALIR ---
Opción: 6
Cerrando sesion...
```

**Resumen de cambios:**

| Campo | Inicio | Después de solicitar | Después de aprobar RRHH |
|---|---|---|---|
| `diasVacaciones` | 20 | 20 | **15** |
| `diasSolicitados` | 0 | **5** | 5 |
| `estado` | `"Sin solicitud"` | `"Pendiente"` | `"Aprobada"` |
| `historial` | `"Sin historial"` | `"Solicitud de vacaciones"` | `"Vacaciones aprobadas"` |

---

### Escenario 2 — Solicitud rechazada

```
--- ACCESO ---
ID: 3333  → "Bienvenido: Empleado 3"

--- SOLICITAR 7 DÍAS DE VACACIONES ---
Opción: 1
Dias disponibles: 10
Cantidad de dias a solicitar: 7
Solicitud enviada a Recursos Humanos.

--- ESPERAR A QUE RRHH EVALÚE...

--- RRHH RECHAZA (no cumple política) ---

--- VERIFICAR ESTADO ---
Opción: 2
Estado: Rechazada
Dias disponibles: 10

--- VER HISTORIAL ---
Opción: 5
Historial: Vacaciones rechazadas por politica
```

**¿Por qué se rechazó?**

| Criterio | Valor del empleado 3 | Requisito | ¿Cumple? |
|---|---|---|---|
| Antigüedad | 1 año | ≥ 1 | ✅ |
| Horas | 35 | ≥ 35 | ✅ |
| Salario | L. 9,000 | ≥ L. 8,000 | ✅ |

> En este caso sí cumple. El rechazo ocurriría si, por ejemplo, el salario fuera menor a L. 8,000 o las horas menores a 35.

---

### Escenario 3 — Solicitud inválida

```
--- ACCESO ---
ID: 2222  → "Bienvenido: Empleado 2"

--- INTENTAR SOLICITAR MÁS DÍAS DE LOS DISPONIBLES ---
Opción: 1
Dias disponibles: 15
Cantidad de dias a solicitar: 20
Cantidad de dias no valida.

--- INTENTAR SOLICITAR 0 DÍAS ---
Opción: 1
Dias disponibles: 15
Cantidad de dias a solicitar: 0
Cantidad de dias no valida.
```

---

## 6. Flujo completo de una solicitud de vacaciones

```
EMPLEADO                          RRHH
   │                                │
   │  1. Solicita vacaciones        │
   │     estado → "Pendiente"       │
   │───────────────────────────────►│
   │                                │
   │  2. Consulta estado            │
   │     → "Pendiente"              │
   │                                │
   │                     3. RRHH revisa
   │                        ¿Cumple política?
   │                                │
   │     ┌──────────────┬───────────┤
   │     │              │           │
   │     ▼              ▼           │
   │  APROBADA     RECHAZADA       │
   │  se descuentan  no se         │
   │  los días       descuenta     │
   │                                │
   │  4. Empleado consulta          │
   │     estado actualizado         │
   │◄───────────────────────────────│
```

---

## 7. Resumen visual

```
MENU EMPLEADO
│
├── 1. Solicitar vacaciones
│       → Muestra días disponibles
│       → Pide cantidad a solicitar
│       → Valida: > 0 y ≤ disponibles
│       → Si es válida → estado = "Pendiente"
│       → Si no es válida → mensaje de error
│
├── 2. Ver vacaciones
│       → Muestra estado actual
│       → Muestra días disponibles
│
├── 3. Ver salario
│       → Muestra salario mensual
│       → Muestra horas trabajadas
│
├── 4. Ver información
│       → Muestra ID, nombre, antigüedad
│       → Muestra salario y horas
│
├── 5. Ver historial
│       → Muestra última acción registrada
│       → Se actualiza según actividad
│
└── 6. Salir
        → Cierra sesión → Regresa al login
```

---

## 8. Estados posibles de vacaciones

| Estado | Significado | ¿Quién lo cambia? |
|---|---|---|
| `"Sin solicitud"` | El empleado no ha pedido vacaciones | Valor inicial del sistema |
| `"Pendiente"` | Solicitud enviada, esperando revisión | El empleado (opción 1) |
| `"Aprobada"` | RRHH aprobó la solicitud | RRHH (opción 6) |
| `"Rechazada"` | RRHH rechazó la solicitud | RRHH (opción 6) |

---

## 9. Transiciones de estado

```
                    Empleado solicita
                    (opción 1)
"Sin solicitud" ──────────────────► "Pendiente"
                                         │
                           RRHH aprueba  │  RRHH rechaza
                           (opción 6)    │  (opción 6)
                                         ▼
                                    ┌────┴────┐
                                    │         │
                                    ▼         ▼
                              "Aprobada"  "Rechazada"
```

> **Nota:** El estado no puede regresar a `"Sin solicitud"` sin que RRHH modifique los datos del empleado (opción 2 de menú RRHH).

> 📊 Para ver el diagrama de flujo completo en Mermaid, consulta [Diagrama_Aprobacion_Vacaciones.md](Diagrama_Aprobacion_Vacaciones.md).
> 📊 Para ver el diagrama general del sistema, consulta [Diagrama_Flujo_Sistema.md](Diagrama_Flujo_Sistema.md).
> 📊 Para ver la estructura de arreglos, consulta [Diagrama_Estructura_Arreglos.md](Diagrama_Estructura_Arreglos.md).
