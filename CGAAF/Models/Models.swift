//
//  Models.swift
//  CGAAF
//
//  Created by Алексей Россошанский on 19.02.18.
//  Copyright © 2018 Alexey Rossoshasky. All rights reserved.
//

import Foundation

class TableViewWithColumnModel {
    
    var columnIdentifier: String
    var columnTitle: String
    var columnType: String
    var columnMaxWidth: CGFloat
    var columnMinWidth: CGFloat
    
    init(columnIdentifier: String, columnTitle: String, columnType: String, columnMaxWidth: CGFloat, columnMinWidth: CGFloat) {
        self.columnIdentifier = columnIdentifier
        self.columnType = columnType
        self.columnTitle = columnTitle
        self.columnMaxWidth = columnMaxWidth
        self.columnMinWidth = columnMinWidth
    }
    
    init() {
        self.columnIdentifier = ""
        self.columnType = ""
        self.columnTitle = ""
        self.columnMaxWidth = 0.0
        self.columnMinWidth = 0.0
    }
    

}
