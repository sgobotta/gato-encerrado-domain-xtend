
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Accion {
	
	String nombre
	
	new(String unNombre) {
		this.nombre = unNombre
	}

	def abstract void realizarAccion(Habitacion unaHabitacion, Jugador unJugador) 
}