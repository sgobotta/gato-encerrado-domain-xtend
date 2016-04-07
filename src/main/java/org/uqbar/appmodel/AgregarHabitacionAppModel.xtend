package org.uqbar.appmodel

import org.uqbar.Habitacion
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class AgregarHabitacionAppModel {
	Habitacion habitacion
	
	new() {
		
	}	
}