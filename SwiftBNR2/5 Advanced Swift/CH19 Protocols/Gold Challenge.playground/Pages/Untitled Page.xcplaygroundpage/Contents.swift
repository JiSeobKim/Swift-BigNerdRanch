//: Chapter 19 - Protocols
//: ======================

import Cocoa

//: 🏅 Gold Challenge
// Had to change itemForRow to return a String instead of an Int

print("🏅 Gold Challenge \n ")

func padding(amount: Int) -> String {
    var paddingString = ""
    for _ in 0 ..< amount {
        paddingString += " "
    }
    return paddingString
}

protocol TabularDataSourceGold {
    var numberOfRows: Int { get }
    var numberOfColumns: Int { get }
    
    func labelForRow(row: Int) -> String
    func labelForColumn(column: Int) -> String
    
    func itemForRow(row: Int, column: Int) -> String
    
    func maxWidthForColumnLabels() -> [Int]
    func maxWidthForColumnContent() -> [Int]
    func determineColumnWidth() -> [Int]
}

func printTableGold(dataSource: protocol<TabularDataSourceGold, CustomStringConvertible>) {
    
    print(dataSource.description)
    
    let rowLabels = (0 ..< dataSource.numberOfRows).map {
        dataSource.labelForRow($0)
    }
    
    let columnLabels = (0 ..< dataSource.numberOfColumns).map {
        dataSource.labelForColumn($0)
    }
    
    let rowLabelWidth = rowLabels.map{ $0.characters.count}
    guard let maxRowLabelWidth = rowLabelWidth.maxElement() else {
        return
    }
    
    var firstRow: String = padding(maxRowLabelWidth) + " |"
    
    var columnWidths = dataSource.determineColumnWidth()
    for (index, label) in columnLabels.enumerate() {
        
        let padColumnHeader = columnWidths[index] - label.characters.count
        let columnHeader = " \(label)" +  padding(padColumnHeader) + " |"
        firstRow += columnHeader
    }
    
    print(firstRow)
    
    for i in 0 ..< dataSource.numberOfRows {
        let paddingAmount = maxRowLabelWidth - rowLabelWidth[i]
        var out = rowLabels[i] + padding(paddingAmount) + " |"
        
        for j in 0 ..< dataSource.numberOfColumns {
            let item = dataSource.itemForRow(i, column: j)
            let itemString = " \(item)"
            let paddingAmount = columnWidths[j] - itemString.characters.count
            out += padding(paddingAmount) + itemString + "  |"
        }
        print(out)
    }
}

struct Book {
    var title: String
    var author: String
    var averageReviewRating: Int
}

struct BookCollection: TabularDataSourceGold, CustomStringConvertible {
    var books = [Book]()
    
    mutating func addBook(book: Book) {
        books.append(book)
    }
    
    // Conform to CustomStringConvertible
    var description: String {
        return "Table: Book Collection"
    }
    
    // Conform to TabularDataSource
    var numberOfRows: Int {
        return books.count
    }
    
    var numberOfColumns: Int {
        return 2
    }
    
    func labelForRow(row: Int) -> String {
        return books[row].title
    }
    
    func labelForColumn(column: Int) -> String {
        switch column {
        case 0: return "Authors"
        case 1: return "Average reviews on Amazon"
        default: fatalError("no label for column")
        }
    }
    
    func itemForRow(row: Int, column: Int) -> String {
        let book = books[row]
        switch column {
        case 0: return book.author
        case 1: return "\(book.averageReviewRating)"
        default: fatalError("no item for row")
        }
    }
    
    func maxWidthForColumnLabels() -> [Int] {
        let columnLabelWidths = (0 ..< numberOfColumns).map { labelForColumn($0) }
        return columnLabelWidths.map { $0.characters.count }
    }
    
    func maxWidthForColumnContent() -> [Int] {
        
        var widthsForColumns = [String]()
        for column in 0 ..< numberOfColumns {
            for row in 0 ..< numberOfRows {
                widthsForColumns.append(itemForRow(row, column: column))
            }
        }
        
        let devideArrayBy = widthsForColumns.count / numberOfColumns
        
        var arrayOfArrays = [[Int]]()
        
        // ideally this should not be hardcoded
        var firstArray = [Int]()
        var secondArray = [Int]()
        
        for (index, value) in widthsForColumns.enumerate() {
            
            // and this is also pretty crap
            if index < devideArrayBy {
                firstArray.append(value.characters.count)
            } else {
                secondArray.append(value.characters.count)
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

let theLittlePrice = Book(title: "The Little Prince", author: "Antoine de Saint-Exupéry", averageReviewRating: 4)
let aliceInWonderLand = Book(title: "Alice's Adventures in Wonderland", author: "Lewis Carol", averageReviewRating: 3)
let peterPan = Book(title: "Peter Pan; or, the Boy Who Wouldn't Grow Up", author: "J. M. Barrie", averageReviewRating: 4)

var bookCollection = BookCollection()
bookCollection.books.append(aliceInWonderLand)
bookCollection.books.append(theLittlePrice)
bookCollection.books.append(peterPan)

printTableGold(bookCollection)

