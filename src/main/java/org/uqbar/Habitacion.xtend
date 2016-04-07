package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Habitacion {

	String nombreHabitacion
	boolean first
	boolean last
	List<Accion> acciones
	
	new() {
		this.acciones = new ArrayList<Accion>
		this.first = false
		this.last = false
	}
	
	def void agregarAccion(Accion unaAccion) {
 		this.acciones.add(unaAccion)
	}
	
	def void eliminarAccion(Accion unaAccion) {
 		this.acciones.remove(unaAccion)
	}
	
	def getTodosLosItems() {
		var list = new ArrayList<String>()
		for(acc : acciones){
			list.add(acc.item)
		}
		list
	}
	
/* 
	def void setFirst(boolean bool){
		if(last && bool){

		} else {
			first = bool
		}
	}
	
	def void setLast(boolean bool){
		if(first && bool){

		} else {
			last = bool
		}
	
	} */
}