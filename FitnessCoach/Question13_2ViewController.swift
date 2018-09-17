//
//  Question13_2ViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/28/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

class Question13_2ViewController: UIViewController{
    
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
            activeMinLabel.text = "From the tracker, it looks like you were able to keep up an average of " + "\(ActiveMinAvg)" + " active minutes daily this week. " + goodPhrases[randomNum] + " You were able to increase your active minutes and reach the goal we set last week. Keep in mind, the recommended goal is 30 minutes per day. This would mean increasing your daily active minutes average to " + "\(ActiveMinAvg + 5)" + " minutes every day this upcoming week. Do you think you can increase your daily steps average by 5 minutes per week?"
        }
    }

    @IBAction func gotoQ10(_ sender: UIButton) {
        goalActiveMin = fitbitData.shared.activeMin().count + 5
        performSegue(withIdentifier: "gotoQ10", sender: sender)

    }
    @IBAction func gotoQ11(_ sender: UIButton) {
        goalActiveMin = fitbitData.shared.activeMin().count
        performSegue(withIdentifier: "gotoQ11", sender: sender)
    }
}
