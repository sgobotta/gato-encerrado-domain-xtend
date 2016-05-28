package org.uqbar.appmodel

import org.uqbar.Usuario
import org.uqbar.jugador.Jugador
import org.uqbar.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Habitacion
import org.uqbar.acciones.Accion
import org.uqbar.acciones.RespuestaDeRealizarAccionModel
import org.uqbar.exceptions.ActionIsNotOnThisRoomException
import org.uqbar.exceptions.PlayerIsNotOnThisRoomException

@Accessors
class XTRestAppModel {
    
    Usuario usuario
    Jugador jugador
    Laberinto laberintoActual

	def nuevoJuego(Laberinto laberinto, Jugador jugador){
		this.laberintoActual = laberinto;
		this.jugador = jugador;
		this.jugador.habitacionActual = laberintoActual.getHabitacionInicial
	}

    def RespuestaDeRealizarAccionModel realizarAccion(int idHabitacion, int idAccion) {

		var accion = findAccionById(idAccion)
		
		if(accion != null && this.jugador.habitacionActual.id == idHabitacion){
			accion.realizarAccion(jugador.habitacionActual, jugador)
		} else if(this.jugador.habitacionActual.id != idHabitacion){
			throw new PlayerIsNotOnThisRoomException()
		} else {
			throw new ActionIsNotOnThisRoomException()			
		}
    }
    
    // Horrible, lo sé, pero es lo único que se me ocurrió
    def findAccionById(int id){
		var Accion res = null
		for(acc : jugador.habitacionActual.acciones){
			if(acc.id == id){
				res = acc
			}
		}
    	res
    }

}