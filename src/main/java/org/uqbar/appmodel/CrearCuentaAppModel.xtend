package org.uqbar.appmodel

import org.uqbar.LoginService
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.Account

@Observable
@Accessors
class CrearCuentaAppModel {
		LoginService servicioDeLogeo
		Account cuentaACrear
		String nombreCuentaACrear
		String passwordCuentaACrear
		
	new(LoginService servicio){
			servicioDeLogeo = servicio
			cuentaACrear = new Account()
		}
	
	def armarCuenta() {
		cuentaACrear.nombre = nombreCuentaACrear
		cuentaACrear.password = passwordCuentaACrear
	}
	
	def validarUsuario() {
		cuentaACrear.estaValidado()
	}
	
	def registrarCuenta(){
		this.armarCuenta()
		this.validarUsuario()
		servicioDeLogeo.registrarCuenta(cuentaACrear)
	}
	
}