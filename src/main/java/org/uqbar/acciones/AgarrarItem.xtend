package org.uqbar.acciones

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Habitacion
import org.uqbar.jugador.Jugador
import org.uqbar.jugador.Elemento

@Accessors
class AgarrarItem extends Accion {

	Elemento item
	
	new() {
	    
	}
	
	// RealizarAccion probablemente cambie en los proximos tps (UI WEB sobre todo)
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		 unJugador.agarrarItem(null)
		 unaHabitacion.eliminarAccion(this)
	}
	
	override getItemName(){
		item.nombre
	}
	
	def setItem(Elemento item){
		this.item = item
		setNombre("Agarrar " +item.nombre)
	}
}