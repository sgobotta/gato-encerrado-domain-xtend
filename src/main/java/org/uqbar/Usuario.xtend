package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Usuario {

	String nombre
	String password
	List<Laberinto> laberintos = new ArrayList<Laberinto>
	
	// 
	
	new(){
		// Agregado para cumplir con Java Bean
		laberintos = new ArrayList<Laberinto>
	}
	
	new(String unNombre) {
		this.nombre = unNombre
	}
	
	// Métodos de Laberinto
	
	def void eliminarLaberinto(Laberinto laberinto) {
		laberintos.remove(laberinto)
	}
	
	def void agregarLaberinto(Laberinto laberinto) {
		laberintos.add(laberinto)
	}
}