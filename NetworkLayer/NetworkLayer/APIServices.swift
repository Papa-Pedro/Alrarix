import Foundation
import Alamofire

final public class APIServices { //предотвращаем переопределение метода
    
    public func getObject<T:Codable>( //для кодирования и декодирования вместе использован Codable
        handler: @escaping (_ object: T?, _ error: Error?) -> Void) { //переменная которую мы получим на выходе
        
        let resultURL = "https://altgo.altarix.org/api/event?id=F95908B6-492E-4D4A-B780-66E9DFE413E4" //страница из которой берем данные
        
        request(resultURL).responseData(){ response in //обрабатываем запрос
            response.result.withValue { data in //разворачиваем ответ в Data
                do {
                    let result = try JSONDecoder.init().decode(T.self, from: data) //декодируем из JSON
                    handler(result, nil)
                } catch (let error) { //если не получилось декадировать
                    handler(nil, error)
                }
                
                }.withError { error in //если не получилось развернуть верни ошибку
                    handler(nil, error)
            }
        }
    }
}
