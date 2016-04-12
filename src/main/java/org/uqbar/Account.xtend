package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException

@Accessors
class Account {
	String nombre
	String password
	Usuario usuario
	
	new(){
		usuario = new Usuario()
	}	

	//Metodos de Login
	def estaValidado(){
		if(!this.ingresoCampo(nombre)){
			throw new UserException("Debe ingresar nombre")
			}
		if(!this.ingresoCampo(password)){
			throw new UserException("Debe ingresar un password")
		}
		return true	
	}
	def ingresoCampo(String value){
		return (value != null) && (!value.trim.equals(""))
	}
	def tienePassword(String pass){
		return password.equals(pass)
	}
	def tieneNombre(String nombre){
		return nombre.equals(nombre)
	}
}