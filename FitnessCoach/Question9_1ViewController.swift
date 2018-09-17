//
//  Question9ViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/26/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

class Question9_1ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var q9_1Label: UILabel!{
        didSet{
            q9_1Label.text = "From the tracker, it looks like you were able to walk an average of " + " \(fitbitData.shared.activeSteps()) "+" steps daily this week. " + goodPhrases[randomNum] + " You met the daily-recommended step requirement. Keep up the good work."
        }
    }
    let activeMin = 30;
    let randomNum = Int(arc4random_uniform(9))
    @IBAction func gotoQ13(_ sender: UIButton) {
        goalSteps = 10000
        if (ActiveMinAvg > activeMin){
            repeated = true
            performSegue(withIdentifier: "gotoQ13.1", sender: sender)
        }
        else{
            repeated = true
            performSegue(withIdentifier: "gotoQ13.2", sender: sender)
        }
    }
}
