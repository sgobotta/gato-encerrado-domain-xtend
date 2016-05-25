package org.uqbar.acciones

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Habitacion
import org.uqbar.jugador.Jugador

@Accessors
class IrAHabitacion extends Accion {
	
	Habitacion habitacion

	new() {

	}
	
	override realizarAccion(Habitacion habitacion, Jugador jugador) {
		jugador.moverAHabitacion(this.habitacion)
		if(this.habitacion.last){
			var response = new RespuestaDeRealizarAccionModel("ganar")
			response
		} else {
			var response = new RespuestaDeRealizarAccionModel(this.habitacion.id)
			response
		}
	}
	
	def setHabitacion(Habitacion hab){
		this.habitacion = hab
		setNombre("Ir a la habitacion "+ this.habitacion.nombreHabitacion)
	}

}