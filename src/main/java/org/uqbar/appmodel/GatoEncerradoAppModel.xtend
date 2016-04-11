package org.uqbar.appmodel

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.Laberinto
import org.uqbar.Habitacion
import org.uqbar.Accion
import org.uqbar.Usuario
import org.uqbar.commons.model.ObservableUtils

@Observable
@Accessors
class GatoEncerradoAppModel {
	
	Usuario usuario	
	Laberinto laberintoSeleccionado
	Habitacion habitacionSeleccionada
	Accion accionSeleccionada
	
	new(){
		
	}
	
//	def setLaberintoSeleccionado(Laberinto lab){
//	    this.laberintoSeleccionado = lab
//	    
//	    this.habitacionSeleccionada = lab.habitaciones.get(0)
//	    ObservableUtils.firePropertyChanged(this, "laberintoSeleccionado", lab)
//	    
//	}

    def isHabSelected(){
        return habitacionSeleccionada != null
    }
    
    def setHabitacionSeleccionada(Habitacion hab){
        this.habitacionSeleccionada = hab
        ObservableUtils.firePropertyChanged(this, "habitacionSeleccionada", hab)
        ObservableUtils.firePropertyChanged(this, "habSelected", habitacionSeleccionada != null)
    }
    
    def isLabSelected(){
        return laberintoSeleccionado != null
    }

    def setLaberintoSeleccionado(Laberinto lab){
        this.laberintoSeleccionado = lab
        ObservableUtils.firePropertyChanged(this, "laberintoSeleccionado", lab)
        ObservableUtils.firePropertyChanged(this, "labSelected", laberintoSeleccionado != null)
    }
}