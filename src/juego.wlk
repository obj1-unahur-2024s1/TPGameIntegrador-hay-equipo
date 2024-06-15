import wollok.game.*
import personajes.*
import balas.*


object juego {
	
	const enemigos=[]
	
	var property puntaje = 0
	
	method  enemigos()= enemigos
	method puntaje()=puntaje
	
	method iniciar(){		
	
		self.tablero()
		self.cargarControles()
		self.cargarUsuario()
		self.modelarEnemigos()

		
		
		game.start()
	
	}
	
	method tablero(){
		game.title("Juego Base")
		game.height(11)
		game.width(11)
		game.boardGround("fondo.png")
	}
	method cargarControles(){
			
		keyboard.left().onPressDo {naveDelJugador.moverIzquierda()}
		keyboard.right().onPressDo {naveDelJugador.moverDerecha()}
		keyboard.up().onPressDo {game.addVisual(new Bala())}
	
	}
	
	method modelarEnemigos(){
	

	aparecerEnemigos.generarEnemigos()
	enemigos.addAll(aparecerEnemigos.enemigos() )
	
	game.onTick(15000, "bajar Enemigos", {enemigos.forEach({ e => e.bajar()})})
	game.onTick(1000, "mover Enemigos", {enemigos.forEach({ e => e.mover()})})
	
		
	}
	
	method cargarUsuario(){
		game.addVisual(naveDelJugador)
		game.addVisual(vida1)
		game.addVisual(vida2)
		game.addVisual(vida3)
	}
	
	method matarEnemigo(){
		
	}
	method terminarJuego(){}
	
	
}
