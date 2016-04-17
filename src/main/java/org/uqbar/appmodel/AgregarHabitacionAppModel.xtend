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
	
	new() {
		
	}
    
    def validarInput(Habitacion habitacion) {
        if(this.nombreHabitacion == null) {
            throw new UserException("Debe ingresar un nombre para la habitación")
        }
        laberintoSeleccionado.agregarHabitacion(habitacion)
    }
    
}