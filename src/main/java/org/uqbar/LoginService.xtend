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
	List<Usuario> usuarios
	
	new(){
		usuarios = new ArrayList<Usuario>()
		usuarios.add(new Usuario("Pepe"))
	}
	
	def login(String nombre, String password){
		
		if(this.existeUsuarioConNombre(nombre)){
			var usuario = this.getUsuario(nombre)
			if(usuario.password.equals(password)){
				//aca deberia hacer otra cosa
				return usuario
			}
			else{
				throw new MyLoginException("Contrasenha invalida")
			}
		}
		else{
			throw new MyLoginException("no existe ese usuario")
		}
	}
	
	def getUsuario(String nombre) {
		for(Usuario user: usuarios){
			if(user.nombre.equals(nombre)){
				return user
			}
		}
	}
	
	def existeUsuarioConNombre(String nombre){
		return usuarios.exists[Usuario usuario | usuario.nombre.equals(nombre)]
	}
	
	def void registrarUsuario(Usuario usuario){
		var existeUsuario = this.existeUsuarioConNombre(usuario.nombre)
		if(!existeUsuario){
			usuarios.add(usuario)			
		}
		else{
			throw new MyRegistracionException("lanza una interfaz amigable, ya existe ese usuario")
		}

	}
	
	def void eliminarUsuario(Usuario usuario){
		var existeUsuario = this.existeUsuarioConNombre(usuario.nombre)
		if(existeUsuario){
			usuarios.remove(usuario)
		}
		else{
			throw new MyEliminandoUsuarioException("lanza una interfaz amigable, no existe ese usuario a borrar")
		}
	}
}