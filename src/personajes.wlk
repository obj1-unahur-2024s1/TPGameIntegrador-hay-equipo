import wollok.game.*
object aparecerEnemigos{
	method listaDePosiciones()=[1,2,3,4,5,6,7,8]
	method generarAliensEnFila(fila){
		//Codigo a emprolijar
		const listaDePosiciones2 = self.listaDePosiciones()
		var x = listaDePosiciones2.anyOne()
		var position = game.at(x, fila)
		listaDePosiciones2.remove(x)
		const nave1 = new NaveEnemiga(posicion = position)
		
		var x = listaDePosiciones2.anyOne()
		var position = game.at(x, fila)
		listaDePosiciones2.remove(x)
		const nave2 = new NaveEnemiga(posicion = position)
		
		var x = listaDePosiciones2.anyOne()
		var position = game.at(x, fila)
		listaDePosiciones2.remove(x)
		const nave3 = new NaveEnemiga(posicion = position)
		
		
		
		return [nave1, nave2, nave3]
	}
	method aparecerAliens(fila){
		const listaNaves = self.generarAliensEnFila(fila)
		game.addVisual(listaNaves.get(0))
		game.addVisual(listaNaves.get(1))
		game.addVisual(listaNaves.get(2))
	}
	
	method generarAlien(){
		
	}
	//Fila 10
	
	//Fila 9
	//Fila 8
	//Fila 7
	//Fila 6
	/*
	 * 
	 * 
	 * 
	 * 
	 */
	
}


class NaveEnemiga {
	var vida = 1
	var tiposDeBala = true
	var posicion 
	
	method image() = "nave_3.png"
	
	method position() = posicion
	method emptyPosition() {
		const position = self.position()
		if(game.getObjectsIn(position).isEmpty()) {
			return position	
		}
		else {
			return self.emptyPosition()
		}
	}
		
	//Las naves pueden nacer de la posiccion 1,11 hasta 10,11 (De la primera a la ultima del techo)
	
	method posicionDeInicio(){
		
	}
	
	method aparecer(){
		//Apaparecer a la nave enemiga en una coordenada
			
	}


	method explotar(){//si es enemigo al recibir una bala explota y desaparece 
	//si es la nave del jugador explota y termina el juego
	}

	method mover(){
		//sorte un numero entre 0, 1 y 2 y llama a mover moverDerecha() si sale 1 o moverIzquierda() 2 y 0 no se mueve
	}
	method moverDerecha(){
		game.whenCollideDo(self, {//No me muevo
		})
		
		//el visual se refiere a uno mismo
		//action = moverDerecha()
		
		

		
	}
	method hayNaveAlLado(direccion){
		
		//Si queremos ver a la derecha le ponemos n = 1, si queremos ver a la izquierda le ponemos n = -1
		
		
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

