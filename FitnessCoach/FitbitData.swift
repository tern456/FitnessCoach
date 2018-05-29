//
//  FitbitData.swift
//  FitnessCoach
//
//  Created by Yuren Huang on 5/9/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation

class fitbitData {
    static let shared = fitbitData()
    
    var steps = [Int]()
    var activeMin = [Int]()
    
    // let steps = [7552, 0, 8140, 4103, 0, 2673, 4212]
    // let activeMin = [36, 0, 74, 29, 0, 0, 38]
    
    func activeDays() -> Int {
        return activeMin.filter{ $0 != 0 }.count
    }
}
