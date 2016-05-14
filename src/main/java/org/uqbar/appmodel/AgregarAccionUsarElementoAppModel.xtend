package org.uqbar.appmodel

import org.uqbar.Habitacion
import org.uqbar.Laberinto
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.uqbar.acciones.ActionAgregable
import org.uqbar.acciones.UsarItem
import org.uqbar.commons.model.UserException
import org.uqbar.jugador.Elemento

@Accessors
@Observable
class AgregarAccionUsarElementoAppModel {

    Laberinto laberintoSeleccionado
    Habitacion habitacionSeleccionada
    String itemSeleccionado
    ActionAgregable objetoParaAgregarleAccion
    UsarItem accionARetornar

    new() {
        accionARetornar = new UsarItem()
    }

    def agregarAccion() {
        this.validacionItem()
        this.validacionAccion()
        objetoParaAgregarleAccion.agregarAccion(accionARetornar)
    }

    def validacionItem() {
        if (itemSeleccionado == null) {
            throw new UserException("Debe seleccionar un item")
        }
    }

    def validacionAccion() {
        if (this.accionARetornar.nombre == null) {
            throw new UserException("Debe seleccionar una acción")
        }
    }
	
	def agregarItemAAccionARetornar() {
		accionARetornar.item = new Elemento() => [
			nombre = itemSeleccionado
		]
	}

}
