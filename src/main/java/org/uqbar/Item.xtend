package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Item {
		
	String nombre
	Accion accion
		
	new(String unNombre) {
		this.nombre = unNombre
	}
}