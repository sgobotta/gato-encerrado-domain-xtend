package org.uqbar.appmodel

import org.uqbar.LoginService
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Account

@Observable
@Accessors
class CrearUsuarioAppModel {
		LoginService servicioDeLogeo
		Account cuentaACrear
		String nombre
		String password
		
	new(LoginService servicio){
			servicioDeLogeo = servicio
			cuentaACrear = new Account()
		}
	
	def armarCuenta() {
		cuentaACrear.nombre = nombre
		cuentaACrear.password = password
	}
	
	def validarUsuario() {
		cuentaACrear.estaValidado()
	}
	
	def registrarUsuario() {
		this.armarCuenta()
		this.validarUsuario()
		servicioDeLogeo.registrarCuenta(cuentaACrear)
	}
	
}