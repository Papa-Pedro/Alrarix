import UIKit

protocol Delegate: class {
    func touchInView(_ view: TodayTableViewCell)
}

class TodayTableViewCell: UITableViewCell {
    weak var delegate: Delegate?
    
    
    @IBOutlet weak var cloudsImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feltLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameCityField: UITextField!
    @IBAction func nameCityActionField(_ sender: UITextField) {
        sender.text = ""
    }
    @IBAction func nameCityButton(_ sender: UIButton) {
        delegate?.touchInView(self)
    }
    
    
}
