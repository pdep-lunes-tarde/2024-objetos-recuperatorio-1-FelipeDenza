import magos.*
import objetosMagicos.*

class Gremio{
    var magos=[]

    method magos()= magos

    method crearGremio() {
        const condicionMinima= 2
      return magos.size() > condicionMinima
    }

    method poderTotalGremio() {
      return magos.sum{unMago => unMago.poderTotal()}
    }

    method enrgiaMagicaGremio() {
      return magos.sum{unMago => unMago.energiaMagica()}
    }

    method liderGremio() {
      const magosPorPoder= new Dictionary()
      magos.forEach{unMago => magosPorPoder.put(unMago.poderTotal(),unMago)}
      const lider = magosPorPoder.keys().max()
      return magosPorPoder.get(lider)
    }

    method desafiar(deasafiado) {
      if(deasafiado.esVencido(self, deasafiado)){
           const puntosPorMago=  deasafiado.puntosPerdidosPorDesafio() / magos.size() //los puntos que le corresponden a cada mago del gremio
            magos.forEach{unMago => unMago.cambiarEnergia(puntosPorMago)}
      }
      else{
        self.error("El gremio atacante fallo el desafio")
      }
    }

    method esVencido(atacante,defensor){
        return (atacante.poderTotalGremio() > (defensor.enrgiaMagicaGremio() + defensor.liderGremio().enrgiaMagicaGremio()))
    }

    method puntosPerdidosPorDesafio() {
      const puntosPerdidos= self.magos().map{unMago => unMago.tipoMago().puntosPorSerVencido(unMago)}
        return puntosPerdidos.sum()
    }
 


















}