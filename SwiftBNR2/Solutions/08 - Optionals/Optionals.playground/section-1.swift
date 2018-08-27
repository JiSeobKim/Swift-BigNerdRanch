// Playground - noun: a place where people can play

import Cocoa
import Swift

//var errorCodeString: String?
//errorCodeString = "an error occurred"
//if let theError = errorCodeString {
//    print(theError)
//}

var errorCodeString: String?
errorCodeString = "404"
if let theError = errorCodeString {
    if let errorCodeInteger = Int(theError) {
        print("\(theError): \(errorCodeInteger)")
    }
}

var errorDescription: String?
if let theError = errorCodeString, errorCodeInteger = Int(theError) where errorCodeInteger == 404 {
    errorDescription = "\(errorCodeInteger + 200): the requested resource was not found."
}

var upCaseErrorDescription = errorDescription?.uppercaseString
upCaseErrorDescription?.appendContentsOf(" PLEASE TRY AGAIN.")
upCaseErrorDescription

//let description: String
//if let errorDescription = errorDescription {
//    description = errorDescription
//} else {
//    description = "No error"
//}

errorDescription = nil
let description = errorDescription ?? "No error"
