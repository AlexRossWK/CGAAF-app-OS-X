//
//  CurrentPortfolioViewModel.swift
//  CGAAF
//
//  Created by Алексей Россошанский on 20.02.18.
//  Copyright © 2018 Alexey Rossoshasky. All rights reserved.
//

import Cocoa
import Charts

final class CurrentPortfolioViewModel {
    
    //Func to create pie diagram
    func createPie(viewForPieChart: PieChartView, dataForChart: [Double]) {
        
        let dataInPieChartDataEntry = dataForChart.enumerated().map { x, y in return PieChartDataEntry(value: y, label: String(x)) }
        let data = PieChartData()
        let ds1 = PieChartDataSet(values: dataInPieChartDataEntry, label: "Hello")
        
        ds1.colors = ChartColorTemplates.colorful()
        
        
        
        data.addDataSet(ds1)
        
        let paragraphStyle: NSMutableParagraphStyle = NSParagraphStyle.default.mutableCopy() as! NSMutableParagraphStyle
        paragraphStyle.lineBreakMode = .byTruncatingTail
        paragraphStyle.alignment = .center
        
        let centerText: NSMutableAttributedString = NSMutableAttributedString(string: "")
        centerText.setAttributes([NSAttributedStringKey.font: NSFont(name: "HelveticaNeue-Light", size: 15.0)!, NSAttributedStringKey.paragraphStyle: paragraphStyle], range: NSMakeRange(0, centerText.length))
        //        centerText.addAttributes([NSAttributedStringKey.font: NSFont(name: "HelveticaNeue-Light", size: 13.0)!, NSAttributedStringKey.foregroundColor: NSColor.gray], range: NSMakeRange(10, centerText.length - 10))
        //        centerText.addAttributes([NSAttributedStringKey.font: NSFont(name: "HelveticaNeue-LightItalic", size: 13.0)!, NSAttributedStringKey.foregroundColor: NSColor(red: 51 / 255.0, green: 181 / 255.0, blue: 229 / 255.0, alpha: 1.0)], range: NSMakeRange(centerText.length - 19, 19))
        
        //кружочки в легенде а не квадратики
        viewForPieChart.legend.form = .circle
        //легенда справа вверху и по вертикали
        viewForPieChart.legend.verticalAlignment = .top
        viewForPieChart.legend.horizontalAlignment = .right
        viewForPieChart.legend.orientation = .vertical
        //радиус дырки в середине
        viewForPieChart.holeRadiusPercent = CGFloat(0.1)
        //цвет дырки в середине
        viewForPieChart.holeColor = NSUIColor.darkGray
        //радиус прозрачной обводки в середине
        viewForPieChart.transparentCircleRadiusPercent = CGFloat(0.15)
        
        
        viewForPieChart.centerAttributedText = centerText
        
        viewForPieChart.data = data
        
        viewForPieChart.chartDescription?.text = ""
        
    }
    
    func animateAppearingOfChart(viewForPieChart: PieChartView) {
        viewForPieChart.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
    }
    
    
    
}
