package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import org.uqbar.jugador.Jugador
import org.uqbar.commons.model.ObservableUtils

@Accessors
@Observable
class Laberinto {
	
	String nombreLaberinto
	List<Habitacion> habitaciones
	Habitacion last
	Habitacion first
	Integer idLaberinto
	String imagePath
	Jugador jugador
	
	new() {
		this.habitaciones = new ArrayList<Habitacion>
	}
	
	def agregarHabitacion(Habitacion unaHabitacion) {
		habitaciones.add(unaHabitacion)
		ObservableUtils.firePropertyChanged(this, "habitaciones", habitaciones)
	}
	
	def eliminarHabitacion(Habitacion unaHabitacion) {
		habitaciones.remove(unaHabitacion)
	}
	
	def List<String> todosLosItems(){
		var list = new ArrayList<String>()
		for(hab : habitaciones){
			list.addAll(hab.todosLosItemNames)
		}
		return list
	}
	
	// Definí estos dos métodos para salir del paso con el pedido del
	// punto 2 del Servidor del TP2 aunque es confusa la menra en la que
	// se nos pide que debemos informar esto de alguna manera, porque éste
	// pequeño enunciado está adentro de los pedidos de lo que la "habitacion
	// debe tener"
	def Habitacion habitacionInicial() {
	    var Habitacion inicial = null
	    for(hab : habitaciones) {
	        if(hab.first) {
	            inicial = hab
	        }
	    }
	    return inicial
	}
	 
    def Habitacion habitacionFinal() {
        var Habitacion final = null
        for(hab : habitaciones) {
            if(hab.last) {
                final = hab
            }
        }
        return final
    }
}