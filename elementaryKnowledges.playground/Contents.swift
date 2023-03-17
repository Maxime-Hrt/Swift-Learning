import UIKit

class Vehicle {
    var make: String
    var model: String
    
    init(make: String, model: String) {
        self.make = make
        self.model = model
    }
    
    func start() {
        print("Starting the \(make) \(model)")
    }
    
    func stop() {
        print("Stopping the \(make) \(model)")
    }
    
    func drive(distance: Int) {
        print("Driving the \(make) \(model) for \(distance) miles")
    }
}

class Car: Vehicle {
    var numDoors: Int
    
    init(make: String, model: String, numDoors: Int) {
        self.numDoors = numDoors
        super.init(make: make, model: model)
    }
    
    override func start() {
        print("Starting the \(make) \(model) with \(numDoors) doors")
    }
    
    override func drive(distance: Int) {
        print("Driving the \(make) \(model) with \(numDoors) doors for \(distance) miles")
    }
    
    func drive(distance: Int, speed: Int) {
        print("Driving the \(make) \(model) with \(numDoors) doors for \(distance) miles at \(speed) mph")
    }
}

class Motorcycle: Vehicle {
    var hasWindshield: Bool
    
    init(make: String, model: String, hasWindshield: Bool) {
        self.hasWindshield = hasWindshield
        super.init(make: make, model: model)
    }
    
    override func start() {
        print("Starting the \(make) \(model) motorcycle")
    }
    
    override func drive(distance: Int) {
        print("Driving the \(make) \(model) motorcycle for \(distance) miles")
    }
}

func main() {
    // Create some vehicles
    let car = Car(make: "Toyota", model: "Corolla", numDoors: 4)
    let motorcycle = Motorcycle(make: "Harley-Davidson", model: "Fat Boy", hasWindshield: true)
    
    // Call some methods on the vehicles
    car.start()
    motorcycle.start()
    
    car.drive(distance: 10)
    car.drive(distance: 1000)
    
    motorcycle.drive(distance: 50)
    
    // Use some polymorphism
    let vehicles: [Vehicle] = [car, motorcycle]
    
    for vehicle in vehicles {
        vehicle.stop()
    }
    
    // Use some method overloading
    car.drive(distance: 200, speed: 60)
}

main()
