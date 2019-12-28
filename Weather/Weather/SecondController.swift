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
            cell.tempLabel1.text = String("")
            cell.temaLabel2.text = String("")
            cell.tempLabel3.text = String("")
            cell.tempLabel4.text = String("")
            cell.tempLabel5.text = String("")
            return cell
        } else {
            if indexPath.row == 0{
                let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
                cell.DataLabel.text = fewDayData.arrayDate[indexPath.row]//String()
                cell.tempLabel1.text = String("\(Int(fewDayData.arrayTemperature[0] - 273.15))º")
                cell.temaLabel2.text = String("\(Int(fewDayData.arrayTemperature[2] - 273.15))º")
                cell.tempLabel3.text = String("\(Int(fewDayData.arrayTemperature[4] - 273.15))º")
                cell.tempLabel4.text = String("\(Int(fewDayData.arrayTemperature[6] - 273.15))º")
                cell.tempLabel5.text = String("\(Int(fewDayData.arrayTemperature[7] - 273.15))º")
                
                return cell
            }
            if indexPath.row == 1{
                let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
                cell.DataLabel.text = fewDayData.arrayDate[indexPath.row]
                cell.tempLabel1.text = String("\(Int(fewDayData.arrayTemperature[8] - 273.15))º")
                cell.temaLabel2.text = String("\(Int(fewDayData.arrayTemperature[10] - 273.15))º")
                cell.tempLabel3.text = String("\(Int(fewDayData.arrayTemperature[12] - 273.15))º")
                cell.tempLabel4.text = String("\(Int(fewDayData.arrayTemperature[14] - 273.15))º")
                cell.tempLabel5.text = String("\(Int(fewDayData.arrayTemperature[15] - 273.15))º")
                
                return cell
            }
            if indexPath.row == 2{
                let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
                cell.DataLabel.text = fewDayData.arrayDate[indexPath.row]
                cell.tempLabel1.text = String("\(Int(fewDayData.arrayTemperature[16] - 273.15))º")
                cell.temaLabel2.text = String("\(Int(fewDayData.arrayTemperature[18] - 273.15))º")
                cell.tempLabel3.text = String("\(Int(fewDayData.arrayTemperature[20] - 273.15))º")
                cell.tempLabel4.text = String("\(Int(fewDayData.arrayTemperature[22] - 273.15))º")
                cell.tempLabel5.text = String("\(Int(fewDayData.arrayTemperature[23] - 273.15))º")
                
                return cell
            }
            if indexPath.row == 3{
                let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
                cell.DataLabel.text = fewDayData.arrayDate[indexPath.row]
                cell.tempLabel1.text = String("\(Int(fewDayData.arrayTemperature[24] - 273.15))º")
                cell.temaLabel2.text = String("\(Int(fewDayData.arrayTemperature[26] - 273.15))º")
                cell.tempLabel3.text = String("\(Int(fewDayData.arrayTemperature[28] - 273.15))º")
                cell.tempLabel4.text = String("\(Int(fewDayData.arrayTemperature[30] - 273.15))º")
                cell.tempLabel5.text = String("\(Int(fewDayData.arrayTemperature[31] - 273.15))º")
                
                return cell
            }
            let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
            cell.DataLabel.text = fewDayData.arrayDate[indexPath.row]
            cell.tempLabel1.text = String("\(Int(fewDayData.arrayTemperature[32] - 273.15))º")
            cell.temaLabel2.text = String("\(Int(fewDayData.arrayTemperature[34] - 273.15))º")
            cell.tempLabel3.text = String("\(Int(fewDayData.arrayTemperature[36] - 273.15))º")
            cell.tempLabel4.text = String("\(Int(fewDayData.arrayTemperature[38] - 273.15))º")
            cell.tempLabel5.text = String("\(Int(fewDayData.arrayTemperature[39] - 273.15))º")
            
            return cell
            
        }
        
        
    }

    //узнать текущую директорию где храняться данные
   /* func documentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)
        return paths[0]
    } */
    
    func saveCheckItem() {
        UserDefaults.standard.set(fewDayData.arrayDate, forKey: "dt_txt")
        UserDefaults.standard.set(fewDayData.arrayTemperature, forKey: "tempSomeDay")
        UserDefaults.standard.synchronize()
    }
    
}

