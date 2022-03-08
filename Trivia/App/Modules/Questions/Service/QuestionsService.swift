//  QuestionService.swift

import Foundation

class QuestionsService {
    
    
    func getQuestions(onComplete: @escaping ([Question]) -> Void, onError: @escaping () -> Void) {
        
        AlamofireAPIClient.shared.get(url: Constants().questionsURL) { response in
            
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let questionResponse = try decoder.decode(Questions.self, from: data)
                        onComplete(questionResponse.results)
                        print(questionResponse)
                    } else {
                        onError()
                    }
                } catch {
                    onError()
                }
            case .failure(_):
                onError()
            }
        }
        
    }
}

