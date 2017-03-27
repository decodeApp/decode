//
//  SpeechViewController.swift
//  Decode
//
//  Created by Caroline Shi on 3/20/17.
//  Copyright © 2017 Victoria Zhou. All rights reserved.
//

import UIKit
import AVFoundation

class SpeechViewController: UIViewController {
    
    @IBOutlet weak var translatedTextView: UITextView!
    
    // MARK: Variables
    let synthesizer = AVSpeechSynthesizer()
    let voice = AVSpeechSynthesisVoice(language: "zh-Hans")

    override func viewDidLoad() {
        super.viewDidLoad()
        translatedTextView.text = "你好吗"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapStartSpeaking(_ sender: UIButton) {
        guard let text = translatedTextView.text else {
            return
        }
        let utterance = AVSpeechUtterance(string: text)
        
        utterance.voice = voice
        synthesizer.speak(utterance)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

