import cosas2.*
object camion {
 var peso = 1000
 const cargas = #{}
 method cargar(unaCosa){
   if (unaCosa == bumblebee){
      bumblebee.transformarse()
   }
   if (unaCosa == paqueteLadrillos){
      paqueteLadrillos.apilarLadrillos(12)
   }
   if (unaCosa == arenaAGranel){
      arenaAGranel.perderPeso(10)
   }
   if (unaCosa == bateriaAntiaerea){
      bateriaAntiaerea.añadirMisiles()
   }
   if (unaCosa == residuosRadioactivos){
      residuosRadioactivos.añadirPeso(15)
   }
    cargas.add(unaCosa)
 }
 method descargar(unaCosa){
    cargas.remove(unaCosa)
 }
 method pesoTotal(){
   peso = peso + cargas.fold(0,{acum,item=>acum+item.peso()})
    return(peso)
 }
 method pesoEsPar(){
    cargas.all({cosa => cosa%2==0 })
 }
 method algunoPesa(unValor){
    return(cargas.any({cosa => cosa.peso()==unValor}))
 }
method algunoTienePeligrosidad(unValor){
    return(cargas.any({cosa => cosa.peligrosidad() >= unValor}))
}
method cosasQueSuperanPeligrosidadDeValor(unValor){
    return(cargas.filter({cosa => cosa.peligrosidad() >= unValor}))
}
method cosasQueSuperanPeligrosidadDeCosa(unaCosa){
    return(cargas.filter({cosa => cosa.peligrosidad() >= unaCosa.peligrosidad()}))
}
method estaExcedidoDelPesoMaximo(){
    return(peso < 2500)
}
method puedeCircularEnRuta(unValor){
    return( !self.estaExcedidoDelPesoMaximo() and 
            self.algunoTienePeligrosidad(unValor) )
}
method tieneAlgoEntre(minimo, maximo){
}
method cosaMasPesada(){
   return(cargas.max({x=>x.peso()}))
}
}

