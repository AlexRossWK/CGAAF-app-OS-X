//
//  CellCummaryViewModel.swift
//  CGAAF
//
//  Created by Алексей Россошанский on 19.02.18.
//  Copyright © 2018 Alexey Rossoshasky. All rights reserved.
//

import Cocoa

final class CellSummaryViewModel{
    
    
    //Func to create columns in NSTableView based on TableViewWithColumnModel
    func tableViewSettings(arrayOfColumnModels: [TableViewWithColumnModel], tableView: NSTableView) {
        
        
        removeAllColumns(tableView: tableView)
        
        arrayOfColumnModels.forEach { (columnModel) in
            let column = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(columnModel.columnIdentifier))
            column.headerCell.title = columnModel.columnTitle
            column.width = ConstantsAndDefaultValues.columnDefaultWidth
            column.maxWidth = columnModel.columnMaxWidth
            column.minWidth = columnModel.columnMinWidth
            switch columnModel.columnType {
            case "check":
                let checkBox = NSButtonCell()
                checkBox.setButtonType(.switch)
                checkBox.title = ""
                checkBox.alignment = .right
                column.dataCell = checkBox
            default:
                break
            }
            let sortDesctiptor = NSSortDescriptor(key: columnModel.columnIdentifier, ascending: true, selector: #selector(NSNumber.compare(_:)))
            column.sortDescriptorPrototype = sortDesctiptor
            
            tableView.addTableColumn(column)
        }
        
        tableView.columnAutoresizingStyle = .uniformColumnAutoresizingStyle
        
    }
    
    //Func to remove all columns in tableView
    func removeAllColumns(tableView: NSTableView){
        let columnsCount = tableView.tableColumns.count
        if columnsCount > 0 {
            var i = 0
            while i < columnsCount {
                tableView.removeTableColumn(tableView.tableColumns[0])
                i += 1
            }
        }
    }
    
    //Func to set row height
    func setTableViewRowHeight(tableView: NSTableView, height: CGFloat) {
        tableView.rowHeight = height
    }
    
    
}
