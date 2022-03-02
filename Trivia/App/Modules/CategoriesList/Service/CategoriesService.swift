//  CategoriesService.swift

import Foundation
 
class CategoriesService {
    
    func getCategories(onComplete: @escaping ([Category]) -> Void, onError: @escaping () -> Void ) {
        AlamofireAPIClient.shared.get(url: Constants().categoriesURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let categoriesResponse = try decoder.decode(Categories.self, from: data)
                    print(categoriesResponse.triviaCategories)
                    onComplete(categoriesResponse.triviaCategories)
                    } else {
                        onError()
                    }
                } catch {
                    onError()
                    print(error)
                }
            case .failure(_):
                onError()
            }
        }
    }
}
