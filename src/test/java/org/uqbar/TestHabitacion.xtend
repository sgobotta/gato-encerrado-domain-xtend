package org.uqbar

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.uqbar.acciones.Accion
import org.uqbar.acciones.IrAHabitacion

class TestHabitacion {
    
    
    Habitacion habitacion
    Accion accion
    
    @Before
    def void setUp() {
        
        habitacion = new Habitacion
        accion = new IrAHabitacion
    }
    
    @Test
    def test01SeAgregaUnaAccionAUnaHabitacionSinAcciones() {
        Assert.assertEquals(habitacion.acciones.size(), 0)
        habitacion.agregarAccion(accion)

        Assert.assertEquals(habitacion.acciones.size(), 1)
        
    }
    
    @Test
    def test02SeQuitaUnaAccionDeUnaHabitacion() {
        habitacion.agregarAccion(accion)

        habitacion.eliminarAccion(accion)
        Assert.assertEquals(habitacion.acciones.size(), 0)        
        
    }
    
}