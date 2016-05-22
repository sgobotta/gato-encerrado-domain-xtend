package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.LoginService
import org.uqbar.Account
import org.uqbar.Usuario

@Observable
@Accessors
class LoginAppModel {

	String nombreDeCuentaALogear
	String contraseñaDeCuentaALogear
	Account cuentaSeleccionada
	LoginService servicioDeLogeo
	
	new(){
		servicioDeLogeo = new LoginService()
	}
	
	//validar el nombre y contrasena ingresados
	def logearUsuario(){
		//solo lo uso para validar esa cuenta
		var dummyAcc = new Account()
		dummyAcc.username = nombreDeCuentaALogear
		dummyAcc.password = contraseñaDeCuentaALogear
		
		dummyAcc.estaValidado()
		//intenta logear al usuario validado
		cuentaSeleccionada = servicioDeLogeo.login(nombreDeCuentaALogear, contraseñaDeCuentaALogear)

	}
	
	def getUsuario() {
		cuentaSeleccionada.usuario = new Usuario(cuentaSeleccionada.username)
		return cuentaSeleccionada.usuario
	}
	
}