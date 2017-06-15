//
//  main.swift
//  Go_Through_Github
//
//  Created by iFlame. on 14/06/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import Foundation

//********************************** Go-Through-Github ***********************************//


/*********************************** Commenting  ***********************************/
// This is an inline comment

/* This is a block comment
 and it can span multiple lines. */

// You can also use it to comment out code
/*
 func doWork() {
 // Implement this
 }
 */


/***********************************Data Types  ***********************************/




/*   Integer  */

let aOneByteInt: Int8 = 127
let aOneByteUnsignedInt: UInt8 = 255

let aTwoByteInt: Int16 = 32767
let aTwoByteUnsignedInt: UInt16 = 65535

let aFourByteInt: Int32 = 2147483647
let aFourByteUnsignedInt: UInt32 = 4294967295

let anEightByteInt: Int64 = 9223372036854775807
let anEightByteUnsignedInt: UInt64 = 18446744073709551615

let theBiggestInt: IntMax = 9223372036854775807
let theBiggestUnsignedInt: UIntMax = 18446744073709551615




/***********************************  Floating Point  ***********************************/




let aFloat = Float()
print("Float size: \(MemoryLayout.size(ofValue: aFloat))")

let aDouble = Double()
print("Double size: \(MemoryLayout.size(ofValue: aDouble))")





/***********************************  Boolean  ***********************************/




let isBool: Bool = true // or false




/***********************************  Enum  ***********************************/



enum day: String
{
    case sunday = "holiday",monday = "workday",tuesday,wednesday,thursday,friday,saturday
}
let h = day.sunday.rawValue
print(h)
let h1 = day.monday.rawValue
print(h1)

/*  Type Casting  */
let floatType : Float = 3.14
let int : Int = Int(floatType)
print(int)

let string : String = String(int)
print(string)

let numericStr : String = "123456"
let integer : Int = Int(numericStr)!
print(integer)




/***********************************Operator Overloading  ***********************************/



struct vector2d
{
    var x = 0.0,y = 0.0
    var description : String {
        return "vector2d(x: \(x), y: \(y))"
    }
}
print(vector2d())

/*func +(left: [Int], right: [Int]) -> [Int] { // 1
 var sum = [Int]() // 2
 assert(left.count == right.count, "vector of same length only")  // 3
 for (key, v) in enumerate(left) {
 sum.append(left[key] + right[key]) // 4
 }
 return sum
 }*/


/*********************************** Declaring Classes ***********************************/
class MyClass
{
    var x: Int,y: Int
    init(x1: Int,y1: Int)
    {
        self.x=x1
        self.y=y1
    }
}
let myclass = MyClass(x1: 1,y1: 2)


/*********************************** Literals ***********************************/
/* Array Access Syntax */
let example : [Any] = ["hi","there",23,true]
print("item at index 0: \(example[0])")

/* Dictionary Access Syntax */
let example1 = ["hi" : "there","iOS" : "people"]
if let value = example1["hi"]
{
    print("hi \(value)")
}


/***********************************  Functions  ***********************************/
func dowork(nm: String) -> String
{
    return "Hello \(nm)"
}
print(dowork(nm: "Kishan"))


/********************************** Constants and variables **********************************/
class conAndVar
{
    let text = "Hello" // Constant
    var id = 25 // variable
    var myInt = 1 // inferred type
    var myExplicitInt: Int = 1 // explicit type
    var x = 1, y = 2, z = 3 // declare multiple variables
    let (a,b) = (1,2) // declare multiple constants
}

/*********************************** Getters and Setters ***********************************/
private var y: Int = 0
var x: Int
{
    get
    {
        print("Accessing x...")
        return y
    }
    set
    {
        print("Setting x...")
        y = newValue
    }
}

/*********************************** Access Callbacks ***********************************/
var numberOfEdits = 0
var value: String = ""
{
    willSet
    {
        print("About to set value...")
    }
    didSet
    {
        numberOfEdits += 1
    }
}


/***********************************  Naming Conventions  ***********************************/
/*
 // Correct
 func move(from start: Point, to end: Point) {}
 
 // Incorrect (likely too expressive, but arguable)
 func moveBetweenPoints(from start: Point, to end: Point) {}
 
 // Incorrect (not expressive enough and lacking argument clarity)
 func move(x: Point, y: Point) {}
 */


/*********************************** Closures ***********************************/
let people = ["Rob", "Jimbob", "Cletus"]
people.map({
    (person: String) -> String in
    "Oh hai, \(person)..."
})

let names = ["Francesca", "Joe", "Bill", "Sally", ]
var reversed = names.sorted { (s1: String, s2: String) -> Bool in
    return s1 > s2
}
print(reversed)

/*********************************** Capturing Values ***********************************/
func capture(amount: Int) -> () -> Int{
    var runTotal = 0
    func increment() -> Int{
        runTotal += amount
        return runTotal
    }
    return increment
}

/*********************************** Capturing Self ***********************************/
typealias SomeClosureType = (_ value: String) -> ()

class SomeClass {
    fileprivate var currentValue = ""
    
    init() {
        someMethod { (value) in // Retained self
            self.currentValue = value
        }
        
        someMethod { [unowned self] (value) in // Not retained, but expected to exist
            self.currentValue = value
            
        }
        
        someMethod { [weak self] value in // Not retained, not expected to exist
            // Or, alternatively you could do
            guard let sSelf = self else { return }
            
            // Or, alternatively use `self?` without the guard
            sSelf.currentValue = value
        }
    }
    
    func someMethod(closure: SomeClosureType) {
        closure("Hai")
    }
}


/*********************************** Control Statements  ***********************************/
