package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.List
import org.uqbar.Laberinto
import org.uqbar.Habitacion
import org.uqbar.Accion

@Observable
@Accessors
class GatoEncerradoAppModel {
	
	List<Laberinto> laberintos
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	Accion accionSeleccionada
	
	
	
}