package org.uqbar.appmodel

import org.uqbar.Habitacion
import org.uqbar.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.ActionAgregable


@Accessors
@Observable
class AgregarAccionUsarElementoAppModel {
	
	Laberinto laberintoSeleccionado
    Habitacion habitacionSeleccionada
	String itemSeleccionado
	ActionAgregable objetoParaAgregarleAccion
	
	new(){
		
	}
	
}