package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList

@Accessors
class Usuario {

    Integer id
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
	
	def eliminarHabitacion(Habitacion habitacion, Laberinto laberinto) {
		laberinto.eliminarHabitacion(habitacion)
	}
	
	def hasLabOfId(int idLab){
		var res = false
		for(laberinto : this.laberintos){
			if(laberinto.idLaberinto == idLab){
				res = true
			}
		}
		res
	}
}