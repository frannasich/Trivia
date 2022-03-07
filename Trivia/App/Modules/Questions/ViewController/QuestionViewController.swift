//  QuestionViewController.swift

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    private var viewModel: QuestionsViewModel!
    private var currentQuestion: Question?
    
    var categoryID : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = QuestionsViewModel(service: QuestionsService())
        getQuestion()
    }
    
    private func getQuestion() {
        viewModel.getQuestion(for: categoryID) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.setCurrentQuestion()
        }
    }

    @IBAction func yesButtonTapped(_ sender: UIButton) {
        let result = validateCurrentQuestion(answer: "True")
        sendResultAlert(for: result)
    }
    
    @IBAction func noButtonTapped(_ sender: UIButton) {
        let result = validateCurrentQuestion(answer: "False")
        sendResultAlert(for: result)
    }
     
    private func setCurrentQuestion() {
        questionLabel.text = viewModel.getCurrentQuestion()
    }
    
    private func validateCurrentQuestion(answer: String) -> Bool {
        viewModel.validateCurrentQuestion(answer: answer)
    }
        
    private func sendResultAlert(for result: Bool) {
        result ? rightAnswerTapped() : wrongAnswerTapped()
    }
   
    private func rightAnswerTapped() {
       let alertYes = UIAlertController(title: "Excellent!", message: "Good Job!😁", preferredStyle: .alert)
        alertYes.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] _ in
            getQuestion()
        }))
        self.present(alertYes, animated: true, completion: nil)
    }
    
    private func wrongAnswerTapped() {
        let alertNO = UIAlertController(title: "Wrong!", message: "Better luck next time 😔", preferredStyle: .alert)
        alertNO.addAction(UIAlertAction(title: "Ups! 😅", style: .cancel, handler: { [self] _ in
            getQuestion()
        }))
        self.present(alertNO, animated: true)
    }
        
}

