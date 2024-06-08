import naves.*
import wollok.game.*
object ciclo{
	method for(inicio, fin, accion){
		//accion es un closure que describe al bloque de codigo dentro del
		//bucle for
		if (inicio < fin){
			accion.apply()
			self.for(inicio +1, fin, accion)
		}
	}
}
object aparecerEnemigos{
	method listaDePosiciones()=[1,2,3,4,5,6,7,8,9]
	
	method aparecerConjuntoEnemigos(){
		const list = [5,6,7,8,9,10]
		list.forEach({x => self.aparecerFilaAliens(x)})
		
	}
	method aparecerFilaAliens(fila){
		const listaPosAux = self.listaDePosiciones()
		const naves = []
		ciclo.for(0,5,
			{
			const x = listaPosAux.anyOne()
			const position = game.at(x, fila)
			listaPosAux.remove(x)
			naves.add(new NaveEnemiga(position = position, vidasRestantes = 1))
		})
		naves.forEach({x => self.generarAlien(x) })
	}

	method generarAlien(unaNave){
		game.addVisual(unaNave)
	}
}