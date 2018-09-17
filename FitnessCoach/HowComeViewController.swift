//
//  HowComeViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/21/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

class HowComeViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gotoQ9(_ sender: UIButton) {
        print(fitbitData.shared.activeSteps())
        if (fitbitData.shared.activeSteps() < goalSteps){
            self.performSegue(withIdentifier: "gotoQ9.1", sender: sender);
        } else {
            self.performSegue(withIdentifier: "gotoQ9.2", sender: sender);
        }
    }
    let goalSteps = 8500
    
    
    
}
