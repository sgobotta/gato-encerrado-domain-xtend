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

	override realizarAccion(Habitacion habitacion, Jugador jugador) {
		 jugador.agarrarItem(item)
		 habitacion.eliminarAccion(this)
		 var response = new RespuestaDeRealizarAccionModel(item)
		 response
	}
	
	override getItemName(){
		item.nombre
	}
	
	def setItem(Elemento item){
		this.item = item
		setNombre("Agarrar " +item.nombre)
	}
}