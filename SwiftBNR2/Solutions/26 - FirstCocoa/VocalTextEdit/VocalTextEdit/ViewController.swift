//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by John Gallagher on 1/6/15.
//  Copyright (c) 2015 Big Nerd Ranch. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let speechSynthesizer = NSSpeechSynthesizer()

    @IBOutlet var textView: NSTextView!

    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
        }
    }

    @IBAction func speakButtonClicked(sender: NSButton) {
        if let contents = textView.string where !contents.isEmpty {
            speechSynthesizer.startSpeakingString(contents)
        } else {
            speechSynthesizer.startSpeakingString("The document is empty.")
        }
    }

    @IBAction func stopButtonClicked(sender: NSButton) {
        speechSynthesizer.stopSpeaking()
    }

}

