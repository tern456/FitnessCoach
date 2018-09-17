//
//  GlobalVars.swift
//  FitnessCoach
//
//  Created by Kevin Li on 7/6/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import Foundation
import UIKit

// This file is for Global variables that are used in multiple files

let goodPhrases = ["Good Job!", "Amazing!", "Way to go!", "Wow! That's great!", "Awesome!", "Wonderful Job!", "Keep it up.", "Terrific!","Keep up the good work!","Superb!"]

let encouragementPhrases = ["You can do it! Keep moving to reach your goal!", "That’s ok. Next week is a new slate.", "Don't give up! Keep working to your goal!", "Stay strong and keep going", "Keep working at it. A little bit of progress everyday goes a long way!"
]

var reminder1 = ""
var reminder2 = ""
var reminder3 = ""

var goalSteps = 0
var goalActiveMin = 0

var accHolder = "" //Either "Parent" or "Child"

let ActiveMinAvg = fitbitData.shared.countActiveMin()
