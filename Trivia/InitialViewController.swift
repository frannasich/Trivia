//  InitialViewController.swift

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startTrivia(_ sender: Any) {
        if textField.hasText{
            let vc = QuestionViewController (nibName: "QuestionViewController", bundle: nil)
            self.present(vc, animated: true)
        } else {
                presentNoUserNameAlert()
        }
    }
    
    @IBAction func aboutTrivia(_ sender: Any) {
        let about = AboutViewController(nibName: "AboutViewController", bundle: nil)
        self.present(about, animated: true)
    }
    
    private func presentNoUserNameAlert(){
        let alert = UIAlertController(title: "Alerta!", message: "Por favor ingrese un nombre de usuario primero", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
