package org.uqbar

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import java.util.ArrayList
import org.uqbar.commons.utils.Observable
import org.uqbar.acciones.ActionAgregable
import org.uqbar.acciones.Accion
import org.uqbar.jugador.Elemento

@Accessors
@Observable
class Habitacion implements ActionAgregable {

    Integer id
    String imagePath
	String nombreHabitacion
	boolean first
	boolean last
	List<Accion> acciones
	List<Elemento> items
	
	new() {
		this.acciones = new ArrayList<Accion>
		this.first = false
		this.last = false
	}
	
	override void agregarAccion(Accion unaAccion) {
 		this.acciones.add(unaAccion)
	}
	
	def void eliminarAccion(Accion unaAccion) {
 		this.acciones.remove(unaAccion)
	}
	
	def getTodosLosItemNames() {
		var list = new ArrayList<String>()
		for(acc : acciones){
		    if(acc.getItem != null){
            list.add(acc.getItemName())
            }
        }
		list
	}
	
}