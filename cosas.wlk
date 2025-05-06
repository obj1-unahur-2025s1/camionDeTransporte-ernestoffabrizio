object knightRider {
    method peso(){
        return(500)
    }
    method peligrosidad(){
        return(10)
    }
}
object bumblebee{
    var transformado = false
    method peso(){
        return(800)
    }
    method peligrosidad(){
        if (self.estaTransformado()) {return(15)}
        else {return(30)}
    }
    method estaTransformado(){
        return(transformado)
    }
    method transformarse(){
        transformado = true
    }
}
object paqueteLadrillos{
    var cantLadrillos = 3
    method peso(){
        return(cantLadrillos * 2)
    }
    method peligrosidad(){
        return(2)
        }
    method apilarLadrillo(){ 
        cantLadrillos =+ cantLadrillos 
        }
    method quitarLadrillo() { 
        cantLadrillos =- cantLadrillos
        }
}
object arenaAGranel{
    var peso = 1
    method definirPeso(unValor){
        peso = unValor
    }
    method peligrosidad(){
        return(1)
    }
}
object bateriaAntiaerea{
    var hayMisiles = false
    method peso(){
        if (self.estaConMisiles()){
            return(300)
        }
        else{
            return(200)
        }
    }
    method peligrosidad(){
        if (self.estaConMisiles()){
            return(100)
        }
        else{
            return(0)
        }
    }
    method estaConMisiles(){
        return(hayMisiles)
    }
    method añadirMisiles(){
        hayMisiles = true
    }
}
object contenedorPortuario{
    const cosas = #{}
    var peso = 0
    method peso(){
        peso = cosas.forEach({cosa => cosa.peso()})
        return(peso)
    }
    method peligrosidad(){
        if (!cosas.isEmpty()){
            return(cosas.max({x=>x.peligrosidad()}))
        }
        else{
            return(0)
        }
    }
}
object residuosRadioactivos{
    var pesoTotal = 15
    method peso(){
        return(pesoTotal)
    }
    method peligrosidad(){
        return(200)
    }
    method cambiarPesoA(unValor){
        pesoTotal = unValor
    }
}
object embajale{
    var contenido = null
    method envolver(unaCosa){
        contenido = unaCosa
    }
    method peso(){
        return(contenido.peso())
    } 
    method peligrosidad(){
        return(contenido.peligrosidad()/2)
    }
}