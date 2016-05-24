package org.uqbar.dummyData

import org.uqbar.Laberinto
import java.util.ArrayList
import org.uqbar.Habitacion

class GEWebDummyData {
	new() {
	}

	def getLaberinto() {

		var h11 = new Habitacion()
		h11.nombreHabitacion = "Entrada"
		h11.id = 11
		h11.imagePath = ""
		h11.first = true
		
		var h21 = new Habitacion()
		h21.nombreHabitacion = "Sala 21"
		h21.id = 21
		h21.imagePath = ""
		
		////////////////////
		var h51 = new Habitacion()
		h51.nombreHabitacion = "Sala 51"
		h51.id = 51
		h51.imagePath = ""
		
		var h53 = new Habitacion()
		h53.nombreHabitacion = "Sala 53"
		h53.id = 53
		h53.imagePath = ""
		
		var h35 = new Habitacion()
		h35.nombreHabitacion = "Sala 35"
		h35.id = 35
		h35.imagePath = ""
		
		////////////////////
		var h36 = new Habitacion()
		h36.nombreHabitacion = "Sala 36"
		h36.id = 36
		h36.imagePath = ""
		
		////////////////////		
		var h17 = new Habitacion()
		h17.nombreHabitacion = "Sala 17"
		h17.id = 17
		h17.imagePath = ""
		
		var h19 = new Habitacion()
		h19.nombreHabitacion = "Sala 19"
		h19.id = 19
		h19.imagePath = ""
		
		////////////////////		
		var h56 = new Habitacion()
		h56.nombreHabitacion = "Sala 56"
		h56.id = 56
		h56.imagePath = ""
		
		
		var h55 = new Habitacion()
		h55.nombreHabitacion = "Sala 55"
		h55.id = 55
		h55.imagePath = ""
		
		////////////////////
		//final
		var h39 = new Habitacion()
		h39.nombreHabitacion = "Salida"
		h39.id = 39
		h39.imagePath = ""
		h39.last = true
		///////////////////////
		var hardMaze = new Laberinto()
		hardMaze.nombreLaberinto = "HARD MAZE"
		hardMaze.habitaciones.add(h11)
		hardMaze.habitaciones.add(h21)
		hardMaze.habitaciones.add(h51)
		hardMaze.habitaciones.add(h53)
		hardMaze.habitaciones.add(h35)
		hardMaze.habitaciones.add(h36)
		hardMaze.habitaciones.add(h17)
		hardMaze.habitaciones.add(h19)
		hardMaze.habitaciones.add(h56)
		hardMaze.habitaciones.add(h55)
		hardMaze.habitaciones.add(h39)
		hardMaze.first = h11
		hardMaze.last = h39
		hardMaze.idLaberinto = 1
		hardMaze.imagePath = ""
		hardMaze.jugador = null

	}

	def getLabs() {
		var labs = new ArrayList<Laberinto>()
		var entrada = new Habitacion()
		entrada.nombreHabitacion = "Entrada"

		var cueva = new Laberinto()
		cueva.nombreLaberinto = "Cueva"
		cueva.habitaciones.add(entrada)
		cueva.first = entrada
		cueva.last = null
		cueva.idLaberinto = 1
		cueva.imagePath = ""
		cueva.jugador = null

		var catarata = new Habitacion()
		catarata.nombreHabitacion = "Catarata"

		var cascada = new Laberinto()
		cascada.nombreLaberinto = "Cascada"
		cascada.habitaciones.add(catarata)
		cascada.first = catarata
		cascada.last = null
		cascada.idLaberinto = 2
		cascada.imagePath = ""
		cascada.jugador = null

		labs.add(cueva)
		labs.add(cascada)
		labs
	}
}
