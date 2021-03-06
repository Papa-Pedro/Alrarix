import UIKit

protocol Delegate: class {
    func touchInView(_ view: TodayViewCellTableViewCell)
}

class TodayViewCellTableViewCell: UITableViewCell {
    weak var delegate: Delegate?
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feltLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameCityField: UITextField!
    @IBAction func nameCityButton(_ sender: UIButton) {
        //sender.layer.cornerRadius = 5.0
        //sender.alpha = 0.0
       // nameCityField.layer.cornerRadius = 5
        delegate?.touchInView(self)
    }
    
    
}
