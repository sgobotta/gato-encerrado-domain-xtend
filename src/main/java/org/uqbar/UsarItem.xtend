package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsarItem extends Accion {
		
	Item item
		
	new(String unNombre, Item unItem) {
		super(unNombre)
		this.item = unItem
	}
	
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		unaHabitacion.agregarAccion(item.getAccion())
		unJugador.eliminarItem(item)
	}
	
}