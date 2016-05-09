package org.uqbar.jugador

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.Habitacion

@Accessors
class Jugador {
	
	Habitacion habitacionActual
	List<Elemento> inventario
	
	new() {
		this.inventario = new ArrayList<Elemento>
	}
	
	def void moverAHabitacion(Habitacion unaHabitacion) {
		habitacionActual = unaHabitacion
	}
	
	// No mas de 15!
	def void agarrarItem(Elemento item) {
		inventario.add(item)
	}
	
	def void eliminarItem(Elemento item) {
		inventario.remove(item)
	}
	
	def tieneItem(Elemento item) {
		inventario.contains(item)
	}
	
}