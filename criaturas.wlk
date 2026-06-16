import roles.*

class Criaturas {
  var poderMagico
  var property astucia 
  var rol 

  method poderMagico() {
    return poderMagico
  }
  method esAstuta()
  method esFormidable() {
    return self.esAstuta() || self.esExtraordinaria()
  }
  method poderOfensivo() {
    return poderMagico * 10 + rol.poderExtra()
  }
  method esExtraordinaria() {
    return rol.esExtraordinario(self)
  }
  method cambiarRol() {
    rol = rol.cambioDeRol()
  }
  method perder15Porciento() {
    poderMagico = poderMagico * 0.85
  }
}

class Hada inherits Criaturas {
  var kmAVolar = 2

  method aumentarKm(km) {
    kmAVolar = (kmAVolar + km).min(25)
  }

  method kilometrosAVolar() {
    return kmAVolar
  }

  override method esAstuta() {
    return astucia > 50
  }

  override method esExtraordinaria() {
    return super() && self.kilometrosAVolar() > 10
  }
}

class Duende inherits Criaturas {
  override method poderOfensivo() {
    return super() + super() * 0.1
  }
  override method esAstuta() {
    return false
  }
}