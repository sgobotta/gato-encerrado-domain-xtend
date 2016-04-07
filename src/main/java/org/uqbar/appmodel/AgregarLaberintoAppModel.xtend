package org.uqbar.appmodel

import org.uqbar.Laberinto
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class AgregarLaberintoAppModel {
	Laberinto laberinto
	
	new() {
		
	}
}