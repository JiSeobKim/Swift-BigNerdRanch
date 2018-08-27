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

//: 🏅 Silver Challenge

//: 🏅 Gold Challenge

//: Formatting a Table of Data
//: --------------------------

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

let rowLabels = ["Joe", "Karen", "Fred"]

let columnLabels = ["Age", "Years of Experience"]

//printTable(data)

//: Defining a Protocol

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row:Int, column: Int) -> Int
}

//: Labelling the rows


func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

/*
func printTable(rowLabels:[String], data: [[Int]]) {
    let rowLabelWidths = rowLabels.map { $0.characters.count }
    guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
        return
    }
    
    for (i, row) in data.enumerate() {
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        for item in row {
            out += " \(item) |"
        }
        print(out)
    }
}

printTable(rowLabels, data: data)
*/

//: Labelling the columns

/*
func printTable(rowLabels: [String], columnLables: [String], data: [[Int]]) {
   
    let rowLabelWidths = rowLabels.map { $0.characters.count }
    guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
        return
    }
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    
    print(firstRow)
    
    for (i, row) in data.enumerate() {
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        for(j, item) in row.enumerate() {
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
        print(out)
    }
}

printTable(rowLabels, columnLables: columnLabels, data: data)

*/

//: Using model Objects

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department : TabularDataSource, CustomStringConvertible {
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
    
    // Conform to TabularDataSource Protocol 
    
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
        default: fatalError("Invalid Column!")
        }
    }
}

var department = Department(name: "Engineering")

var joe = Person(name: "Joe", age: 30, yearsOfExperience: 6)
var karen = Person(name: "Karen", age: 40, yearsOfExperience: 18)
var fred = Person(name: "Fred", age: 50, yearsOfExperience: 20)

department.addPerson(joe)
department.addPerson(karen)
department.addPerson(fred)

// Making printTable(_:) take a TabularDataSource

// func printTable(dataSource: TabularDataSource) {


//: Protocol Composition
func printTabel(dataSource: protocol<TabularDataSource, CustomStringConvertible> ) {

    print("Table: \(dataSource.description)")
    
    let rowLabels = (0 ..< dataSource.numberOfRows).map {
        dataSource.labelForRow($0)
    }
    
    let columnLabels = (0 ..< dataSource.numberOfColumns).map {
        dataSource.labelForColumn($0)
    }
    
    let rowLabelWidths = rowLabels.map { $0.characters.count }
    
    guard let maxRowLabelWidth = rowLabelWidths.maxElement() else {
        return
    }
    
    var firstRow: String = padding(maxRowLabelWidth) + " |"

    var columnWidths = [Int]()
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel) |"
        firstRow += columnHeader
        columnWidths.append(columnHeader.characters.count)
    }
    
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows{
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item) |"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString
        }
        print(out)
    }
}

printTabel(department)

//: Mutating Methods
//: ----------------

protocol Toggleable {
    mutating func toggle()
}

enum LightBulb: Toggleable {
    case On
    case Off
    
    mutating func toggle() {
        switch self {
        case .On: self = .Off
        case .Off: self = .On
        }
    }
}

var light = LightBulb.On
light.toggle()


