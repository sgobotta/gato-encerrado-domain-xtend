package org.uqbar.appmodel

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.uqbar.Habitacion
import org.uqbar.Laberinto

class TestGatoEncerradoAppModel {
    
    GatoEncerradoAppModel appModel
    Habitacion habitacion
    Laberinto laberinto
    Habitacion habitacionInicial
    Habitacion habitacionFinal
    
    @Before
    def void setUp(){
        
        appModel = new GatoEncerradoAppModel
        habitacion = new Habitacion
        laberinto = new Laberinto
        habitacionInicial = new Habitacion
        habitacionFinal = new Habitacion
        
        appModel.laberintoSeleccionado = laberinto
        
        appModel.laberintoSeleccionado.agregarHabitacion(habitacionInicial)
        appModel.laberintoSeleccionado.agregarHabitacion(habitacionFinal)
        

    }
    
    
    @Test
    def test01NoHayReferenciasDeUnaHabitacionSeleccionadaEnElAppModel() {
        
        appModel.habitacionSeleccionada = null
        
        Assert.assertEquals(appModel.isHabSelected, false)
    }
    
    @Test
    def test02SeAsignaUnaHabitacionSeleccionadaAlAppModelYAhoraReferenciaAUnaHabitacionSeleccionada() {
        
        appModel.habitacionSeleccionada = habitacion
        
        Assert.assertEquals(appModel.habitacionSeleccionada, habitacion)
        Assert.assertEquals(appModel.isHabSelected, true)
    }
    
    @Test
    def test03NoHayReferenciasDeUnLaberintoSeleccionadoEnElAppModel() {
        
        appModel.laberintoSeleccionado = null
        
        Assert.assertEquals(appModel.isLabSelected, false)
    }
    
    @Test
    def test04SeAsignaUnLaberintoSeleccionadoAlAppModelYAhoraReferenciaAUnLaberintoSeleccionada() {
        
        appModel.laberintoSeleccionado = laberinto
        
        Assert.assertEquals(appModel.laberintoSeleccionado, laberinto)
        Assert.assertEquals(appModel.isLabSelected, true)
    }
    
    @Test
    def test05UnAppModelDevuelveLaHabitacionInicialDeUnLaberinto() {

        appModel.laberintoSeleccionado.agregarHabitacion(habitacionFinal)
        appModel.laberintoSeleccionado.agregarHabitacion(habitacionInicial)

        habitacionInicial.first = true
        habitacionFinal.first = false
        
        var resultadoBusqueda = appModel.habitacionFirst
        
        Assert.assertEquals(resultadoBusqueda, habitacionInicial)
        Assert.assertFalse(resultadoBusqueda == habitacionFinal)   
    }
    
    @Test
    def test06UnAppModelDevuelveLaHabitacionFinalDeUnLaberinto() {
        appModel.laberintoSeleccionado.agregarHabitacion(habitacionInicial)
        appModel.laberintoSeleccionado.agregarHabitacion(habitacionFinal)

        habitacionFinal.last = true
        habitacionInicial.last = false
        
        var resultadoBusqueda = appModel.habitacionLast
        
        Assert.assertEquals(resultadoBusqueda, habitacionFinal)
        Assert.assertFalse(resultadoBusqueda == habitacionInicial)
    }
    
    @Test
    def test07DadoUnAppModelSeSabeSiTieneUnaHabitacionInicial() {
        
        habitacionInicial.first = true
        
        Assert.assertEquals(appModel.isAnyHabitacionFirst, true)
    }
     
    @Test
    def test08DadoUnAppModelSeSabeSiTieneUnaHabitacionFinal() {
        
        habitacionFinal.last = true
        
        Assert.assertEquals(appModel.isAnyHabitacionLast, true)
    }   
}