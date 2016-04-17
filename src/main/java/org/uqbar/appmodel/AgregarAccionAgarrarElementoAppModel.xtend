package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Laberinto
import org.uqbar.Habitacion
import org.uqbar.acciones.ActionAgregable
import org.uqbar.commons.model.UserException
import org.uqbar.acciones.Accion

@Observable
@Accessors
class AgregarAccionAgarrarElementoAppModel {
	
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	String nombreItem
	ActionAgregable objetoParaAgregarleAccion
	
	new(){
		
	}
	
	
	def isItemNotNull() {
        return nombreItem != ""
	}
    
    def validarInput(Accion accion) {
        if(nombreItem == null) {
            throw new UserException("Debe ingresar un nombre")
        }
        objetoParaAgregarleAccion.agregarAccion(accion)
    }
    
}