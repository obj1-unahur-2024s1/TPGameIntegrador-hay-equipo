import wollok.game.*


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


