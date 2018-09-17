//
//  Question13_1ViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/28/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

class Question13_1ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    let randomNum = Int(arc4random_uniform(9))
    
    @IBOutlet var activeMinLabel: UILabel!{
        didSet{
            activeMinLabel.text = "From the tracker, it looks like you were able to keep up an average of \(ActiveMinAvg) active minutes daily this week.  \(goodPhrases[randomNum]) You met the daily-recommended step requirement. Keep up the good work."
        }
    }
    
    @IBAction func gotoQ17(_ sender: UIButton) {
        goalActiveMin = 30
        performSegue(withIdentifier: "gotoQ17", sender: sender)
        
    }
    
    

}
