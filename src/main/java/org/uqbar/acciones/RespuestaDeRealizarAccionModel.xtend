package org.uqbar.acciones

import org.uqbar.jugador.Elemento
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RespuestaDeRealizarAccionModel {
	String type
	Elemento item
	Accion action
	int idHabitacion
	String extra
	
	new(Elemento itemToAdd){
    	this.type = "agarrarItem"
    	this.item = itemToAdd
    }
    
   	new(Accion actionToAdd, Elemento itemToDelete){
		this.type = "usarItem"
		this.action = actionToAdd
		this.item = itemToDelete
	}
	
	new(int id){
		this.type = "irAHabitacion"
		this.idHabitacion = id
	}
	
	new(String type, String itemName){
	    this.type = type
	    this.extra = itemName
	}
	
	new(String type){
		this.type = type
	}
}