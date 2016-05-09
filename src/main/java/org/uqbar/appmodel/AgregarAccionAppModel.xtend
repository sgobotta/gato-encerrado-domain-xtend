package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Laberinto
import org.uqbar.Habitacion
import org.uqbar.acciones.ActionAgregable
import org.uqbar.acciones.IrAHabitacion

@Observable
@Accessors
class AgregarAccionAppModel {
	
	Habitacion habitacionSeleccionada
	ActionAgregable objetoParaAgregarleAccion
	
	new(){
		
	}
	
	new(Habitacion habitacion, Habitacion habitacionAAgregarle) {
            habitacionSeleccionada = habitacion
            objetoParaAgregarleAccion = habitacionAAgregarle

}
	def agregarAccion(){
	    var acc = new IrAHabitacion()
	    acc.habitacion = habitacionSeleccionada
	    objetoParaAgregarleAccion.agregarAccion(acc)
	}
	
}