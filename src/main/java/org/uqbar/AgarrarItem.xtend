package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AgarrarItem extends Accion {

	Item item
	
	new(String unNombre, Item unItem) {
		super(unNombre)
		this.item = unItem			
	}
	
	new(String unNombre) {
		super(unNombre)
	}
	
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		 unaHabitacion.eliminarItem(item)
		 unJugador.agarrarItem(item)
	}
	
}