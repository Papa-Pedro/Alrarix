import UIKit

struct infoToday {
    let cell: Int!
    let text1: String!
    let text2: String!
}

class TableViewController: UITableViewController {
    
    var temp = 0.0
    var feels = 0.0
    var tempMin = 0.0
    var tempMax = 0.0//инф о текущем дне
    var name = ""
    
    var nameOfLabel = "London" //сюда извлекаем информацию

    var arrayData = [infoToday]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        


        arrayData = [infoToday(cell: 1, text1: "-17", text2: "-23"),
                     infoToday(cell: 2, text1: "mondey", text2: "-5"),
                     infoToday(cell: 1, text1: "", text2: "")]
        
        APIServices().getObjectToday(city: nameOfLabel) {
            [weak self] (result: WeatherData?, error: Error?) in
            if let error = error {
                print("\(error)")
                print("yes")
            } else if let result = result {
                //self.temp = result.main.temp
                //self?.feels = result.main.feels
                self?.update(from: result)
                //print("\(result)")
                print("no")
            }
        }
    }
    
    private func update(from result: WeatherData) {
        name = result.name
        feels = result.main.feels
        temp = result.main.temp
        tempMin = result.main.min
        tempMax = result.main.max
        tableView.reloadData()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count-1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayData[indexPath.row].cell == 1 {
            
            let cell = Bundle.main.loadNibNamed("TodayViewCellTableViewCell", owner: self, options: nil)?.first as! TodayViewCellTableViewCell
            self.view = view
            self.view.frame = view.bounds
            cell.delegate = self //вызываем делегат и получаем все его свойства
            
            cell.temperatureLabel.text = String("\(Int(temp - 273.15))º")
            cell.feltLabel.text = String("\(Int(tempMin - 273.15))º/\(Int(tempMax    - 273.15))º Ощущается как \(Int(feels - 273.15))º")
            cell.nameLabel.text = name //изменен name на nameText
            
            
            return cell
        } else {
            let cell = Bundle.main.loadNibNamed("DayTableViewCell", owner: self, options: nil)?.first as! DayTableViewCell
           // cell.daysLabel.text = arrayData[indexPath.row].text1
            //cell.weatherDayLabel.text = arrayData[indexPath.row].text2
            
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

extension TableViewController: Delegate {
    func touchInView(_ view: TodayViewCellTableViewCell) {
        let newText = (view.nameCityField.text ?? "")
        view.nameLabel.text = newText
        nameOfLabel = newText
        APIServices().getObjectToday(city: nameOfLabel) {
            [weak self] (result: WeatherData?, error: Error?) in
            if let error = error {
                print("\(error)")
                print("yes")
            } else if let result = result {
                self?.update(from: result)
                self?.tableView.reloadData()
                print("no")
            }
        }
        
    }
}
