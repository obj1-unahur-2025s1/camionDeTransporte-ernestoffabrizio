object knightRider {
    method peso(){
        return(500)
    }
    method peligrosidad(){
        return(10)
    }
    method bultos(){
        return(1)
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
    method bultos(){
        return(2)
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
    method apilarLadrillos(unaCantidad){ 
        cantLadrillos = cantLadrillos + unaCantidad 
        }
    method quitarLadrillo() { 
        cantLadrillos =- cantLadrillos
        }
    method bultos(){
        if (cantLadrillos > 100 and cantLadrillos < 300){
            return(2)
        }
        if (cantLadrillos > 300){
            return(3)
        }
        return(1)
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
    method peso(){
        return(peso)
    }
    method bultos(){
        return(1)
    }
    method perderPeso(unValor){
        peso = peso - unValor
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
    method bultos(){
        if (self.estaConMisiles()){
            return(2)
        }
        return(1)
    }
}
object contenedorPortuario{
    const cosas = #{}
    method peso(){
        return(cosas.fold(0,{acum,cosa=>acum+cosa.peso()}))
    }
    method peligrosidad(){
        if (!cosas.isEmpty()){
            return(cosas.max({x=>x.peligrosidad()}).peso())
        }
        else{
            return(0)
        }
    }
    method añadir(unaCosa){
        cosas.add(unaCosa)
    }
    method cosas(){
        return(cosas)
    }
    method bultos(){
        return (1 + cosas.fold(0,{acum, cosa=>acum+cosa.bultos()}))
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
    method añadirPeso(unValor){
        pesoTotal = pesoTotal + unValor
    }
}
object embalaje{
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