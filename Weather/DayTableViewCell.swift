import UIKit

protocol DayDelegate: class {
    func dayView(_ view: DayTableViewCell)
}

class DayTableViewCell: UITableViewCell {
    
    weak var delegate: DayDelegate?
    
    @IBOutlet weak var goNextButton: UIButton!
    @IBAction func goNextNewButton(_ sender: UIButton) {
        delegate?.dayView(self)
    }
    
}
