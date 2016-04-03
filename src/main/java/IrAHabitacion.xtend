
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Mover extends Accion {
	
	new(String unNombre) {
		super(unNombre)
	}
	
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		unJugador.moverAHabitacion(unaHabitacion)
	}

}