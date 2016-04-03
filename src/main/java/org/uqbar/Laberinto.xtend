package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Laberinto {
	
	String nombre
	List<Habitacion> habitaciones
	
	
	new(String unNombre) {
		this.nombre = unNombre
		this.habitaciones = new ArrayList<Habitacion>
	}
	
	def agregarHabitacion(Habitacion unaHabitacion) {
		habitaciones.add(unaHabitacion)
	}
	
	def eliminarHabitacion(Habitacion unaHabitacion) {
		habitaciones.remove(unaHabitacion)
	}
	
	def marcarHabitacionComoInicial(Habitacion unaHabitacion){
		unaHabitacion.esInicial = true
	}
	def marcarHabitacionComoFinal(Habitacion unaHabitacion){
		unaHabitacion.esFinal = true
	}
	
}