# Diagrama de Flujo — Proceso de Aprobación de Vacaciones

---

## 1. Diagrama de flujo general (Mermaid)

```mermaid
flowchart TD
    A([Inicio: Empleado solicita vacaciones]) --> B[Mostrar días disponibles]
    B --> C{¿Cantidad solicitada > 0\ny ≤ días disponibles?}

    C -- No --> D[/Cantidad no válida/]
    D --> A

    C -- Sí --> E[estado = Pendiente]
    E --> F[historial = Solicitud de vacaciones]
    F --> G[/Solicitud enviada a RRHH/]

    G --> H([RRHH revisa la solicitud])
    H --> I[Buscar empleado por ID]
    I --> J{¿Empleado existe?}

    J -- No --> K[/Empleado no encontrado/]
    K --> H

    J -- Sí --> L{¿Estado = Pendiente?}

    L -- No --> M[/No tiene solicitud pendiente/]
    M --> H

    L -- Sí --> N{¿Cumple política?\nantigüedad ≥ 1\nhoras ≥ 35\nsalario ≥ 8000}

    N -- Sí --> O[estado = Aprobada]
    O --> P[diasVacaciones = diasVacaciones − diasSolicitados]
    P --> Q[historial = Vacaciones aprobadas]
    Q --> R[/Vacaciones aprobadas/]

    N -- Sí no --> S[estado = Rechazada]
    S --> T[historial = Vacaciones rechazadas por politica]
    T --> U[/Vacaciones rechazadas/]

    R --> V([Fin])
    U --> V

    style A fill:#4CAF50,color:#fff
    style H fill:#2196F3,color:#fff
    style V fill:#9E9E9E,color:#fff
    style D fill:#f44336,color:#fff
    style K fill:#f44336,color:#fff
    style M fill:#FF9800,color:#fff
    style U fill:#f44336,color:#fff
    style R fill:#4CAF50,color:#fff
```

---

## 2. Diagrama de estados de vacaciones (Mermaid)

```mermaid
stateDiagram-v2
    [*] --> Sin_solicitud: Sistema inicia

    Sin_solicitud --> Pendiente: Empleado solicita vacaciones

    Pendiente --> Aprobada: RRHH aprueba
    Pendiente --> Rechazada: RRHH rechaza

    Aprobada --> Pendiente: Empleado solicita de nuevo
    Rechazada --> Pendiente: Empleado solicita de nuevo

    note right of Sin_solicitud
        Valor inicial
        diasSolicitados = 0
    end note

    note right of Pendiente
        Esperando revisión
        de RRHH
    end note

    note right of Aprobada
        Se descuentan
        los días solicitados
    end note

    note right of Rechazada
        No se descuentan
        los días
    end note
```

---

## 3. Diagrama de interacción Empleado ↔ RRHH (Mermaid)

```mermaid
sequenceDiagram
    autonumber
    participant E as Empleado
    participant S as Sistema
    participant R as RRHH

    E->>S: Ingresa ID (ej: 1111)
    S->>S: Valida ID en arreglo
    S->>E: Bienvenida + Menú

    E->>S: Opción 1: Solicitar vacaciones
    S->>E: Días disponibles: 20

    E->>S: Cantidad a solicitar: 5
    S->>S: Valida: 5 > 0 y 5 ≤ 20 
    S->>S: estado = "Pendiente"
    S->>S: historial = "Solicitud de vacaciones"
    S->>E: Solicitud enviada a RRHH

    R->>S: Opción 6: Revisar vacaciones
    S->>R: Ingrese ID del empleado
    R->>S: 1111
    S->>S: Busca empleado → pos = 1

    alt Estado = Pendiente y cumple política
        S->>S: antigüedad(3) ≥ 1 
        S->>S: horas(40) ≥ 35 
        S->>S: salario(12000) ≥ 8000 
        S->>S: estado = "Aprobada"
        S->>S: diasVacaciones = 20 − 5 = 15
        S->>S: historial = "Vacaciones aprobadas"
        S->>R: Vacaciones aprobadas
    else Estado = Pendiente y NO cumple política
        S->>S: estado = "Rechazada"
        S->>S: historial = "Vacaciones rechazadas por politica"
        S->>R: Vacaciones rechazadas
    else No tiene solicitud pendiente
        S->>R: No tiene solicitud pendiente
    end

    E->>S: Opción 2: Ver vacaciones
    S->>E: Estado: Aprobada | Días: 15

    E->>S: Opción 5: Ver historial
    S->>E: Historial: Vacaciones aprobadas
```

---

## 4. Diagrama de decisión de política (Mermaid)

```mermaid
flowchart LR
    A([RRHH evalúa solicitud]) --> B{antigüedad ≥ 1\naño?}

    B -- No --> R[/RECHAZADA\npor antigüedad/]
    B -- Sí --> C{horas ≥ 35\nsemana?}

    C -- No --> R2[/RECHAZADA\npor horas/]
    C -- Sí --> D{salario ≥\nL. 8,000?}

    D -- No --> R3[/RECHAZADA\npor salario/]
    D -- Sí --> A2[/APROBADA\nSe descuentan días/]

    style A fill:#2196F3,color:#fff
    style A2 fill:#4CAF50,color:#fff
    style R fill:#f44336,color:#fff
    style R2 fill:#f44336,color:#fff
    style R3 fill:#f44336,color:#fff
```

---

## 5. Ejemplo visual completo

```mermaid
flowchart TD
    subgraph EMPLEADO [" MENÚ EMPLEADO"]
        E1[Empleado 1 - ID: 1111] --> E2[Solicita 5 días de vacaciones]
        E2 --> E3[Estado: Pendiente]
    end

    subgraph RRHH [" MENÚ RRHH"]
        R1[RRHH revisa solicitud] --> R2{Evalúa política}
        R2 -->|Aprueba| R3[Estado: Aprobada]
        R2 -->|Rechaza| R4[Estado: Rechazada]
    end

    E3 --> R1
    R3 --> E5[Empleado consulta → Estado: Aprobada\ndías: 20 → 15]
    R4 --> E6[Empleado consulta → Estado: Rechazada\ndías: 20 (sin cambio)]

    style E1 fill:#4CAF50,color:#fff
    style R3 fill:#4CAF50,color:#fff
    style R4 fill:#f44336,color:#fff
```

---

## 6. Código PSeInt correspondiente

### Bloque de solicitud (Empleado)

```pseint
// Opción 1 del menú empleado
Escribir "Dias disponibles: ", diasVacaciones[pos]
Escribir "Cantidad de dias a solicitar:"
Leer diasSolicitados[pos]

Si diasSolicitados[pos] > 0 Y diasSolicitados[pos] <= diasVacaciones[pos] Entonces
    estado[pos] <- "Pendiente"
    historial[pos] <- "Solicitud de vacaciones"
    Escribir "Solicitud enviada a Recursos Humanos."
SiNo
    Escribir "Cantidad de dias no valida."
FinSi
```

### Bloque de aprobación/rechazo (RRHH)

```pseint
// Opción 6 del menú RRHH
Si pos <> -1 Entonces
    Si estado[pos] = "Pendiente" Entonces
        Si antiguedad[pos] >= 1 Y horas[pos] >= 35 Y salario[pos] >= 8000 Entonces
            estado[pos] <- "Aprobada"
            diasVacaciones[pos] <- diasVacaciones[pos] - diasSolicitados[pos]
            historial[pos] <- "Vacaciones aprobadas"
            Escribir "Vacaciones aprobadas."
        SiNo
            estado[pos] <- "Rechazada"
            historial[pos] <- "Vacaciones rechazadas por politica"
            Escribir "Vacaciones rechazadas por politica de RRHH."
        FinSi
    SiNo
        Escribir "El empleado no tiene una solicitud pendiente."
    FinSi
SiNo
    Escribir "Empleado no encontrado."
FinSi
```

---

## 7. Resumen de criterios

| # | Criterio | Expresión | Ejemplo pasa | Ejemplo no pasa |
|---|---|---|---|---|
| 1 | Antigüedad | `antigüedad ≥ 1` | Empleado 1 (3 años)  | Nuevo empleado (0 años)  |
| 2 | Horas | `horas ≥ 35` | Empleado 1 (40 hrs)  | Empleado a tiempo parcial (30 hrs)  |
| 3 | Salario | `salario ≥ 8000` | Empleado 1 (12000)  | Empleado nuevo (7000)  |

> **Nota:** Los tres criterios deben cumplirse simultáneamente. Si alguno falla, la solicitud es rechazada.
