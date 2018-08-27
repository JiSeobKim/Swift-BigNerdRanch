//: Chapter 19 - Protocols
//: ======================================

/*:
- Formatting a Table of Data
- Protocols
- Protocol Conformance
- Protocol Inheritance
- Protocol Compositions
- Mutating Methods
*/

import Cocoa

//: Formatting a Table of Data
//: --------------------------


//: Setting up a table

/*
func printTable(data: [[Int]]) {
for row in data {
var out = ""
for item in row {
out += "\(item) |"
}
print(out)
}
}
*/

let data = [
    [30,6],
    [40,18],
    [50,20]
]

// printTable(data)

//: Labeling the rows

func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

/*
func printTable(rowlabels: [String], data: [[Int]]) {

let rowLabelWidths = rowlabels.map { $0.characters.count }

guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
return
}

for (i, row) in data.enumerate() {
let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
var out = rowlabels[i] + padding(paddingAmount) + " |"

for item in row {
out += "\(item) |"
}
print(out)
}
}
*/

let rowLabels = ["Joe", "Karen", "Fred"]

// printTable(rowLabels, data: data)

//: Labeling the columns

/*
func printTable(rowLables: [String], columnLables:[String], data: [[Int]]) {
    
    // create an array of the width of each row label
    let rowLabelWidth = rowLabels.map{ $0.characters.count}
    
    // determine the length of the longes row label
    guard let maxRowLabelWidth = rowLabelWidth.maxElement() else {
        return
    }
    
    // create first row containing columnn headers
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    
    // also keep track of the width of each column
    var columnWidths = [Int]()
    
    for columnLabel in columnLables {
        let columnHeader = "\(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    
    print(firstRow)
    
    for (i, row) in data.enumerate() {
        
        // pad the row label out so they are all the same lenght
        
        let paddingAmount = maxRowLabelWidth - rowLabelWidth[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        // append each item in this row to our string
        
        for (j, item) in row.enumerate() {
            let itemString = "\(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
        print(out)
    }
}

let columnLables = ["Age", "Years of Experience"]

printTable(rowLabels, columnLables: columnLables, data: data)
*/

//: Using model objects

/*
struct Person {
let name: String
let age: Int
let yearsOfExperience: Int
}

struct Department {
let name: String
var people = [Person]()

init(name: String) {
self.name = name
}

mutating func addPerson(person: Person) {
people.append(person)
}
}

var department = Department(name: "Engineering")
let joe = Person(name: "Joe", age: 30, yearsOfExperience: 6)
department.addPerson(joe)
let karen = Person(name: "Karen", age: 40, yearsOfExperience: 18)
department.addPerson(karen)
let fred = Person(name: "Fred", age: 50, yearsOfExperience: 20)
department.addPerson(fred)
*/

//: Protocols
//: ---------

//: Defining a protocol

/*

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
}


struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource {
    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }
    
    // Conform to TabularDataSource protocol
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Age"
        case 1: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column {
        case 0: return person.age
        case 1: return person.yearsOfExperience
        default: fatalError("invalid column!")
        }
    }
    
}

var department = Department(name: "Engineering")
let joe = Person(name: "Joe", age: 30, yearsOfExperience: 6)
department.addPerson(joe)
let karen = Person(name: "Karen", age: 40, yearsOfExperience: 18)
department.addPerson(karen)
let fred = Person(name: "Fred", age: 50, yearsOfExperience: 20)
department.addPerson(fred)

*/
//: Making printTable(_:) take a TabularDataSource

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
}

/*
func printTable(dataSource: TabularDataSource) {
   
    // create arrays of the row and column labels
    let rowLabels = (0 ..< dataSource.numberOfRows).map {
        dataSource.labelForRow($0)
    }
    
    let columnLabels = (0 ..< dataSource.numberOfColumns).map {
        dataSource.labelForColumn($0)
    }
    
    // create an array of the width of each row label
    let rowLabelWidth = rowLabels.map{ $0.characters.count}
    
    // determine the length of the longes row label
    guard let maxRowLabelWidth = rowLabelWidth.maxElement() else {
        return
    }
    
    // create first row containing columnn headers
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    
    // also keep track of the width of each column
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = "\(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        // pad the row label out so they are all the same lenght
        
        let paddingAmount = maxRowLabelWidth - rowLabelWidth[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        // append each item in this row to our string
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = "\(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
        print(out)
    }
}

*/

//: Printing department

// printTable(department)

//: Protocol Conformance
//: --------------------

//: Conforming to CustomStringConvertible

/*
protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
}
*/



struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource, CustomStringConvertible {
    let name: String
    var people = [Person]()
    
    init(name: String) {
        self.name = name
    }
    
    mutating func addPerson(person: Person) {
        people.append(person)
    }

    // Conform to CustomStringConvertible
    
    var description: String {
        return "Department (\(name))"
    }
    
    // Conform to TabularDataSource protocol
    
    var numberOfRows: Int {
        return people.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Age"
        case 1: return "Years of Experience"
        default: fatalError("Invalid column!")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column {
        case 0: return person.age
        case 1: return person.yearsOfExperience
        default: fatalError("invalid column!")
        }
    }
    
}

var department = Department(name: "Engineering")
let joe = Person(name: "Joe", age: 30, yearsOfExperience: 6)
department.addPerson(joe)
let karen = Person(name: "Karen", age: 40, yearsOfExperience: 18)
department.addPerson(karen)
let fred = Person(name: "Fred", age: 50, yearsOfExperience: 20)
department.addPerson(fred)

// printTable(department)

//: Printing the department's name
// print(department)

//: Protocol Inheritance
//: --------------------

//: Marking TabularDataSource inherit from CustomeStringConvertible

/*

// added code before printTable(_:)
// TabularDataSource should not be CustomStringConvertible
protocol TabularDataSource: CustomStringConvertible {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
}
*/

//: Protocol Composition
//: --------------------

func printTable(dataSource: protocol<TabularDataSource, CustomStringConvertible>) {
    
    print(dataSource.description)
    
    // create arrays of the row and column labels
    let rowLabels = (0 ..< dataSource.numberOfRows).map {
        dataSource.labelForRow($0)
    }
    
    let columnLabels = (0 ..< dataSource.numberOfColumns).map {
        dataSource.labelForColumn($0)
    }
    
    // create an array of the width of each row label
    let rowLabelWidth = rowLabels.map{ $0.characters.count}
    
    // determine the length of the longes row label
    guard let maxRowLabelWidth = rowLabelWidth.maxElement() else {
        return
    }
    
    // create first row containing columnn headers
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    
    // also keep track of the width of each column
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = "\(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        // pad the row label out so they are all the same lenght
        
        let paddingAmount = maxRowLabelWidth - rowLabelWidth[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        // append each item in this row to our string
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = "\(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
        print(out)
    }
}

printTable(department)

//: Mutating Methods
//: ----------------

protocol Toggleable {
    mutating func toggle()
}

enum Lightbulb: Toggleable {
    case On
    case Off
    
    mutating func toggle() {
        switch self {
        case .On: self = .Off
        case .Off: self = .On
        }
    }
}




