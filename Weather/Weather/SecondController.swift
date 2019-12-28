import UIKit

struct FewDayData {
    var arrayTemperature = [Double] (repeating: 0.0, count: 40) //погода
    var arrayDate = [String] (repeating: "", count: 5)
    var nameCity = ""
}

class TableSecondController: UITableViewController {
    var fewDayData = FewDayData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Weather for 5 days in \(fewDayData.nameCity)"
        if UserDefaults.standard.array(forKey: "dt_txt") != nil {
            fewDayData.arrayDate.removeAll()
            fewDayData.arrayDate = (UserDefaults.standard.array(forKey: "dt_txt") as? [String])!
        }
        if UserDefaults.standard.array(forKey: "tempSomeDay") != nil {
            fewDayData.arrayTemperature = UserDefaults.standard.array(forKey: "tempSomeDay") as? [Double] ?? [0.0]
        }
        //вынимаем данные с сервера
        APIServices().getObjectSomeDay(city: fewDayData.nameCity) {
            [weak self] (result: WeatherSomeDay?, error: Error?) in
            if let error = error {
                print("no")
                print("\(error)")
                print("no")
            } else if let result = result {
                self?.fewDayData.arrayTemperature.removeAll()
                self?.fewDayData.arrayDate.removeAll()
                self?.update(from: result)
            }
        }
    }
    //заполняем массив
    private func update(from result: WeatherSomeDay) {
      for index in 0..<result.list.count {
        if index % 8 == 0 {
            var str = result.list[index].dt
            str.removeLast(9)
            fewDayData.arrayDate.append(str)
        }
        fewDayData.arrayTemperature.append(result.list[index].main.temp)
        }
        saveCheckItem()
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//
        
        if fewDayData.nameCity == "" {
            self.navigationItem.title = "Check your internet connection"
            let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
            cell.DataLabel.text = "No data"
            cell.tempLabel1.text = ""
            cell.temaLabel2.text = ""
            cell.tempLabel3.text = ""
            cell.tempLabel4.text = ""
            cell.tempLabel5.text = ""
            return cell
        } else {
            var arrayIndex = [Double]()
            for counterRow in 0...4 {
                if indexPath.row == counterRow{
                    arrayIndex = countIndex(row: indexPath.row, arrayInfoDay: fewDayData.arrayTemperature)
                    let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
                    cell.DataLabel.text = fewDayData.arrayDate[indexPath.row]//String()
                    cell.tempLabel1.text = String("\(Int(arrayIndex[0] - 273.15))º")
                    cell.temaLabel2.text = String("\(Int(arrayIndex[1] - 273.15))º")
                    cell.tempLabel3.text = String("\(Int(arrayIndex[2] - 273.15))º")
                    cell.tempLabel4.text = String("\(Int(arrayIndex[3] - 273.15))º")
                    cell.tempLabel5.text = String("\(Int(arrayIndex[4] - 273.15))º")
                    return cell
                }
            }
            return Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
        }
    }
    
    func countIndex(row: Int, arrayInfoDay: [Double]) -> [Double] {
        var arrayData: [Double] = []
        for counter in 0...3 {
            arrayData.append(arrayInfoDay[8 * row + 2 * counter])
        }
        arrayData.append(arrayInfoDay[8 * row + 7])
        return arrayData
    }
    
    func saveCheckItem() {
        UserDefaults.standard.set(fewDayData.arrayDate, forKey: "dt_txt")
        UserDefaults.standard.set(fewDayData.arrayTemperature, forKey: "tempSomeDay")
        UserDefaults.standard.synchronize()
    }
    
}

