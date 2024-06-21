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
		escenas.menuPrincipal()
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
		game.onTick(1000,"disparar enemigo", {self.dispararEnemigo()})
		
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
		//game.addVisual(self.puntaje().toString())
		game.addVisual(new Texto(text = self.puntaje().toString(), position = game.at(5,7)))
		
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
	
	method limpiarTablero(){
		game.clear()
	}
	

	method dispararEnemigo(){
		const enemigo = enemigos.anyOne()
		game.addVisual(new BalaEnemiga(position = game.at(enemigo.position().x(), enemigo.position().y()-1)))
	}
}

object escenas {
	
	method menuPrincipal(){
		game.addVisual(new Texto(text = "pulsa 1 para ir al primer nivel", position = game.at(5,6)))
		game.addVisual(new Texto(text = "pulsa 2 para ir al segundo nivel", position = game.at(5,5)))
		game.addVisual(new Texto(text = "pulsa P para ver el tutorial", position = game.at(5,4)))
		game.addVisual(new Texto(text = "pulsa Esc para salir", position = game.at(5,3)))
		
		keyboard.num1().onPressDo{juego.limpiarTablero(); self.primerNivel()}
		keyboard.num2().onPressDo{juego.limpiarTablero(); self.segundoNivel()}
		keyboard.p().onPressDo {juego.limpiarTablero(); self.tutorial()}
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
	
	method tutorial(){
		game.addVisual(new Texto(text = "debes eliminar a las naves enemigas antes de que sobrepasen a la tuya", position = game.at(5,10)))
		game.addVisual(new Texto(text = "usa las flechas para moverte", position = game.at(5,8)))
		game.addVisual(new Texto(text = "pulsa Espacio para disparar", position = game.at(5,7)))
		game.addVisual(new Texto(text = "pulsa back space para volver al menu", position = game.at(5,6)))
		
		keyboard.c().onPressDo {juego.limpiarTablero(); self.menuPrincipal()}
	}
	
	method perdiste(){
		juego.limpiarTablero()
		game.boardGround("gameover.png")
		keyboard.c().onPressDo {juego.limpiarTablero(); self.menuPrincipal()}
	}
}

class Texto {
	const property text
	const property position
	const property textColor = color.rojo()
}

object color {
	const property verde = "00FF00F"
	const property rojo = "FF0000FF"
}

