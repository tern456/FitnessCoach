//
//  WhyViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/21/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

class WhyViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gotoQ7(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoQ7", sender: sender)

    }
    let goalSteps = 8500
    
    @IBAction func gotoQ9(_ sender: UIButton) {
        print(fitbitData.shared.activeSteps())
        if (fitbitData.shared.activeSteps() < goalSteps){
            self.performSegue(withIdentifier: "gotoQ9.1", sender: sender);
        } else {
            self.performSegue(withIdentifier: "gotoQ9.2", sender: sender);
        }

    }
    @IBOutlet var remember: UISegmentedControl!
    @IBOutlet var wearing: UISegmentedControl!
    @IBOutlet var alarm: UISegmentedControl!
    
    @IBAction func gotoQ8(_ sender: Any) {
        performSegue(withIdentifier: "gotoQ8", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let recallTextVC = segue.destination as? RepeatViewController else{ return }
        recallTextVC.repeatText = textRecallCreator()
    }
    var txt = "So you just said that you would "
    var newText = ""
    var new = true
    
    func textRecallCreator() -> String{
        newText = ""
        new = true
        print(remember.selectedSegmentIndex)
        if(remember.selectedSegmentIndex == 0){
            newText = "put it in a place you will remember"
            new = false
        }
        if(wearing.selectedSegmentIndex == 0){
            if(new == false){
                newText = newText + ", "
                if(alarm.selectedSegmentIndex == 1){
                    newText = newText + "and "
                }
            }
            newText = newText + "wear it on a band or chain"
            new = false
        }
        if(alarm.selectedSegmentIndex == 0){
            if(new == false){
                newText = newText + ", and "
            }
            newText = newText + "set an alarm in the morning"
        }
        if(newText == ""){
            newText += "not do anything"
        }
        newText = newText + ", did I get that right?"
        print(txt + newText)
        return txt + newText
    }
    
    
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
