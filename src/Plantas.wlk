import wollok.game.*
import personajes.*

class Planta {
	var property position
	
	method image()
	method esRegada(hector)
	method esCosechada(hector)
	method devolverValorVenta()
}

class Maiz inherits Planta {
	var estadoPlanta = "corn_baby.png"
	
	override method image() = estadoPlanta
	override method devolverValorVenta() = 150
	
	override method esRegada(hector){
		if (estadoPlanta == "corn_baby.png"){
			estadoPlanta = "corn_adult.png"
		}
	}
	override method esCosechada(hector){
		if (estadoPlanta == "corn_adult.png"){
		hector.cosechar(self)
		game.removeVisual(self)
		}
	}	
}
class Tomaco inherits Planta {
	
	override method esRegada(hector){
		
		position=game.up(1)
	}
	override method esCosechada(hector){
		hector.cosechar(self)
		game.removeVisual(self)
	}
	
	override method devolverValorVenta() = 80
	override method image() = "tomaco.png"
}
class Trigo inherits Planta {
	var imagenesEtapas = ["wheat_0.png","wheat_1.png","wheat_2.png","wheat_3.png"]
	var etapaActual=0
	
	override method image() = imagenesEtapas.get(etapaActual)
	override method devolverValorVenta() = 100
	
		override method esRegada(hector){
		if (etapaActual != 3){
			etapaActual++
		}
		else {
			etapaActual=0
			}
		}
		
		override method esCosechada(hector){
			if (etapaActual >= 2){
			hector.cosechar(self)
			game.removeVisual(self)
			}
		}
}
	