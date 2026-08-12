Algoritmo Inicio_Proyecto

    // ===================================================
    // BLOQUE 1: DEFINICION DE VARIABLES Y ARREGLOS
    // ===================================================
    Definir cantidad, i, j, opcion, id, pos, idBuscado Como Entero
    Definir encontrado Como Logico
    Definir nombres, estado, historial Como Caracter
    Definir ids, antiguedad, diasVacaciones, diasSolicitados Como Entero
    Definir horas, salario Como Real

    Dimension nombres[100], estado[100], historial[100]
    Dimension ids[100], antiguedad[100], diasVacaciones[100], diasSolicitados[100]
    Dimension horas[100], salario[100]

    // ===================================================
    // BLOQUE 2: CARGA INICIAL DE EMPLEADOS
    // ===================================================
    cantidad <- 6

    ids[1] <- 1111
    ids[2] <- 2222
    ids[3] <- 3333
    ids[4] <- 4444
    ids[5] <- 5555
    ids[6] <- 6666

    nombres[1] <- "Empleado 1"
    nombres[2] <- "Empleado 2"
    nombres[3] <- "Empleado 3"
    nombres[4] <- "RRHH 1"
    nombres[5] <- "RRHH 2"
    nombres[6] <- "Administrador"

    antiguedad[1] <- 3
    antiguedad[2] <- 2
    antiguedad[3] <- 1
    antiguedad[4] <- 4
    antiguedad[5] <- 5
    antiguedad[6] <- 6

    diasVacaciones[1] <- 20
    diasVacaciones[2] <- 15
    diasVacaciones[3] <- 10
    diasVacaciones[4] <- 15
    diasVacaciones[5] <- 15
    diasVacaciones[6] <- 20

    horas[1] <- 40
    horas[2] <- 40
    horas[3] <- 35
    horas[4] <- 40
    horas[5] <- 40
    horas[6] <- 40

    salario[1] <- 12000
    salario[2] <- 10000
    salario[3] <- 9000
    salario[4] <- 15000
    salario[5] <- 16000
    salario[6] <- 20000

    Para i <- 1 Hasta cantidad Hacer
        estado[i] <- "Sin solicitud"
        diasSolicitados[i] <- 0
        historial[i] <- "Sin historial"
    FinPara

    // ===================================================
    // BLOQUE 3: MENU PRINCIPAL DEL SISTEMA
    // ===================================================
    Repetir

        Limpiar Pantalla
        Escribir "========================================"
        Escribir "       SISTEMA DE GESTION RRHH"
        Escribir "========================================"
        Escribir "Ingrese su ID:"
        Leer id

        // Busca si el ID ingresado existe dentro del arreglo de empleados
        encontrado <- Falso
        pos <- -1

        Para i <- 1 Hasta cantidad Hacer
            Si ids[i] = id Entonces
                encontrado <- Verdadero
                pos <- i
            FinSi
        FinPara

        Si encontrado Entonces

            // Si el ID pertenece a un empleado regular, se abre su menú
            Si id = 1111 O id = 2222 O id = 3333 Entonces

                Repetir

                    Limpiar Pantalla
                    Escribir "========================================"
                    Escribir "            MENU EMPLEADO"
                    Escribir "========================================"
                    Escribir "Bienvenido: ", nombres[pos]
                    Escribir "1. Solicitar vacaciones"
                    Escribir "2. Ver vacaciones"
                    Escribir "3. Ver salario"
                    Escribir "4. Ver informacion"
                    Escribir "5. Ver historial"
                    Escribir "6. Salir"
                    Leer opcion

                    Segun opcion Hacer

                        1:
                            // Solicitud de vacaciones por parte del empleado
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

                        2:
                            // Consulta del estado actual de vacaciones
                            Escribir "Estado: ", estado[pos]
                            Escribir "Dias disponibles: ", diasVacaciones[pos]

                        3:
                            // Consulta de salario y horas trabajadas
                            Escribir "Salario: L. ", salario[pos]
                            Escribir "Horas trabajadas: ", horas[pos]

                        4:
                            // Información personal del empleado
                            Escribir "ID: ", ids[pos]
                            Escribir "Nombre: ", nombres[pos]
                            Escribir "Antiguedad: ", antiguedad[pos], " años"
                            Escribir "Salario: L. ", salario[pos]
                            Escribir "Horas: ", horas[pos]

                        5:
                            // Historial del empleado
                            Escribir "Historial: "
                            Escribir historial[pos]

                        6:
                            // Cierre de sesión
                            Escribir "Cerrando sesion..."

                        De Otro Modo:
                            Escribir "Opcion incorrecta."

                    FinSegun

                    Esperar Tecla

                Hasta Que opcion = 6

            SiNo

                // Si el ID pertenece al personal de RRHH, se abre el panel administrativo
                Si id = 4444 O id = 5555 O id = 6666 Entonces

                    Repetir

                        Limpiar Pantalla
                        Escribir "========================================"
                        Escribir "         MENU RECURSOS HUMANOS"
                        Escribir "========================================"
                        Escribir "1. Agregar empleado"
                        Escribir "2. Modificar empleado"
                        Escribir "3. Eliminar empleado"
                        Escribir "4. Reportes"
                        Escribir "5. Revisar historial"
                        Escribir "6. Aprobar o rechazar vacaciones"
                        Escribir "7. Salir"
                        Leer opcion

                        Segun opcion Hacer

                            1:
                                // Agregar un nuevo empleado al sistema
                                cantidad <- cantidad + 1
                                Escribir "Ingrese ID:"
                                Leer ids[cantidad]
                                Escribir "Ingrese nombre:"
                                Leer nombres[cantidad]
                                Escribir "Ingrese antiguedad:"
                                Leer antiguedad[cantidad]
                                Escribir "Ingrese salario:"
                                Leer salario[cantidad]
                                Escribir "Ingrese horas trabajadas:"
                                Leer horas[cantidad]
                                Escribir "Ingrese dias de vacaciones:"
                                Leer diasVacaciones[cantidad]
                                estado[cantidad] <- "Sin solicitud"
                                diasSolicitados[cantidad] <- 0
                                historial[cantidad] <- "Empleado registrado"
                                Escribir "Empleado agregado."

                            2:
                                // Modificar la información de un empleado existente
                                Escribir "Ingrese ID del empleado a modificar:"
                                Leer idBuscado
                                pos <- -1
                                Para i <- 1 Hasta cantidad Hacer
                                    Si ids[i] = idBuscado Entonces
                                        pos <- i
                                    FinSi
                                FinPara

                                Si pos <> -1 Entonces
                                    Escribir "Nuevo nombre:"
                                    Leer nombres[pos]
                                    Escribir "Nueva antiguedad:"
                                    Leer antiguedad[pos]
                                    Escribir "Nuevo salario:"
                                    Leer salario[pos]
                                    Escribir "Nuevas horas:"
                                    Leer horas[pos]
                                    Escribir "Nuevo total de vacaciones:"
                                    Leer diasVacaciones[pos]
                                    historial[pos] <- "Datos modificados"
                                    Escribir "Empleado modificado."
                                SiNo
                                    Escribir "Empleado no encontrado."
                                FinSi

                            3:
                                // Eliminar un empleado del sistema
                                Escribir "Ingrese ID a eliminar:"
                                Leer idBuscado
                                pos <- -1
                                Para i <- 1 Hasta cantidad Hacer
                                    Si ids[i] = idBuscado Entonces
                                        pos <- i
                                    FinSi
                                FinPara

                                Si pos <> -1 Entonces
                                    Para j <- pos Hasta cantidad - 1 Hacer
                                        ids[j] <- ids[j + 1]
                                        nombres[j] <- nombres[j + 1]
                                        antiguedad[j] <- antiguedad[j + 1]
                                        diasVacaciones[j] <- diasVacaciones[j + 1]
                                        diasSolicitados[j] <- diasSolicitados[j + 1]
                                        horas[j] <- horas[j + 1]
                                        salario[j] <- salario[j + 1]
                                        estado[j] <- estado[j + 1]
                                        historial[j] <- historial[j + 1]
                                    FinPara
                                    cantidad <- cantidad - 1
                                    Escribir "Empleado eliminado."
                                SiNo
                                    Escribir "Empleado no encontrado."
                                FinSi

                            4:
                                // Reportes generales del personal
                                Escribir "========== REPORTES =========="
                                Para i <- 1 Hasta cantidad Hacer
                                    Escribir "----------------------------------------"
                                    Escribir "ID: ", ids[i]
                                    Escribir "Nombre: ", nombres[i]
                                    Escribir "Antiguedad: ", antiguedad[i], " años"
                                    Escribir "Salario: L. ", salario[i]
                                    Escribir "Horas: ", horas[i]
                                    Escribir "Vacaciones disponibles: ", diasVacaciones[i]
                                    Escribir "Estado: ", estado[i]
                                FinPara

                            5:
                                // Consulta del historial de un empleado particular
                                Escribir "Ingrese ID del empleado:"
                                Leer idBuscado
                                pos <- -1
                                Para i <- 1 Hasta cantidad Hacer
                                    Si ids[i] = idBuscado Entonces
                                        pos <- i
                                    FinSi
                                FinPara

                                Si pos <> -1 Entonces
                                    Escribir "Historial de ", nombres[pos], ":"
                                    Escribir historial[pos]
                                SiNo
                                    Escribir "Empleado no encontrado."
                                FinSi

                            6:
                                // Validacion de aprobacion o rechazo de vacaciones
                                Escribir "Ingrese ID del empleado:"
                                Leer idBuscado
                                pos <- -1
                                Para i <- 1 Hasta cantidad Hacer
                                    Si ids[i] = idBuscado Entonces
                                        pos <- i
                                    FinSi
                                FinPara

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

                            7:
                                // Salir del panel administrativo
                                Escribir "Cerrando sesion..."

                            De Otro Modo:
                                Escribir "Opcion incorrecta."

                        FinSegun

                        Esperar Tecla

                    Hasta Que opcion = 7

                SiNo
                    Escribir "Usuario no autorizado."
                    Esperar Tecla
                FinSi

            FinSi

        SiNo
            Escribir "ID incorrecto."
            Esperar Tecla
        FinSi

    Hasta Que Falso

FinAlgoritmo
