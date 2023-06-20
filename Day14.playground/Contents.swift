import Cocoa

//Optionals
let optionalInt :Int? = 10
let optioalInt2 : Optional<Int> = nil

// providing value using enum case of optional
let optionalString : String? = Optional.some("raj")
let optionalString2 : String? = Optional.none


//Optional binding
if let optionalInt = optionalInt{
    print(optionalInt)
}

func unwrapOptional(){
    guard let optionalInt = optionalInt else{
        return
    }
}

switch optionalInt{
case .some(let optionalInt):
    print(optionalInt)
case .none :
    print("Can't bind nil")
}


//Optional chaning
struct Address {
    var street: String
    var city: String
}

struct Person {
    var name: String
    var address: Address?
}

let person1 = Person(name: "John", address: Address(street: "123 Main St", city: "New York"))
let person2 = Person(name: "Jane", address: nil)

let city1 = person1.address?.city
let city2 = person2.address?.city


//Nil-Coalescing Operator -> provides default value whent the optional is nil
print("Person 1 city: \(city1 ?? "Unknown")")
print("Person 2 city: \(city2 ?? "Unknown")")

//Forced unwrap
let unwrappedVal = optionalInt!
let city3 = person1.address!.city


enum MyError: Error {
    case divisionByZero
}

func divide(_ dividend: Int, by divisor: Int) throws -> Int {
    guard divisor != 0 else {
        throw MyError.divisionByZero
    }
    return dividend / divisor
}

let dividend = 10
let divisor = 0

if let result = try? divide(dividend, by: divisor) {
    print("Result: \(result)")
} else {
    print("error occurred ")
}


//check point 9
func getRandomNumber(from array:[Int]?)->Int{
    return array?.randomElement() ?? (0...100).randomElement() ?? 0
}

print("Random element from 1,2,3,4 \(getRandomNumber(from:[1,2,3,4]))")
print("Empty array random element \(getRandomNumber(from: []))")
print("passing nil : \(getRandomNumber(from: nil))")
