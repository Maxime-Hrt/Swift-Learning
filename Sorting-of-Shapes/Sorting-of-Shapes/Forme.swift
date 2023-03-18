import Foundation

protocol Measurable{
    func getSurface() -> Double
}

protocol stringObject{
    func toString() -> String
}

class Forme : Measurable, Comparable, stringObject{
    
    var x: Int
    var y: Int
    
    init(x: Int = 0, y: Int = 0) {
        self.x = x
        self.y = y
    }
    
    func getSurface() -> Double{
        fatalError("La méthode doit etre implémentée dans la sous-classe")
    }
    
    static func < (lhs: Forme, rhs: Forme) -> Bool{
        return lhs.getSurface() < rhs.getSurface()
    }
    
    static func == (lhs: Forme, rhs: Forme) -> Bool {
        return lhs.getSurface() == rhs.getSurface()
    }
    
    func makeSound() -> String {
        return "Shape"
    }
    
    func toString() -> String {
        return "i don't have length, im a shape"
    }
}
