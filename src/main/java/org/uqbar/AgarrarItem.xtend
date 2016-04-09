package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AgarrarItem extends Accion {

	String nombreItem
	
	new(String unNombre, String unItem) {
		super(unNombre)
		this.nombreItem = unItem			
	}
	
	new(String unNombre) {
		super(unNombre)
	}
	
	new() {
	    
	}
	
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		 unJugador.agarrarItem(item)
		 unaHabitacion.eliminarAccion(this)
	}
	
	override getItem(){
		nombreItem
	}
	
}