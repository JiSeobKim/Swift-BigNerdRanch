//: Chapter 19 - Protocols
//: ======================

import Cocoa

print("🏅 Silver Challenge \n ")

//: 🏅 Silver Challenge

func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

protocol TabularDataSource {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> Int
    
    func maxWidthForColumnLabels() -> [Int]
    func maxWidthForColumnContent() -> [Int]
    func determineColumnWidth() -> [Int]
}

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
        return "Table: Department (\(name))"
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
    
    func maxWidthForColumnLabels() -> [Int] {
        
        var widths = [Int]()
        let columnLabelWidths = (0 ..< numberOfColumns).map {
            labelForColumn($0)
        }
        
        for w in columnLabelWidths {
            widths.append(w.characters.count)
        }
        return widths
    }
    
    func maxWidthForColumnContent() -> [Int] {
        var widthsForColumns = [Int]()
        for column in 0 ..< numberOfColumns {
            for row in 0 ..< numberOfRows {
                widthsForColumns.append(itemForRow(row, column: column))
            }
        }
        
        let devideArrayBy = widthsForColumns.count / numberOfColumns
        
        devideArrayBy
        
        var arrayOfArrays = [[Int]]()
        
        // ideally this should not be hardcoded
        var firstArray = [Int]()
        var secondArray = [Int]()
        
        for (index, value) in widthsForColumns.enumerate() {
            
            // and this is also pretty crap
            if index < devideArrayBy {
                firstArray.append(String(value).characters.count)
            } else {
                secondArray.append(String(value).characters.count)
            }
        }
        
        arrayOfArrays.append(firstArray)
        arrayOfArrays.append(secondArray)
        
        var result = [Int]()
        for array in arrayOfArrays {
            if let max = array.maxElement() {
                result.append(max)
            }
        }
        
        return result
    }
    
    func determineColumnWidth() -> [Int] {
        let labels = maxWidthForColumnLabels()
        let content = maxWidthForColumnContent()
        
        var result = [Int]()
        
        for i in 0 ..< numberOfColumns {
            if labels[i] > content[i] {
                result.append(labels[i] + 1)
            } else {
                result.append(content[i] + 1)
            }
        }
        return result
    }
    
}

var department = Department(name: "Engineering")
let joe = Person(name: "Joe", age: 30, yearsOfExperience: 6)
department.addPerson(joe)
let karen = Person(name: "Karen", age: 40, yearsOfExperience: 18)
department.addPerson(karen)
let fred = Person(name: "Fred", age: 500, yearsOfExperience: 20)
department.addPerson(fred)

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
    var columnWidths = dataSource.determineColumnWidth()
    for (index, label) in columnLabels.enumerate() {
        
        let padColumnHeader = columnWidths[index] - label.characters.count
        let columnHeader = " \(label)" +  padding(padColumnHeader) + " |"
        firstRow += columnHeader
    }
    
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        // pad the row label out so they are all the same lenght
        
        let paddingAmount = maxRowLabelWidth - rowLabelWidth[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        // append each item in this row to our string
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item)"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString + "  |"
        }
        print(out)
    }
    
    
}

printTable(department)
