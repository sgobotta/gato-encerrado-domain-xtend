package org.uqbar.appmodel

import org.uqbar.Usuario
import org.uqbar.jugador.Jugador
import org.uqbar.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.acciones.Accion
import org.uqbar.acciones.RespuestaDeRealizarAccionModel
import org.uqbar.exceptions.ActionIsNotOnThisRoomException
import org.uqbar.exceptions.PlayerIsNotOnThisRoomException
import org.uqbar.exceptions.UserDoesNotHaveLabException
import org.uqbar.exceptions.UserCantExecuteActionException

@Accessors
class XTRestAppModel {
    
    Usuario usuario
    Jugador jugador
    Laberinto laberintoActual

	def nuevoJuego(Usuario usuario, Laberinto laberinto, Jugador jugador){
		if(usuario.hasLabOfId(laberinto.idLaberinto)){
			this.usuario = usuario
			this.laberintoActual = laberinto
			this.jugador = jugador
			this.jugador.habitacionActual = laberintoActual.getHabitacionInicial
		} else {
			throw new UserDoesNotHaveLabException
		}
	}

	def RespuestaDeRealizarAccionModel realizarAccion(int idHabitacion, int idAccion, int idUsuario){
		if(this.usuario.id == idUsuario){
			this.realizarAccion(idHabitacion, idAccion)
		} else {
			throw new UserCantExecuteActionException
		}
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