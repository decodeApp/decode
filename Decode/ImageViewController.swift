//
//  ImageViewController.swift
//  Decode
//
//  Created by Caroline Shi on 3/20/17.
//  Copyright © 2017 Victoria Zhou. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var originalLanguageLabel: UILabel!
    @IBOutlet weak var translatedLanguageLabel: UILabel!
    
    @IBOutlet weak var selectedImageView: UIImageView!
    @IBOutlet weak var originalDescriptionView: UITextView!
    @IBOutlet weak var translatedTextView: UITextView!
    @IBOutlet weak var selectImageButton: UIButton!
    
    var origianlLangugae: String!
    var detectedLanguage: String!
    var languagePickerView: UIPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        languagePickerView.dataSource = self
        languagePickerView.delegate = self
        languagePickerView.isHidden = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : Any]) {
        // Get the image captured by the UIImagePickerController
        //let originalImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        let editedImage = info[UIImagePickerControllerEditedImage] as! UIImage
        
        // Do something with the images (based on your use case)
        selectImageButton.setTitle("", for: .normal)
        selectImageButton.backgroundColor = UIColor.clear
        selectedImageView.image = editedImage
        
        // Dismiss UIImagePickerController to go back to your original view controller
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func onChooseImage(_ sender: Any) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = .photoLibrary
        present(vc, animated: true, completion: nil)
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

extension ImageViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return languages.count
    }
}


extension ImageViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return languages[row]
    }
    
}
