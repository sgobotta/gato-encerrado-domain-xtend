package org.uqbar.appmodel

import org.uqbar.LoginService
import org.uqbar.Usuario
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class CrearUsuarioAppModel {
		LoginService servicioDeLogeo
		Usuario usuarioACrear
		String nombre
		String password
		
	new(LoginService servicio){
			servicioDeLogeo = servicio
			usuarioACrear = new Usuario()
		}
	
	def armarUsuario() {
		usuarioACrear.nombre = nombre
		usuarioACrear.password = password
	}
	
	def validarUsuario() {
		usuarioACrear.estaValidado()
	}
	
	def registrarUsuario() {
		this.armarUsuario()
		this.validarUsuario()
		servicioDeLogeo.registrarUsuario(usuarioACrear)
	}
	
}