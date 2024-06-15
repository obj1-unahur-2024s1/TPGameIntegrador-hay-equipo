import wollok.game.*


class Personaje {
	var property posicion
	
	method position()= posicion
	
	method puedeSubir(){
		return game.getObjectsIn(posicion.up(1)).isEmpty() and posicion.y() < game.height()-2
	}
	
	method subir(){
		if (self.puedeSubir()){self.posicion(posicion.up(1))}
		else {self.desaparecer()}
	}
	
	method puedeBajar(){
		return game.getObjectsIn(posicion.down(1)).isEmpty() and posicion.y() > 1
	}
	
	method bajar(){
		if (self.puedeBajar()){self.posicion(posicion.down(1))}
	}
	
	method puedeMoverDerecha(){
		return game.getObjectsIn(posicion.right(1)).isEmpty() and posicion.x() <game.width()-2
	}
	
	method moverDerecha(){
		if (self.puedeMoverDerecha()){self.posicion(posicion.right(1))}
	}
	
	method puedeMoverIzquierda(){
		return game.getObjectsIn(posicion.left(1)).isEmpty() and posicion.x() > 1
	}
	
	method moverIzquierda(){
		if (self.puedeMoverIzquierda()){self.posicion(posicion.left(1))}
	}
	method aparecer(){
		game.addVisual(self)
	}	
	
	method desaparecer(){
		game.removeVisual(self)
	}
}


class NaveEnemiga inherits Personaje {
	var property vida = 1
	
	method image() = "nave_3.png"

	method explotar(){//si es enemigo al recibir una bala explota y desaparece 
	//si es la nave del jugador explota y termina el juego
	}

	method mover(){
		const direcciones = [0,1,2]
		const direccion = direcciones.anyOne()
		//llama a mover moverDerecha() si sale 1 o moverIzquierda() 2 y 0 no se mueve
		 if (direccion!=0){self.moverHorizontalmente(direccion)}
	}
	
	method moverHorizontalmente(direccion){
		 if (direccion == 1) self.moverDerecha() else self.moverIzquierda()	
	}

}

object aparecerEnemigos{
	const enemigos =[]
	
	method enemigos()=enemigos 
	method listaDePosiciones()=[1,2,3,4,5,6,7,8]
	
	method generarAliensEnFila(fila){
		
		const lista= self.listaDePosiciones()
		
		const x = lista.anyOne()
		enemigos.add(new NaveEnemiga(posicion = game.at(x, fila)))
		lista.remove(x)
		
		const y = lista.anyOne()
		enemigos.add(new NaveEnemiga(posicion = game.at(y, fila)))
		lista.remove(y)
		
		const z = lista.anyOne()
		enemigos.add(new NaveEnemiga(posicion = game.at(z, fila)))
		}
	
	method generarEnemigos(){
		self.generarAliensEnFila(10)
		self.generarAliensEnFila(9)
		self.generarAliensEnFila(8)
		self.generarAliensEnFila(7)
		enemigos.forEach{e=>e.aparecer()}
	}
	
}


class NaveDelJugador inherits Personaje {
	var property vida = 3

	method image() = "naveJugador.png"

}

const naveDelJugador  = new NaveDelJugador(posicion = game.at(5,1))	
	
class Bala inherits Personaje {
	const esPropia
//	var fotograma = if (esPropia) 1 else 3 

	method image()= "bala2.png"


/*	
 * 	method siguienteFotograma(){
		if (esPropia)  fotograma = (fotograma + 1 ) % 3
		else fotograma = (fotograma - 1 ) % 3
	}
 * method image(){return "bala" + fotograma.toString()+ ".png"}
 * method animacion(){
		game.onTick(300, "desplazamiento",{ self.siguienteFotograma()} )
	}
	
 	

*/
	method disparar(naveDelJugador){
		posicion = game.at(naveDelJugador.posicion().x(),naveDelJugador.posicion().y()+1)
		self.aparecer()
		self.desplazar()
		}
		
	method desplazar(){
		if(esPropia) 
			{game.onTick(500,"bala Baja", {self.subir()})}
			
		else
			{game.onTick(900,"bala Baja",{self.bajar()})}	
		}
	
		
	}
	
	
	


const bala = new Bala(posicion = game.at(2,2),esPropia=true) 


class Corazon {
	const n
	const posicion = game.at(n,0)
	method image() = "vida.png"
	method position()= posicion
}

const vida1 = new Corazon(n=1)
const vida2 = new Corazon(n=2)
const vida3 = new Corazon(n=3)

