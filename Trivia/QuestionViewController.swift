//  QuestionViewController.swift

import UIKit

class QuestionViewController: UIViewController {
    private var viewModel: QuestionsViewModel!
    
    @IBOutlet weak var questionLabel: UILabel!

     override func viewDidLoad() {
            viewModel = QuestionsViewModel(questionsService: QuestionsService())
     }
    
}
