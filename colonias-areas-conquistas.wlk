import criaturas.*

class Colonia {
    const criaturas = []

    method conquistarArea(unArea) {
        if(self.poderOfensivoTotal() > unArea.poderDefensivo()) {
            unArea.serUsurpada(self)
        }else{
            criaturas.forEach({c => c.perder15Porciento()})
        }
    }

    method poderOfensivoTotal() {
        return criaturas.sum({c => c.poderOfensivo()})
    }
    method cantCriaturasFormidables() {
        return criaturas.count({c => c.esFormidable()})
    }
}

class Area {
    var colonia 

    method poderDefensivo() 
    method serUsurpada(unaColonia) {
        colonia = unaColonia
    }
}

class Claros inherits Area {
    override method poderDefensivo() {
        return 100 + colonia.poderOfensivoTotal()
    }
}

class Castillo inherits Area {
    override method poderDefensivo() {
        return 200 * colonia.cantCriaturasFormidables()
    }
}