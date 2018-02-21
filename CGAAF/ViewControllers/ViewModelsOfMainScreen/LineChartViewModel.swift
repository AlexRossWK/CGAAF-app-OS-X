//
//  LineChartViewModel.swift
//  CGAAF
//
//  Created by Алексей Россошанский on 21.02.18.
//  Copyright © 2018 Alexey Rossoshasky. All rights reserved.
//

import Foundation
import Charts

final class LineChartViewModel {
    
    func createLineChart(viewForLineChart: LineChartView, dataPoints: [Double], values: [Double]) {
        
        var lineDataEntry = [ChartDataEntry]()
        
        for i in 0..<dataPoints.count {
            let dataPoint = ChartDataEntry(x: Double(i), y: Double(values[i]))
            lineDataEntry.append(dataPoint)
        }

        let data = LineChartData()
        let ds1 = LineChartDataSet(values: lineDataEntry, label: "Line")
        ds1.colors = [NSUIColor.red]
        //точки-кружочки
        ds1.circleRadius = 3
        ds1.circleColors = [NSUIColor.red]
        //вид графика
        ds1.mode = .linear
        //ширина линии
        ds1.lineWidth = 2.5
        //разрешаем поялвение линий при нажатии на точки
        ds1.setDrawHighlightIndicators(true)
        
        //градиент(под линией)
        let gradientColors = [NSColor.black.cgColor, NSColor.clear.cgColor] as CFArray
        let colorLocation = [CGFloat(1.0), CGFloat(0.0)]
        guard let gradient = CGGradient.init(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: gradientColors, locations: colorLocation) else {print("error in gradient"); return}
        ds1.fill = Fill.fillWithLinearGradient(gradient, angle: 90.0)
        ds1.drawFilledEnabled = true
        //Ось х внизу
        viewForLineChart.xAxis.labelPosition = .bottom
        //Сетка
        viewForLineChart.xAxis.drawGridLinesEnabled = true
        viewForLineChart.rightAxis.enabled = false
        viewForLineChart.leftAxis.drawGridLinesEnabled = true
        
        data.addDataSet(ds1)
        
        viewForLineChart.data = data
        //цвет бэкграунда
        viewForLineChart.backgroundColor = NSUIColor.darkGray
        viewForLineChart.gridBackgroundColor = NSUIColor.black //?
        
        viewForLineChart.chartDescription?.text = "Linechart"
    }
    
    func animateAppearingOfLineChart(viewForLineChart: LineChartView) {
        viewForLineChart.animate(xAxisDuration: 0.0, yAxisDuration: 1.0)
    }
}





