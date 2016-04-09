package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Laberinto {
	
	String nombreLaberinto
	List<Habitacion> habitaciones
	Habitacion last
	Habitacion first
	
	
	new() {
		this.habitaciones = new ArrayList<Habitacion>
	}
	
	def agregarHabitacion(Habitacion unaHabitacion) {
//		if((unaHabitacion.isFirst && first == null) || 
//			(unaHabitacion.isLast && last == null) || 
//			(!unaHabitacion.isFirst && !unaHabitacion.isLast)){
		habitaciones.add(unaHabitacion)
//		}
	}
	
	def eliminarHabitacion(Habitacion unaHabitacion) {
		habitaciones.remove(unaHabitacion)
	}
	/* 
	def marcarHabitacionComoInicial(Habitacion unaHabitacion){
		unaHabitacion.first = true
	}
	def marcarHabitacionComoFinal(Habitacion unaHabitacion){
		unaHabitacion.last = true
	}
	*/
	
	def List<String> todosLosItems(){
		var list = new ArrayList<String>()
		for(hab : habitaciones){
			list.addAll(hab.todosLosItems)
		}
		return list
	}

}