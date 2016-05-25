package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
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
		ObservableUtils.firePropertyChanged(this, "habitaciones", habitaciones)
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
}