import UIKit

struct InfoToday {
    var temp: Double = pullDataCollection("temp")
    var feels: Double = pullDataCollection("feels")
    var tempMax: Double = pullDataCollection("temp_max")
    var tempMin: Double = pullDataCollection("temp_min")
    var name: String = pullDataCollection("name")
}

class TableViewController: UITableViewController {
    
    var infoToday = InfoToday()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Погода" 
        callAPIService(city: infoToday.name)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = Bundle.main.loadNibNamed("TodayViewCellTableViewCell", owner: self, options: nil)?.first as! TodayViewCellTableViewCell
            cell.delegate = self //вызываем делегат и получаем все его свойства теперь будет вызван extension
            cell.temperatureLabel.text = String("\(Int(infoToday.temp - 273.15))º")
            cell.feltLabel.text = String("\(Int(infoToday.tempMin - 273.15))º/\(Int(infoToday.tempMax - 273.15))º Ощущается как \(Int(infoToday.feels - 273.15))º")
            cell.nameLabel.text = infoToday.name
            
            return cell
        } else {
            let cell = Bundle.main.loadNibNamed("DayTableViewCell", owner: self, options: nil)?.first as! DayTableViewCell
            cell.delegate = self
            
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 166.5
        } else {
            return 93
        }
    }
    //обновляем данные
    private func update(from result: WeatherData) {
        infoToday.name = result.name
        infoToday.feels = result.main.feels
        infoToday.temp = result.main.temp
        infoToday.tempMin = result.main.min
        infoToday.tempMax = result.main.max
        saveCheckItems()
        tableView.reloadData()
    }
    //cохраняем данные в DataStorage
    private func saveCheckItems() {
        UserDefaults.standard.set(infoToday.temp, forKey: "temp")
        UserDefaults.standard.set(infoToday.feels, forKey: "feels")
        UserDefaults.standard.set(infoToday.tempMax, forKey: "temp_max")
        UserDefaults.standard.set(infoToday.tempMin, forKey: "temp_min")
        UserDefaults.standard.set(infoToday.name, forKey: "name")
        UserDefaults.standard.synchronize()
    }

    func callAPIService(city: String) {
        APIServices().getObjectToday(city) {
            [weak self] (result: WeatherData?, error: Error?) in
            if let error = error {
                print("Error - \(error)")
            } else if let result = result {
                self?.update(from: result)
                self?.tableView.reloadData()
            }
        }
    }
    
}
//получаем информацию из DataStorage
func pullDataCollection(_ key: String) -> Double {
    if UserDefaults.standard.double(forKey: key) != 0.0 {
        return UserDefaults.standard.double(forKey: key)
    }
    return 0.0
}

func pullDataCollection(_ key: String) -> String {
    if UserDefaults.standard.string(forKey: key) != nil {
        return UserDefaults.standard.string(forKey: key)!
    }
    return ""
}


extension TableViewController: Delegate {
    func touchInView(_ view: TodayViewCellTableViewCell) {
        let newText = (view.nameCityField.text ?? "")
        view.nameLabel.text = newText
        let nameOfLabel = newText //получаем значение label из Xib.row = 0
        callAPIService(city: nameOfLabel)    }
}
//вызов делегата 2 ячейки
extension TableViewController: DayDelegate {
    func dayView(_ view: DayTableViewCell) {
        //создаем свойство в котором находится TableVC
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //создаем TableSecondViewController
        let nextTableViewController = mainStoryboard.instantiateViewController(withIdentifier: "nextView") as! TableSecondController
        //меняем его свойство
        print("!!!!" + infoToday.name)
        nextTableViewController.fewDayData.nameCity = infoToday.name
        //кладем Second наверх стека и вызываем его, те другой VC
        self.navigationController?.pushViewController(nextTableViewController, animated: true)
    }
}
//работаем с NavigationBar (скрываем его)
extension TableViewController {
    func hideNavigationBar() {//
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
