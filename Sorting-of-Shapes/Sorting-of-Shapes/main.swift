import Foundation

enum MyError: Error{
    case negativeDouble(String)
    case not1Or2(String)
}

func unwrappingOptionalDouble(optionalValue: Double?) -> Double?{
    guard let myValue = optionalValue else {
        return 0.0
    }
    return myValue
}
func unwrappingOptionalInt(optionalValueX: Int?, optionalValueY: Int?) -> [Int?]{
    guard let myValueX = optionalValueX else {
        return [nil, nil]
    }
    guard let myValueY = optionalValueY else {
        return [nil, nil]
    }
    return [myValueX, myValueY]
}
func unwrappingOptionalIntSolo(optionalValue: Int?) -> Int?{
    guard let myValue = optionalValue else {
        return 0
    }
    return myValue
}


var tabOfShapes: [Forme] = []
let numberOfShapes: Int = 35
var randomShape: Int

for _ in 0..<numberOfShapes {
    randomShape = Int.random(in: 0..<3)
    switch randomShape{
    case 0:
        tabOfShapes.append(Carre(
            longeurCote: Double.random(in: 0.0...20.0),
            x: Int.random(in: 0...100)-50,
            y: Int.random(in: 0...100)-50))
    case 1:
        tabOfShapes.append(Cercle(
            longueurRayon: Double.random(in: 0.0...12.0),
            x: Int.random(in: 0...100)-50,
            y: Int.random(in: 0...100)-50))
    case 2:
        tabOfShapes.append(Triangle(
            longueurBase:Double.random(in:0.0...30.0),
            longueurHauteur: Double.random(in: 0.0...30.0),
            x: Int.random(in: 0...100)-50,
            y: Int.random(in: 0...100)-50))
    default:
        fatalError("Error random filling of shapes")
    }
}

var choix: Int = 0

print("Enter 1 to use Comparable or 2 to use Comparator")
if let userInput = readLine(), let choice = Int(userInput) {
    choix = choice
    
    do{
        if choix < 0{
            throw MyError.negativeDouble("You have to enter a positive value")
        }
        if choix != 1 && choix != 2 {
            throw MyError.not1Or2("Value is different from 1 or 2")
        }
    } catch MyError.negativeDouble(let message){
        print(message)
    } catch MyError.not1Or2(let message){
        print(message)
    } catch {
        print("An error occured")
    }
} else {
    print("You have to enter an integer")
}
    
if choix == 1 {
    tabOfShapes.sort()
    print("Using Comparable: ")
    for (i, forme) in tabOfShapes.enumerated() {
        print("The area of the \(forme.makeSound()) \(i) is \(forme.getSurface()) and it's position is (\(forme.x), \(forme.y)), and it's length(s) \(String(describing: forme.toString()))")
    }
} else if choix == 2{
    let tabOfShapes = tabOfShapes.sorted {$0 < $1}
    print("Using comparator")
    for (i, forme) in tabOfShapes.enumerated() {
        print("The area of the \(forme.makeSound()) \(i) is \(forme.getSurface()) and it's position is (\(forme.x), \(forme.y)), and it's length(s) \(String(describing: forme.toString()))")
    }
} else {
    print("ERROR VALUE \"choix\"")
}
print("\n\n")

//Largest Area
let formeMax = tabOfShapes.max(by: {$0.getSurface() < $1.getSurface()})
if let maxArea = unwrappingOptionalDouble(optionalValue: formeMax?.getSurface()){
    print("The shape containing the largest area have an area of : \(maxArea)")
}else {
    print("Fail to unwrap the max value")
}
   
//Farthest Position
let distance = {(x: Int, y: Int) -> Double in
    return sqrt(Double(x*x + y*y))
}
let maxDistance = tabOfShapes.max(by: {distance($0.x, $0.y) < distance($1.x, $1.y)})
let maxDistanceU = unwrappingOptionalInt(optionalValueX: maxDistance?.x, optionalValueY: maxDistance?.y)
if  !maxDistanceU.isEmpty {
    if let xPos = unwrappingOptionalIntSolo(optionalValue: maxDistanceU[0]){
        if let yPos = unwrappingOptionalIntSolo(optionalValue: maxDistanceU[1]){
            print("The farthest shape is positionned at (\(xPos), \(yPos))")
        }
    }
} else {
    print("Fail to unwrap the farthest position")
}
