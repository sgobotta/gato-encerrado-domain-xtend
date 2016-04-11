package org.uqbar.dummyData

import org.uqbar.Laberinto
import org.uqbar.Habitacion
import org.uqbar.Usuario
import org.uqbar.Accion
import org.uqbar.AgarrarItem
import org.uqbar.IrAHabitacion
import org.uqbar.UsarItem

class GatoEncerradoDummyData {
	
	def crearUsuarioDummy(String nombreUsuario) {
		new Usuario(nombreUsuario) => [
			
			password = "1234"
			
			agregarLaberinto(crearLaberintoDummy("Cueva"))
			laberintos.get(0).agregarHabitacion(crearHabitacion("Entrada", true, false))
			laberintos.get(0).agregarHabitacion(crearHabitacion("Pasillo", false, false))
			laberintos.get(0).agregarHabitacion(crearHabitacion("Salida", false, true))
			
			laberintos.get(0).habitaciones.get(0).agregarAccion(crearAccionIrAHabitacionItem("Ir a habitación - Pasillo"))
			laberintos.get(0).habitaciones.get(0).agregarAccion(crearAccionAgarrarItem("Agarrar comida", "Comida"))
			
			laberintos.get(0).habitaciones.get(1).agregarAccion(crearAccionIrAHabitacionItem("Ir a habitación - Salida"))
			laberintos.get(0).habitaciones.get(1).agregarAccion(crearAccionAgarrarItem("Agarrar herramienta", "Herramienta"))
			laberintos.get(0).habitaciones.get(1).agregarAccion(crearAccionUsarItem("Usa herramienta pasa a Salida"))
			
			laberintos.get(0).habitaciones.get(2).agregarAccion(crearAccionAgarrarItem("Agarrar llave", "Llave"))
			
			agregarLaberinto(crearLaberintoDummy("Bosque Oscuro"))
			laberintos.get(1).agregarHabitacion(crearHabitacion("Area arbolada", true, false))
			laberintos.get(1).agregarHabitacion(crearHabitacion("Puente", false, false))
			laberintos.get(1).agregarHabitacion(crearHabitacion("Cascada", true, false))
			
			laberintos.get(1).habitaciones.get(0).agregarAccion(crearAccionIrAHabitacionItem("Ir a habitación - Puente"))
			laberintos.get(1).habitaciones.get(0).agregarAccion(crearAccionAgarrarItem("Agarrar soga", "Soga"))
			
			laberintos.get(1).habitaciones.get(1).agregarAccion(crearAccionIrAHabitacionItem("Ir a habitación - Cascada"))
			laberintos.get(1).habitaciones.get(1).agregarAccion(crearAccionAgarrarItem("Agarrar mapa", "Mapa"))
			laberintos.get(1).habitaciones.get(1).agregarAccion(crearAccionUsarItem("Usa soga pasa a Cascada"))
			
			laberintos.get(1).habitaciones.get(2).agregarAccion(crearAccionAgarrarItem("Agarrar anillo", "Anillo"))
			
		]
		
	}
	
	def crearLaberintoDummy(String nombreDeLaberinto) {
		new Laberinto() => [
			nombreLaberinto = nombreDeLaberinto
			 
		]
	}
	
	def Habitacion crearHabitacion(String nombreDeHabitacion, Boolean esHabitacionInicial, Boolean esHabitacionFinal) {
		new Habitacion() => [
			nombreHabitacion = nombreDeHabitacion
			first = esHabitacionInicial
			last = esHabitacionFinal
		]
	}
	
	def Accion crearAccionAgarrarItem(String nombreDeAccion, String nombreItem) {
		new AgarrarItem(nombreItem)
	}
	
	def crearAccionIrAHabitacionItem(String nombreDeAccion) {
		new IrAHabitacion(nombreDeAccion)
	}
	
	def crearAccionUsarItem(String nombreDeAccion) {
		new UsarItem(nombreDeAccion)
	}
}
