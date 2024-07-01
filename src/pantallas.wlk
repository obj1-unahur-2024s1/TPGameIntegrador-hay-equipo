import wollok.game.*
import juego.*
import score.*


class Pantalla {
	const img
	const position =game.at(0,0)
	method image() = img
	method position() = position 
}

const inicio = new Pantalla(img="inicio.png",position=game.at(0,2))
const menu = new Pantalla(img="menu...png",position=game.at(0,2))
const gameOver = new  Pantalla(img="gameover.png", position = game.at(2,7))
const tutorial = new Pantalla(img="tutorial.png",position=game.at(0,1))
const ganaste= new  Pantalla(img="ganaste.png", position = game.at(1,6))


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
//		keyboard.backspace().onPressDo {game.stop()}
	}
	
	method primerNivel(){
		juego.limpiarTablero()
		juego.cargarControles()
		juego.cargarUsuario()
		juego.modelarEnemigos()
		juego.cargarVidas()
		scoreJuego.addVisual()
		
	}
	
	method segundoNivel(){
		juego.limpiarTablero()
		juego.cargarControles()
		juego.cargarUsuario()
		juego.modelarEnemigos()
		juego.agregarAsteroides()
		juego.cargarVidas()
		scoreJuego.addVisual()

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