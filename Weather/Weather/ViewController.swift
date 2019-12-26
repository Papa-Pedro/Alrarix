import UIKit

struct infoToday {
    let cell: Int!
    let text1: String!
    let text2: String!
}
//создаем делегат
//protocol DelegateSecond {
 //   func touchInSecondView(_ view: String)
//}/

class TableViewController: UITableViewController {
    //инициализируем делегат
   // var delegate: DelegateSecond?
    
    var temp = 0.0
    var feels = 0.0
    var tempMin = 0.0
    var tempMax = 0.0//инф о текущем дне
    var name = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Погода"
        
        APIServices().getObjectToday(city: "Samara") {
            [weak self] (result: WeatherData?, error: Error?) in
            if let error = error {
                print("Error 1 start")
                print("\(error)")
                print("Error 1 finish")
            } else if let result = result {
                self?.update(from: result)
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
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = Bundle.main.loadNibNamed("TodayViewCellTableViewCell", owner: self, options: nil)?.first as! TodayViewCellTableViewCell
            
            cell.delegate = self //вызываем делегат и получаем все его свойства теперь будет вызван extension
            
            cell.temperatureLabel.text = String("\(Int(temp - 273.15))º")
            cell.feltLabel.text = String("\(Int(tempMin - 273.15))º/\(Int(tempMax - 273.15))º Ощущается как \(Int(feels - 273.15))º")
            cell.nameLabel.text = name //изменен name на nameText
            
            
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
    
    
  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      /*  let TableSecondViewController: TableSecondController = segue.destination as! TableSecondController
        let cell = Bundle.main.loadNibNamed("TodayViewCellTableViewCell", owner: self, options: nil)?.first as! TodayViewCellTableViewCell
        TableSecondViewController.nameSity  = cell.nameLabel.text!*/
   // }
}

extension TableViewController: Delegate {
    func touchInView(_ view: TodayViewCellTableViewCell) {
        let newText = (view.nameCityField.text ?? "")
        view.nameLabel.text = newText
        let nameOfLabel = newText //получаем значение label из Xib.row = 0
        APIServices().getObjectToday(city: nameOfLabel) {
            [weak self] (result: WeatherData?, error: Error?) in
            if let error = error {
                print("no1")
                print("\(error)")
                print("no")
            } else if let result = result {
                self?.update(from: result)
                self?.tableView.reloadData()
            }
        }
    }
}
//вызов делегата 2 ячейки
extension TableViewController: DayDelegate {
    func dayView(_ view: DayTableViewCell) {
      //  let dest = storyboard?.instantiateViewController(withIdentifier: "nextView") as! TableSecondController
      //  print(name)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let nextTableViewController = mainStoryboard.instantiateViewController(withIdentifier: "nextView")
        
      //  let info = name
       // delegate?.touchInSecondView(info)
        //delegate1?.touchInSecondView(self) //передаем делегат
        
        //self.gfvv
        self.navigationController?.pushViewController(nextTableViewController, animated: true)
    }
}
//работаем с NavigationBar (скрываем его)
extension TableViewController {
    func hideNavigationBar() {//
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
