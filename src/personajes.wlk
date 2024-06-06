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
	var posicion = game.at(5,0)// cambiar 5 para que inicie en el centro 
	method image() = "pepita.png"
	
	method position()= posicion
	
	method moverDerecha(){//mover una unidad a la derecha si se puede
		if(self.position().x()< 10) {posicion = game.at(self.position().x()+1,self.position().y())}
	}
	
	method moverIzquierda(){ // se mueve una celda a la izquierda si puede (no hay borde o nave a izquierda)
		if(self.position().x()> 0) {posicion = game.at(self.position().x()-1,self.position().y())}
	}
	
	method disparar() {// cada dos tiks dispara una bala aleatoria si no hay nave en  la misma columna y fila menor
	}
}
	
