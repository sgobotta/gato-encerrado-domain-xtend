package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class IrAHabitacion extends Accion {
	
	new(String unNombre) {
		super(unNombre)
	}
	
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		unJugador.moverAHabitacion(unaHabitacion)
	}

}