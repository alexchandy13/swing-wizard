//
//  Item.swift
//  master
//
//  Created by Alex Chandy on 2/12/19.
//  Copyright © 2019 Alex Chandy. All rights reserved.
//

import Foundation

class Item {
    var problem:String
    var field:String
    var zone:String
    var type:String
    
    init(problem:String, field:String, zone:String, type:String) {
        self.problem = problem
        self.field = field
        self.zone = zone
        self.type = type
    }
    
}
