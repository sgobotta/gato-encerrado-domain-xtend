package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Usuario {

	String nombre
	List<Laberinto> laberintos
	
	new(){
		// Agregado para cumplir con Java Bean
		laberintos = new ArrayList<Laberinto>
	}
	
	new(String unNombre) {
		this.nombre = unNombre
		this.laberintos = new ArrayList<Laberinto>
	}
	
	// Métodos de Laberinto
	
	def void crearLaberinto(String nombre) {		
		var nuevoLaberinto = new Laberinto()
		laberintos.add(nuevoLaberinto)
	}
	
	def void eliminarLaberinto(Laberinto laberinto) {
		laberintos.remove(laberinto)
	}
	
	def void agregarLaberinto(Laberinto laberinto) {
		laberintos.add(laberinto)
	}
	
	// Métodos de Habitación
	
	def crearHabitacion(String nombre, Laberinto laberinto) {
		var nuevaHabitacion = new Habitacion()
		laberinto.agregarHabitacion(nuevaHabitacion) 
	}
	
	def eliminarHabitacion(Habitacion habitacion, Laberinto laberinto) {
		laberinto.eliminarHabitacion(habitacion)
	}
	
	def marcarHabitacionComoInicial(Habitacion habitacion, Laberinto laberinto) {
		//Si ya existe una habitación marcada como Inicial, debería ser desmarcada
		//y luego marcar la nueva habitación
		habitacion.setEsInicial(true)
		habitacion.setEsFinal(false) //Puede ser innecesario 
	}
	
	def marcarHabitacionComoFinal(Habitacion habitacion) {
		//Si ya existe una habitación marcada como Inicial, debería ser desmarcada
		//y luego marcar la nueva habitación
		habitacion.setEsFinal(true)
		habitacion.setEsInicial(false) //Puede ser innecesario
	}
	
	// Métodos de Acción
	
	def crearAccionParaMoverse(String nombre, Habitacion habitacion) {
		var nuevaAccion = new Mover(nombre)
		habitacion.agregarAccion(nuevaAccion)
	}
	
	def crearAccionParaAgarrarItem(String nombre, Habitacion habitacion) {
		var nuevaAccion = new AgarrarItem(nombre)
		habitacion.agregarAccion(nuevaAccion)
	}
	
	def crearAccionParaUsarItem(String nombreAccionHabitacion, Item item, Habitacion habitacion, Mover accionParaItem) {
		item.accion = accionParaItem
		var accionParahabitacion = new UsarItem(nombreAccionHabitacion, item)
		habitacion.agregarAccion(accionParahabitacion)
	}
	
}