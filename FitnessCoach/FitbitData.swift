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
    
    var dates = [String]()
    var steps = [Int]()
    var fairlyActiveMin = [Int]()
    var veryActiveMin = [Int]()
    
    // active = fairly active + very active
    func activeMin() -> [Int] {
        return zip(fairlyActiveMin, veryActiveMin).map(+)
    }
    
    func activeDays() -> Int {
        return activeMin().filter{ $0 != 0 }.count
    }
}
