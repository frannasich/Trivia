//  QuestionService.swift

import Foundation
import Alamofire

class QuestionsService {

    func getQuestion(for category: Int, onComplete: @escaping (Question) -> Void) {
        var questionURL: String
        if category == 0 {
            questionURL = Constants().questionsURL
        } else {
            let stringCategory = String(category)
            questionURL = "https://opentdb.com/api.php?amount=1&category=" + stringCategory + "&type=boolean"
        }
        AlamofireAPIClient.shared.get(url: questionURL) { response in
            switch response {
            case .success(let data):
                do {
                    if let data = data {
                        let decoder = JSONDecoder()
                        let question = try decoder.decode(Questions.self, from: data)
                        print(question.results)
                        onComplete(question.results[0])
                    }
                } catch {
                    print(error)
                    onComplete(Question(category: "catch error", type: "catch error", difficulty: "catch error", question: "catch error", correct_answer: "catch error", incorrect_answers: [String]()))
                }
            case .failure(let error):
                print(error)
                onComplete(Question(category: "failure", type: "failure", difficulty: "failure", question: "failure", correct_answer: "failure", incorrect_answers: [String]()))
            }
        }
    }
}
