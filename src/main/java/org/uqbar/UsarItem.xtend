package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsarItem extends Accion implements ActionAgregable {
		
	String item
	Accion accion

	new(){
		
	}	
	
	// Probablemente cambie cuando avancemos en los proximos tps (UI WEB sobre todo)
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		if(unJugador.tieneItem(item)){
		unaHabitacion.agregarAccion(accion)
		unJugador.eliminarItem(item)
		}
	}
	
	def setItem(String item){
		this.item = item
		setNombre("Usar " +item)
	}
	
	override agregarAccion(Accion acc) {
		setAccion(acc)
	}
	
	def setAccion(Accion acc){
		this.accion = acc
		setNombre(getNombre+ " para " + acc.getNombre)
	}
}