//
//  HowCome2ViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/27/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

class HowCome2ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        whyLabel.isHidden = true
        whyTextBox.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var difficultBox: UIButton!
    @IBOutlet var timeBox: UIButton!
    
    var checkBox = UIImage(named: "CheckBox")
    var uncheckBox = UIImage(named: "UnCheckBox")
    var difficultBoxClicked = false;
    var timeBoxClicked = false;
    
    @IBAction func difficultClickBox(_ sender: UIButton) {
        if (difficultBoxClicked == true){
            difficultBoxClicked = false
            difficultBox.setImage(uncheckBox, for: UIControlState.normal)
        }
        else{
            difficultBoxClicked = true
            difficultBox.setImage(checkBox, for: UIControlState.normal)
        }
    }

    @IBAction func timeClickBox(_ sender: UIButton) {
        if(timeBoxClicked == true){
            timeBoxClicked = false
            timeBox.setImage(uncheckBox, for: UIControlState.normal)
        }else{
            timeBoxClicked = true
            timeBox.setImage(checkBox, for: UIControlState.normal)
        }

    }
    @IBOutlet var whyLabel: UILabel!
    @IBOutlet var whyTextBox: UITextView!
    @IBOutlet var keepSegment: UISegmentedControl!
    
    @IBAction func keepDaily(_ sender: UISegmentedControl) {
        if(keepSegment.selectedSegmentIndex == 1){
            whyLabel.isHidden = false
            whyTextBox.isHidden = false
        }
    }
    
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
}
    

