## Swift Programming Basics

### Classes

In Swift, classes are used to create objects. An object is an instance of a class, and it has its own set of properties and methods. To create a class in Swift, use the `class` keyword:

````swift
class Person {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sayHello() {
        print("Hello, my name is \(name)!")
    }
}
````
This creates a `Person` class with two properties (`name` and `age`) and a method (`sayHello`). The init method is used to initialize the properties of the object when it is created.

To create an instance of a class, use the name of the class followed by parentheses:
```swift
let person = Person(name: "John", age: 30)
````


This creates a `Person` object named `person` with the `name` property set to "John" and the `age` property set to 30.

### Arrays

In Swift, arrays are used to store collections of data of the same type. To create an array in Swift, use the square brackets and specify the type of data the array will hold:

```swift
var numbers: [Int] = [1, 2, 3, 4, 5]
````


This creates an array of integers with the values 1, 2, 3, 4, and 5.

To access an element in an array, use square brackets and the index of the element:

````swift
print(numbers[2]) //Output: 3
````


This prints the third element in the `numbers` array, which is 3.

### Iteration

In Swift, there are two main iteration constructs: `while` and `for`.

The `while` loop is used to execute a block of code while a certain condition is true:

````swift
var i = 0
while i < 5 {
  print(i)
  i += 1
}
````


This prints the numbers 0 through 4.

The `for` loop is used to iterate over a collection of data, such as an array:

````swift
let fruits = ["apple", "banana", "orange"]
for fruit in fruits {
  print(fruit)
}
````


This prints each fruit in the `fruits` array: "apple", "banana", and "orange".

### Example Usage

Here is an example usage of these Swift programming concepts:

````swift
class Car {
  var make: String
  var model: String
  var year: Int
  
  init(make: String, model: String, year: Int) {
    self.make = make
    self.model = model
    self.year = year
  }

  func start() {
    print("\(make) \(model) started.")
  }
}

var cars: [Car] = []
let car1 = Car(make: "Toyota", model: "Corolla", year: 2022)
let car2 = Car(make: "Ford", model: "Mustang", year: 2023)
cars.append(car1)
cars.append(car2)

for car in cars {
  car.start()
}

````

This creates two `Car` objects and prints a message indicating that each car

### Inheritance

In Swift, you can create a new class that is a modified version of an existing class by using inheritance. The new class, called the subclass, inherits all the properties and methods of the existing class, called the superclass. To create a subclass in Swift, use the `class` keyword followed by the name of the subclass and the name of the superclass in parentheses:

````swift
class Animal {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeSound() {
        print("...")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Woof!")
    }
}

class Cat: Animal {
    override func makeSound() {
        print("Meow!")
    }
}
````
This creates an `Animal` class with a `name` property and a `makeSound` method. The `Dog` and `Cat` subclasses inherit the `name` property and the `makeSound` method from the `Animal` superclass, but they override the `makeSound` method with their own implementation.

To create an instance of a subclass, use the same syntax as for creating an instance of a superclass:

````swift
let dog = Dog(name: "Fido")
let cat = Cat(name: "Whiskers")
````

### Polymorphism
In Swift, polymorphism means that objects of different classes can be used interchangeably if they have a common superclass. For example, if you have a function that takes an `Animal` object as a parameter, you can pass a `Dog` object or a `Cat` object to the function because `Dog` and `Cat` are subclasses of `Animal`. Here's an example:

````swift
func makeAnimalSound(animal: Animal) {
    animal.makeSound()
}

makeAnimalSound(animal: dog) // Output: Woof!
makeAnimalSound(animal: cat) // Output: Meow!
````

This calls the `makeSound` method on the `Dog` object and the `Cat` object using the same `makeAnimalSound` function.

### Method Overloading

In Swift, you can define multiple methods with the same name in a class as long as they have different parameter types or different numbers of parameters. This is called method overloading. Here's an example:

````swift
class Calculator {
    func add(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func add(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
}
````

This creates a `Calculator` class with two `add` methods. One `add` method takes two integers as parameters and returns an integer, while the other `add` method takes two doubles as parameters and returns a double.

To call a specific `add` method, Swift will choose the method based on the types of the parameters passed in:

```swift
let calculator = Calculator()
let result1 = calculator.add(2, 3) // result1 = 5
let result2 = calculator.add(2.5, 3.5) // result2 = 6.0
```

### Example Usage

Here's an example that demonstrates inheritance, polymorphism, and method overloading:

````swift
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

````




