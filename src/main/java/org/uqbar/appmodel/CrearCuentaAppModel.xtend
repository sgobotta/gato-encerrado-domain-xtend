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
		
	new(LoginService servicio){
			servicioDeLogeo = servicio
			cuentaACrear = new Account()
		}
			
	def registrarCuenta(){
		cuentaACrear.estaValidado()
		servicioDeLogeo.registrarCuenta(cuentaACrear)
	}
	
}