object paquete {
	var estáPago = false // el estado del paquete puede variar y no estar pago
	
	// getter
	method estáPago() {
		return estáPago
	}

	// setter
	method estáPago(_estáPago) {
		estáPago = _estáPago
	}

	method puedeSerEntregado(destino, persona) {
		return self.estáPago() && destino.dejarPasar(persona)
	}
}

// Destinos
object puenteDeBrooklyn {
	const topePesoPermitido = 1000 

	// getter
	method topePesoPermitido() {
		return topePesoPermitido
	}

	// deja pasar a todo lo que pese hasta una tonelada (1000 kilos)
	method dejarPasar(persona) {
		return persona.peso() <= topePesoPermitido
	}
}

object laMatrix { 
	// deja pasar a quien pueda hacer una llamada
	method dejarPasar(persona) {
		return persona.puedeLlamar()
	}
}

// Personas Mensajeras: Jean Gray, Neo y Sara Connor
// Caracteristicas Jean: poderes telepáticos y telequinésicos, por lo que puede llamar siempre 
object jeanGray {
	const peso = 65
	const puedeLlamar = true

	// getter
	method peso() {
		return peso
	}

	// getter
	method puedeLlamar() {
		return puedeLlamar
	}
}

// Caracteristicas Neo: vuela. Usa celular para llamar pero a veces se queda sin crédito y no puede
object neo {
	const peso = 0
	var tieneCrédito = false // puede variar

	// getter
	method peso() {
		return peso
	}

	// setter
	method tieneCrédito(_tieneCrédito) {
		tieneCrédito = _tieneCrédito
	}

	method puedeLlamar() {
		return tieneCrédito 
	}
}

// Caracteristicas Sara: viaja en moto o camión y no puede llamar a nadie.
object saraConnor {
	var peso = 50 // varía con el tiempo y se le suma el peso del vehiculo que puede ser moto o camión
	var vehículo = moto
	const puedeLlamar = false

	// setter
	method peso(_peso) {
		peso = _peso
	}

	// setter
	method vehículo(_vehículo) {
		vehículo = _vehículo
	}

	method peso() {
		return peso + vehículo.pesoVehículo()
	}

	// getter
	method puedeLlamar() {
		return puedeLlamar
	}
}

// Vehículos
object moto {
	const pesoVehículo = 100

	// getter
	method pesoVehículo() {
		return pesoVehículo
	}
}

object camión {
  	const pesoVehículo = 500 // pesa media tonelada
  	var cantAcoplados = 0 // es una especie de contador de cantidad de acoplados (?)

	// getter
	method cantAcoplados() {
		return cantAcoplados
	}

	// setter
	method cantAcoplados(_cantAcoplados) {
		cantAcoplados = _cantAcoplados
	}

  	method pesoVehículo() {
		return pesoVehículo + ( cantAcoplados * 500 ) // agrega media tonelada adicional por cada uno de los acoplados
  	}
}