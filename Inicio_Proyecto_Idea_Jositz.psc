Algoritmo Inicio_Proyecto
	
	// ==========================================
	// VARIABLES
	// ==========================================
	
	Definir ids, antiguedad, diasVacaciones, diasSolicitados Como Entero
	Definir horas, salario Como Real
	Definir nombres, estado Como Caracter
	Definir id, opcion, i, pos, cantidad Como Entero
	Definir encontrado Como Logico
	
	// ==========================================
	// ARREGLOS
	// ==========================================
	
	Dimension ids[100]
	Dimension nombres[100]
	Dimension antiguedad[100]
	Dimension diasVacaciones[100]
	Dimension diasSolicitados[100]
	Dimension horas[100]
	Dimension salario[100]
	Dimension estado[100]
	
	// ==========================================
	// DATOS INICIALES
	// ==========================================
	
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
	FinPara
	
	
	// ==========================================
	// INICIO DEL SISTEMA
	// ==========================================
	
	Repetir
		
		Limpiar Pantalla
		
		Escribir "================================="
		Escribir "    SISTEMA DE RECURSOS HUMANOS"
		Escribir "================================="
		Escribir "Ingrese su ID:"
		Leer id
		
		encontrado <- Falso
		
		Para i <- 1 Hasta cantidad Hacer
			Si ids[i] = id Entonces
				encontrado <- Verdadero
				pos <- i
			FinSi
		FinPara
		
		
		Si encontrado Entonces
			
			// ==========================================
			// EMPLEADO
			// ==========================================
			
			Si id = 1111 O id = 2222 O id = 3333 Entonces
				
				Repetir
					
					Limpiar Pantalla
					
					Escribir "========= MENU EMPLEADO ========="
					Escribir "Bienvenido: ", nombres[pos]
					Escribir "1. Solicitar vacaciones"
					Escribir "2. Ver vacaciones"
					Escribir "3. Ver salario"
					Escribir "4. Ver informacion"
					Escribir "5. Salir"
					Leer opcion
					
					Segun opcion Hacer
						
						1:
							Escribir "Dias disponibles: ", diasVacaciones[pos]
							Escribir "Dias a solicitar:"
							Leer diasSolicitados[pos]
							
							Si diasSolicitados[pos] > 0 Y diasSolicitados[pos] <= diasVacaciones[pos] Entonces
								estado[pos] <- "Pendiente"
								Escribir "Solicitud enviada a Recursos Humanos."
							SiNo
								Escribir "Cantidad de dias no valida."
							FinSi
							
						2:
							Escribir "Estado: ", estado[pos]
							Escribir "Dias disponibles: ", diasVacaciones[pos]
							
						3:
							Escribir "Salario: L. ", salario[pos]
							Escribir "Horas trabajadas: ", horas[pos]
							
						4:
							Escribir "ID: ", ids[pos]
							Escribir "Nombre: ", nombres[pos]
							Escribir "Antiguedad: ", antiguedad[pos], " años"
							Escribir "Salario: L. ", salario[pos]
							Escribir "Horas: ", horas[pos]
							
						5:
							Escribir "Cerrando sesion..."
							
						De Otro Modo:
							Escribir "Opcion incorrecta."
							
					FinSegun
					
					Esperar Tecla
					
				Hasta Que opcion = 5
				
				
				// ==========================================
				// RECURSOS HUMANOS
				// ==========================================
				
			SiNo
				
				Si id = 4444 O id = 5555 Entonces
					
					Repetir
						
						Limpiar Pantalla
						
						Escribir "====== MENU RECURSOS HUMANOS ======"
						Escribir "1. Agregar empleado"
						Escribir "2. Modificar empleado"
						Escribir "3. Eliminar empleado"
						Escribir "4. Aceptar vacaciones"
						Escribir "5. Rechazar vacaciones"
						Escribir "6. Reportes"
						Escribir "7. Salir"
						Leer opcion
						
						Segun opcion Hacer
							
								// AGREGAR
							1:
								cantidad <- cantidad + 1
								
								Escribir "ID:"
								Leer ids[cantidad]
								
								Escribir "Nombre:"
								Leer nombres[cantidad]
								
								Escribir "Antiguedad:"
								Leer antiguedad[cantidad]
								
								Escribir "Salario:"
								Leer salario[cantidad]
								
								Escribir "Horas trabajadas:"
								Leer horas[cantidad]
								
								Escribir "Dias de vacaciones:"
								Leer diasVacaciones[cantidad]
								
								estado[cantidad] <- "Sin solicitud"
								diasSolicitados[cantidad] <- 0
								
								Escribir "Empleado agregado."
								
								
								// MODIFICAR
							2:
								Escribir "Ingrese ID:"
								Leer id
								
								Para i <- 1 Hasta cantidad Hacer
									Si ids[i] = id Entonces
										Escribir "Nuevo nombre:"
										Leer nombres[i]
										Escribir "Nuevo salario:"
										Leer salario[i]
										Escribir "Nuevas horas:"
										Leer horas[i]
										Escribir "Empleado modificado."
									FinSi
								FinPara
								
								
								// ELIMINAR
							3:
								Escribir "Ingrese ID:"
								Leer id
								
								Para i <- 1 Hasta cantidad Hacer
									Si ids[i] = id Entonces
										
										Para j <- i Hasta cantidad - 1 Hacer
											ids[j] <- ids[j+1]
											nombres[j] <- nombres[j+1]
											antiguedad[j] <- antiguedad[j+1]
											salario[j] <- salario[j+1]
											horas[j] <- horas[j+1]
											diasVacaciones[j] <- diasVacaciones[j+1]
											diasSolicitados[j] <- diasSolicitados[j+1]
											estado[j] <- estado[j+1]
										FinPara
										
										cantidad <- cantidad - 1
										Escribir "Empleado eliminado."
									FinSi
								FinPara
								
								
								// ACEPTAR VACACIONES
							4:
								Escribir "ID del empleado:"
								Leer id
								
								Para i <- 1 Hasta cantidad Hacer
									Si ids[i] = id Entonces
										
										Si estado[i] = "Pendiente" Entonces
											
											estado[i] <- "Aceptada"
											diasVacaciones[i] <- diasVacaciones[i] - diasSolicitados[i]
											
											Escribir "VACACIONES ACEPTADAS."
											Escribir "Dias restantes: ", diasVacaciones[i]
											
										SiNo
											Escribir "No tiene solicitud pendiente."
										FinSi
										
									FinSi
								FinPara
								
								
								// RECHAZAR VACACIONES
							5:
								Escribir "ID del empleado:"
								Leer id
								
								Para i <- 1 Hasta cantidad Hacer
									Si ids[i] = id Entonces
										
										Si estado[i] = "Pendiente" Entonces
											estado[i] <- "Rechazada"
											Escribir "VACACIONES RECHAZADAS."
										SiNo
											Escribir "No tiene solicitud pendiente."
										FinSi
										
									FinSi
								FinPara
								
								
								// REPORTES
							6:
								Escribir "========== REPORTES =========="
								
								Para i <- 1 Hasta cantidad Hacer
									
									Escribir "-----------------------------"
									Escribir "ID: ", ids[i]
									Escribir "Nombre: ", nombres[i]
									Escribir "Antiguedad: ", antiguedad[i], " años"
									Escribir "Salario: L. ", salario[i]
									Escribir "Horas: ", horas[i]
									Escribir "Dias vacaciones: ", diasVacaciones[i]
									Escribir "Estado: ", estado[i]
									
								FinPara
								
								
							7:
								Escribir "Cerrando sesion..."
								
							De Otro Modo:
								Escribir "Opcion incorrecta."
								
						FinSegun
						
						Esperar Tecla
						
					Hasta Que opcion = 7
					
					
					// ==========================================
					// ADMINISTRADOR
					// ==========================================
					
				SiNo
					
					Repetir
						
						Limpiar Pantalla
						
						Escribir "======= MENU ADMINISTRADOR ======="
						Escribir "1. Agregar empleado"
						Escribir "2. Modificar empleado"
						Escribir "3. Eliminar empleado"
						Escribir "4. Reportes"
						Escribir "5. Salir"
						Leer opcion
						
						Segun opcion Hacer
							
							1:
								Escribir "Agregar empleado."
								
							2:
								Escribir "Modificar empleado."
								
							3:
								Escribir "Eliminar empleado."
								
							4:
								Escribir "Mostrar reportes."
								
							5:
								Escribir "Cerrando sesion..."
								
							De Otro Modo:
								Escribir "Opcion incorrecta."
								
						FinSegun
						
						Esperar Tecla
						
					Hasta Que opcion = 5
					
				FinSi
				
			FinSi
			
		SiNo
			
			Escribir "ID incorrecto."
			Esperar Tecla
			
		FinSi
		
	Hasta Que Falso
	
FinAlgoritmo