package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Habitacion {

	String nombreHabitacion
	boolean esInicial
	boolean esFinal
	List<Accion> acciones
	List<Item> items
	
	new() {
		this.acciones = new ArrayList<Accion>
		this.items = new ArrayList<Item>
		this.esInicial = false
		this.esFinal = false
	}
	
	def void agregarAccion(Accion unaAccion) {
 		this.acciones.add(unaAccion)
	}
	
	def void eliminarAccion(Accion unaAccion) {
 		this.acciones.remove(unaAccion)
	}
	
	def void agregarItem(Item unItem) {
		this.items.add(unItem)
	}
	
	def void eliminarItem(Item unItem) {
		this.items.remove(unItem)
	}
}