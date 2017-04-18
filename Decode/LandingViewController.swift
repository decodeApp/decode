//
//  ViewController.swift
//  Decode
//
//  Created by Victoria Zhou on 3/1/17.
//  Copyright © 2017 Victoria Zhou. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LanguageClientSingleton.sharedInstance.getAccessToken()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

