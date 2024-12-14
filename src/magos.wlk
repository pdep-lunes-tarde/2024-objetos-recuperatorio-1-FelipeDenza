import objetosMagicos.*

class Mago{
    const nombre // string
    var objetosMagicosEquipados= []
    var poderInnato // numero del 1 al 10
    var resistMagico // number
    var tipoMago // TipoObjeto
    var energiaMagica

    method queEs()= "mago"


    method energiaMagica()= energiaMagica

    method tipoMago()= tipoMago
    
    method cambiarTipo(nuevoTipo) {
      tipoMago = nuevoTipo
    }

    method agregarObjeto(objeto){
        objetosMagicosEquipados.add(objeto)
    }

    method poderObjetos(){
        return objetosMagicosEquipados.sum{unObjeto => unObjeto.poderBase()}
    }

    method poderTotal(){
        return self.poderObjetos() * poderInnato
    }

    method resistMagico() = resistMagico

    method cambiarEnergia(puntos){
        energiaMagica = energiaMagica + puntos
    }


    method desafiar(magoDesafiado) {
        if(magoDesafiado.tipoMago().esVencido(self, magoDesafiado)){ 
            self.cambiarEnergia(magoDesafiado.tipoMago().puntosPorSerVencido(magoDesafiado))
        }
        else{
            self.error("El mago atacante perdio el desafio")
        }      
    }

    method puntosPerdidosPorDesafio() {
      return self.tipoMago().puntosPerdidosPorDesafio()
    }
}

object tipoAprendis {
  method esVencido(atacante,mago) {
    return atacante.poderTotal() > mago.resistMagico() 
  }
  method puntosPorSerVencido(mago) {
    const puntos = mago.energiaMagica() / 2
    mago.cambiarEnergia(-puntos)
    return puntos

  }
}


object tipoVeterano {
  method esVencido(atacante,mago){
    return (atacante.poderTotal() * 1.5) >= mago.resistMagico()
  }
  method puntosPorSerVencido(mago) {
    const puntos = mago.energiaMagica() * 3/4
    mago.cambiarEnergia(puntos)
    return puntos
  }
}



object tipoInnmortal {
    method esVencido(atacante,mago)= false
}


