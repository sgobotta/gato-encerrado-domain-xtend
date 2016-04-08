package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Usuario
import org.uqbar.LoginService
import org.uqbar.exceptions.MyLoginException

@Observable
@Accessors
class LoginAppModel {

	String nombreDeUsuarioALogear
	String contraseñaDeUsuarioALogeaer
	Usuario usuarioSeleccionado
	LoginService servicioDeLogeo
    boolean usuarioSeleccionadoPuedeAcceder
	
	new(){
		servicioDeLogeo = new LoginService()
	}
	
	
	def logearUsuario(){
		if(this.estaValidado()){
			usuarioSeleccionado = servicioDeLogeo.login(nombreDeUsuarioALogear, contraseñaDeUsuarioALogeaer)
			usuarioSeleccionadoPuedeAcceder = true
		}
		else{
		    usuarioSeleccionadoPuedeAcceder = false
			throw new MyLoginException("Debe ingresar campo")
		}
	}
	
	def estaValidado(){
		return this.campoValido(nombreDeUsuarioALogear) && this.campoValido(contraseñaDeUsuarioALogeaer)
	}
	
	def campoValido(String value) {
		return (value.trim.equals("")) && (value != null)
	}
	
}