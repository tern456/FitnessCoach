//
//  DashboardViewController.swift
//  FitnessCoach
//
//  Created by Yuren Huang on 5/9/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit
import PromiseKit

class DashboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let api = FitbitAPIHelper.shared
        if !api.hasToken() {
            _ =
            firstly {
            api.callAuth0ManagementAPI()
            }.then {
                api.requestFitbitAccessToken()
            }.then {
                when(fulfilled: api.getSteps(), api.getFairlyActiveMin(), api.getVeryActiveMin())
            }.done { res1, res2, res3 in
                if res1 == "Renew" || res2 == "Renew" || res3 == "Renew" {
                    self.logoutAlert(title: "Uh-oh", msg: "Fitbit token has expired. Please re-login.")
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewStat(_ sender: UIButton) {
        performSegue(withIdentifier: "gotoStat", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "gotoStat" {
            if let vc = segue.destination as? StatViewController {
                vc.statType = (sender as? UIButton)?.currentTitle
            }
        }
    }
    
    @IBAction func syncData(_ sender: UIButton) {
        let api = FitbitAPIHelper.shared
        guard api.hasToken() else { return }
        _ =
        firstly {
            when(fulfilled: api.getSteps(), api.getFairlyActiveMin(), api.getVeryActiveMin())
        }.done { res1, res2, res3 in
            if res1 == "Renew" || res2 == "Renew" || res3 == "Renew" {
                self.logoutAlert(title: "Uh-oh", msg: "Fitbit token has expired. Please re-login.")
            }
        }
    }
    
    // Show this when token expires
    func logoutAlert(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Logout", style: UIAlertActionStyle.default, handler: { act in
            _ = SessionManager.shared.logout()
//            TODO here
//            self.presentingViewController?.dismiss(animated: true, completion: nil)
            alert.dismiss(animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Stay", style: UIAlertActionStyle.default, handler: { act in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
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
