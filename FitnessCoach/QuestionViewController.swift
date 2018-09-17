//
//  QuestionViewController.swift
//  FitnessCoach
//
//  Created by Yuren Huang on 5/9/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit

var repeated = false;

class QuestionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func getStarted(_ sender: UIButton) {
        print("Active days for the past week: \(fitbitData.shared.activeDays())")
        let goal = 5
        if (fitbitData.shared.activeDays() < goal) {
            performSegue(withIdentifier: "gotoQ1", sender: sender)
        } else {
            performSegue(withIdentifier: "gotoQ2", sender: sender)
        }
    }
    
    @IBAction func gotoQ9(_ sender: UIButton) {
        print(fitbitData.shared.activeSteps())
        if (fitbitData.shared.activeSteps() < goalSteps){
            performSegue(withIdentifier: "gotoQ9.1", sender: sender);
        } else {
            performSegue(withIdentifier: "gotoQ9.2", sender: sender);
        }
    }
    
    @IBAction func gotoHowCome1(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoHowCome1", sender: sender)
    }
    @IBAction func gotoQ7(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoQ6", sender: sender)
    }
    
    let goalSteps = 8500
    let randomNum = Int(arc4random_uniform(9))
    
    
    @IBOutlet var GoodLabel: UILabel!{
        didSet{
            GoodLabel.text = "From your tracker it looks like you used the tracker more than 5 days this past week. " + goodPhrases[randomNum]  + " Do you think you can keep up the good work?"
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

}

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get { return layer.borderColor.flatMap { UIColor(cgColor: $0) } }
        set { layer.borderColor = newValue?.cgColor }
    }
}
