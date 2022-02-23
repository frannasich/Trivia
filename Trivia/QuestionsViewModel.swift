//  QuestionsViewModel.swift

import Foundation

class QuestionsViewModel{
    private let questionsService: QuestionsService
    var questions = [Question]()
    var currentQuestionIndex = 0

        init(questionsService: QuestionsService) {
            self.questionsService = questionsService
        }
    func getQuestions(for categoryID: Int?,
    completion: @escaping () -> Void) {
         questionsService.getQuestions(for: categoryID) {questions in
                    self?.questions = questions
                    completion()
         }
     }
}

