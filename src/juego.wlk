import wollok.game.*
import personajes.*
import balas.*
import asteriodes.*



object juego {
	
	const property enemigos=[]
	const property asteroides = []
	const property vidas = []
	var property puntaje = 0
	var  img = "fondo.png"
	
	method vidas()=vidas.size()
	

	method puntaje()=puntaje

	
	method iniciar(){		
	
		self.tablero()
		self.cargarControles()
//		self.cargarSonido()
		self.cargarUsuario()
		self.modelarEnemigos()
		self.agregarAsteroides()
		self.cargarVidas()
//		game.onCollideDo(naveDelJugador, {naveDelJugador.perderVida() ; self.removerVida()})
		game.start()
	
	}
	
	method tablero(){
		game.title("Invasores espaciales")
		game.height(11)
		game.width(11)
		game.boardGround(img)
	}
	method cargarControles(){
			
		keyboard.left().onPressDo {naveDelJugador.moverIzquierda()}
		keyboard.right().onPressDo {naveDelJugador.moverDerecha()}
		keyboard.up().onPressDo {self.disparar()}
	
	}
	
	method cargarSonido(){
		var  sound = game.sound("sonido/sonidoArcademp3")
		sound.shouldLoop(true)
		game.schedule(500, { sound.play()} )
		keyboard.enter().onPressDo({sound.stop()})

	}
	
	method modelarEnemigos(){

		aparecerEnemigos.generarEnemigos()
		enemigos.addAll(aparecerEnemigos.enemigos() )
		
		game.onTick(4000, "bajar Enemigos", {enemigos.forEach({ e => e.bajar()})})
		game.onTick(1000, "mover Enemigos", {enemigos.forEach({ e => e.mover()})})
		
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
		img = "gameover.png"
		
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
		
	}
	
	method removerCorazon(){
		
	}
	
}

