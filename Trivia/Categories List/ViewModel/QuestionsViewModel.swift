//  QuestionsViewModel.swift

import Foundation

class QuestionsViewModel{
    private let questionsService: QuestionsService
    var questions = [Question]()
    var questions_ : Question?
    var currentQuestionIndex = 0

        init(service: QuestionsService) {
            self.questionsService = service
        }
    func getQuestion(for categoryID: Int, completion: @escaping () -> Void) {
            questionsService.getQuestion(for: categoryID) { [weak self] receivedQuestion in
                guard let strongSelf = self else { return }
                strongSelf.questions_ = receivedQuestion
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
    
    func validateCurrentQuestion(answer: String) -> Bool {
        questions[currentQuestionIndex].correct_answer == answer
    }
}

