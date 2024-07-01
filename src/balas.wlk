import wollok.game.*
import personajes.*
import asteriodes.*
import juego.*

class Bala {
	//var bala
	var property position = game.at(naveDelJugador.position().x(), 1)
	method image() = "laser.png"
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
		if(game.hasVisual(self)){	
			game.removeTickEvent("Avanza bala")
			game.removeVisual(self)
		}
	}
	
	
	method impactar(){
		  //game.onCollideDo(self, {elemento => elemento.morir(); self.morir()})
		  if(game.hasVisual(self)){
			  game.onCollideDo(self, {elemento => if(elemento.puedeMorir() ){elemento.morir()}; self.morir()})
		  	
		  }
	}
	
	method perderUnaVida(){}
	
}

class BalaEnemiga {
	var property position
	const property puedeMorir = false // determina si puede morir o no
	method puedeMorir() = false
	method image() = "laser.png"
	
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
			self.position(game.at(12,12))
			game.removeTickEvent("Avanza bala enemiga")
			if(game.hasVisual(self)){
				game.removeVisual(self)				
			}
			
		}
	}
	
	method puedeBajar(){
		return position.y()>1 
		
	}
	
	method initialize(){
		self.disparar()
	}
	
	method desaparecer(){
		if(game.hasVisual(self)){
			game.removeTickEvent("Avanza bala")
			game.removeVisual(self)
			
		}
	}
	
	method morir(){}
	
	method impactaSiHayNave(){
		if (position.y() == 1 and game.getObjectsIn(position).size()>1 and game.getObjectsIn(position).contains(naveDelJugador)){
			juego.removerVida()
		}
	}
	

}
