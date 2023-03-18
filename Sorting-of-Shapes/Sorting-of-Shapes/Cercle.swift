import Foundation

class Cercle: Forme{
    var longueurRayon: Double
    var pi: Double
    
    init(longueurRayon: Double, x: Int = 0, y: Int = 0) {
        self.longueurRayon = longueurRayon
        self.pi = Double.pi
        super.init(x: x, y: y)
    }
    
    override func getSurface() -> Double {
        return pi*pow(longueurRayon, 2)
    }
    
    override func makeSound() -> String {
        "Cercle"
    }
    
    override func toString() -> String {
        return "Cercle: longueur Rayon = \(String(longueurRayon))"
    }
}
