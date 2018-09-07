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
        
        // Do any additional setup after loading the view.
        /*
        guard case q9_1Label.text = "From the tracker, it looks like you were able to walk an average of " + " \(fitbitData.shared.activeSteps()) "+" steps daily this week. Great job. You met the daily-recommended step requirement. Keep up the good work." else {return}
        guard case q9_2Label.text = "From the tracker, it looks like you were able to walk an average of " + "\(fitbitData.shared.activeSteps()) " + " steps daily this week. Great job! You were able to increase your step count and reach the goal we set last week. Keep in mind the recommended goal is 8,500 steps per day. This means you would try to walk about " + "\(fitbitData.shared.activeSteps() + 1,000)" + " steps every day this upcoming week. It may seem like a lot right now, but remember, 1000 steps can be achieved in a slow to medium paced jog or a brisk walk for about 10 minutes. Do you think you can continue to increase your daily steps average by 1,000 per week." else {return}
*/
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var q9_1Label: UILabel!{
        didSet{
            q9_1Label.text = "From the tracker, it looks like you were able to walk an average of " + " \(fitbitData.shared.activeSteps()) "+" steps daily this week. Great job. You met the daily-recommended step requirement. Keep up the good work."
        }
    }
    
    @IBOutlet var q9_2Label: UILabel!{
        didSet{
            q9_2Label.text = "From the tracker, it looks like you were able to walk an average of " + "\(fitbitData.shared.activeSteps()) " + " steps daily this week. Great job! You were able to increase your step count and reach the goal we set last week. Keep in mind the recommended goal is 8,500 steps per day. This means you would try to walk about " + "\(fitbitData.shared.activeSteps() + 1,000)" + " steps every day this upcoming week. It may seem like a lot right now, but remember, 1000 steps can be achieved in a slow to medium paced jog or a brisk walk for about 10 minutes. Do you think you can continue to increase your daily steps average by 1,000 per week."
        }
    }
    
    
    @IBAction func gotoQ13(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoQ13", sender: sender)
    }
}
