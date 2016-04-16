package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Laberinto
import org.uqbar.Habitacion
import org.uqbar.acciones.Accion
import org.uqbar.Usuario
import org.uqbar.commons.model.ObservableUtils
import org.uqbar.commons.model.UserException

@Observable
@Accessors
class GatoEncerradoAppModel {
	
	Usuario usuario	
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	Accion accionSeleccionada
	
	new(Usuario usuario){
		this.usuario = usuario
	}
	
	new(){
		
	}
	
    def isHabSelected(){
        return habitacionSeleccionada != null
    }
    
    def setHabitacionSeleccionada(Habitacion hab){
        this.habitacionSeleccionada = hab
        ObservableUtils.firePropertyChanged(this, "habitacionSeleccionada", hab)
        ObservableUtils.firePropertyChanged(this, "habSelected", habitacionSeleccionada != null)
        ObservableUtils.firePropertyChanged(this, "first")
        ObservableUtils.firePropertyChanged(this, "last")
    }
    
    def isLabSelected(){
        return laberintoSeleccionado != null
    }

    def setLaberintoSeleccionado(Laberinto lab){
        this.laberintoSeleccionado = lab
        ObservableUtils.firePropertyChanged(this, "laberintoSeleccionado", lab)
        ObservableUtils.firePropertyChanged(this, "labSelected", laberintoSeleccionado != null)
        ObservableUtils.firePropertyChanged(this, "habitacionSeleccionada")
    }
    
    def habitacionFirst(){
    	var Habitacion res = null
    	for(hab : laberintoSeleccionado.habitaciones){
    		if(hab.isFirst()){
    			res = hab
    		}
    	}
    	res
    }
    
    def habitacionLast(){
    	var Habitacion res = null
    	for(hab : laberintoSeleccionado.habitaciones){
    		if(hab.isLast()){
    			res = hab
    		}
    	}
    	res
    }
    
    def boolean isAnyHabitacionFirst(){
    	var res = false
    	for(hab : laberintoSeleccionado.habitaciones){
    		res = res || hab.isFirst
    	}
    	return res
    }

    def boolean isAnyHabitacionLast(){
    	var res = false
    	for(hab : laberintoSeleccionado.habitaciones){
    		res = res || hab.isLast
    	}
    	return res    	
    }
        
    def setFirst(boolean bool) throws UserException{
    	if(!habitacionSeleccionada.last && (!isAnyHabitacionFirst() || habitacionFirst() == habitacionSeleccionada)){
    	habitacionSeleccionada.first = bool
    	ObservableUtils.firePropertyChanged(this, "first")
    	} else if(habitacionSeleccionada.last){
    		throw new UserException("La habitacion seleccionada ya es final, y por lo tanto no puede ser inicial.")
    	} else {
    		throw new UserException("Ya hay una habitacion inicial.")
    	}

    }
    
    def isFirst(){
    	if(habitacionSeleccionada != null){
    		habitacionSeleccionada.isFirst()
    	} else {
    		false
    	}
    }
    
    def setLast(boolean bool) throws UserException{
    	if(!habitacionSeleccionada.first && (!isAnyHabitacionLast() || habitacionLast() == habitacionSeleccionada)){
    	habitacionSeleccionada.last = bool
    	ObservableUtils.firePropertyChanged(this, "last")
    	} else if(habitacionSeleccionada.first){
    		throw new UserException("La habitacion seleccionada ya es inicial, y por lo tanto no puede ser final.")
    	} else {
    		throw new UserException("Ya hay una habitacion final.")
    	}
    }
    
    def isLast(){
    	if(habitacionSeleccionada != null){
    		habitacionSeleccionada.isLast()
    	} else {
    		false
    	}
    }
}