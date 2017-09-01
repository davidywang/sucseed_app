//
//  Goal.swift
//  Sucseed
//
//  Created by David Wang on 1/9/16.
//  Copyright © 2016 David Wang. All rights reserved.
//

import Foundation
import UIKit

class Goal {
    var name: String = ""
    var type: String = ""
    var targetDate: String = ""
    
    init (goalName: String, goalType: String, goalTargetDate: String) {
        name = goalName
        type = goalType
        targetDate = goalTargetDate
    }
}