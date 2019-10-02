//
//  Storage.swift
//  master
//
//  Created by Alex Chandy on 2/12/19.
//  Copyright © 2019 Alex Chandy. All rights reserved.
//

import Foundation

class Storage {
    static let shared: Storage = Storage()
    
    var objects: [Item]
    
    private init() {
        objects = [Item]()
    }
    
}
