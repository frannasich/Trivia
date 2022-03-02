//  AlamofireAPIClient.swift

import Foundation
import Alamofire
 
class AlamofireAPIClient {
    static let shared = AlamofireAPIClient()
    
    func get(url: String, completion: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            completion(response.result)
            print(response.result)
        }
    }
}

