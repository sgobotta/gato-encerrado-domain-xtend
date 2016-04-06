package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Item {
	
	// Deprecated, a ser borrado una vez que terminemos de cambiar el dominio
		
	String nombreItem
	Accion accion
		
	new(String unNombre) {
		this.nombreItem = unNombre
	}
}