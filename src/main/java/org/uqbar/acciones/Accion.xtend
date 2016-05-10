package org.uqbar.acciones

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Habitacion
import org.uqbar.jugador.Jugador
import org.uqbar.jugador.Elemento

@Accessors
@Observable
abstract class Accion {
	
	Integer id
	String nombre
	
	new(){
		// Agregado para cumplir con Java Bean
	}

	def abstract void realizarAccion(Habitacion unaHabitacion, Jugador unJugador)
	
	def Elemento getItem(){
		null
	}
	
	def String getItemName(){
		null
	}
	
}