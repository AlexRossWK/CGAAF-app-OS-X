//
//  ViewController.swift
//  CGAAF
//
//  Created by Алексей Россошанский on 15.02.18.
//  Copyright © 2018 Alexey Rossoshasky. All rights reserved.
//

import Cocoa
import Charts

class MainScreenVC: NSViewController {
    
    fileprivate enum CellIdentifiers {
        static let NameCell = "NameCellID"
        static let DateCell = "DateCellID"
    }
    @IBOutlet var mainBigView: NSView!
    @IBOutlet weak var lineChartSegmentControl: NSSegmentedControl!
    
    @IBOutlet weak var investmentsDetailsSegmentContr: NSSegmentedControl!
    
    @IBOutlet weak var summAndClDetSegm: NSSegmentedControl!
    @IBOutlet weak var libraryButton: NSButton!
    
    @IBOutlet weak var lineChart: LineChartView!
    @IBOutlet weak var currentPortfolioPieChart: PieChartView!
    @IBOutlet weak var recomendedPortfolioPieChart: PieChartView!
    
    @IBOutlet weak var investmentsDetailsTableView: NSTableView!
    
    @IBOutlet weak var cellSummaryTableView: NSTableView!
    
    let investmentsTableViewTESTColumnsArray = [TableViewWithColumnModel(columnIdentifier: "first", columnTitle: "first", columnType: "text", columnMaxWidth: 50, columnMinWidth: 150),TableViewWithColumnModel(columnIdentifier: "second", columnTitle: "second", columnType: "text", columnMaxWidth: 50, columnMinWidth: 150), TableViewWithColumnModel(columnIdentifier: "third", columnTitle: "third", columnType: "text", columnMaxWidth: 50, columnMinWidth: 150), TableViewWithColumnModel(columnIdentifier: "fourth", columnTitle: "fourth", columnType: "text", columnMaxWidth: 50, columnMinWidth: 150), TableViewWithColumnModel(columnIdentifier: "fifth", columnTitle: "fifth", columnType: "check", columnMaxWidth: 50, columnMinWidth: 150)]
    
    let cellSummaryTableViewTESTColumnsArray = [TableViewWithColumnModel(columnIdentifier: "first", columnTitle: "first", columnType: "text", columnMaxWidth: 50, columnMinWidth: 150),TableViewWithColumnModel(columnIdentifier: "second", columnTitle: "second", columnType: "text", columnMaxWidth: 50, columnMinWidth: 150)]
    
    let testDataForRecomendedPortfolioPieChart = Array(1..<10).map { x in return sin(Double(x) / 2.0 / 3.141 * 1.5) * 100.0 }
    let monthsToTestDataForRecomendedPortfolioPieChart = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Oct"]

    
     let testDataForCurrentPortfolioPieChart = Array(2..<11).map { x in return sin(Double(x) / 2.0 / 3.141 * 1.5) * 100.0 }
    
    let testDataForLineChart2 = [1.3,5.2,2.1,4.0,9.1,12.3,2.9,1.1,8.3,7.0]
    let testDataForLineChart = [0.0,1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0]


    
    let investmentsDetailsViewModel = InvestmentsDetailsViewModel()
    let cellSummaryViewModel = CellSummaryViewModel()
    let recomendedPortfolioViewModel = RecomendedPortfolioViewModel()
    let currentPortfolioViewModel = CurrentPortfolioViewModel()
    let lineChartViewModel = LineChartViewModel()
    
}

//MARK: View Loads
extension MainScreenVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        lineChartSegmentControl.setLabel("1m", forSegment: 0)
        lineChartSegmentControl.setLabel("3m", forSegment: 1)
        lineChartSegmentControl.setLabel("4m", forSegment: 2)
        lineChartSegmentControl.setLabel("1y", forSegment: 3)
        lineChartSegmentControl.setLabel("2y", forSegment: 4)
        lineChartSegmentControl.setLabel("max", forSegment: 5)
        //
        investmentsDetailsSegmentContr.setLabel("INVESTMENT", forSegment: 0)
        investmentsDetailsSegmentContr.setLabel("INFLOW SUMMARY", forSegment: 1)
        investmentsDetailsSegmentContr.setLabel("OUTFLOW", forSegment: 2)
        investmentsDetailsSegmentContr.setWidth(170, forSegment: 1)
        //
        summAndClDetSegm.setLabel("SUMMARY", forSegment: 0)
        summAndClDetSegm.setLabel("CLIENT DETAILS", forSegment: 1)
        summAndClDetSegm.setWidth(120, forSegment: 1)
        //
        
        //Invesments Details tableView
        investmentsDetailsViewModel.setTableViewRowHeight(tableView: investmentsDetailsTableView, height: ConstantsAndDefaultValues.rowDefaultHeight)
        investmentsDetailsViewModel.tableViewSettings(arrayOfColumnModels: investmentsTableViewTESTColumnsArray, tableView: investmentsDetailsTableView)
        
        //Cell summary tableView
        cellSummaryViewModel.setTableViewRowHeight(tableView: cellSummaryTableView, height: ConstantsAndDefaultValues.rowDefaultHeight)
        cellSummaryViewModel.tableViewSettings(arrayOfColumnModels: cellSummaryTableViewTESTColumnsArray, tableView: cellSummaryTableView)
        
        //Recomended portfolio chart
//        recomendedPortfolioViewModel.createPie(viewForPieChart: recomendedPortfolioPieChart, dataForChart: testDataForRecomendedPortfolioPieChart)
        recomendedPortfolioViewModel.setPieChart(dataPoints: monthsToTestDataForRecomendedPortfolioPieChart, values: testDataForRecomendedPortfolioPieChart, viewForPieChart: recomendedPortfolioPieChart)
        
        //Cerrent portfolio chart
        currentPortfolioViewModel.createPie(viewForPieChart: currentPortfolioPieChart, dataForChart: testDataForCurrentPortfolioPieChart)
        
        //Line chart
        lineChartViewModel.createLineChart(viewForLineChart: lineChart, dataPoints: testDataForLineChart, values: testDataForLineChart2)
        
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        //Общий бэкгроунд цвет
        mainBigView.layer?.backgroundColor = NSColor.darkGray.cgColor
        
        
        //Animated appearing of pie chart
        recomendedPortfolioViewModel.animateAppearingOfChart(viewForPieChart: recomendedPortfolioPieChart)
        currentPortfolioViewModel.animateAppearingOfChart(viewForPieChart: currentPortfolioPieChart)
        
        //Animated appearing of line chart
        lineChartViewModel.animateAppearingOfLineChart(viewForLineChart: lineChart)
    }
    
}

//MARK: tableView dataSource and delegate methods
extension MainScreenVC: NSTableViewDelegate, NSTableViewDataSource {
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return investmentsTableViewTESTColumnsArray.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        let object = investmentsTableViewTESTColumnsArray[row]
        return object.columnIdentifier
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        
        var text: String = ""
        var cellIdentifier: String = ""

        
        switch tableColumn {
        case tableView.tableColumns[0]?:
            text = "Alexis"
            cellIdentifier = CellIdentifiers.NameCell
        case tableView.tableColumns[1]?:
            text = "Henry"
            cellIdentifier = CellIdentifiers.NameCell
        case tableView.tableColumns[2]?:
            text = "David"
            cellIdentifier = CellIdentifiers.NameCell
        case tableView.tableColumns[3]?:
            text = "Persiy"
            cellIdentifier = CellIdentifiers.NameCell
        case tableView.tableColumns[4]?:
            text = "Gregory"
            cellIdentifier = CellIdentifiers.NameCell
        default:
            break
        }
        
        if let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: cellIdentifier), owner: nil) as? NSTableCellView {
            cell.textField?.stringValue = text
            return cell
        }
        
        return nil
        
    }
}
    

//MARK: 
extension MainScreenVC {
    
    
    
}

