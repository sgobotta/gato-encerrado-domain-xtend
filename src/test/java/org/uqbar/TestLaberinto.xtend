package org.uqbar

import org.junit.Before
import org.junit.Test
import org.junit.Assert

import org.uqbar.Laberinto

class TestLaberinto {

    Laberinto laberinto
    Habitacion habitacion
  
    @Before
    def void setUp() {
    
    laberinto = new Laberinto
    habitacion = new Habitacion
    }
      
    @Test
    def test01SeAgregaUnaHabitacionAUnLaberintoSinHabitaciones() {
        Assert.assertEquals(laberinto.habitaciones.size(), 0)
        laberinto.agregarHabitacion(habitacion)

        Assert.assertEquals(laberinto.habitaciones.size(), 1)
    }
    
    @Test
    def test02SeEliminarUnaHabitacionDeUnLaberinto() {
        laberinto.agregarHabitacion(habitacion)
        laberinto.eliminarHabitacion(habitacion)
        
        Assert.assertEquals(laberinto.habitaciones.size(), 0)
    }
    
}