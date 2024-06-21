import wollok.game.*
import personajes.*


class Bala {
	//var bala
	var property position = game.at(naveDelJugador.position().x(), 2)
	method image() = "bala..png"
	
	method disparar(){
		
		game.onTick(50, "Avanza bala", {self.subir()})
		
	}
	
	method subir(){
		if (self.puedeSubir()){self.position(position.up(1))}
		else {
			self.position(position.up(1))
			self.impactar()			
		}
	}
	
	method puedeSubir(){
		return game.getObjectsIn(position.up(1)).isEmpty() and position.y() < game.height()-2
	}
	
	method initialize(){
		self.disparar()
	}
	
	method morir(){
		game.removeVisual(self)
		game.removeTickEvent("Avanza bala")
	}
	
	method impactar(){
		  game.onCollideDo(self, {elemento => elemento.morir()})
	}
	
	method perderUnaVida(){}
}
