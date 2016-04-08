package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Usuario
import org.uqbar.LoginService

@Observable
@Accessors
class LoginAplicationModel {

	String nombreDeUsuarioALogear
	String contraseñaDeUsuarioALogeaer
	Usuario usuarioSeleccionado
	LoginService servicioDeLogeo
	
	new(){
		servicioDeLogeo = new LoginService()
	}
	
	
	def logearUsuario(){
		
		usuarioSeleccionado = servicioDeLogeo.login(nombreDeUsuarioALogear, contraseñaDeUsuarioALogeaer)
	}
}