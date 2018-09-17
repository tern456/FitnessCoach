//
//  DailyQViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 7/10/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

class DailyQViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gotoDaily(_ sender: UIButton) {
        accHolder = "Parent"
        performSegue(withIdentifier: "gotoDaily", sender: sender)
    }
    
    @IBAction func gotoDailyChild(_ sender: UIButton) {
        accHolder = "Child"
        performSegue(withIdentifier: "gotoDaily", sender: sender)
    }
    
    @IBAction func gotoP2(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoP2", sender: sender)
    }
    
    @IBAction func gotoMenu(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoMenu", sender: sender)
    }
    
    let activeMin = 30;
    
    
    @IBOutlet var activeLabel: UILabel!{
        didSet{
            if(fitbitData.shared.dailyActiveSteps() > activeMin){
                activeLabel.text = "Wow! You reached the recommended goal for active min today! Keep moving and staying active! You can even set a new personal goal for next week!"
            }
            else if(fitbitData.shared.dailyActiveSteps() < activeMin && fitbitData.shared.dailyActiveSteps() > goalActiveMin){
                activeLabel.text = "It looks like you were active for \(fitbitData.shared.dailyActiveSteps())  number of min: Good job! You made your goal! Keep working toward a future goal of 30 minutes a day!"
            }
            else{
                    activeLabel.text = "it looks like you were active for \(fitbitData.shared.dailyActiveSteps()) number of min: Your goal for this week is \(goalActiveMin). You can do it! Keep moving to reach your goal!"
            }
        }
    }
}
