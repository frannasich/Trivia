//  InitialViewController.swift

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func startTrivia(_ sender: Any) {
        if let userName = textField.text, !userName.isEmpty {
            presentTabBarController()
        } else {
                presentNoUserNameAlert()
        }    }
    
    @IBAction func aboutTrivia(_ sender: Any) {
        let about = AboutViewController(nibName: "AboutViewController", bundle: nil)
        about.modalPresentationStyle = .overFullScreen
        self.present(about, animated: true)
    }
    
    private func presentNoUserNameAlert(){
        let alert = UIAlertController(title: "Alerta!", message: "Por favor ingrese un nombre de usuario primero", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func presentTabBarController() {
         let tabBarController = TabBarController()
         tabBarController.modalPresentationStyle = .overFullScreen
         self.present(tabBarController, animated: true)
     }
}
