//  CategoriesService.swift

import Foundation
import Alamofire
 
class CategoriesService {

    let apiClient = AlamofireAPIClient()
    
    func getCategories(completion: @escaping ([Category]) -> Void, onError: @escaping () -> Void ) {
        apiClient.get(url: Constants().categoriesURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let categories = try JSONDecoder().decode(Categories.self, from: data)
                        completion(categories.trivia_categories)
                    } else {
                        onError()
                    }
                } catch {
                    completion([])
                }
            case .failure(_):
                completion([])
            }
        }
    }
}
