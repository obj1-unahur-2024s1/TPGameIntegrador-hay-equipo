import wollok.game.*
import juego.*


class Personaje {
	var property posicion
	
	method position()= posicion
	
	method puedeSubir(){
		return game.getObjectsIn(posicion.up(1)).isEmpty() and posicion.y() < game.height()-2
	}
	
	method puedeBajar(){
		return  posicion.y() > 1
	}
	
	method bajar(){
		if (self.puedeBajar()){self.posicion(posicion.down(1))}
		else juego.terminar()
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
	method perderUnaVida(){}

}


class NaveEnemiga inherits Personaje {
	const property puedeMorir = true
	var property  img =  "nave_3.png"
	method image() = img
	
	

	method mover(){
		const direcciones = [0,1,2]
		const direccion = direcciones.anyOne()
		//llama a mover moverDerecha() si sale 1 o moverIzquierda() 2 y 0 no se mueve
		 if (direccion!=0){self.moverHorizontalmente(direccion)}
	}
	
	override method bajar(){
		super()
		if(self.position().y() == 1){juego.terminar()}
	}
	
	method moverHorizontalmente(direccion){
		 if (direccion == 1) self.moverDerecha() else self.moverIzquierda()	
	}
	
	 method morir(){
		juego.enemigos().remove(self)
		game.removeVisual(self)
		juego.puntaje(juego.puntaje() + 20)		
		juego.terminarSiCorresponde()

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


	method image() = "naveJugador.png"
	
	
	method morir(){}

	
}
	


const naveDelJugador  = new NaveDelJugador(posicion = game.at(5,1))	
	
/*class Meteorito inherits Personaje {
	var posicion = 
}
*/
class Corazon {
	const n
	const posicion = game.at(n,0)
	method image() = "vida.png"
	method position()= posicion
	method aparecer()=game.addVisual(self)
}

object aparecerVidas{
	const property vidas =[new Corazon(n=1),new Corazon(n=2), new Corazon(n=3)]
	
	method cargarVidas(){

			vidas.forEach({v=>v.aparecer()})
	}

}