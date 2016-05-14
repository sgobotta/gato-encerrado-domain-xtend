package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Laberinto
import org.uqbar.Habitacion
import org.uqbar.acciones.ActionAgregable
import org.uqbar.commons.model.UserException
import org.uqbar.acciones.AgarrarItem
import org.uqbar.jugador.Elemento

@Observable
@Accessors
class AgregarAccionAgarrarElementoAppModel {
	
	Habitacion habitacionSeleccionada
	String nombreItem
	ActionAgregable objetoParaAgregarleAccion
	
	new(){
		
	}
		
    def validar() {
        if(nombreItem == null) {
            throw new UserException("Debe ingresar un nombre")
        }

    }
    
    def agregarAccion(){
        this.validar()
        var acc = new AgarrarItem()
        acc.item = new Elemento() => [
        	nombre = nombreItem
        ]
        objetoParaAgregarleAccion.agregarAccion(acc)
    }
    
}