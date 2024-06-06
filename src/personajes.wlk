import wollok.game.*

class NaveEnemiga {
	var vida = 1
	var tiposDeBala
	var posicion
	
	method posicion() = posicion
	
	method posicionDeInicio()

	method explotar(){//si es enemigo al recibir una bala explota y desaparece 
	//si es la nave del jugador explota y termina el juego
	 }

	method mover(){
		//sorte un numero entre 0, 1 y 2 y llama a mover moverDerecha() si sale 1 o moverIzquierda() 2 y 0 no se mueve
	}
	method moverDerecha(){//mover una unidad a la derecha si se puede
	}
	method moverIzquierda(){ // se mueve una celda a la izquierda si puede (no hay borde o nave a izquierda)
	}
	
	method disparar() {// cada dos tiks dispara una bala aleatoria si no hay nave en  la misma columna y fila menor
	}
	
}

object naveDelJugador {
	var posicion = game.at(5,1)// cambiar 5 para que inicie en el centro 
	method image() = "naveJugador.png"
	
	method position()= posicion
	
	method moverDerecha(){//mover una unidad a la derecha si se puede
 //   if(self.position().x()< 10) {posicion = game.at(self.position().x()+1,self.position().y())}
 		posicion = game.at((self.position().x()+1).min(9),self.position().y())
	}
	
	method moverIzquierda(){ // se mueve una celda a la izquierda si puede (no hay borde o nave a izquierda)
 //   if(self.position().x()> 0) {posicion = game.at(self.position().x()-1,self.position().y())}
		posicion = game.at((self.position().x()-1).max(1),self.position().y())
	}
	
	method disparar() {// cada dos tiks dispara una bala aleatoria si no hay nave en  la misma columna y fila menor
	}
}
	
object bala {
	var posicion = game.at(5,5)// cambiar 5 para que inicie en el centro 
	method image() = "balaPlata.png"
	
	method position()= posicion
	
	
}

class Corazon {
	const n
	var posicion = game.at(n,0)
	method image() = "vida.png"
	method position()= posicion
}

const vida1 = new Corazon(n=1)
const vida2 = new Corazon(n=2)
const vida3 = new Corazon(n=3)
