import magos.*

class ObjetosMagicos{
    var poderBase
    var usuario


    method asignarUsuario(mago) {
      usuario= mago
    }

    // no se considera nesesario sustraer el metodo poderBase 
}

class Varita inherits ObjetosMagicos{
    var porcentajeExtra= 1.5

    method poderBase() {
      if(usuario.nombre().size().even()){
        return poderBase * porcentajeExtra
      }
      else{
        return poderBase
      }
    }

}

class Tunica inherits ObjetosMagicos{
    const unidadesPorPunto= 2 

    method poderBase() {
      return usuario.resistMagico() * unidadesPorPunto
    }
}

class TunicaEpica inherits Tunica{
    const puntosFijos= 10

    override method poderBase(){
        return super() + puntosFijos
    }
}


class Amuletos {
    const poderPorAmuleto= 200
  method poderBase() {
    return poderPorAmuleto
  }
}

object ojota inherits ObjetosMagicos(poderBase=0 ,usuario= "") { //comienza sin un usario
  const poderPorUnidad= 10

  method poderBase(){
    return usuario.nombre().size()* poderPorUnidad
  }
}

