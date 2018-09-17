//
//  Question9_2ViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/26/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

class Question9_2ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        underStepsLabel.text = text
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    let text = "From the tracker, it looks like you were able to walk an average of " + "\(fitbitData.shared.activeSteps()) " + " steps daily this week. Good job! You were able to increase your step count and reach the goal we set last week. Keep in mind the recommended goal is 8,500 steps per day. This means you would try to walk about " + "\(fitbitData.shared.activeSteps() + 1000)" + " steps every day this upcoming week. It may seem like a lot right now, but remember, 1000 steps can be achieved in a slow to medium paced jog or a brisk walk for about 10 minutes. Do you think you can continue to increase your daily steps average by 1,000 per week."
    
    
    @IBOutlet weak var underStepsLabel: UILabel!

    let activeMin = 30
    let count = fitbitData.shared.countActiveMin()
    @IBAction func gotoQ13(_ sender: UIButton) {
        goalSteps = fitbitData.shared.activeSteps() + 1000
        if (ActiveMinAvg > activeMin){
            repeated = true
            performSegue(withIdentifier: "gotoQ13.1", sender: sender)
        }
        else{
            repeated = true
            performSegue(withIdentifier: "gotoQ13.2", sender: sender)
        }
    }
    
    @IBAction func gotoQ11(_ sender: UIButton) {
        goalSteps = fitbitData.shared.activeSteps()
        performSegue(withIdentifier: "gotoQ11", sender: sender)
    }
}
