//: Chapter 19 - Protocols
//: ======================

import Cocoa

//: 🏅 Silver Challenge

//: Defining a Protocol

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    var widthForColumn: [ Int : Int ] { get }
    
    func labelForRow(row: Int) -> String
    mutating func labelForColumn(column: Int) -> String
    mutating func itemForRow(row:Int, column: Int) -> Int
    //    func widthForColumn(column: Int) -> Int
}

//: Labelling the rows


func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

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
    
    var widthForColumn = [ Int : Int ]()
    
    func labelForRow(row: Int) -> String {
        return people[row].name
    }
    
    mutating func labelForColumn(column: Int) -> String {
        switch column {
        case 0:
            let name = "Age"
            widthForColumn[0] = name.characters.count
            return name
        case 1:
            let name = "Years of Experience"
            widthForColumn[1] = name.characters.count
            return name
        default: fatalError("Invalid column!")
        }
    }
    
    mutating func itemForRow(row: Int, column: Int) -> Int {
        let person = people[row]
        switch column {
        case 0:
            let item = String(person.age)
            if item.characters.count > widthForColumn[0] {
                widthForColumn[0] = item.characters.count
            }
            return person.age
        case 1:
            let item = String(person.yearsOfExperience)
            if item.characters.count > widthForColumn[1] {
                widthForColumn[0] = item.characters.count
            }
            return person.yearsOfExperience
        default: fatalError("Invalid Column!")
        }
    }
    
}

var department = Department(name: "Engineering")

var joe = Person(name: "Joe", age: 3000, yearsOfExperience: 6)
var karen = Person(name: "Karen", age: 40, yearsOfExperience: 18)
var fred = Person(name: "Fred", age: 50, yearsOfExperience: 20)

department.addPerson(joe)
department.addPerson(karen)
department.addPerson(fred)

//: Protocol Composition
func printTabel(var dataSource: protocol<TabularDataSource, CustomStringConvertible> ) {
    
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
    
    
    for columnLabel in columnLabels {
        let columnHeader = " \(columnLabel)   |"
        firstRow += columnHeader
    }
    
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows{
        let paddingAmount = maxRowLabelWidth - rowLabelWidths[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item) |"
            if let columnWidth = dataSource.widthForColumn[j] {
                out += padding(columnWidth) + itemString
            }
        }
        print(out)
    }
}


printTabel(department)

