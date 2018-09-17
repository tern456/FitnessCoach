//
//  LoadingViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/21/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {
    let goalSteps = 8500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(fitbitData.shared.activeSteps())
        if (fitbitData.shared.activeSteps() < goalSteps){
            self.performSegue(withIdentifier: "gotoQ9.1", sender: self);
        } else {
            self.performSegue(withIdentifier: "gotoQ9.2", sender: self);
        }
    }
    
    
    
}
