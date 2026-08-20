# Diagrama de Flujo General — Sistema de Gestión RRHH

---

## 1. Flujo principal del sistema (Mermaid)

```mermaid
flowchart TD
    START([ INICIO]) --> INIT[Declarar variables y arreglos]
    INIT --> LOAD[Cargar 6 empleados iniciales]
    LOAD --> LOOP([ CICLO PRINCIPAL])

    LOOP --> CLEAR[Limpiar pantalla]
    CLEAR --> LOGIN[Mostrar pantalla de login]
    LOGIN --> READ_ID[Leer ID del usuario]

    READ_ID --> SEARCH[Buscar ID en arreglo ids]
    SEARCH --> FOUND{¿ID encontrado?}

    FOUND -- No --> ERR1[/ ID incorrecto/]
    ERR1 --> WAIT1[Esperar tecla]
    WAIT1 --> LOOP

    FOUND -- Sí --> TYPE{¿Tipo de usuario?}

    TYPE -- "IDs 1111, 2222, 3333\n(Empleado)" --> EMP_MENU
    TYPE -- "IDs 4444, 5555, 6666\n(RRHH)" --> RRHH_MENU
    TYPE -- "Otro ID\n(no autorizado)" --> ERR2[/ Usuario no autorizado/]
    ERR2 --> WAIT2[Esperar tecla]
    WAIT2 --> LOOP

    EMP_MENU([ MENÚ EMPLEADO]) --> EMP_OPT{Opción}

    EMP_OPT -- "1. Solicitar vacaciones" --> E1[Solicitar vacaciones]
    EMP_OPT -- "2. Ver vacaciones" --> E2[Ver estado de vacaciones]
    EMP_OPT -- "3. Ver salario" --> E3[Ver salario y horas]
    EMP_OPT -- "4. Ver información" --> E4[Ver info personal]
    EMP_OPT -- "5. Ver historial" --> E5[Ver historial]
    EMP_OPT -- "6. Salir" --> E6[Cerrar sesión]
    EMP_OPT -- "Otra" --> E_ERR[/Opción incorrecta/]

    E1 --> E_WAIT
    E2 --> E_WAIT
    E3 --> E_WAIT
    E4 --> E_WAIT
    E5 --> E_WAIT
    E_ERR --> E_WAIT
    E_WAIT[Esperar tecla] --> E_LOOP{¿Opción = 6?}
    E_LOOP -- No --> EMP_MENU
    E_LOOP -- Sí --> LOOP

    RRHH_MENU([ MENÚ RRHH]) --> RRHH_OPT{Opción}

    RRHH_OPT -- "1. Agregar empleado" --> R1[Agregar empleado]
    RRHH_OPT -- "2. Modificar empleado" --> R2[Modificar empleado]
    RRHH_OPT -- "3. Eliminar empleado" --> R3[Eliminar empleado]
    RRHH_OPT -- "4. Reportes" --> R4[Ver reportes]
    RRHH_OPT -- "5. Revisar historial" --> R5[Revisar historial]
    RRHH_OPT -- "6. Aprobar/Rechazar vacaciones" --> R6[Aprobar/Rechazar vacaciones]
    RRHH_OPT -- "7. Salir" --> R7[Cerrar sesión]
    RRHH_OPT -- "Otra" --> R_ERR[/Opción incorrecta/]

    R1 --> R_WAIT
    R2 --> R_WAIT
    R3 --> R_WAIT
    R4 --> R_WAIT
    R5 --> R_WAIT
    R6 --> R_WAIT
    R_ERR --> R_WAIT
    R_WAIT[Esperar tecla] --> R_LOOP{¿Opción = 7?}
    R_LOOP -- No --> RRHH_MENU
    R_LOOP -- Sí --> LOOP

    style START fill:#4CAF50,color:#fff
    style LOOP fill:#FF9800,color:#fff
    style EMP_MENU fill:#2196F3,color:#fff
    style RRHH_MENU fill:#9C27B0,color:#fff
    style ERR1 fill:#f44336,color:#fff
    style ERR2 fill:#f44336,color:#fff
    style E_ERR fill:#f44336,color:#fff
    style R_ERR fill:#f44336,color:#fff
    style E6 fill:#9E9E9E,color:#fff
    style R7 fill:#9E9E9E,color:#fff
```

---

## 2. Detalle del menú de Empleado (Mermaid)

```mermaid
flowchart TD
    EM([ MENÚ EMPLEADO\nBienvenido: nombre]) --> OPT{Selecciona opción}

    OPT -- 1 --> V1[Mostrar días disponibles]
    V1 --> V1B[Leer cantidad a solicitar]
    V1B --> V1C{¿> 0 y ≤ disponibles?}

    V1C -- Sí --> V1D[estado = Pendiente]
    V1D --> V1E[historial = Solicitud de vacaciones]
    V1E --> V1F[/Solicitud enviada a RRHH/]

    V1C -- No --> V1G[/Cantidad no válida/]

    OPT -- 2 --> V2[Mostrar estado y días disponibles]

    OPT -- 3 --> V3[Mostrar salario y horas]

    OPT -- 4 --> V4[Mostrar ID, nombre, antigüedad,\nsalario, horas]

    OPT -- 5 --> V5[Mostrar historial]

    OPT -- 6 --> V6[/Cerrando sesión/]

    OPT -- Otra --> VE[/Opción incorrecta/]

    V1F --> DONE
    V1G --> DONE
    V2 --> DONE
    V3 --> DONE
    V4 --> DONE
    V5 --> DONE
    VE --> DONE

    DONE[Esperar tecla] --> CHK{¿Opción = 6?}
    CHK -- No --> EM
    CHK -- Sí --> EXIT([ Regresar al login])

    style EM fill:#2196F3,color:#fff
    style EXIT fill:#9E9E9E,color:#fff
    style V1F fill:#4CAF50,color:#fff
    style V1G fill:#f44336,color:#fff
    style VE fill:#f44336,color:#fff
    style V6 fill:#9E9E9E,color:#fff
```

---

## 3. Detalle del menú de RRHH (Mermaid)

```mermaid
flowchart TD
    RM([ MENÚ RECURSOS HUMANOS]) --> OPT{Selecciona opción}

    OPT -- 1 --> A1[Leer datos del nuevo empleado]
    A1 --> A2[cantidad = cantidad + 1]
    A2 --> A3[Asignar estado, historial por defecto]
    A3 --> A4[/Empleado agregado/]

    OPT -- 2 --> B1[Leer ID a modificar]
    B1 --> B2[Buscar ID en arreglo]
    B2 --> B3{¿Encontrado?}
    B3 -- Sí --> B4[Leer nuevos datos]
    B4 --> B5[historial = Datos modificados]
    B5 --> B6[/Empleado modificado/]
    B3 -- No --> B7[/Empleado no encontrado/]

    OPT -- 3 --> C1[Leer ID a eliminar]
    C1 --> C2[Buscar ID en arreglo]
    C2 --> C3{¿Encontrado?}
    C3 -- Sí --> C4[Desplazar arreglo hacia atrás]
    C4 --> C5[cantidad = cantidad - 1]
    C5 --> C6[/Empleado eliminado/]
    C3 -- No --> C7[/Empleado no encontrado/]

    OPT -- 4 --> D1[Recorrer todo el arreglo]
    D1 --> D2[Mostrar info de cada empleado]

    OPT -- 5 --> E1[Leer ID del empleado]
    E1 --> E2[Buscar ID en arreglo]
    E2 --> E3{¿Encontrado?}
    E3 -- Sí --> E4[Mostrar historial]
    E3 -- No --> E5[/Empleado no encontrado/]

    OPT -- 6 --> F1[Leer ID del empleado]
    F1 --> F2[Buscar ID en arreglo]
    F2 --> F3{¿Encontrado?}
    F3 -- No --> F4[/Empleado no encontrado/]
    F3 -- Sí --> F5{¿Estado = Pendiente?}
    F5 -- No --> F6[/No tiene solicitud pendiente/]
    F5 -- Sí --> F7{¿Cumple política?\nantigüedad ≥ 1\nhoras ≥ 35\nsalario ≥ 8000}
    F7 -- Sí --> F8[estado = Aprobada]
    F8 --> F9[diasVacaciones -= diasSolicitados]
    F9 --> F10[/Vacaciones aprobadas/]
    F7 -- No --> F11[estado = Rechazada]
    F11 --> F12[/Vacaciones rechazadas/]

    OPT -- 7 --> G1[/Cerrando sesión/]
    OPT -- Otra --> GE[/Opción incorrecta/]

    A4 --> DONE
    B6 --> DONE
    B7 --> DONE
    C6 --> DONE
    C7 --> DONE
    D2 --> DONE
    E4 --> DONE
    E5 --> DONE
    F4 --> DONE
    F6 --> DONE
    F10 --> DONE
    F12 --> DONE
    GE --> DONE

    DONE[Esperar tecla] --> CHK{¿Opción = 7?}
    CHK -- No --> RM
    CHK -- Sí --> EXIT([ Regresar al login])

    style RM fill:#9C27B0,color:#fff
    style EXIT fill:#9E9E9E,color:#fff
    style F10 fill:#4CAF50,color:#fff
    style F12 fill:#f44336,color:#fff
    style F4 fill:#f44336,color:#fff
    style F6 fill:#FF9800,color:#fff
    style B7 fill:#f44336,color:#fff
    style C7 fill:#f44336,color:#fff
    style E5 fill:#f44336,color:#fff
    style GE fill:#f44336,color:#fff
    style G1 fill:#9E9E9E,color:#fff
```

---

## 4. Diagrama de secuencia completo (Mermaid)

```mermaid
sequenceDiagram
    autonumber
    participant U as  Usuario
    participant S as  Sistema
    participant DB as  Arreglos

    Note over S, DB: INICIALIZACIÓN
    S->>DB: Declarar variables y arreglos [100]
    S->>DB: Cargar 6 empleados iniciales
    S->>DB: Asignar estado, historial por defecto

    loop Ciclo principal (infinito)
        Note over U, DB: LOGIN
        U->>S: Ingresar ID
        S->>DB: Buscar ID en arreglo ids[]
        DB-->>S: pos (índice o -1)

        alt ID no encontrado
            S->>U:  ID incorrecto
        else ID válido
            alt IDs 1111, 2222, 3333 (Empleado)
                loop Menú Empleado (hasta opción 6)
                    U->>S: Seleccionar opción
                    alt Opción 1: Solicitar vacaciones
                        S->>DB: Leer días disponibles
                        DB-->>S: diasVacaciones[pos]
                        U->>S: Cantidad a solicitar
                        alt Válido (> 0 y ≤ disponibles)
                            S->>DB: estado[pos] = "Pendiente"
                            S->>DB: historial[pos] = "Solicitud de vacaciones"
                            S->>U:  Solicitud enviada a RRHH
                        else Inválido
                            S->>U:  Cantidad no válida
                        end
                    else Opción 2: Ver vacaciones
                        S->>DB: Leer estado y días
                        DB-->>S: estado, diasVacaciones
                        S->>U: Mostrar información
                    else Opción 3: Ver salario
                        S->>DB: Leer salario y horas
                        DB-->>S: salario, horas
                        S->>U: Mostrar salario y horas
                    else Opción 4: Ver información
                        S->>DB: Leer todos los datos
                        DB-->>S: ids, nombres, antigüedad, salario, horas
                        S->>U: Mostrar info completa
                    else Opción 5: Ver historial
                        S->>DB: Leer historial
                        DB-->>S: historial[pos]
                        S->>U: Mostrar historial
                    else Opción 6: Salir
                        S->>U: Cerrando sesión
                    end
                end

            else IDs 4444, 5555, 6666 (RRHH)
                loop Menú RRHH (hasta opción 7)
                    U->>S: Seleccionar opción
                    alt Opción 1: Agregar empleado
                        U->>S: Datos del nuevo empleado
                        S->>DB: cantidad += 1
                        S->>DB: Guardar en posición [cantidad]
                        S->>U:  Empleado agregado
                    else Opción 2: Modificar empleado
                        U->>S: ID a modificar
                        S->>DB: Buscar ID
                        alt Encontrado
                            U->>S: Nuevos datos
                            S->>DB: Actualizar campos
                            S->>U:  Empleado modificado
                        else No encontrado
                            S->>U:  Empleado no encontrado
                        end
                    else Opción 3: Eliminar empleado
                        U->>S: ID a eliminar
                        S->>DB: Buscar ID
                        alt Encontrado
                            S->>DB: Desplazar arreglo
                            S->>DB: cantidad -= 1
                            S->>U:  Empleado eliminado
                        else No encontrado
                            S->>U:  Empleado no encontrado
                        end
                    else Opción 4: Reportes
                        S->>DB: Recorrer todo el arreglo
                        DB-->>S: Info de todos los empleados
                        S->>U: Mostrar reportes
                    else Opción 5: Revisar historial
                        U->>S: ID del empleado
                        S->>DB: Buscar ID
                        DB-->>S: historial[pos]
                        S->>U: Mostrar historial
                    else Opción 6: Aprobar/Rechazar vacaciones
                        U->>S: ID del empleado
                        S->>DB: Buscar ID
                        alt Encontrado y Pendiente
                            S->>S: Evaluar política
                            alt Cumple (antigüedad ≥ 1, horas ≥ 35, salario ≥ 8000)
                                S->>DB: estado = "Aprobada"
                                S->>DB: diasVacaciones -= diasSolicitados
                                S->>DB: historial = "Vacaciones aprobadas"
                                S->>U:  Vacaciones aprobadas
                            else No cumple
                                S->>DB: estado = "Rechazada"
                                S->>DB: historial = "Rechazadas por politica"
                                S->>U:  Vacaciones rechazadas
                            end
                        else Sin solicitud o no encontrado
                            S->>U: Mensaje informativo
                        end
                    else Opción 7: Salir
                        S->>U: Cerrando sesión
                    end
                end

            else Otro ID
                S->>U:  Usuario no autorizado
            end
        end
    end
```

---

## 5. Diagrama de datos — Estructura de arreglos (Mermaid)

```mermaid
flowchart LR
    subgraph ARRAYS [" ARREGLOS DEL SISTEMA"]
        direction TB
        A1["ids[1..100]"]
        A2["nombres[1..100]"]
        A3["antiguedad[1..100]"]
        A4["salario[1..100]"]
        A5["horas[1..100]"]
        A6["diasVacaciones[1..100]"]
        A7["diasSolicitados[1..100]"]
        A8["estado[1..100]"]
        A9["historial[1..100]"]
    end

    subgraph INDICE [" INDICE = pos"]
        POS["Cada posición [pos]\nrepresenta a un empleado"]
    end

    POS --> A1
    POS --> A2
    POS --> A3
    POS --> A4
    POS --> A5
    POS --> A6
    POS --> A7
    POS --> A8
    POS --> A9

    style ARRAYS fill:#E3F2FD
    style INDICE fill:#FFF3E0
```

---

## 6. Diagrama de acceso por ID (Mermaid)

```mermaid
flowchart TD
    START([Usuario ingresa ID]) --> SEARCH[Buscar en arreglo ids]
    SEARCH --> CHECK{¿Existe?}

    CHECK -- No --> ERR[/ ID incorrecto/]

    CHECK -- Sí --> RANGE{¿Rango del ID?}

    RANGE -- "1111 - 3333" --> EMP[ Menú Empleado\n6 opciones]
    RANGE -- "4444 - 6666" --> RRHH[ Menú RRHH\n7 opciones]
    RANGE -- "Otro" --> UNAUTH[/ No autorizado/]

    EMP --> E_OPTS
    subgraph E_OPTS ["OPCIONES EMPLEADO"]
        EO1[1. Solicitar vacaciones]
        EO2[2. Ver vacaciones]
        EO3[3. Ver salario]
        EO4[4. Ver información]
        EO5[5. Ver historial]
        EO6[6. Salir]
    end

    RRHH --> R_OPTS
    subgraph R_OPTS ["OPCIONES RRHH"]
        RO1[1. Agregar empleado]
        RO2[2. Modificar empleado]
        RO3[3. Eliminar empleado]
        RO4[4. Reportes]
        RO5[5. Revisar historial]
        RO6[6. Aprobar/Rechazar vac.]
        RO7[7. Salir]
    end

    EO6 --> BACK([ Regresar al login])
    RO7 --> BACK
    ERR --> BACK
    UNAUTH --> BACK

    style START fill:#4CAF50,color:#fff
    style EMP fill:#2196F3,color:#fff
    style RRHH fill:#9C27B0,color:#fff
    style ERR fill:#f44336,color:#fff
    style UNAUTH fill:#f44336,color:#fff
    style BACK fill:#9E9E9E,color:#fff
```

---

## 7. Leyenda de colores

| Color | Significado |
|---|---|
|  Verde | Inicio / Éxito / Aprobado |
|  Azul | Menú de Empleado |
|  Morado | Menú de RRHH |
|  Naranja | Ciclo principal / Advertencia |
|  Gris | Salir / Cerrar sesión |
|  Rojo | Error / Rechazado / No encontrado |
