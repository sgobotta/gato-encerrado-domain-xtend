package org.uqbar.acciones

import org.junit.Before
import org.junit.Test
import org.junit.Assert

class TestAgarrarItem {
    
    AgarrarItem agarrarItem
    String unItem
    
    @Before
    def void setUp() {

        agarrarItem = new AgarrarItem
        unItem = "Gasolina"
    }
    
    @Test
    def test01SeObtieneElItemAsignadoALaAccionAgarrarItem() {
        
        agarrarItem.nombreItem = unItem
        
        Assert.assertEquals(agarrarItem.getItem, unItem)
    }
    
    @Test
    def test02SeLeAsignaUnNombreALaAccion() {
        
        agarrarItem.nombreItem = unItem
        
        var nuevoNombre = "Agarrar " + unItem
        
        Assert.assertEquals(agarrarItem.nombre, nuevoNombre)
    }
    
}