class Enfermedad {
	
	var celulasAmenazadas
	
	method producirEfecto(persona)
	method esAgresiva()
	method atenuar(valor) { celulasAmenazadas = 0.max(celulasAmenazadas - valor * 15) }
	method agravar() { celulasAmenazadas = celulasAmenazadas * 5 }
	method estaCurada() { return celulasAmenazadas == 0 }
	method celulasAmenazadas() { return celulasAmenazadas }
	
}

class EnfermedadInfecciosa inherits Enfermedad {
	
	var afectandoA = null
	
	override method producirEfecto(persona) { persona.aumentarTemperatura(celulasAmenazadas / 1000) }
	override method esAgresiva() { return celulasAmenazadas > afectandoA.porcentajeDeCelulas() }
	method reproducirse() { celulasAmenazadas = celulasAmenazadas * 2 }
	method afectandoA(persona) { afectandoA = persona }
	method afectandoA() { return afectandoA }
	
}

class EnfermedadAutoinmune inherits Enfermedad {
	
	var cantidadDeDiasActiva = 0
	
	override method producirEfecto(persona) { 
		persona.destruirCelulas(celulasAmenazadas)
		cantidadDeDiasActiva = cantidadDeDiasActiva + 1
	}
	override method esAgresiva() { return cantidadDeDiasActiva > 30 }
	method cantidadDeDiasActiva() { return cantidadDeDiasActiva }
	
}