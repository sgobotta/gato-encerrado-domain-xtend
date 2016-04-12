package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.exceptions.MyRegistracionException
import org.uqbar.exceptions.MyLoginException
import org.uqbar.commons.utils.Observable
import java.util.ArrayList
import org.uqbar.exceptions.MyEliminandoUsuarioException

@Observable
@Accessors
class LoginService {
	List<Account> accounts
	
	new(){
		accounts = new ArrayList<Account>()
	}
	
	def login(String nombre, String password){
		
		if(this.existeCuentaConNombre(nombre)){
			var cuenta = this.getCuenta(nombre)
			if(cuenta.tienePassword(password)){
				return cuenta
			}
			else{
				throw new MyLoginException("Contrasenha invalida")
			}
		}
		else{
			throw new MyLoginException("No existe ese usuario")
		}
	}

	def void registrarCuenta(Account cuenta){
		var existeCuenta = this.existeCuentaConNombre(cuenta.nombre)
		if(!existeCuenta){
			accounts.add(cuenta)			
		}
		else{
			throw new MyRegistracionException("Ya existe ese usuario")
		}

	}
	
	def void eliminarCuenta(Account cuenta){
		var existeCuenta = this.existeCuentaConNombre(cuenta.nombre)
		if(existeCuenta){
			accounts.remove(cuenta)
		}
		else{
			throw new MyEliminandoUsuarioException("No existe el usuario a borrar")
		}
	}
	
	def getCuenta(String nombre) {
		for(Account account: accounts){
			if(account.tieneNombre(nombre)){
				return account
			}
		}
	}
	
	def existeCuentaConNombre(String nombre){
		return accounts.exists[Account cuenta | cuenta.tieneNombre(nombre)]
	}
	

}