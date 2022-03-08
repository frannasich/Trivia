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
        let about = AboutViewController()
        self.navigationController?.pushViewController(about, animated: true)
    }
    
    private func presentNoUserNameAlert(){
        let alert = UIAlertController(title: "Alert!", message: "Please enter a username first", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func presentTabBarController() {
         let tabBarController = TabBarController()
        self.navigationController?.pushViewController(tabBarController, animated: true)
     }
}
