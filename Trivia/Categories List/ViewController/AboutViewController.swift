//  AboutViewController.swift

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButton(_ sender: Any) {
        let initialView = InitialViewController(nibName: "InitialViewController", bundle: nil)
        self.present(initialView, animated: true)
    }
}
