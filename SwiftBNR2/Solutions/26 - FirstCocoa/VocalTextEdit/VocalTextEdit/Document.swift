//
//  Document.swift
//  VocalTextEdit
//
//  Created by John Gallagher on 1/6/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

import Cocoa

class Document: NSDocument {

    var contents: String = ""

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override func makeWindowControllers() {
        // Returns the Storyboard that contains your Document window.
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let windowController = storyboard.instantiateControllerWithIdentifier("Document Window Controller") as! NSWindowController

        let viewController = windowController.contentViewController as! ViewController
        viewController.contents = contents

        self.addWindowController(windowController)
    }

    override func dataOfType(typeName: String) throws -> NSData {
        let windowController = windowControllers[0] 
        let viewController = windowController.contentViewController as! ViewController
        let contents = viewController.contents ?? ""

        if let data = contents.dataUsingEncoding(NSUTF8StringEncoding) {
            return data
        } else {
            let userInfo = [
                NSLocalizedRecoverySuggestionErrorKey: "File cannot be encoded in UTF-8."
            ]
            throw NSError(
                domain: "com.bignerdranch.VocalTextEdit", code: 0, userInfo: userInfo)
        }
    }

    override func readFromData(data: NSData, ofType typeName: String) throws {
        if let contents = NSString(data: data, encoding: NSUTF8StringEncoding) as? String {
            self.contents = contents
        } else {
            let userInfo = [
                NSLocalizedRecoverySuggestionErrorKey: "File is not valid UTF-8."
            ]
            throw NSError(
                domain: "com.bignerdranch.VocalTextEdit", code: 0, userInfo: userInfo)
        }
    }


}

