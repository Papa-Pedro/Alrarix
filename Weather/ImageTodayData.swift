import Foundation

enum WeatherCondition: String {
    case Clear = "https://openweathermap.org/img/wn/01d@2x.png"
    case Few = "https://openweathermap.org/img/wn/02d@2x.png"
    case Scattered = "https://openweathermap.org/img/wn/03d@2x.png"
    case Broken = "https://openweathermap.org/img/wn/04d@2x.png"
    case Shower = "https://openweathermap.org/img/wn/09d@2x.png"
    case Rain = "https://openweathermap.org/img/wn/10d@2x.png"
    case Thunderstorm = "https://openweathermap.org/img/wn/11d@2x.png"
    case Show = "https://openweathermap.org/img/wn/13d@2x.png"
    case Mist = "https://openweathermap.org/img/wn/50d@2x.png"
    case Non = ""
    
    init(_ image: String) {
        switch image {
        case "clear sky": self = .Clear
        case "few clouds": self = .Few
        case "scattered clouds": self = .Scattered
        case "overcast clouds": self = .Broken
        case "broken clouds": self = .Broken
        case "shower rain": self = .Shower
        case "light rain": self = .Rain
        case "thunderstorm": self = .Thunderstorm
        case "light snow": self = .Show
        case "snow": self = .Show
        case "mist": self = .Mist
        default:
            self = .Non
        }
    }
}
