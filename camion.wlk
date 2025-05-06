object camion {
 var peso = 1000
 const cargas = #{}
 method cargar(unaCosa){
    cargas.add(unaCosa)
 }
 method descargar(unaCosa){
    cargas.remove(unaCosa)
 }
 method pesoTotal(){
    peso = cargas.forEach({cosa => cosa.peso()})
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

