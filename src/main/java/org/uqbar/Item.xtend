package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Item {
		
	String nombreItem
	Accion accion
		
	new(String unNombre) {
		this.nombreItem = unNombre
	}
}