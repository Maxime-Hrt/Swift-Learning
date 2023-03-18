import Foundation

class Carre: Forme{
    var longeurCote: Double
    
    init(longeurCote: Double = 0, x: Int = 0, y: Int = 0) {
        self.longeurCote = longeurCote
        super.init(x: x, y: y)
    }
    
    override func getSurface() -> Double {
        return pow(longeurCote, 2)
    }
    
    override func makeSound() -> String {
        return "Square"
    }
    
    override func toString() -> String{
        return "Carre: longueurCote = \(String(longeurCote))"
    }
    
}
