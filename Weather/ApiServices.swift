import Foundation
import Alamofire
//вообщем тут вытаскиваем данные
class APIServices {
    
    func getObject<T: Codable>(url: String, completion: @escaping (_ object: T?, _ error: Error?) -> Void) {
        request(url).responseData() { response in
            response.result.withValue { data in
                do {
                    let result = try JSONDecoder.init().decode(T.self, from: data)
                    completion(result, nil)
                } catch (let error) {
                    completion(nil, error)
                }
                }.withError { error in
                    completion(nil, error)
            }
        }
    }
    
}
