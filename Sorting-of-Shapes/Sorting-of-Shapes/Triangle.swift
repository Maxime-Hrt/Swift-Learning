import Foundation

class Triangle: Forme{
    var longueurBase: Double
    var longueurHauteur: Double
    
    init(longueurBase: Double = 0, longueurHauteur: Double = 0, x: Int = 0, y: Int = 0) {
        self.longueurBase = longueurBase
        self.longueurHauteur = longueurHauteur
        super.init(x: x, y: y)
    }
    
    override func getSurface() -> Double {
        return (longueurBase * longueurHauteur)/2
    }
    
    override func makeSound() -> String {
        return "Triangle"
    }
    
    override func toString() -> String {
        return "longueur base = \(String(longueurBase)), longueurHauteur =  \(String(longueurHauteur))"
    }
}
