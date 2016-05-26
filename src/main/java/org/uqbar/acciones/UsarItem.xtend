package org.uqbar.acciones

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Habitacion
import org.uqbar.jugador.Jugador
import org.uqbar.jugador.Elemento

@Accessors
class UsarItem extends Accion implements ActionAgregable {
		
	Elemento item
	Accion accion

	new(){
		
	}	
	
	override realizarAccion(Habitacion habitacion, Jugador jugador) {
		if(jugador.tieneItem(item)){
			habitacion.agregarAccion(accion)
			jugador.eliminarItem(item)
			habitacion.eliminarAccion(this)
			var response = new RespuestaDeRealizarAccionModel(this.accion, this.item)
			response
		} else {
			var response = new RespuestaDeRealizarAccionModel("sinItem", this.item.nombre)
			response
		}
	}
	
	def setItem(Elemento item){
		this.item = item
		setNombre("Usar " +item.nombre)
	}
	
	override getItem(){
		accion.getItem()
	}
	
	override getItemName(){
		accion.getItemName()
	}
	
	override agregarAccion(Accion acc) {
		setAccion(acc)
	}
	
	def setAccion(Accion acc){
		this.accion = acc
		setNombre(getNombre + " para poder " + acc.getNombre)
	}
}