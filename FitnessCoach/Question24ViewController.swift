//
//  Question24ViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 7/5/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

class Question24ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotoQ33(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoQ33", sender: sender)
    }
}
