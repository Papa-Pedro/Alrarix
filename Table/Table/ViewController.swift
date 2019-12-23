import UIKit

class ViewController: UIViewController {
    
    
   // @IBOutlet weak var cityInfoView: CityInfoTableViewCell!
    
    //@IBOutlet weak var tabelView: UITableView!
    
    @IBOutlet weak var tabelView: UITableView!
    
    var dataSource: [Info] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelView.dataSource = self  //источник данных табличного представления (вызываем UITableViewDataSource)
        //tabelView.delegate = self
        loadDataSource()
        /*let view = UINib(nibName: "CityInfoTableViewCell", bundle: .main).instantiate(withOwner: nil, options: nil).first as! UIView
        view.frame = self.view.bounds
        self.view.addSubview(view)*/
       // tabelView.register(UINib(nibName: "CityInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "CityInfoTableViewCell")
       // cityInfoView.infoLabel.text = "ahaha"
    }
    //заполняем массив наших данных
    func loadDataSource() {
        dataSource.append(City().Samara)
        dataSource.append(City().Tolyatti)
        dataSource.append(City().Novokuibyshevsk)
        dataSource.append(City().Chapaevsk)
        dataSource.append(City().Zhigulevsk)
        dataSource.append(City().Kinel)
        dataSource.append(City().Syzran)
    }
}

extension ViewController: UITableViewDataSource {//, UITableViewDelegate {
    
   // func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
   //     return 83
   // }
   //доделать заголовок
  /*  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) ->UIView? {
        //let title = "Title"
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "Cell") as? CityTableViewCell else {
            return nil
        }
        view.textLabel?.text = dataSource[section].name
        //let view = UIView()
        view.backgroundColor = .red
        return view
    }*/
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) ->CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    //инициализируем строки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cityCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CityTableViewCell else {
            return UITableViewCell()
        } //возвращаем ячейку
        
        cityCell.configure(with: dataSource[indexPath.row])
        
        return cityCell
    }
    
    
    
}
