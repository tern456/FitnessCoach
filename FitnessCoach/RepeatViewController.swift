//
//  RepeatViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/25/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

class RepeatViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        repeatLabel.text = repeatText
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var repeatText:String!
    let goalSteps = 8500
    
    @IBAction func gotoQ9(_ sender: UIButton) {
        print(fitbitData.shared.activeSteps())
        if (fitbitData.shared.activeSteps() < goalSteps){
            self.performSegue(withIdentifier: "gotoQ9.1", sender: sender);
        } else {
            self.performSegue(withIdentifier: "gotoQ9.2", sender: sender);
        }

    }
    @IBAction func gotoQ7(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoQ7", sender: sender)

    }
    
    @IBOutlet var repeatLabel: UILabel!
}
