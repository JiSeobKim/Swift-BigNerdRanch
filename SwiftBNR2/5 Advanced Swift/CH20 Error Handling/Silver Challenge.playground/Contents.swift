//: Chapter 20 - Error Handling
//: ===========================

/*:
- 🏅 Silver Challenge
*/

import Cocoa

//: Lexing an Input String
//: ----------------------

enum Token {
    case Number(Int, String.CharacterView.Index)
    case Plus(String.CharacterView.Index)
    
    func characterIndex() -> String.CharacterView.Index {
        switch self {
        case .Number(_, let index): return index
        case .Plus(let index): return index
        }
    }
    
    func value() -> String {
        switch self {
        case .Number(let number, _): return "\(number)"
        case .Plus(_): return "+"
        }
    }
}

class Lexer {
    
    enum Error: ErrorType {
        case InvalidCharacter(Character, String.CharacterView.Index)
    }
    
    let input: String.CharacterView // A String's collection of Characters (extended grapheme clusters) elements.
    var position: String.CharacterView.Index
    
    init(input: String) {
        self.input = input.characters
        self.position = self.input.startIndex
    }
    
    func peek() -> Character? {
        guard position < input.endIndex else {
            return nil
        }
        return input[position]
    }
    
    func advance() {
        assert(position < input.endIndex, "cannot advance past the end")
        ++position
    }
    
    func getNumber() -> Int {
        var value = 0
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9" :
                let digitValue = Int(String(nextCharacter))!
                value = 10 * value + digitValue
                advance()
            default :
                //  A non-digit go back to regular lexing
                return value
            }
        }
        return value
    }
    
    func lex() throws -> [Token] {
        var tokens = [Token]()
        
        while let nextCharacter = peek() {
            switch nextCharacter {
            case "0" ... "9" :
                let value  = getNumber()
                tokens.append(.Number(value, position))
            case "+" :
                tokens.append(.Plus(position))
                advance()
            case " " :
                advance()
            default:
                throw Error.InvalidCharacter(nextCharacter, position)
            }
        }
        return tokens
    }
}

//: Parsing the Token Array
//: -----------------------

class Parser {
    
    enum Error: ErrorType {
        case UnexpectedEndOfInput
        case InvalidToken(Token)
    }
    
    let tokens: [Token]
    var position = 0
    
    init(tokens: [Token]) {
        self.tokens = tokens
    }
    
    func getNextToken() -> Token? {
        guard position < tokens.count else {
            return nil
        }
        return tokens[position++]
    }
    
    func getNumber() throws -> (Int, String.CharacterView.Index) {
        guard let token = getNextToken() else {
            throw Error.UnexpectedEndOfInput
        }
        
        switch token {
        case .Number(let value, let index):
            return (value, index)
        case .Plus:
            throw Error.InvalidToken(token)
        }
    }
    
    func parse() throws -> (Int, String.CharacterView.Index) {
        var value = try getNumber()
        
        while let token = getNextToken() {
            switch token {
            case .Plus:
                let nextNumber = try getNumber()
                value.0 += nextNumber.0
            case .Number:
                throw Error.InvalidToken(token)
            }
        }
        return value
    }
}

func evaluate(input: String) {
    print("Evaluating: \(input)")
    let lexer = Lexer(input: input)
    
    do {
        let tokens = try lexer.lex()
        print("Lexer output: \(tokens)")
        
        let parser = Parser(tokens: tokens)
        
        let result = try parser.parse()
        print("Parser output: \(result)")
        
    } catch Lexer.Error.InvalidCharacter(let character, let index) {
        print("Input contained an invalid character at index \(index): \(character)")
    } catch Parser.Error.UnexpectedEndOfInput {
        print("Unexpected end of input during parsing")
    } catch Parser.Error.InvalidToken(let token) {
            print("Invalid token during parsing at index \(token.characterIndex()): \(token.value())")
    } catch {
        print("An error occured: \(error)")
    }
}

evaluate("1 + 3 + 7a + 8")
evaluate("10 + 3 3 + 7")




