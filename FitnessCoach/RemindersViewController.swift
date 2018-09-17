//
//  RemindersViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 7/12/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

class RemindersViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var reminder1Label: UILabel!{
        didSet{
            reminder1Label.text = "Average \(goalSteps) steps"
        }
    }
    
    @IBOutlet var reminder2Label: UILabel!{
        didSet{
            reminder2Label.text = "Average \(goalActiveMin) active minutes"
        }
    }
    @IBOutlet var reminder3Label: UILabel!{
        didSet{
            reminder3Label.text = "Try \(reminder3)"
        }
    }
    
    @IBAction func gotoMenu(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoMenu", sender: sender)
    }
}
