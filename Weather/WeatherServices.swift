import Foundation

class WeatherService {
    
    private let tail = "&APPID=ed92c137ca53adb7b11b7faf933c6f79"
    
    func getObjectToday(city: String, completion: @escaping (_ object: WeatherData?, _ error: Error?) -> Void) {
        let domin = "https://api.openweathermap.org/data/2.5/weather?q="
        APIServices().getObject(url: domin+city+tail, completion: {
            (result: WeatherData?, error: Error?) in
            completion(result,error)
        })
    }
    
    func getObjectSomeDay(city: String, completion: @escaping (_ object: WeatherSomeDay?, _ error: Error?) -> Void) {
        let dominSomeDay = "http://api.openweathermap.org/data/2.5/forecast?q="
        APIServices().getObject(url: dominSomeDay+city+tail, completion: {
            (result: WeatherSomeDay?, error: Error?) in
            completion(result,error)
        })
    }
}
