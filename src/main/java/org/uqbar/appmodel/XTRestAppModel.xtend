package org.uqbar.appmodel

import org.uqbar.Usuario
import org.uqbar.jugador.Jugador
import org.uqbar.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors

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
    }

}