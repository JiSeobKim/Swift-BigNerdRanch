//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Brigitte Michau on 2016/03/09.
//  Copyright © 2016 BigNerdRanch. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var contents: String? {
        get {
            return textView.string
        }
        set {
            textView.string = newValue
        }
    }
    
    let speechSynthesizer = NSSpeechSynthesizer()
    
    @IBOutlet var textView: NSTextView!
    @IBOutlet weak var stop: NSButton!
    @IBOutlet weak var speak: NSButton!
    @IBOutlet weak var progressBar: NSProgressIndicator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        speechSynthesizer.delegate = self
        speakEnabled(true)
    }
    
    @IBAction func speakButtonClicked(sender: NSButton) {
        
        speakEnabled(false)
        activateProgress(true)
        
        if let contents = textView.string where !contents.isEmpty {
            speechSynthesizer.startSpeakingString(contents)
        } else {
            speechSynthesizer.startSpeakingString("The document is empty")
        }
    }
    
    @IBAction func stopButtonClicked(sender: NSButton) {
        
        speechSynthesizer.stopSpeaking()
        activateProgress(false)
    }
    
    private func speakEnabled(enabled: Bool) {
        speak.enabled = enabled
        stop.enabled = !enabled
    }
    
    private func activateProgress(activate: Bool) {
        if activate {
            progressBar.startAnimation(self)
        } else {
            progressBar.stopAnimation(self)
            progressBar.doubleValue = 0.0
        }
    }
}

extension ViewController: NSSpeechSynthesizerDelegate {
    
    func speechSynthesizer(sender: NSSpeechSynthesizer,
        didFinishSpeaking finishedSpeaking: Bool) {
            
            speakEnabled(true)
            activateProgress(false)
    }
    
    func speechSynthesizer(sender: NSSpeechSynthesizer,
        willSpeakWord characterRange: NSRange,
        ofString string: String) {
            
            let characterCount = Double(string.characters.count)
            let wordLength = (Double(characterRange.length) + 1)
            let increment = (wordLength / characterCount) * 100
            progressBar.incrementBy(increment)
    }
}