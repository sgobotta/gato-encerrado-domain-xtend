package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IrAHabitacion extends Accion {
	
	Habitacion habitacion

	new() {

	}
	
	// realizarAccion vamos a tener que cambiarlo cuando hagamos el UI web.
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		unJugador.moverAHabitacion(unaHabitacion)
	}
	
	def setHabitacion(Habitacion hab){
		habitacion = hab
		setNombre("Ir a la habitacion "+habitacion.nombreHabitacion)
	}

}