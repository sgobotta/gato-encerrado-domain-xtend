package org.uqbar.acciones

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Habitacion
import org.uqbar.jugador.Jugador

@Accessors
class IrAHabitacion extends Accion {
	
	Habitacion habitacion

	new() {

	}
	
	// Hay que agregar lo que devuelve si hacemos que devuelva una RespuestaDeRealizarAccion 
	//(Tendríamos que armar la dependency del xtrest project)
	override realizarAccion(Habitacion habitacion, Jugador jugador) {
		jugador.moverAHabitacion(this.habitacion)
	}
	
	def setHabitacion(Habitacion hab){
		this.habitacion = hab
		setNombre("Ir a la habitacion "+ this.habitacion.nombreHabitacion)
	}

}