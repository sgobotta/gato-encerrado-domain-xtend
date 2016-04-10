package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Laberinto
import org.uqbar.Habitacion
import org.uqbar.ActionAgregable

@Observable
@Accessors
class AgregarAccionAgarrarElementoAppModel {
	
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	String nombreAccion
	String nombreItem
	ActionAgregable objetoParaAgregarleAccion
	
	new(){
		
	}
	
}