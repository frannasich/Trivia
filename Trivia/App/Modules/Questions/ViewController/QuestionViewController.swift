//  QuestionViewController.swift

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    private var viewModel: QuestionsViewModel!
    private var currentQuestion: Question?
    
    var categoryID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = QuestionsViewModel(service: QuestionsService())
        getQuestion()
    }
    
    private func getQuestion() {
        viewModel.getQuestions(for: categoryID) { [weak self] in
            guard let strongSelf = self else { return }
            strongSelf.setCurrentQuestion()
        }
    }

    @IBAction func yesButtonTapped(_ sender: UIButton) {
        let result = validateCurrentQuestion(answer: true)
        sendResultAlert(for: result)
    }
    
    @IBAction func noButtonTapped(_ sender: UIButton) {
        let result = validateCurrentQuestion(answer: false)
        sendResultAlert(for: result)
    }
     
    private func setCurrentQuestion() {
        questionLabel.text = viewModel.getCurrentQuestion()
    }
    
    private func validateCurrentQuestion(answer: Bool) -> Bool {
        viewModel.validateCurrentQuestion(answer: answer)
    }
        
    private func sendResultAlert(for result: Bool) {
        result ? rightAnswerTapped() : wrongAnswerTapped()
    }
   
    private func rightAnswerTapped() {
       let alertYes = UIAlertController(title: "Great!", message: "Good Job!😁", preferredStyle: .alert)
        alertYes.addAction(UIAlertAction(title: "OK", style: .default, handler: { [self] _ in
            getQuestion()
        }))
        self.present(alertYes, animated: true, completion: nil)
    }
    
    private func wrongAnswerTapped() {
        let alertNO = UIAlertController(title: "Very close!", message: "Good luck next time!😔", preferredStyle: .alert)
        alertNO.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { [self] _ in
            getQuestion()
        }))
        self.present(alertNO, animated: true)
    }
        
}

