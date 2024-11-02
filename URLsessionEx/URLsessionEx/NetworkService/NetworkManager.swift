
import Foundation
import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private init(){}
    
    func requestData(url: URL, method: String, body: Data? = nil,   completion: @escaping (Data?, Error?) -> Void){
        var request = URLRequest(url : url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(nil, error)
            } else {
                completion(data,nil)
            }
        }.resume()
        
    }
}
