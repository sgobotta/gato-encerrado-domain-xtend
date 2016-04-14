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
			
			laberintos.get(0).habitaciones.get(0).agregarAccion(crearAccionIrAHabitacion(laberintos.get(0).habitaciones.get(1)))
			laberintos.get(0).habitaciones.get(0).agregarAccion(crearAccionAgarrarItem("Comida"))
			
			laberintos.get(0).habitaciones.get(1).agregarAccion(crearAccionAgarrarItem("Herramienta"))
			laberintos.get(0).habitaciones.get(1).agregarAccion(crearAccionUsarItem("Herramienta", 
				crearAccionIrAHabitacion(laberintos.get(0).habitaciones.get(2))
			))
			
			laberintos.get(0).habitaciones.get(2).agregarAccion(crearAccionAgarrarItem("Llave"))
			
			agregarLaberinto(crearLaberintoDummy("Bosque Oscuro"))
			laberintos.get(1).agregarHabitacion(crearHabitacion("Area arbolada", true, false))
			laberintos.get(1).agregarHabitacion(crearHabitacion("Puente", false, false))
			laberintos.get(1).agregarHabitacion(crearHabitacion("Cascada", false, true))
			
			laberintos.get(1).habitaciones.get(0).agregarAccion(crearAccionIrAHabitacion(laberintos.get(1).habitaciones.get(1)))
			laberintos.get(1).habitaciones.get(0).agregarAccion(crearAccionAgarrarItem("Soga"))
			
			laberintos.get(1).habitaciones.get(1).agregarAccion(crearAccionAgarrarItem("Mapa"))
			laberintos.get(1).habitaciones.get(1).agregarAccion(crearAccionUsarItem("Soga", 
				crearAccionIrAHabitacion(laberintos.get(1).habitaciones.get(2))
			))
			
			laberintos.get(1).habitaciones.get(2).agregarAccion(crearAccionAgarrarItem("Anillo"))
			
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
	
	def Accion crearAccionAgarrarItem(String itemName) {
		new AgarrarItem() => [
			nombreItem = itemName
		]
	}
	
	def crearAccionIrAHabitacion(Habitacion hab) {
		new IrAHabitacion() => [
			habitacion = hab
		]
	}
	
	def crearAccionUsarItem(String itemm, Accion acc) {
		new UsarItem() => [
			item = itemm
			accion = acc
		]
	}
}
