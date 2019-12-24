import Foundation
import UIKit

struct WeatherData: Codable {
    let main: Main
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
    }
}

struct Main: Codable {
    let temp: Double
    let feels: Double
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case feels = "feels_like"
    }
}
