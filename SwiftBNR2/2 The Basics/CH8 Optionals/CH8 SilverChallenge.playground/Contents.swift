//: Playground - noun: a place where people can play

import Cocoa

// Silver Challenge

var optionalString: String?
optionalString = nil
let forceUnwrappedString = optionalString!

/*
Error: unexpectedly found nil while unwrapping an Optional value
The optionalString is nil, but when a variable is force unwrapped, it is not allowed to be nil.

*/
/*

// Optional binding

var errorCodeString: String?
errorCodeString = "404"

if let error = errorCodeString,
    errorCode = Int(error) where errorCode == 404 {
    print(errorCode)
}

*/

/*

// Implicitly Unwrapped Optionals

var errorCodeString: String!
errorCodeString = "404"
print(errorCodeString)
*/

// Optional Chaining

var errorCodeString: String?
errorCodeString = "404"
var errorDescription: String?

if let error = errorCodeString,
    errorCodeInteger = Int(error) where errorCodeInteger == 404 {
        errorDescription = "\(errorCodeInteger + 200): the request resource was not found. "
}

var upperCaseErrorDescription = errorDescription?.uppercaseString
errorDescription

// Modify an optional in place

upperCaseErrorDescription?.appendContentsOf("PLEASE TRY AGAIN")
print(upperCaseErrorDescription)


// The nil Coalescing Operator

// errorDescription = nil
let description = errorDescription ?? "No Error"

