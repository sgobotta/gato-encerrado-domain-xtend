package org.uqbar.acciones

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Habitacion
import org.uqbar.Jugador

@Accessors
@Observable
abstract class Accion {
	
	String nombre
	
	new(){
		// Agregado para cumplir con Java Bean
	}

	def abstract void realizarAccion(Habitacion unaHabitacion, Jugador unJugador)
	
	def String getItem(){
		null
	}
	
}