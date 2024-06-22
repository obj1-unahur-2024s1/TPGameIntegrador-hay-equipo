import wollok.game.*
import personajes.*
import asteriodes.*
import juego.*

class Bala {
	//var bala
	var property position = game.at(naveDelJugador.position().x(), 1)
	method image() = "bala..png"
	method puedeMorir() = true
	
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
		return game.getObjectsIn(position.up(1)).isEmpty() or position.y() > game.height()-2
	}
	
	method initialize(){
		self.disparar()
	}
	
	method morir(){
		game.removeTickEvent("Avanza bala")
		game.removeVisual(self)
	}
	
	
	method impactar(){
		  //game.onCollideDo(self, {elemento => elemento.morir(); self.morir()})
		  game.onCollideDo(self, {elemento => if(elemento.puedeMorir()){elemento.morir()}; self.morir()})
	}
	
	method perderUnaVida(){}
	
}

class BalaEnemiga {
	var property position
	const property puedeMorir = false // determina si puede morir o no
	method puedeMorir() = false
	method image() = "bala..png"
	
	method disparar(){
		
		game.onTick(500, "Avanza bala enemiga", {self.bajar()})
		
	}
	
	method bajar(){
		if (self.puedeBajar()){
			self.position(position.down(1))
			self.impactaSiHayNave()	
			}
		else{ 
			//self.desaparecer()
			game.removeTickEvent("Avanza bala enemiga")
			game.removeVisual(self)
			
		}
	}
	
	method puedeBajar(){
		return position.y()>1 
		
	}
	
	method initialize(){
		self.disparar()
	}
	
	method desaparecer(){
		game.removeTickEvent("Avanza bala")
		game.removeVisual(self)
	}
	
	method morir(){}
	
	method impactaSiHayNave(){
		if (position.y() == 1 and game.getObjectsIn(position).size()>1){
			juego.removerVida()
		}
	}
	

}
