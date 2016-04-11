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
	String contraseñaDeUsuarioALogear
	Usuario usuarioSeleccionado
	LoginService servicioDeLogeo
    boolean usuarioSeleccionadoPuedeAcceder
	
	new(){
		servicioDeLogeo = new LoginService()
	}
	
	//validar el nombre y contrasena ingresados
	def logearUsuario(){
		if(this.estaValidado()){
			//intenta logear al usuario validado
			usuarioSeleccionado = servicioDeLogeo.login(nombreDeUsuarioALogear, contraseñaDeUsuarioALogear)
			usuarioSeleccionadoPuedeAcceder = true
		}
		else{
		    usuarioSeleccionadoPuedeAcceder = false
			throw new MyLoginException("Debe ingresar campo")
		}
	}
	
	def estaValidado(){
		return this.campoValido(nombreDeUsuarioALogear) && this.campoValido(contraseñaDeUsuarioALogear)
	}
	
	def campoValido(String value) {
		//System.out.println(value)
		return value != null && !value.trim.equals("") 
	}
	
}