package org.uqbar.appmodel

import org.uqbar.Laberinto
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.model.UserException
import org.uqbar.Usuario

@Observable
@Accessors
class AgregarLaberintoAppModel {
	String nombreLaberinto
	
	Usuario usuarioSeleccionado
	
	new() {
		
	}

	new(List<Laberinto> laberintos, Usuario usuarioSeleccionado){
		this.usuarioSeleccionado = usuarioSeleccionado
	}
	
    
    def agregarLaberinto() {
        
        this.validar()
		var nuevoLaberinto = new Laberinto()
		nuevoLaberinto.setNombreLaberinto(nombreLaberinto)
		
		usuarioSeleccionado.agregarLaberinto(nuevoLaberinto)
    }
    
    def validar(){
         if(this.nombreLaberinto == null) {
            throw new UserException("El laberinto debe tener un nombre")
    	}
	}    
}