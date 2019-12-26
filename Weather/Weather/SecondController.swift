import UIKit

class TableSecondController: UITableViewController {
    //массив с получеными температурами
    var arrayTemperature = [Double] (repeating: 0.0, count: 40)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Погода на 5 дней"
        //вынимаем данные с сервера
        APIServices().getObjectSomeDay(city: "Samara") {
            [weak self] (result: WeatherSomeDay?, error: Error?) in
            if let error = error {
                print("no")
                print("\(error)")
                print("no")
            } else if let result = result {
                print("yes")
                self?.arrayTemperature.removeAll()
                self?.update(from: result)
               // print(self?.arrayTemperature.count)
            }
        }
    }
    //заполняем массив
    private func update(from result: WeatherSomeDay) {
        for value in result.list {
            arrayTemperature.append(value.main.temp)
        }
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {//
        
        if indexPath.row == 0{
            let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
            cell.tempLabel1.text = String("\(Int(arrayTemperature[0] - 273.15))º")
            cell.temaLabel2.text = String("\(Int(arrayTemperature[2] - 273.15))º")
            cell.tempLabel3.text = String("\(Int(arrayTemperature[4] - 273.15))º")
            cell.tempLabel4.text = String("\(Int(arrayTemperature[6] - 273.15))º")
            cell.tempLabel5.text = String("\(Int(arrayTemperature[7] - 273.15))º")
            
            return cell
        }
        if indexPath.row == 1{
            let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
            cell.tempLabel1.text = String("\(Int(arrayTemperature[8] - 273.15))º")
            cell.temaLabel2.text = String("\(Int(arrayTemperature[10] - 273.15))º")
            cell.tempLabel3.text = String("\(Int(arrayTemperature[12] - 273.15))º")
            cell.tempLabel4.text = String("\(Int(arrayTemperature[14] - 273.15))º")
            cell.tempLabel5.text = String("\(Int(arrayTemperature[15] - 273.15))º")
                
            return cell
        }
        if indexPath.row == 1{
            let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
            cell.tempLabel1.text = String("\(Int(arrayTemperature[16] - 273.15))º")
            cell.temaLabel2.text = String("\(Int(arrayTemperature[18] - 273.15))º")
            cell.tempLabel3.text = String("\(Int(arrayTemperature[20] - 273.15))º")
            cell.tempLabel4.text = String("\(Int(arrayTemperature[22] - 273.15))º")
            cell.tempLabel5.text = String("\(Int(arrayTemperature[23] - 273.15))º")
            
            return cell
        }
        if indexPath.row == 1{
            let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
            cell.tempLabel1.text = String("\(Int(arrayTemperature[24] - 273.15))º")
            cell.temaLabel2.text = String("\(Int(arrayTemperature[26] - 273.15))º")
            cell.tempLabel3.text = String("\(Int(arrayTemperature[28] - 273.15))º")
            cell.tempLabel4.text = String("\(Int(arrayTemperature[30] - 273.15))º")
            cell.tempLabel5.text = String("\(Int(arrayTemperature[31] - 273.15))º")
            
            return cell
        }
            let cell = Bundle.main.loadNibNamed("SomeDayCell", owner: self, options: nil)?.first as! SomeDayCell
            cell.tempLabel1.text = String("\(Int(arrayTemperature[32] - 273.15))º")
            cell.temaLabel2.text = String("\(Int(arrayTemperature[34] - 273.15))º")
            cell.tempLabel3.text = String("\(Int(arrayTemperature[36] - 273.15))º")
            cell.tempLabel4.text = String("\(Int(arrayTemperature[38] - 273.15))º")
            cell.tempLabel5.text = String("\(Int(arrayTemperature[39] - 273.15))º")
            
            return cell
    }
    
    
    
    
}
