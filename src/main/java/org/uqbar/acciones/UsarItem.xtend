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
	
	// Hay que agregar lo que devuelve si hacemos que devuelva una RespuestaDeRealizarAccion 
	//(Tendríamos que armar la dependency del xtrest project)
	override realizarAccion(Habitacion habitacion, Jugador jugador) {
		if(jugador.tieneItem(item)){
		habitacion.agregarAccion(accion)
		jugador.eliminarItem(item)
		habitacion.eliminarAccion(this)
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
		setNombre(getNombre + " para " + acc.getNombre)
	}
}