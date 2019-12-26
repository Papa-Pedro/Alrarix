import UIKit

struct WeatherSomeDay: Codable {
    let list: [ListSome]
    
    enum CodingKeys: String, CodingKey {
        case list = "list"
    }
}

struct ListSome: Codable {
    let main: MainSome
    let dt: String
    
    enum CodingKeys: String, CodingKey {
        case main = "main"
        case dt = "dt_txt"
    }
}

struct MainSome: Codable {
    let temp: Double
    
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
    }
}
