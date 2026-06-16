class Guardian {

    method poderExtra() {
        return 100
    }
    method esExtraordinario(criatura) {
        return criatura.poderMagico() > 50
    }
    method cambioDeRol() {
        return new Domador(
            mascotas = [new MascotaMitologica(edad=1, tieneCuernos=false)]
        )
    }
}

class Domador {
    const mascotas = []

    method poderExtra() {
        return mascotas.count({m => m.tieneCuernos()}) * 150
    }

    method esExtraordinario(criatura) {
        return criatura.poderMagico() >= 15 && mascotas.all({m => m.esVeterana()})
    }
    method AlMenosUnaConCuerno() {
        return mascotas.any({m => m.tieneCuernos()})
    }
    method cambioDeRol() {
         
        if(self.AlMenosUnaConCuerno()){
                return Hechicero
        }else{
                self.error("No se pudo cambiar de rol.")
        }
    }
}

class MascotaMitologica {
    const edad 
    const tieneCuernos 

    method tieneCuernos() {
        return tieneCuernos
    }
    method esVeterana() {
        return edad >= 10
    }
}

class Hechicero {
    method poderExtra() {return 0}
    method esExtraordinario(criatura) {
        return true
    }
    method cambioDeRol(){
        return Guardian
    }
}