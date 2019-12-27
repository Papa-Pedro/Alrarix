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
}
