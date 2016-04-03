package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Jugador {
	
	Habitacion habitacionActual
	List<Item> inventario
	
	new() {
		this.inventario = new ArrayList<Item>
	}
	
	def void moverAHabitacion(Habitacion unaHabitacion) {
		habitacionActual = unaHabitacion
	}
	
	def void agarrarItem(Item item) {
		inventario.add(item)
	}
	
	def void eliminarItem(Item item) {
		inventario.remove(item)
	}
	
}