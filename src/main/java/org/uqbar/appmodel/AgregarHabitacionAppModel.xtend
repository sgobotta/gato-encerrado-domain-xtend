package org.uqbar.appmodel

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Laberinto
import org.uqbar.commons.model.UserException
import org.uqbar.Habitacion

@Observable
@Accessors
class AgregarHabitacionAppModel {
	String nombreHabitacion
	Laberinto laberintoSeleccionado
	
	Habitacion habitacionSeleccionada
	
	new() {
		
	}
	
	new(Laberinto laberinto) {
        this.laberintoSeleccionado = laberinto
	}
 
	
    def validar() {
        if (this.nombreHabitacion == null) {
            throw new UserException("Debe ingresar un nombre para la habitación")
        }

    }
	

    def agregarHabitacion() {
        this.validar()
        var hab = new Habitacion()
        hab.nombreHabitacion = nombreHabitacion
        laberintoSeleccionado.agregarHabitacion(hab)
    }

}
