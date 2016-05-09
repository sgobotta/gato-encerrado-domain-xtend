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
    
    def validarInput(Habitacion habitacion) {
        if(this.nombreHabitacion == null) {
            throw new UserException("Debe ingresar un nombre para la habitación")
        }

    }
	
	def agregarHabitacion() {
		var nuevaHabitacion = new Habitacion()
		nuevaHabitacion.nombreHabitacion =  this.nombreHabitacion
		this.validarInput(nuevaHabitacion)
        laberintoSeleccionado.agregarHabitacion(nuevaHabitacion)		
	}
	
    }