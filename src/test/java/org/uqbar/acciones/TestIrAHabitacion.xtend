package org.uqbar.acciones

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.uqbar.Habitacion

class TestIrAHabitacion {
    
    IrAHabitacion irAHabitacion
    Habitacion habitacion
    
    @Before
    def void setUp() {

        irAHabitacion = new IrAHabitacion
        habitacion = new Habitacion
    }
    
    @Test
    def test01SeAsignaUnaHabitacionALaAccionIrAHabitacionYSeLeAsignaUnNombre() {
        
        irAHabitacion.habitacion = habitacion
        var nuevoNombre = "Ir a la habitacion " + habitacion.nombreHabitacion
        
        Assert.assertEquals(irAHabitacion.habitacion, habitacion)
        Assert.assertEquals(irAHabitacion.nombre, nuevoNombre)
    }
    
}