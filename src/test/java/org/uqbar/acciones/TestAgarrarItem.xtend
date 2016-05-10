package org.uqbar.acciones

import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.uqbar.jugador.Elemento

class TestAgarrarItem {
    
    AgarrarItem agarrarItem
    Elemento unItem
    
    @Before
    def void setUp() {

        agarrarItem = new AgarrarItem
        unItem = new Elemento() => [
        	nombre = "Gasolina"
        ]
    }
    
    @Test
    def test01SeObtieneElItemAsignadoALaAccionAgarrarItem() {
        
        agarrarItem.item = unItem
        
        Assert.assertEquals(agarrarItem.getItemName, unItem.nombre)
    }
    
    @Test
    def test02SeLeAsignaUnNombreALaAccion() {
        
        agarrarItem.item = unItem
        
        var nuevoNombre = "Agarrar " + unItem.nombre
        
        Assert.assertEquals(agarrarItem.nombre, nuevoNombre)
    }
    
}