package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.LoginService
import org.uqbar.exceptions.MyLoginException
import org.uqbar.Account

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
		var dummyAcc = new Account()
		dummyAcc.nombre = nombreDeCuentaALogear
		dummyAcc.password = contraseñaDeCuentaALogear
		
		if(dummyAcc.estaValidado()){
			//intenta logear al usuario validado
			cuentaSeleccionada = servicioDeLogeo.login(nombreDeCuentaALogear, contraseñaDeCuentaALogear)
		}
		else{
			throw new MyLoginException("Debe ingresar algun campo")
		}
	}	
}