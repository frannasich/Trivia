//  QuestionViewController.swift

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    private var viewModel: QuestionsViewModel!
    var categoryID = 0

     override func viewDidLoad() {
         viewModel = QuestionsViewModel(service: QuestionsService())
         getQuestions()
     }
    
    private func getQuestions(){
        viewModel.getQuestion(for: categoryID){ [weak self] in
            guard let strongSelf = self else {return}
            
            if strongSelf.viewModel.areQuestionsAvailable() {
                strongSelf.setCurrentQuestion()
            }
        }
    }
    
    @IBAction func wrongAnswer(_ sender: UIButton){
        if let result = validateCurrentQuestion(answer: "False"){
            sendResultMessage(for: result)
        }
    }
    
    @IBAction func rightAnswer(_ sender: UIButton){
        if let result = validateCurrentQuestion(answer: "true"){
        sendResultMessage(for: result)
        }
    }
    
    private func updateQuestion(){
        setQuestion(question: viewModel.getNextQuestion())
    }
    
    private func setCurrentQuestion(){
        setQuestion(question: viewModel.getNextQuestion())
    }
    
    private func setQuestion(question: String){
        questionLabel.text = question
    }
    
    private func validateCurrentQuestion(answer: String) -> Bool? {
        viewModel.validateCurrentQuestion(answer: answer)
    }
    
    private func sendResultMessage(for result: Bool){
        let message = result ? "Respuesta Correcta" : "Respuesta Incorrecta"
        
        let alert = UIAlertController(title: "Respuesta", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in self.updateQuestion()
        }))
        
        self.present(alert, animated: true)
    }
}
