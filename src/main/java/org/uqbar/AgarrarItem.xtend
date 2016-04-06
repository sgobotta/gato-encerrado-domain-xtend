package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AgarrarItem extends Accion {

	String item
	
	new(String unNombre, String unItem) {
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