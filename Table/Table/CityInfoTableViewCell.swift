import UIKit

class CityInfoTableViewCell: UIView { //для использования в коде
    
    @IBOutlet var contetnView: UIView!
    @IBOutlet weak var tittleNameLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { //для использования в IB
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("CityInfoViewController", owner: self, options: nil) //загружаем Xib из памяти
        addSubview(contetnView) //добовляем представление
        contetnView.frame = self.bounds
        contetnView.autoresizingMask = [.flexibleHeight, .flexibleWidth] //что бы полностью занимало внешний вид
        
    }

}
