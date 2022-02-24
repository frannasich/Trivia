//  QuestionsViewModel.swift

import Foundation

class QuestionsViewModel{
    private let questionsService: QuestionsService
    var questions = [Question]()
    var currentQuestionIndex = 0

        init(service: QuestionsService) {
            self.questionsService = service
        }
    func getQuestions(for categoryID: Int?, completion: @escaping () -> Void) {
        questionsService.getQuestions(for: categoryID) {
            [weak self] questions in guard let strongSelf = self else {return}
            
            strongSelf.questions = questions
            completion()
         }
     }
    
    func areQuestionsAvailable() -> Bool {
        !questions.isEmpty
    }
    
    func questionsCount() -> Int {
        questions.count
    }
    
    func getQuestion(at index: Int) -> Question {
        questions[index]
    }
    
    func getNextQuestion() -> String {
        updateIndex()
        
        return getCurrentQuestion()
    }
    
    func getCurrentQuestion() -> String {
        if needsToResetIndex() { resetIndex() }
        
        return questions[currentQuestionIndex].question
    }
    
    private func updateIndex() {
        currentQuestionIndex += 1
    }
    
    private func resetIndex() {
        currentQuestionIndex = 0
    }
    
    private func needsToResetIndex() -> Bool {
        currentQuestionIndex >= questions.count
    }
    
    func validateCurrentQuestion(answer: Bool) -> Bool {
        questions[currentQuestionIndex].answer == answer
    }
}

