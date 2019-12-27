import Foundation
import UIKit

struct WeatherData: Codable {
    let main: Main
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
        case name = "name"
    }
}

struct Main: Codable {
    let temp: Double
    let feels: Double
    let	min: Double
    let max: Double
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feels = "feels_like"
        case min = "temp_min"
        case max = "temp_max"
    }
    
  /*  init?(coder aDecoder: NSCoder) {
        self.temp = aDecoder.decodeObject(forKey: "temp") as! Double
        self.feels = aDecoder.decodeObject(forKey: "feels_like") as! Double
        self.min = aDecoder.decodeObject(forKey: "temp_min") as! Double
        self.max = aDecoder.decodeObject(forKey: "temp_max") as! Double
    }*/
}
