package org.uqbar

import org.junit.Before
import org.junit.Test
import org.uqbar.exceptions.MyLoginException
import org.uqbar.exceptions.MyRegistracionException
import org.junit.Assert
import org.uqbar.exceptions.MyEliminandoUsuarioException

class TestLoginService {
	
	Account pepillo
	
	Account cepillo
	
	LoginService sudo
	
	boolean cepilloEstaRegistrado
	
	@Before
	def void setUp(){
		pepillo = new Account =>[
			username = 'pepillo'
			password = '1234'
		]
		
		cepillo = new Account =>[
			username = 'cepillo'
			password = '1234'
 		]
		
		
		sudo = new LoginService()
		
		sudo.registrarCuenta(pepillo)
		
		cepilloEstaRegistrado = sudo.existeCuentaConNombre(cepillo.username)
		
	}
	
	@Test(expected = MyLoginException)
	def void testLogearUnUsuarioQueNoExisteArrojaUnaExcepcion(){
		
		sudo.login(cepillo.username, cepillo.password)
		
		Assert.assertEquals(false, sudo.existeCuentaConNombre(cepillo.username))
	}
	
	@Test
	def void testLoguearUnUsuarioQueExisteMeDevuelveEseUsuario(){
		var loginUsser = sudo.login(pepillo.username, pepillo.password)
		Assert.assertEquals(pepillo, loginUsser)
	}
	
	@Test(expected = MyRegistracionException)
	def void testRegistrarUnUsuarioConUnNombreQueYaExisteArrojaUnaExcepcion(){
		
		sudo.registrarCuenta(pepillo)
		Assert.assertEquals(true, sudo.existeCuentaConNombre(pepillo.username))
	}
	
	@Test
	def void testRegistrarUnUsuarioConUnNombreQueNoExisteLoAgregaAlSistema(){
		
		
		sudo.registrarCuenta(cepillo)
		
		var cepilloLuegoDeRegistrarlo = sudo.existeCuentaConNombre(cepillo.username)
		
		Assert.assertEquals(false, cepilloEstaRegistrado)
		Assert.assertEquals(true, cepilloLuegoDeRegistrarlo)
	}
	
	@Test(expected = MyEliminandoUsuarioException)
	def void testEliminarUnaCuentaQueNoExisteArrojaUnaExcepcion(){
		
		sudo.eliminarCuenta(cepillo)
		Assert.assertEquals(cepilloEstaRegistrado, false)
	}
	
	@Test
	def void testEliminarUnaCuentaQueExistaLoSacaDelSistema(){
		
		sudo.eliminarCuenta(pepillo)
		var pepilloLuegoDeEliminarlo = sudo.existeCuentaConNombre(pepillo.username)
		
		Assert.assertEquals(pepilloLuegoDeEliminarlo, false)
	}
	
}