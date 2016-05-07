package org.uqbar.acciones

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Habitacion
import org.uqbar.jugador.Jugador

@Accessors
class AgarrarItem extends Accion {

	String nombreItem
	
	new() {
	    
	}
	
	// RealizarAccion probablemente cambie en los proximos tps (UI WEB sobre todo)
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		 unJugador.agarrarItem(null)
		 unaHabitacion.eliminarAccion(this)
	}
	
	override getItem(){
		nombreItem
	}
	
	def setNombreItem(String itemName){
		this.nombreItem = itemName
		setNombre("Agarrar " +itemName)
	}
}