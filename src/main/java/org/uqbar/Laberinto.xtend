package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Laberinto {
	
	String nombreLaberinto
	List<Habitacion> habitaciones
	Integer idLaberinto
	String imagePath
	
	new() {
		this.habitaciones = new ArrayList<Habitacion>
	}
	
	def agregarHabitacion(Habitacion unaHabitacion) {
		habitaciones.add(unaHabitacion)
	}
	
	def eliminarHabitacion(Habitacion unaHabitacion) {
		habitaciones.remove(unaHabitacion)
	}
	
	def List<String> todosLosItems(){
		var list = new ArrayList<String>()
		for(hab : habitaciones){
			list.addAll(hab.todosLosItemNames)
		}
		return list
	}
	
	def getHabitacionInicial(){
		var Habitacion res = null;
		for(hab : this.habitaciones){
			if(hab.first){
				res = hab
			}
		}
		return res
	}
}