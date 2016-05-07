package org.uqbar.acciones

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Habitacion
import org.uqbar.jugador.Jugador

@Accessors
class UsarItem extends Accion implements ActionAgregable {
		
	String item
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
	
	def setItem(String item){
		this.item = item
		setNombre("Usar " +item)
	}
	
	override getItem(){
		accion.getItem()
	}
	
	override agregarAccion(Accion acc) {
		setAccion(acc)
	}
	
	def setAccion(Accion acc){
		this.accion = acc
		setNombre(getNombre + " para " + acc.getNombre)
	}
}