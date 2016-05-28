package org.uqbar.gameplay

import org.junit.Before
import org.junit.Test
import org.uqbar.Laberinto
import org.uqbar.Habitacion
import org.uqbar.acciones.AgarrarItem
import org.uqbar.jugador.Elemento
import org.uqbar.acciones.IrAHabitacion
import org.uqbar.acciones.UsarItem
import org.uqbar.jugador.Jugador
import org.uqbar.appmodel.XTRestAppModel
import static org.junit.Assert.*
import org.uqbar.exceptions.ActionIsNotOnThisRoomException
import org.uqbar.exceptions.PlayerIsNotOnThisRoomException

class TestGame {
	XTRestAppModel game
	Laberinto lab
	Jugador jugador
	
	@Before
	def void setUp(){
		this.game = new XTRestAppModel
		this.lab = new Laberinto => [
            nombreLaberinto = "Cueva"
            idLaberinto     = 01
        ]
		
		val hab1 = new Habitacion => [
			nombreHabitacion 	= "Agujero extraÃ±o"
			id 					= 1
			imagePath			= "http://localhost/static/cueva/agujero.jpg"
			first 				= true
		]
		
		val hab2 = new Habitacion => [
			nombreHabitacion 	= "Tunel"
			id 					= 2
			imagePath			= "http://localhost/static/cueva/tunel.jpg"
		]
		
		val hab3 = new Habitacion => [
			nombreHabitacion 	= "Pared enorme"
			id 					= 3
			imagePath			= "http://localhost/static/cueva/pared.jpg"
		]
		
		val hab4 = new Habitacion => [
			nombreHabitacion 	= "Salida"
			id 					= 4
			imagePath			= "http://localhost/static/cueva/salida.jpg"
			last 				= true
		]
		
		val piqueta = new Elemento() => [
				nombre 		= "piqueta para escalar"
				descripcion	= "Esto seria muy util para escalar una pared muy alta..."
				id			= 1
		]
		
		val agarrarPiqueta = new AgarrarItem() => [
			item = piqueta
			id	 = 1
		]
		
		val irAHab2 = new IrAHabitacion() => [
			habitacion = hab2
			id		   = 2
		]
		
		val irAHab1 = new IrAHabitacion() => [
			habitacion = hab1
			id 		   = 3
		]
		
		val irAHab3 = new IrAHabitacion() => [
			habitacion = hab3
			id		   = 4
		]
		
		val irASalida = new IrAHabitacion() => [
			habitacion	= hab4
			id 			= 5
		]
		
		val usarPiqueta = new UsarItem() => [
			item		= piqueta
			accion		= irASalida
			id 			= 6
		]
		
		hab1.agregarAccion(agarrarPiqueta)
		hab1.agregarAccion(irAHab2)
		hab2.agregarAccion(irAHab1)
		hab2.agregarAccion(irAHab3)
		hab3.agregarAccion(irAHab2)
		hab3.agregarAccion(usarPiqueta)
		
		lab.agregarHabitacion(hab1)
		lab.agregarHabitacion(hab2)
		lab.agregarHabitacion(hab3)
		lab.agregarHabitacion(hab4)
		
		this.jugador = new Jugador()
		
		this.game.nuevoJuego(this.lab, this.jugador)		
	}
	
	@Test
	def void testUnNuevoJuegoSeIniciaEnLaHabitacionInicial(){
		assertEquals(1, jugador.habitacionActual.id)
	}
	
	@Test
	def void testAlRealizarIrAHabitacionAccionElJugadorCambiaDeHabitacion(){
		assertEquals(1, jugador.habitacionActual.id)
		this.game.realizarAccion(1,2) // El Jugador esta en la hab inicial por el setup (habID = 1) y la accion es la de ID = 2
		assertEquals(2, jugador.habitacionActual.id)
	}
	
	@Test
	def void testAlAgarrarItemElItemEsAgregadoAlInventarioDelJugador(){
		assertEquals(0, jugador.inventario.size())
		this.game.realizarAccion(1,1) // accion id = 1, agarrar item piqueta.
		assertEquals(1, jugador.inventario.size())
		assertEquals(1, jugador.inventario.get(0).id)
	}
	
	@Test (expected = ActionIsNotOnThisRoomException)
	def void testElJugadorNoPuedeRealizarAccionesQueNoEstenEnLaHabitacionActual(){
		this.game.realizarAccion(1,3) // La accion de ID = 3 no esta en la habitaciond de id 1
	}
	
	@Test (expected = PlayerIsNotOnThisRoomException)
	def void testElJugadorNoPuedeRealizarAccionesDeUnaHabitacionEnLaQueNoEsta(){
		this.game.realizarAccion(2,3)
	}
	
	@Test
	def void testAlUsarItemElItemEsBorradoDelInventarioYLaAccionEsAgregadaALaHabitacion(){
		this.game.realizarAccion(1,1)
		this.game.realizarAccion(1,2)
		this.game.realizarAccion(2,4) // Esto es para llevar al jugador a donde hay una accion UsarItem
		assertEquals(1, jugador.inventario.size())
		assertEquals(1, jugador.inventario.get(0).id)
		assertEquals(2, jugador.habitacionActual.acciones.size())		// Me aseguro que haya 2 acciones
		assertEquals(2, jugador.habitacionActual.acciones.get(0).id)	// La de ID 2, irAHab2
		assertEquals(6, jugador.habitacionActual.acciones.get(1).id)	// La de ID 6, usarPiqueta
		
		this.game.realizarAccion(3,6)
		assertEquals(2, jugador.habitacionActual.acciones.size())
		assertEquals(2, jugador.habitacionActual.acciones.get(0).id)
		assertEquals(5, jugador.habitacionActual.acciones.get(1).id)	// Esta es la accion que se tenia que agregar
		assertEquals(0, jugador.inventario.size())						// y se borro el item del inventario			
	}
}