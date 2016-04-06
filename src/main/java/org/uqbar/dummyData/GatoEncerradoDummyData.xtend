package org.uqbar.dummyData

import org.uqbar.Laberinto
import org.uqbar.Habitacion
import org.uqbar.Usuario

class GatoEncerradoDummyData {
	
	def crearUsuarioDummy(String nombreUsuario) {
		new Usuario(nombreUsuario) => [
			
			agregarLaberinto(crearLaberintoDummy("Cueva", "Entrada", "Pasillo", "Salida"))
			agregarLaberinto(crearLaberintoDummy("Bosque Oscuro", "Area arbolada", "Puente", "Cascada"))
		]
		
	}
	
	def crearLaberintoDummy(String nombreDeLaberinto, String nombreHabitacion1, String nombreHabitacion2, String nombreHabitacion3) {
		new Laberinto() => [
			nombreLaberinto = nombreDeLaberinto
			agregarHabitacion(crearHabitacion(nombreHabitacion1, true, false))
			agregarHabitacion(crearHabitacion(nombreHabitacion2, false, false))
			agregarHabitacion(crearHabitacion(nombreHabitacion3, false, true)) 
		]
	}
	
	
	def Habitacion crearHabitacion(String nombreDeHabitacion, Boolean esHabitacionInicial, Boolean esHabitacionFinal) {
		new Habitacion() => [
			nombreHabitacion = nombreDeHabitacion
			esInicial = esHabitacionInicial
			esFinal = esHabitacionFinal
		]
	}
	
}
