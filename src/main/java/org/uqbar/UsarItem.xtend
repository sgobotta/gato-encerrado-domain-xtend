package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsarItem extends Accion {
		
	String item
	Accion accion
		
	new(String unNombre, String unItem, Accion unaAccion) {
		super(unNombre)
		this.item = unItem
		this.accion = unaAccion
	}
	
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		if(unJugador.tieneItem(item)){
		unaHabitacion.agregarAccion(accion)
		unJugador.eliminarItem(item)
		}
	}
	
}