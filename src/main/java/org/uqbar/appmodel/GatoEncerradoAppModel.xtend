package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Laberinto
import org.uqbar.Habitacion
import org.uqbar.Accion
import org.uqbar.Usuario

@Observable
@Accessors
class GatoEncerradoAppModel {
	
	Usuario usuario	
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	Accion accionSeleccionada
	String nombreHabitacionSeleccionada
	String nombreLaberintoSeleccionado
	
	new(){
		
	}

}