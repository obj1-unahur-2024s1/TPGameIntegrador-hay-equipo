import wollok.game.*
import pantallas.*
import personajes.*
import balas.*
import asteriodes.*
import score.*



object juego {
	
	const property enemigos=[]
	const property asteroides = []
	const property vidas = []
	var property puntaje = 0
	method vidas()=vidas.size()
	

	method puntaje()=puntaje

	
	method iniciar(){		
	
		self.tablero()
		escenas.pantallaInicio()
		self.cargarSonido()
		game.start()
	
	}
	
	method tablero(){
		game.title("Invasores espaciales")
		game.height(11)
		game.width(11)
		game.boardGround("fondo.png")
	}
	method cargarControles(){
			
		keyboard.left().onPressDo {naveDelJugador.moverIzquierda()}
		keyboard.right().onPressDo {naveDelJugador.moverDerecha()}
		keyboard.up().onPressDo {self.disparar()}
		keyboard.c().onPressDo {self.limpiarTablero(); escenas.menuPrincipal() }
	
	}
	
	method cargarSonido(){
		var  sound = game.sound("sonido/sonidoArcade.mp3")
		sound.shouldLoop(true)
		game.schedule(500, { sound.play()} )
		keyboard.enter().onPressDo({sound.stop()})

	}
	
	method modelarEnemigos(){

		aparecerEnemigos.generarEnemigos()
		enemigos.addAll(aparecerEnemigos.enemigos() )
		
		game.onTick(4000, "bajar Enemigos", {enemigos.forEach({ e => e.bajar()})})
		game.onTick(1000, "mover Enemigos", {enemigos.forEach({ e => e.mover()})})
		game.onTick(2000,"disparar enemigo", {self.dispararEnemigo()})
		game.onTick(500, "eliminar muertos",{enemigos.forEach({e =>e.eliminarRestos()})})
		
	}
	
	method cargarUsuario(){
		game.addVisual(naveDelJugador)

	}
	
	method cargarVidas(){
		aparecerVidas.cargarVidas()
		vidas.addAll(aparecerVidas.vidas())

		
	}
	method agregarAsteroides(){
		
		aparecerAsteroides.generarAsteriodes()
		asteroides.addAll(aparecerAsteroides.asteroides() )
		
		game.onTick(200, "Avanza asteroide", {asteroides.forEach({ a=> a.bajar()})})

	}
	
	method disparar(){
		game.addVisual(new Bala())
		game.sound("sonido/balazo.mp3").play()
	}
	
	
	method terminar(){
		self.limpiar()
		self.agregarVisualFinal()
		//game.addVisual(new Texto(text = self.puntaje().toString(),
		//	 position = game.center()))
		score.addVisual()	 
	}
	
	method agregarVisualFinal(){
		if(not enemigos.isEmpty()) game.addVisual(gameOver) else game.addVisual(ganaste)
	}
	method limpiar(){
		game.clear()
	}

	method removerVida(){
		if(self.vidas()>1) self.quitarVida() else self.terminar()
		
	}
	
	method quitarVida(){
		game.removeVisual(vidas.last())
		vidas.remove(vidas.last())
		game.sound("sonido/perder.mp3").play()
		self.cambiarVisualDelJugador()
		
	}
	
	method cambiarVisualDelJugador(){
		if (self.vidas() == 2) naveDelJugador.img("n2.png") else naveDelJugador.img("n3.png") 
	}
	
	method limpiarTablero(){
		game.clear()
	}
	

	method dispararEnemigo(){
		const enemigo = enemigos.anyOne()
		game.addVisual(new BalaEnemiga(position = game.at(enemigo.position().x(), enemigo.position().y()-1)))
	}
	
	method terminarSiCorresponde(){
		if(enemigos.isEmpty()){self.terminar()}
	}
	
}
	

object escenas {
	
	method pantallaInicio(){
		game.addVisual(inicio)
		keyboard.enter().onPressDo{juego.limpiarTablero(); self.menuPrincipal() }
	}
	
	method menuPrincipal(){
		game.addVisual(menu)
		keyboard.num1().onPressDo{juego.limpiarTablero(); self.primerNivel() }
		keyboard.num2().onPressDo{juego.limpiarTablero(); self.segundoNivel()}
		keyboard.t().onPressDo {juego.limpiarTablero(); self.verTutorial()}
		keyboard.backspace().onPressDo {game.stop()}
	}
	
	method primerNivel(){

		juego.cargarControles()
//		self.cargarSonido()
		juego.cargarUsuario()
		juego.modelarEnemigos()
		juego.cargarVidas()
	}
	
	method segundoNivel(){

		juego.cargarControles()
//		self.cargarSonido()
		juego.cargarUsuario()
		juego.modelarEnemigos()
		juego.agregarAsteroides()
		juego.cargarVidas()

	}
	
	method verTutorial(){
		juego.limpiarTablero()
		game.addVisual(tutorial)
		keyboard.c().onPressDo {juego.limpiarTablero(); self.menuPrincipal() }
	}
	
	method perdiste(){
		juego.limpiarTablero()
		game.addVisual(gameOver)
		keyboard.c().onPressDo {juego.limpiarTablero(); self.menuPrincipal()}
	}
	

}

class Texto {
	const property text
	const property position
	const property textColor = color.verde()
	
	
}

object color {
	const property verde = "00FF00F"
	const property rojo = "FF0000FF"
}



