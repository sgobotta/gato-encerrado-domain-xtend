package org.uqbar.appmodel

import org.uqbar.Habitacion
import org.uqbar.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.acciones.ActionAgregable
import org.uqbar.acciones.UsarItem
import org.uqbar.acciones.Accion
import org.uqbar.commons.model.UserException

@Accessors
@Observable
class AgregarAccionUsarElementoAppModel {
	
	Laberinto laberintoSeleccionado
    Habitacion habitacionSeleccionada
	String itemSeleccionado
	ActionAgregable objetoParaAgregarleAccion
	UsarItem accionARetornar
	
	new(){
		accionARetornar = new UsarItem()
	}
    
    def validarInput(Accion accion) {
        if(this.itemSeleccionado == null) {
            throw new UserException("Debe seleccionar un item")
        }
        if(this.accionARetornar.nombre == null) {
            throw new UserException("Debe seleccionar una acción")
        }
         
        objetoParaAgregarleAccion.agregarAccion(accion)
    }
	
}