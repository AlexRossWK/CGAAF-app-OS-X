//
//  RecomendedPortfolioViewModel.swift
//  CGAAF
//
//  Created by Алексей Россошанский on 20.02.18.
//  Copyright © 2018 Alexey Rossoshasky. All rights reserved.
//

import Cocoa
import Charts

final class RecomendedPortfolioViewModel {
    
 
    
    func animateAppearingOfChart(viewForPieChart: PieChartView) {
        viewForPieChart.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
    }
    
    //Func to create pie diagram
    func setPieChart(dataPoints: [String], values: [Double], viewForPieChart: PieChartView) {
        
        var dataEntries = [ChartDataEntry]()
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(x: values[i], y: Double(i))
            dataEntries.append(dataEntry)
        }
        
        let dataInPieChartDataEntry = values.enumerated().map { x, y in return PieChartDataEntry(value: y, label: String(dataPoints[x])) }
        
        let pieChartDataSet = PieChartDataSet(values: dataInPieChartDataEntry, label: "Elements")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        viewForPieChart.data = pieChartData
        
        var colors = [NSColor]()
        for i in 0..<dataPoints.count {
            let red = Double(arc4random_uniform(256))
            let green = Double(arc4random_uniform(256))
            let blue = Double(arc4random_uniform(256))
            
            let color = NSColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
            colors.append(color)
        }
        pieChartDataSet.colors = colors
        
        
        let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        let centerText: NSMutableAttributedString = NSMutableAttributedString(string: "Deference\n16%\nModerate")
        centerText.setAttributes([NSAttributedStringKey.font: NSFont(name: "HelveticaNeue-Light", size: 15.0)!, NSAttributedStringKey.paragraphStyle: paragraphStyle], range: NSMakeRange(0, centerText.length))
        //        centerText.addAttributes([NSAttributedStringKey.font: NSFont(name: "HelveticaNeue-Light", size: 13.0)!, NSAttributedStringKey.foregroundColor: NSColor.gray], range: NSMakeRange(10, centerText.length - 10))
        //        centerText.addAttributes([NSAttributedStringKey.font: NSFont(name: "HelveticaNeue-LightItalic", size: 13.0)!, NSAttributedStringKey.foregroundColor: NSColor(red: 51 / 255.0, green: 181 / 255.0, blue: 229 / 255.0, alpha: 1.0)], range: NSMakeRange(centerText.length - 19, 19))
        
        //кружочки в легенде а не квадратики
        viewForPieChart.legend.form = .circle
        //легенда справа вверху и по вертикали
        viewForPieChart.legend.verticalAlignment = .top
        viewForPieChart.legend.horizontalAlignment = .right
        viewForPieChart.legend.orientation = .vertical
        
        viewForPieChart.centerAttributedText = centerText
        
        viewForPieChart.chartDescription?.text = "Piechart"

        
    }
    
    
    
}
