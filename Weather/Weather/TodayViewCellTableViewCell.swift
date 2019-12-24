import UIKit

/*protocol NameCityDelegate: class {
    func nameCityPop(_ contrller: TodayViewCellTableViewCell, didFinish item: String)
}*/

protocol Delegate: class {
    func touchInView(_ view: TodayViewCellTableViewCell)
}

class TodayViewCellTableViewCell: UITableViewCell {//, UITextFieldDelegate {
    ///weak var delegate: NameCityDelegate?
    //var nameOfLabel: String?
    weak var delegate: Delegate?
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feltLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameCityField: UITextField!
    @IBAction func nameCityButton(_ sender: UIButton) {
        //nameLabel.text = nameCityField.text
        delegate?.touchInView(self)
        //delegate?.didElementClick()
       // nameOfLabel = nameCityField.text
       // delegate?.nameCityPop(self, didFinish: nameOfLabel!)
    
    }
    
    
    //override func prepare
    
    
    


}
