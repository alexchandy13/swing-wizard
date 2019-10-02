//
//  Cell.swift
//  master
//
//  Created by Alex Chandy on 2/12/19.
//  Copyright © 2019 Alex Chandy. All rights reserved.
//

import UIKit

class UITableCell: UITableViewCell {
    var problem: String = ""
    var field: String = ""
    var zone: String = ""
    var type: String = ""
    
    @IBOutlet weak var problemLabel: UILabel!
 //   @IBOutlet weak var fieldLabel: UILabel!
}
