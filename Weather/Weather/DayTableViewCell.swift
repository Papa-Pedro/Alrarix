import UIKit

protocol DayDelegate: class {
    func dayView(_ view: DayTableViewCell)
}

class DayTableViewCell: UITableViewCell {
    
    weak var delegate: DayDelegate?
    
    @IBOutlet weak var goNextButton: UIButton!
    @IBAction func goNextNewButton(_ sender: UIButton) {
        delegate?.dayView(self)
        //print("hay")
    }
    
    /*    static func storyboard() -> TableViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        //return storyboard.instantiateInitialViewController() as? TableViewController
        let nextVuewController = storyboard.instantiateViewController(withIdentifier: "nextView") as! TableViewController
        self.navigationController?
        
    }*/
    
}
