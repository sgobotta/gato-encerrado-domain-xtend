package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Laberinto
import org.uqbar.Habitacion

@Observable
@Accessors
class AgregarAccionAppModel {
	
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	
}