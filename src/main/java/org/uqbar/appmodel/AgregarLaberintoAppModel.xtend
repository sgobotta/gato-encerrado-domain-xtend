package org.uqbar.appmodel

import org.uqbar.Laberinto
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List

@Observable
@Accessors
class AgregarLaberintoAppModel {
	String nombreLaberinto
	List<Laberinto> laberintos
	
	new() {
		
	}
}