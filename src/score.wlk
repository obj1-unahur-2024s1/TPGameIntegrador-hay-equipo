import wollok.game.*

class Caracter {
	var position = new Position(x=0, y=0)
	
	// indica si ese objeto provoca daño cuando colisiona con felix
	const property haceDanio = false
	
	
	method position() = position
	method position(nuevaPosicion) {
		position = nuevaPosicion		
	}
	
	method positionXY(x, y) {
		self.position(new Position(x=x, y=y))
	}
	
	method addVisual(){
		if(!game.hasVisual(self)) {
			game.addVisual(self)
		}
	}
	method removeVisual(){
		if(game.hasVisual(self)) {
			game.removeVisual(self)		
		}
	}
	
}

class Visual inherits Caracter {
	
	method image()
//	method image(nuevaImagen)
	
}

// Score Final
object scoreFinal inherits Visual(position = new Position(x=1, y=1)) { 
	var property puntaje = 0
	const digitos = [
		new Digito(position = new Position(x= 7, y=5)),
		new Digito(position = new Position(x= 6, y=5)),
		new Digito(position = new Position(x= 5, y=5)),
		new Digito(position = new Position(x= 4, y=5))
	]
	
	override method addVisual() {
		super()
		digitos.forEach({d => d.addVisual()})
	}
	
	override method removeVisual() {
		super()
		digitos.forEach({d => d.removeVisual()})
	}
	override method image()="score.png"
	
	method puntaje(nuevoPuntaje) {
		puntaje = nuevoPuntaje
		var p = nuevoPuntaje
		
		(0..2).forEach({ i => 
			const d = (p % 10).truncate(0)
			digitos.get(i).valor(d)
			p = (p / 10).truncate(0);
		})
	}
}

class Digito inherits Visual {
	var property valor = 0
	
	override method image() = "numeros/" + valor + ".png" 
}

// Score Final
object scoreJuego inherits Visual(position = new Position(x=1, y=1)) { 
	var property puntaje = 0
	const digitos = [
		new Digito(position = new Position(x= 10, y=0)),
		new Digito(position = new Position(x= 9, y=0)),
		new Digito(position = new Position(x= 8, y=0)),
		new Digito(position = new Position(x= 7, y=0))
	]
	
	override method addVisual() {
		super()
		digitos.forEach({d => d.addVisual()})
	}
	
	override method removeVisual() {
		super()
		digitos.forEach({d => d.removeVisual()})
	}
	override method image()="score.png"
	
	method puntaje(nuevoPuntaje) {
		puntaje = nuevoPuntaje
		var p = nuevoPuntaje
		
		(0..2).forEach({ i => 
			const d = (p % 10).truncate(0)
			digitos.get(i).valor(d)
			p = (p / 10).truncate(0);
		})
	}
}