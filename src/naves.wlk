import wollok.game.*

class Personaje{
	var property position
	var vidasRestantes
	
	/*
	 * Metodos de moverse
	 * Inicializarse
	 * explotar
	 * disparar
	 */
	 
	 //Metodos de movimiento
	method adicionalMoverseDerecha()
	method moverseDerecha(){
	 	if(self.position().x() <= 9 and self.adicionalMoverseDerecha()){
	 		position = position.right(1)
	 	}
	}
	
	method adicionalMoverseIzquierda()
	method moverseIzquierda(){
	 	if(self.position().x() <= 9 and self.adicionalMoverseDerecha()){
	 		position = position.left(1)
	 	}
	}
	
	method recibirDisparo(){
		vidasRestantes -= 1
		if (vidasRestantes == 0){
			self.explotar()
		}
	}
	//Explotar
	method explotar(){
		//Accion en cadena de explotar
	}
}

class NaveEnemiga inherits Personaje{
	method image() = "naveJugador.png"
	//Estos metodos evaluan si hay alguna nave al lado que impida su movimiento
	override method adicionalMoverseIzquierda(){}
	override method adicionalMoverseDerecha(){}
	/*	Metodos que debe entender la nave enemiga
	 * Oscilamiento automatico(Se mueve de derecha a izquierda)
	 * Desciende cada x segundos
	 * Dispara aleatoriamente alguna nave si no tiene una nave debajo
	 * Su disparar es (false)
	 */
	 
	 method disparar(){
	 	//Crea una nueva bala que viaja hacia la direccion del jugador
	 }
	
}

class NaveJugador inherits Personaje{
	//Estos metodos quedan con true, porque no chocan con nadie a su lado
	override method adicionalMoverseIzquierda(){return true}
	override method adicionalMoverseDerecha(){return true}
	/*	Metodos que debe entender la nave del jugador
	 * Disparar(true)
	 */
	 
	method disparar(){
		//Crea una nueva bala que va hacia la direccion del enemigo
	}
	
}

class Bala {
	
	const balaAliada
	//Si es verdadero es la bala disparada por el personaje, sinó la disparó el enemigo
	method viajarAlEnemigo(){
		if (balaAliada){
			//Debe viajar hacia arriba
		}
		else{
			//Debe viajar hacia abajo
		}
	}
	/*	Metodos para la bala
	 * Si la bala se encuentra con un enemigo debe matarlo
	 * Si la bala se encuentra con la nave del jugador debe sacarle vidas
	 * Si la nave sale fuera del area del tablero debe desaparecer
	 */
	
}