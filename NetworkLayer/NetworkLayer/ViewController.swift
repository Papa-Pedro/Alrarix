import UIKit

class ViewController: UITableViewController {
    
    var item: [Item] = [] //массив с информацией Codable
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            APIServices().getObject() {
            [weak self]  (result: Cource?, error: Error?) in
            if let error = error {
                print("\(error)")
            } else if let result = result {
                print("\(result)")
                self?.update(from: result)
            }
        }
    }
    
    private func update(from result: Cource) {
        navigationItem.title = result.event.title //предоставляем доступ к панели навигации и записываем event туда
        item = result.event.dayes.compactMap { day in //возращаем массив с разультами
            return day.items.first //берем 1 результат
        }
        tableView.reloadData() //перезагружаем строки и разделы табличного представления
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    //заполняем ячейки
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)//инициализируем ячейку
        cell.textLabel?.text = item[indexPath.row].title //заполняем ее
        
        return cell
    }
}

