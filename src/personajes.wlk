import wollok.game.*
import Plantas.*

object hector {
	var property position = game.at(7,7)
	var property plantasCosechadas=[]
	var oroTotal=0
	
	method image(){
		return "player.png"
	}
	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}
	method sembrar(planta){
		if (position.allElements().size() < 2){
		game.addVisualIn(planta, self.position())
		}
	}
	method totalPlantasCosechadas(){
		return plantasCosechadas.size()
	}
	method darInformacion(){
		game.say(self, "Tengo " + self.totalPlantasCosechadas() + " plantas para vender y " + oroTotal + " de oro acumulado")
		
	}
	
	method cosechar(planta){
		plantasCosechadas.add(planta)
	}
	method venderUna(planta){
		oroTotal= oroTotal + planta.devolverValorVenta()
		plantasCosechadas.remove(planta)
	}
	method venderPlantas(){
		plantasCosechadas.forEach({planta => self.venderUna(planta)})
	}
}
