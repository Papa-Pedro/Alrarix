//
//  ViewController.swift
//  Weather
//
//  Created by Tim Ferens on 24.12.2019.
//  Copyright © 2019 Tim Ferens. All rights reserved.
//

import UIKit

struct infoToday {
    let cell: Int!
    let text1: String!
    let text2: String!
}

class TableViewController: UITableViewController {

    var arrayData = [infoToday]()
    
    override func viewDidLoad() {
        arrayData = [infoToday(cell: 1, text1: "-17", text2: "-23"),
                     infoToday(cell: 2, text1: "mondey", text2: "-5"),
                     infoToday(cell: 1, text1: "", text2: "")]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrayData.count-1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if arrayData[indexPath.row].cell == 1 {
            
            let cell = Bundle.main.loadNibNamed("TodayViewCellTableViewCell", owner: self, options: nil)?.first as! TodayViewCellTableViewCell
            cell.temperatureLabel.text = arrayData[indexPath.row].text1
            cell.feltLabel.text = arrayData[indexPath.row].text2
            
            return cell
        } else {
            
            let cell = Bundle.main.loadNibNamed("DayTableViewCell", owner: self, options: nil)?.first as! DayTableViewCell
            cell.daysLabel.text = arrayData[indexPath.row].text1
            cell.weatherDayLabel.text = arrayData[indexPath.row].text2
            
            return cell
        }

        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayData[indexPath.row].cell == 1 {
            return 167
        } else {
            return 93
        }
    }
}

