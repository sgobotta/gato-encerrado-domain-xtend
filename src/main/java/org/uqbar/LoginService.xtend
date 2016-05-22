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
	
	def Account login(String nombre, String password) throws MyLoginException{
		
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

	def void registrarCuenta(Account cuenta) throws MyRegistracionException{
		
		var existeCuenta = this.existeCuentaConNombre(cuenta.username)
		
		if(!existeCuenta){
			accounts.add(cuenta)			
		}
		else{
			throw new MyRegistracionException("Ya existe ese usuario")
		}

	}
	
	def void eliminarCuenta(Account cuenta) throws MyEliminandoUsuarioException{
		var existeCuenta = this.existeCuentaConNombre(cuenta.username)
		if(existeCuenta){
			accounts.remove(cuenta)
		}
		else{
			throw new MyEliminandoUsuarioException("No existe el usuario a borrar")
		}
	}
	
	def Account getCuenta(String nombre) {
		for(Account account: accounts){
			if(account.tieneNombre(nombre)){
				return account
			}
		}
		return null
	}
	
	def boolean existeCuentaConNombre(String nombre){
		return accounts.exists[Account cuenta | cuenta.tieneNombre(nombre)]
	}
	

}