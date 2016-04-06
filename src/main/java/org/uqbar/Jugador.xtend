package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Jugador {
	
	Habitacion habitacionActual
	List<String> inventario
	
	new() {
		this.inventario = new ArrayList<String>
	}
	
	def void moverAHabitacion(Habitacion unaHabitacion) {
		habitacionActual = unaHabitacion
	}
	
	def void agarrarItem(String item) {
		inventario.add(item)
	}
	
	def void eliminarItem(String item) {
		inventario.remove(item)
	}
	
	def tieneItem(String item) {
		inventario.contains(item)
	}
	
}