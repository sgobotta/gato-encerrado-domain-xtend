package org.uqbar.acciones

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestUsarItem {
    
    UsarItem usarItem
    Accion accionIrAHabitacion
    
    @Before
    def void setUp() {

        usarItem = new UsarItem
        accionIrAHabitacion = new IrAHabitacion
        
        accionIrAHabitacion.nombre = "Cascada"
        
    }
    
    @Test
    def test01SeAsignaUnNombreAlItemDeUnaAccion() {
        
        usarItem.nombre = "Diamante"
        
        Assert.assertEquals(usarItem.nombre, "Diamante")
    }
 
    @Test
    def test02SeAgregaUnaAccionDeIrAHabitacionAUsarItem() {
        
        usarItem.agregarAccion(accionIrAHabitacion)
        
        Assert.assertEquals(usarItem.accion, this.accionIrAHabitacion)
    }
    
    @Test
    def test03SeSeteaUnaAccionEnUsarItemYSeLeAsignaUnNuevoNombre() {
        
        usarItem.setAccion(accionIrAHabitacion)
        usarItem.nombre = "Diamante"
        
        Assert.assertEquals(usarItem.nombre, "Diamante")
    }
    
    
}