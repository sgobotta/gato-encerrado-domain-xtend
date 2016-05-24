package org.uqbar.appmodel

import org.uqbar.Usuario
import org.uqbar.jugador.Jugador
import org.uqbar.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Habitacion
import org.uqbar.acciones.Accion

@Accessors
class XTRestAppModel {
    
    Usuario usuario
    Jugador jugador
    Laberinto laberintoActual

    def realizarAccion(int idHabitacion, int idAccion) {
        
//        Juanma lo entiende
//        accion = R.findAccionByid(idAccion)
//        
//        accion.realizarAccion(R.findHabitacionOById(idHabitacion), this.jugador)

		var accion = findAccionById(idAccion)
		var habitacion = findHabitacionById(idHabitacion)
		
		if(accion != null && habitacion != null){
			accion.realizarAccion(habitacion, jugador)
		} else {
			// Exception?
		}
    }
    
    // Horrible, lo sé, pero es lo único que se me ocurrió
    def findAccionById(int id){
		var Accion res = null
    	for(hab : laberintoActual.habitaciones){
    		for(acc : hab.acciones){
    			if(acc.id == id){
    				res = acc
    			}
    		}
    	}
    	res
    }
    
    def findHabitacionById(int id){
		var Habitacion res = null
    	for(hab : laberintoActual.habitaciones){
    		if(hab.id == id){
    			res = hab
    		}
    	}
    	res
    }

}