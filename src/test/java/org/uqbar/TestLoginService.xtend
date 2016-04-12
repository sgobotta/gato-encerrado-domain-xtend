package org.uqbar

import org.junit.Before
import org.junit.Test
import org.uqbar.exceptions.MyLoginException
import org.uqbar.exceptions.MyRegistracionException
import org.junit.Assert

class TestLoginService {
	
	Account pepillo
	
	Account cepillo
	
	LoginService sudo
	
	@Before
	def void setUp(){
		pepillo = new Account=>[
			nombre = 'pepillo'
			password = '1234'
		]
		
		cepillo = new Account=>[
			nombre = 'cepillo'
			password = '1234'
 		]
		
		
		sudo = new LoginService()
		
		sudo.registrarCuenta(pepillo)
	}
	
	@Test(expected = MyLoginException)
	def void testLogearUnUsuarioQueNoExisteArrojaUnaExcepcion(){
		sudo.login(cepillo.nombre, cepillo.password)
		Assert.assertEquals(false, sudo.existeCuentaConNombre(cepillo.nombre))
	}
	
	@Test
	def void testLoguearUnUsuarioQueExisteMeDevuelveEseUsuario(){
		var loginUsser = sudo.login(pepillo.nombre, pepillo.password)
		Assert.assertEquals(pepillo, loginUsser)
	}
	
	@Test(expected = MyRegistracionException)
	def void testRegistrarUnUsuarioConUnNombreQueYaExisteArrojaUnaExcepcion(){
		sudo.registrarCuenta(pepillo)
		Assert.assertEquals(true, sudo.existeCuentaConNombre(pepillo.nombre))
	}
	
	@Test
	def void testRegistrarUnUsuarioConUnNombreQueNoExisteLoAgregaAlSistema(){
		
		var existia = sudo.existeCuentaConNombre(cepillo.nombre)
		
		sudo.registrarCuenta(cepillo)
		
		Assert.assertEquals(false, existia)
		Assert.assertEquals(true, sudo.existeCuentaConNombre(cepillo.nombre))
	}
	
}