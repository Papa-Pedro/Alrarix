import Foundation
import Alamofire
//вообщем тут вытаскиваем данные
final public class APIServices {
    
    public func getObjectToday<T: Codable>(
        handler: @escaping (_ object: T?, _ error: Error?) -> Void) {
        
        let resultURL = "http://api.openweathermap.org/data/2.5/weather?id=499099&APPID=1b05683bb146bfc6b7a19237b48b9c64"
        
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
}
