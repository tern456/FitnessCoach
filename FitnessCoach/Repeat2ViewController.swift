//
//  Repeat2ViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/27/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

class Repeat2ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        repeatLabel.text = repeatText;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var repeatLabel: UILabel!
    var repeatText:String!
    let activeMin = 30
    
    @IBAction func gotoQ13(_ sender: UIButton) {
        if(repeated == true){
            repeated = false
            performSegue(withIdentifier: "gotoQ17", sender: sender)
        }
        else if (fitbitData.shared.activeMin().count > activeMin){
            repeated = true
            performSegue(withIdentifier: "gotoQ13.1", sender: sender)
        }
        else{
            repeated = true
            performSegue(withIdentifier: "gotoQ13.2", sender: sender)
        }
    }
    
    @IBAction func gotoQ12(_ sender: UIButton) {
        performSegue(withIdentifier: "goto12.2", sender: sender)
    }
}
