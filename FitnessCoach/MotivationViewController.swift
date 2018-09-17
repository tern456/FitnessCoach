//
//  MotivationViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/27/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

class MotivationViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var motivationScale: UISegmentedControl!
    @IBAction func goto12(_ sender: UIButton) {
        if(motivationScale.selectedSegmentIndex > 6){
            performSegue(withIdentifier: "gotoQ12.1", sender: sender)
        }
        else{
            performSegue(withIdentifier: "gotoQ12.2", sender: sender)
        }
    }
    
    @IBAction func gotoRepeat(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoRepeat", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let recallTextVC = segue.destination as? Repeat2ViewController else{ return }
        recallTextVC.repeatText = textRecallCreator()
    }
    var txt = "So you just said that you would"
    var newText = ""
    
    @IBOutlet var reasonableGoal: UISegmentedControl!
    func textRecallCreator() ->String{
        newText = ""
        if(repeated == false){
            if(reasonableGoal.selectedSegmentIndex == 0){
                    newText += " not be able to walk 1000 more steps at all this week"
            }
            else if(reasonableGoal.selectedSegmentIndex == 1){
                txt += " be able to walk 1000 more steps for 1-2 days this week"
            }
            else if (reasonableGoal.selectedSegmentIndex == 2){
                txt += " be able to walk 1000 more steps for 3-4 days this week"
            }
            else{
                txt += " be able to walk 1000 more steps for 5-7 days this week"
            }
        }
        else{
            if(reasonableGoal.selectedSegmentIndex == 0){
                newText += " not be able to increase your daily step average at all this week"
            }
            else if(reasonableGoal.selectedSegmentIndex == 1){
                txt += " be able to increase your daily step average by 5 minutes for 1-2 days this week"
            }
            else if (reasonableGoal.selectedSegmentIndex == 2){
                txt += " be able to increase your daily step average by 5 minutes for 3-4 days this week"
            }
            else{
                txt += " be able to increase your daily step average by 5 minutes for 5-7 days this week"
            }
        }
        return txt + newText + ", did I get that right?"
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
