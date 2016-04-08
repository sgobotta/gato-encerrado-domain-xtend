package org.uqbar.appmodel

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Laberinto

@Observable
@Accessors
class AgregarHabitacionAppModel {
	String nombreHabitacion
	Laberinto laberintoSeleccionado
	
	new() {
		
	}	
}