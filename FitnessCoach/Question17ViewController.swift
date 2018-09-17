//
//  Question17ViewController.swift
//  FitnessCoach
//
//  Created by Kevin Li on 6/29/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit


class Question17ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let sports = ["Basketball", "Running", "Cycling", "Swimming","Aerobics Class", "Weight or Resistance Training","Yoga", "Softball","Hocket", "Tennis","Soccer", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sports.count
    }
    
    @IBOutlet var sportsTable: UITableView!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = sports[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        //Access the array that you have used to fill the tableViewCell
        if(reminder3 == ""){
            reminder3 = (sports[indexPath.row])
        }
        else{
            reminder3 += " and \((sports[indexPath.row]))"
        }
    }
    
    func numberOfSections(in tableView: UITableView)->Int{
        return 1
    }
    @IBAction func gotoQ33(_ sender: UIButton) {
        reminder3 = "none."
        performSegue(withIdentifier: "gotoQ33", sender: sender)

    }
    
    @IBAction func gotoQ23(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoQ23", sender: sender)
    }

    @IBAction func gotoQ24_1(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoQ24.1", sender: sender)
    }
    @IBAction func gotoQ24_2(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoQ24.2", sender: sender)
        
    }
    
    
}
