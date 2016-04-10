package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class UsarItem extends Accion implements ActionAgregable {
		
	String item
	Accion accion
	
	// Los dos primeros constructures hay que cambiarlos una vez que actualicemos el dummydata	
	new(String unNombre) {
		super(unNombre)
	}
	
	
	new(String unNombre, String unItem, Accion unaAccion) {
		super(unNombre)
		this.item = unItem
		this.accion = unaAccion
	}
	
	new(){
		
	}	
	
	override realizarAccion(Habitacion unaHabitacion, Jugador unJugador) {
		if(unJugador.tieneItem(item)){
		unaHabitacion.agregarAccion(accion)
		unJugador.eliminarItem(item)
		}
	}
	
	def setItem(String item){
		this.item = item
		setNombre("Usar " +item)
	}
	
	override agregarAccion(Accion acc) {
		this.accion = acc
	}
	
}