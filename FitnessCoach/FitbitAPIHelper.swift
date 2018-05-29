//
//  FitbitAPIHelper.swift
//  FitnessCoach
//
//  Created by Yuren Huang on 5/8/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit

class FitbitAPIHelper {
    static let shared = FitbitAPIHelper()
    
    // replace the following with your own setup
    let fitbitClientID = "22CN58"
    let fitbitClientSecret = "532efafcb07e60e84f32ced1af732852"
    let fitbitAuthPage = "https://www.fitbit.com/oauth2/authorize"
    let fitbitTokenPage = "https://api.fitbit.com/oauth2/token"
    let fitbitAPIPage = "https://api.fitbit.com/1/user/"
    
    let a0ClientID = "Rw9MZEfTpJenQRkLyFgkLBQL85DgTJAr"
    let a0ClientSecret = "dJo9696z1vJorNHEe1rwbm5PemOXxmko9pcJQVMxvrP2_SGuF5OVzvMZri8JM8By"
    let a0TokenPage = "https://spin0za.auth0.com/oauth/token"
    let a0APIPage = "https://spin0za.auth0.com/api/v2/"
    let callback = "https://spin0za.auth0.com/login/callback"
    let clientInfo = plistValues(bundle: Bundle.main)
    
    let data = fitbitData.shared
    let period = "7d" //  Choose from 1d, 7d, 30d, 1w, 1m, 3m, 6m, 1y
    let days = 7
    lazy var userID = getUserID()
    
    // token for auth0
    var a0AccessToken: String?
    // token for Fitbit
    var accessToken: String?
    var refreshToken: String?
    
    init() {
        data.steps = Array(repeating: 0, count: self.days)
        data.activeMin = Array(repeating: 0, count: self.days)
    }
    
    func getUserID() -> String {
        return "638HH4"
    }
    
    // To understand the function below, check this tutorial
    // https://auth0.com/docs/connections/calling-an-external-idp-api#from-the-backend
    func callAuth0ManagementAPI() -> Promise<Void> {
        let url = a0TokenPage
        let body = ["client_id": a0ClientID,
                    "client_secret": a0ClientSecret,
                    "audience": a0APIPage,
                    "grant_type": "client_credentials"]
        let headers = ["content-type": "application/json"]
        return Promise { seal in
            Alamofire.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseJSON { resp in
                if let err = resp.result.error {
                    // print(err)
                    seal.reject(err)
                }
                if let val = resp.result.value as? NSDictionary {
                    self.a0AccessToken = val["access_token"] as? String
                    // you have to call the function below within the request, because it is asynchronous
                    // this is called a completion handler
                    // self.requestFitbitAccessToken(withA0Token: self.a0AccessToken!)
                    seal.fulfill(())
                }
            }
        }
    }
    
    // This is a subprocess of the function above
    func requestFitbitAccessToken() -> Promise<Void> {
        let url = (a0APIPage + "users/fitbit|" + userID).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let headers = ["Authorization": "Bearer \(self.a0AccessToken!)"]
        return Promise { seal in
            Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { resp in
                if let err = resp.result.error {
                    // print(err)
                    seal.reject(err)
                }
                if let val = resp.result.value as? NSDictionary {
                    if let id = val["identities"] as? NSArray {
                        if let dict = id[0] as? NSDictionary {
                            self.accessToken = dict["access_token"] as? String
                            print("Fitbit access token obtained: " + self.accessToken!)
                            seal.fulfill(())
                        }
                    }
                }
            }
        }
    }
    
    func getSteps() -> Promise<String> {
        let url = fitbitAPIPage + userID + "/activities/steps/date/today/" + period + ".json"
        return getFitbitData(withURL: url, for: days)
    }
    
    func getFairlyActiveMin() -> Promise<String> {
        let url = fitbitAPIPage + userID + "/activities/minutesFairlyActive/date/today/" + period + ".json"
        return getFitbitData(withURL: url, for: days)
    }
    
    func getVeryActiveMin() -> Promise<String> {
        let url = fitbitAPIPage + userID + "/activities/minutesVeryActive/date/today/" + period + ".json"
        return getFitbitData(withURL: url, for: days)
    }
    
    func getFitbitData(withURL url: String, for numDays: Int) -> Promise<String> {
        let headers = ["Authorization": "Bearer " + accessToken!]
        print(url)
        return Promise { seal in
            Alamofire.request(url, method: .get, headers: headers).responseJSON {resp in
                if let err = resp.result.error {
                    // print(err)
                    seal.reject(err)
                }
                if let val = resp.result.value as? NSDictionary {
                    print(val)
                    if let errors = val["errors"] as? NSArray {
                        if let dict = errors[0] as? NSDictionary, dict["errorType"] as? String == "expired_token" {
                            print("Token expired, renewing...")
                            // self.renewFitbitToken(withA0Token: self.a0AccessToken!)
                            seal.fulfill("Renew")
                        }
                    }
                    if let log = val["activities-steps"] as? NSArray {
                        self.data.steps = Array(repeating: 0, count: self.days)
                        for i in 0..<log.count {
                            if let day = log[i] as? NSDictionary {
                                self.data.steps[i] += Int(day["value"] as! String)!
                            }
                        }
                        seal.fulfill("Normal")
                    }
                    if let log = val["activities-minutesFairlyActive"] as? NSArray {
                        self.data.activeMin = Array(repeating: 0, count: self.days)
                        for i in 0..<log.count {
                            if let day = log[i] as? NSDictionary {
                                self.data.activeMin[i] += Int(day["value"] as! String)!
                            }
                        }
                        seal.fulfill("Normal")
                    }
                    if let log = val["activities-minutesVeryActive"] as? NSArray {
                        self.data.activeMin = Array(repeating: 0, count: self.days)
                        for i in 0..<log.count {
                            if let day = log[i] as? NSDictionary {
                                self.data.activeMin[i] += Int(day["value"] as! String)!
                            }
                        }
                        seal.fulfill("Normal")
                    }
                }
            }
        }
    }
    
    
    
    func hasToken() -> Bool {
        return accessToken != nil
    }
    
    //    MARK: The functions below should not be called before they are fixed
    
    //    TODO: Refreshing is not available, due to auth0 missing the "refresh_token" key
    func renewFitbitToken(withA0Token token: String) {
        let userID = getUserID()
        let url = (a0APIPage + "users/fitbit|" + userID).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let headers = ["Authorization": "Bearer \(token)"]
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseJSON { resp in
            if let err = resp.result.error {
                print(err)
            }
            if let val = resp.result.value as? NSDictionary {
                if let id = val["identities"] as? NSArray {
                    if let dict = id[0] as? NSDictionary {
                        print(dict)
                        self.refreshToken = dict["refresh_token"] as? String
                        print("Refresh token: " + self.refreshToken!)
                        self.renewRequest()
                    }
                }
            }
        }
    }
    
    func renewRequest() {
        let encoded = NSString(format: "%@:%@", fitbitClientID, fitbitClientSecret).data(using: String.Encoding.utf8.rawValue)!.base64EncodedString(options: [])
        let body = ["grant_type": "refresh_token",
                    "refresh_token": self.refreshToken!]
        let headers = ["Authorization": "Basic \(encoded)",
            "content-type": "application/x-www-form-urlencoded"]
        Alamofire.request(fitbitTokenPage, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseJSON { resp in
            if let err = resp.result.error {
                print(err)
            }
            if let val = resp.result.value as? NSDictionary {
                self.accessToken = val["access_token"] as? String
                print("Token renewed: " + self.accessToken!)
                // Call your API here
            }
        }
    }
    
}
