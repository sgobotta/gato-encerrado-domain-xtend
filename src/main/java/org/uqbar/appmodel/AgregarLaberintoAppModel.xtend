package org.uqbar.appmodel

import org.uqbar.Laberinto
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.UserException

@Observable
@Accessors
class AgregarLaberintoAppModel {
	String nombreLaberinto
	List<Laberinto> laberintos
	
	new() {
		
	}
    
    def validarInput(Laberinto habitacion) {
        if(this.nombreLaberinto == null) {
            throw new UserException("El laberinto debe tener un nombre")
        }
        laberintos.add(habitacion)
    }
    
}