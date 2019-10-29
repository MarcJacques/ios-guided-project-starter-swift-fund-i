//: # Swift Fundamentals I
//: ## Hello, World!
//: As tradition dictates, any exploration of a new language needs to start with "hello, world"
let helloString = "Hello, World!"
print(helloString)
//: ## Comments
//: A comment is text that is ignored by the compiler. So it can be plain text, or even code. If it formatted like the examples below, it will be completely ignored when the project is built. Comments are notes to yourself or others about how a given block of code functions.
// A single line comment is one with two slashes as the first characters
/*
 * A multi-line comment
 * is one that is bounded by
 * /* and */ characters
 */
//: ## Identifiers
//: first character A-Z or a-z or _, followed by any of these plus 0-9
let lambdaSchool = "awesome", ls100 = "100%", _travelBack = "1985"
//: ## Mutability
//: There are two kinds of containers that hold values in Swift. One kind is called a constant, because once a value has been set, it cannot change for the lifetime of that container. Constants are declared with the `let` keyword.
let students = 30
let staff = 4
//let totalPeople = students + staff
// constants can not change
var totalPeople = students + staff
//: Variables are declared with the 'var' keyword
totalPeople = 4
//: ## Type Inference and Explicit Typing
//: All containers in Swift must have a type set on them. The containers we've seen so far had their types set implicitly. This is called _type inference_. Meaning the kind of object stored in the container was determined by looking at what kind of value was assigned to the container.
let ios = "Apple's mobile operating system"
// swift can implicitly infer what the datatype of the value stored inside the container
//: In the line above, the constant `ios` stores a value "Apple's mobile operating system". This value is a `String`, so the data type of `ios` is `String`. The type was _inferred_ by the value provided.
//: Another way to type a container is to set it explicitly. See some examples of this below.
let price: Double = 1299.99
let onSale: Bool = true
let modelName: String = "MacBook Pro"
let discountQty: Int = 15
// we told it exactly the type. but we don't always need to do that since swift is pretty good at inferring
if onSale {
    print("\(modelName) on sale for \(price)!")
}
//: ## Type Safety
//: Once a container's data type is set, it cannot hold a value of any other type
var life = 42
life = 12 // we just can't change the datatype of the value. however as long as the container is a variable you can always change the value as long as it is the same datatype as when the container was initially setup. This is type safety.
//: ## Type Coercion
//: Types are never automatically converted into another type.
let label = "The width is "
let width = 94
//let widthLabel = label + width can not convert one into the other. This is type coercion
let widthLabel = label + String(width)
print(widthLabel)
//: ## String Interpolation and Concatenation
//: Using the `+` operator with two strings is called _string concatentation_. One string is appended to the end of another.
let heightLabel = "The height is " + "100" //concatenation
//: The below example shows the _string interpolation_ characters (`\()`). These allow a `String` (or non-string) value to be placed in-line inside a larger `String` literal value. If the value is not already a `String`, it will be converted.
let anotherWidthLabel = "The width is \(width)" // interpolation


//: ## Collections
//: ### Arrays
//: A Swift array is a collection of like objects, and they are stored in the order they are added. Accessing a particular element is done by using its index value (which starts at 0).
let shipCaptains = ["Malcolm Reynolds", "Jean-Luc Picard", "James T. Kirk", "Han Solo"]
let sameCaptains = ["Malcolm Reynolds", "Jean-Luc Picard", "James T. Kirk", "Han Solo"]
let differentCaptains = ["Kathryn Janeway", "Poe Dameron"]
//: Array equality is determined by looking at each element. If all elements are the same, and in the same order, the two arrays are equal.
print(differentCaptains[0])// this is how you access individual elements from the array. arrrays always are indexed from 0
print(sameCaptains[0])

if shipCaptains == differentCaptains { // 1 equal sign is assignment. 2 equal signs is equality, used in boolean logic
    print("Arrays are equal.")
} else {
    print("Arrays are not equal.")
}
//: Since `shipCaptains` was declared as a constant, we must convert it to a mutable array before we can add entries.
var moreCaptains = shipCaptains // this assigns the value of shipCaptains to the new array. and now that it is a variable it is editable
moreCaptains.append("Kathryn Janeway")
moreCaptains[1] = "Poe Dameron"
moreCaptains.insert("Jean-Luc Picard", at: 2)
print(moreCaptains) //arrays must be like types.
//: ### Dictionaries
//: A Swift dictionary is similar to an array in that is a collection, but the items are stored in no particular order. To access an item, its associated key is provided. Dictionaries are also called "key-value" stores. The key has a type, and the value can have the same or a different type.
var occupations = ["Malcolm": "Captain", "Kaylee": "Mechanic"]
occupations["Malcolm"]
occupations["Jayne"] = "Public Relations"
print(occupations)

//: ## Looping
//: ### `for`
//: `for` loops allow for iterating over a collection of elements (usually an array), examining each element in turn.
let scores = [75, 43, 103, 87, 78, 12, 85]
var passingStudents = 0
for score in scores {
    if score > 70 {
        passingStudents += 1
    }
}
print("\(passingStudents) students scored a passing grade of 70 or higher. ")

//: ### `switch`
//: `switch` statements are useful when a multiple-choice path is possible for your code, and you want to choose a single path at runtime, based on some criteria.
let number = 6
switch number {
case 1:
    print("Got 1")
case 2:
    print("Got 2")
case 3, 4, 5:
    print("Got 3, 4, 5")
case 6...22:
    print("Got 6 to 22")
default:
    print("Got Default")
}

let furniture = "Chair"
switch furniture {
case "Table":
    print("Got Table")
case "Chair", "Stool", "Bench":
    print("Got someting to sit on")
default:
    print("Default")
}
//: ## Functions
//: A function in Swift is nothing more than a collection of instructions that accomplish some task. The advantage to grouping the instructions into a function is that the function can then be called whenever that task should be performed, rather than having to list out those instrutions a second, third, or nth time.
func averageScore(_ scores: [Int]) -> Int {
    var totalScore = 0
    for score in scores {
        totalScore += score
    }
    return totalScore / scores.count
}

let avg = averageScore(scores)

//: ## Tuples
//: Tuples are a lightweight way of grouping related values into a single compound value.
let carrots = (name: "carrots", aisle: 4, category: "produce", count: 25)
let soup = (name: "tomato soup", aisle: 6, category: "canned goods", count: 100)
let cereal = (name: "Frosted Flakes", aisle: 2, category: "cereals", count: 43)
let pringles = (name: "Pringles", aisle: 7, category: "chips", count: 15)
let tostitos = (name: "Tostitos", aisle: 7, category: "chips", count: 26)
let seafood = (name: "crab legs", aisle: 1, category: "seafood", count: 8)
let rice = (name: "Minute Rice", aisle: 2, category: "dry rice and beans", count: 62)
let turkey = (name: "Boar's Head turkey", aisle: 9, category: "deli", count: 4)
// groceries is an array of tuples

let groceries = [carrots, soup, cereal, pringles, tostitos, seafood, rice, turkey]

func determineTotalCount() -> Int {
    var totalCount = 0
    for anItem in groceries {
        totalCount += anItem.count
    }
    
    return totalCount
}

print("Total count of all grocery items: \(determineTotalCount())")

