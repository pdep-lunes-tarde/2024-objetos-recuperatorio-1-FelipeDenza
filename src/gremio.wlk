import magos.*
import objetosMagicos.*

class Gremio{
    var integrantes=[]

    method magos(){
        return integrantes.filter{integrante => integrante.queEs() == "mago"}
    }

    method queEs()= "gremio"

    method gremios() {
        return integrantes.filter{integrante => integrante.queEs() == "gremio"}

    }

    method crearGremio() {
        const condicionMinima= 2
      return self.magos().size() > condicionMinima
    }

    method poderTotalGremio() {
      return self.magos().sum{unMago => unMago.poderTotal()}
    }

    method enrgiaMagicaGremio() {
      return self.magos().sum{unMago => unMago.energiaMagica()}
    }

    method gremioMasFuerte() {
      const gremiosPorPoder = new Dictionary()
      self.gremios().forEach{unGremio => gremiosPorPoder.put(unGremio.poderTotalGremio(),unGremio)}
      const masFuerte = gremiosPorPoder.keys().max()
      return gremiosPorPoder.get(masFuerte)
    }

   method magoMasFuerte() {
      const magosPorPoder= new Dictionary()
     self.magos().forEach{unMago => magosPorPoder.put(unMago.poderTotal(),unMago)}
      const mayorPoder = magosPorPoder.keys().max()
      return magosPorPoder.get(mayorPoder)
    }
    

    method liderGremio() {
      const gremioMasFuerte= self.gremioMasFuerte()
      const magoMasFuerte= self.magoMasFuerte()

      if(gremioMasFuerte.poderTotalGremio() > magoMasFuerte.poderTota()){
        return gremioMasFuerte.magoMasFuerte()
      }
      else{
      return magoMasFuerte
      }
    }


    
    method desafiar(deasafiado) {
      if(deasafiado.esVencido(self, deasafiado)){
           const puntosPorMago=  deasafiado.puntosPerdidosPorDesafio() / self.magos().size() //los puntos que le corresponden a cada mago del gremio
            self.magos().forEach{unMago => unMago.cambiarEnergia(puntosPorMago)}
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