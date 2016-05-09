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
	
    
    def validarInput(Laberinto habitacion) {
        if(this.nombreLaberinto == null) {
            throw new UserException("El laberinto debe tener un nombre")
        }
    }
	
	def agregarLaberinto() {
		
		var nuevoLaberinto = new Laberinto()
		nuevoLaberinto.setNombreLaberinto(nombreLaberinto)
		
		this.validarInput(nuevoLaberinto)
		usuarioSeleccionado.agregarLaberinto(nuevoLaberinto)
		
	}
    
}