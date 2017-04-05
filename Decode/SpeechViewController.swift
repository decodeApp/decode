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
    @IBOutlet weak var detectedSpeechView: UITextView!
    @IBOutlet weak var translatedLanguageLabel: UILabel!
    @IBOutlet weak var detectedLanguageLabel: UILabel!
    
    var detectedLanguage: String!
    var translatedLanguage: String!
    var languagePickerView: UIPickerView = UIPickerView()
    
    // MARK: Variables
    let synthesizer = AVSpeechSynthesizer()
    let voice = AVSpeechSynthesisVoice(language: "zh-Hans")

    override func viewDidLoad() {
        super.viewDidLoad()
        translatedTextView.text = "你好吗"
        
        languagePickerView.dataSource = self
        languagePickerView.delegate = self
        languagePickerView.isHidden = true
        
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

    @IBAction func onSwitchButton(_ sender: Any) {
        
    }
    
    @IBAction func tappedChooseLanguage(_ sender: Any) {
        languagePickerView.isHidden = false
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

extension SpeechViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
}


extension SpeechViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
    
}

