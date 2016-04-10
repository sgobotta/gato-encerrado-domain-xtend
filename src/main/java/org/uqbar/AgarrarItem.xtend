package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class AgarrarItem extends Accion {

	String nombreItem
	
	new(String unItem) {
		this.setNombreItem(unItem)			
	}
		
	new() {
	    
	}
	
	// RealizarAccion probablemente cambie en los proximos tps (UI WEB sobre todo)
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		 unJugador.agarrarItem(item)
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