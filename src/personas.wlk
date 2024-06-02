import enfermedades.*

class Persona {
	
	var temperatura
	var cantidadDeCelulas
	const enfermedades = []
	
	method contraer(enfermedad) { 
		if(enfermedades.size() < 5) enfermedades.add(enfermedad)
		if(enfermedad.className() == "enfermedades.EnfermedadInfecciosa") enfermedad.afectandoA(self)
	}
	method curarseDe(enfermedad) { enfermedades.remove(enfermedad) }
	method acontecerUnDia() { enfermedades.forEach({ enfermedad => enfermedad.producirEfecto(self) }) }
	method aumentarTemperatura(valor) { temperatura = 45.min(temperatura + valor) }
	method destruirCelulas(valor) { cantidadDeCelulas = 0.max(cantidadDeCelulas - valor) }
	method porcentajeDeCelulas() { return cantidadDeCelulas * 0.1 }
	method enfermedadesAgresivas() { return enfermedades.filter({ enfermedad => enfermedad.esAgresiva() }) }
	method cantidadCelulasAmenazadas() { return self.enfermedadesAgresivas().sum({ enfermedad => enfermedad.celulasAmenazadas() }) }
	method enfermedadMasCelulasAmenazadas() { return enfermedades.max({ enfermedad => enfermedad.celulasAmenazadas() }) }
	method estaEnComa() { return temperatura == 45 or cantidadDeCelulas < 1000000 }
	method temperatura() { return temperatura }
	method cantidadDeCelulas() { return cantidadDeCelulas }
	method recibirMedicamento(valor) { 
		enfermedades.forEach({ enfermedad => enfermedad.atenuar(valor) })
		enfermedades.filter({ enfermedad => enfermedad.estaCurada() }).forEach({ enfermedad => self.curarseDe(enfermedad)})
	}
	
}