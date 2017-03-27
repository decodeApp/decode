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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        originalTextView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
