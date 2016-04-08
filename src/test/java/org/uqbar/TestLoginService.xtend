package org.uqbar

import org.junit.Before
import org.junit.Test
import org.uqbar.exceptions.MyLoginException
import org.uqbar.exceptions.MyRegistracionException
import org.junit.Assert

class TestLoginService {
	
	Usuario pepillo
	
	Usuario cepillo
	
	LoginService sudo
	
	@Before
	def void setUp(){
		pepillo = new Usuario=>[
			nombre = 'pepillo'
			password = '1234'
		]
		
		cepillo = new Usuario=>[
			nombre = 'cepillo'
			password = '1234'
 		]
		
		
		sudo = new LoginService()
		
		sudo.registrarUsuario(pepillo)
	}
	
	@Test(expected = MyLoginException)
	def void testLogearUnUsuarioQueNoExisteArrojaUnaExcepcion(){
		sudo.login(cepillo.nombre, cepillo.password)
		Assert.assertEquals(false, sudo.existeUsuarioConNombre(cepillo.nombre))
	}
	
	@Test
	def void testLoguearUnUsuarioQueExisteMeDevuelveEseUsuario(){
		var loginUsser = sudo.login(pepillo.nombre, pepillo.password)
		Assert.assertEquals(pepillo, loginUsser)
	}
	
	@Test(expected = MyRegistracionException)
	def void testRegistrarUnUsuarioConUnNombreQueYaExisteArrojaUnaExcepcion(){
		sudo.registrarUsuario(pepillo)
		Assert.assertEquals(true, sudo.existeUsuarioConNombre(pepillo.nombre))
	}
	
	@Test
	def void testRegistrarUnUsuarioConUnNombreQueNoExisteLoAgregaAlSistema(){
		
		var existia = sudo.existeUsuarioConNombre(cepillo.nombre)
		
		sudo.registrarUsuario(cepillo)
		
		Assert.assertEquals(false, existia)
		Assert.assertEquals(true, sudo.existeUsuarioConNombre(cepillo.nombre))
	}
	
}