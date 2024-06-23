import wollok.game.*
import juego.*


class Asteroide {
	var property position 
	
	method image() = "ast.png"
	
	method puedeMorir() = false
	
	method aparecer()=game.addVisual(self)
	
	method bajar(){
		if (position.y() == 1 ) 
			{position = game.at(position.x(),11)}
		else 
			{self.bajarUnaCelda()}
		
}
	
	method bajarUnaCelda(){
		position = game.at(position.x(),position.y()-1)
		self.impactaSiHayNave()
	}
	
	method impactaSiHayNave(){
		if (position.y() == 1 and game.getObjectsIn(position).size()>1){
			juego.removerVida()
		}
	}
	method morir(){} //para que no le pase nada
	
	method perderUnaVida(){}
	
}

object 	aparecerAsteroides {
	const  property asteroides = [new Asteroide(position=game.at(1,9)),
		new Asteroide(position=game.at(3,10)) ,	
		new Asteroide(position=game.at(5,8)) ,
		new Asteroide(position=game.at(7,11)), 
		new Asteroide(position=game.at(9,5)) ]
	
	method generarAsteriodes(){
		asteroides.forEach{e=>e.aparecer()}
	}
}