import Foundation
import Alamofire
//вообщем тут вытаскиваем данные
final public class APIServices {
    
    private(set) var domin = "https://api.openweathermap.org/data/2.5/weather?q="
    
    private(set) var tail = "&APPID=ed92c137ca53adb7b11b7faf933c6f79"
    
    private(set) var dominSomeDay = "http://api.openweathermap.org/data/2.5/forecast?q="   

    
    public func getObjectToday<T: Codable>(
        city: String,
        handler: @escaping (_ object: T?, _ error: Error?) -> Void) {

        let resultURL = domin+city+tail
        
        request(resultURL).responseData(){ response in
            response.result.withValue { data in
                do {
                    let result = try JSONDecoder.init().decode(T.self, from: data)
                    handler(result, nil)
                } catch (let error) {
                    handler(nil, error)
                }
                }.withError { error in
                    handler(nil, error)
            }
        }
    }
    //вынимаем информацию на 5 дней
    public func getObjectSomeDay<T: Codable>(
        city: String,
        handler: @escaping (_ object: T?, _ error: Error?) -> Void) {
        
        let resultURL = dominSomeDay + city + tail
        //print(resultURL)
        
        request(resultURL).responseData() { response in
            response.result.withValue { data in
                do {
                    let result = try JSONDecoder.init().decode(T.self, from: data)
                    handler(result, nil)
                } catch (let error) {
                    handler(nil, error)
                    
                }
                }.withError { error in
                    handler(nil, error)
            }
        }
    }
    
}
