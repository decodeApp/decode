//
//  TextViewController.swift
//  Decode
//
//  Created by Caroline Shi on 3/20/17.
//  Copyright © 2017 Victoria Zhou. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {

    @IBOutlet weak var originalTextView: UITextView!
    @IBOutlet weak var translatedTextView: UITextView!
    @IBOutlet weak var originalLanguageLabel: UILabel!
    @IBOutlet weak var translatedLanguageLabel: UILabel!
    
    var originalLanguage: String!
    var translateLanguage: String!
    var languagePickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalTextView.delegate = self
        
        languagePickerView = UIPickerView()
        languagePickerView.dataSource = self
        languagePickerView.delegate = self
        languagePickerView.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTranslateButton(_ sender: Any) {
        
    }

    @IBAction func onSwitchButton(_ sender: Any) {
        
    }
    
    @IBAction func tappedChooseLanguage(_ sender: Any) {
        languagePickerView.isHidden = false
        print("hello?")
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

extension TextViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}

extension TextViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
}


extension TextViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
    
}
