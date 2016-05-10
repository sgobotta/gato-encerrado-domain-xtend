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
	
	// Probablemente cambie cuando avancemos en los proximos tps (UI WEB sobre todo)
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		if(unJugador.tieneItem(null)){
		unaHabitacion.agregarAccion(accion)
		unJugador.eliminarItem(null)
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