//  QuestionViewController.swift

import UIKit

class QuestionsViewController: UIViewController {
    
    private var viewModel: QuestionsViewModel!
       
     override func viewDidLoad() {
            viewModel = QuestionsViewModel(questionsService: QuestionsService())
     }

    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            viewModel.getQuestions(for: categoryID) { [weak self] in
                guard let strongSelf = self else { return }
                strongSelf.setCurrentQuestion()
            }
    }
}
