import UIKit

class CityTableViewCell: UITableViewCell {
    
    //@IBOutlet weak var nameLabel: UILabel!
    
    //@IBOutlet weak var populationLabel: UILabel!
    
    //@IBOutlet weak var yearLabel: UILabel!
    
    //@IBOutlet weak var areaLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //override func setSelected(_ selected: Bool, animated: Bool) {
    //   super.setSelected(selected, animated: animated)
    // }
    
    func configure(with infoCity: Info) {
        
       // nameLabel.text = "City: \(infoCity.name)"
      //  yearLabel.text = "Year: \(infoCity.year)"
       // areaLabel.text = "Area: \(infoCity.area)"//
      //  populationLabel.text = "Population: \(infoCity.population)"
        
      //  if  infoCity.name == "Samara" {
      //      contentView.backgroundColor = .green
      //  }
    }
    
}
