//
//  StatViewController.swift
//  FitnessCoach
//
//  Created by Yuren Huang on 2/28/18.
//  Copyright © 2018 Auth0. All rights reserved.
//

import UIKit
import Charts

class StatViewController: UIViewController {
    
    var statType: String?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let data = ["Step Count": fitbitData.shared.steps, "Active Minutes": fitbitData.shared.activeMin]
        
//        let barChart = BarChartView.init(frame: UIScreen.main.bounds)
        let insets = view.safeAreaInsets
        let barChart = BarChartView.init(frame: CGRect(x: insets.left, y: insets.top, width: view.bounds.width - insets.left - insets.right, height: view.bounds.height - insets.top - insets.bottom))
        
        barChart.chartDescription?.text = "Daily " + statType!
        barChart.backgroundColor = UIColor.white
        
        var dataEntries: [BarChartDataEntry] = []
        print(statType ?? "No stat")
        if (statType == nil || data[statType!] == nil) {
            print("No such statistic type")
            return
        }
        print(data)
        for i in 0 ..< data[statType!]!.count {
            let dataEntry = BarChartDataEntry.init(x: Double(i), y: Double(data[statType!]![i]))
            dataEntries.append(dataEntry)
        }
        
        let barChartDataSet = BarChartDataSet(values: dataEntries, label: statType)
        
        barChartDataSet.valueColors = [UIColor.orange, UIColor.purple]
        barChartDataSet.drawValuesEnabled = true
        barChartDataSet.barBorderWidth = 1
        barChartDataSet.barBorderColor = UIColor.black
        barChartDataSet.colors = [UIColor.orange, UIColor.purple]
        barChartDataSet.highlightColor = UIColor.white
        barChartDataSet.highlightAlpha = 0.5
        
        let barChartData = BarChartData(dataSet: barChartDataSet)
        
        barChart.data = barChartData
        barChart.drawGridBackgroundEnabled = true
        
        self.view.addSubview(barChart)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
