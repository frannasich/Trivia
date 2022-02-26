//  AboutViewController.swift

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButton(_ sender: Any) {
        let initialView = InitialViewController(nibName: "InitialViewController", bundle: nil)
        initialView.modalPresentationStyle = .overFullScreen
        initialView.modalTransitionStyle = .crossDissolve
        self.present(initialView, animated: true)
    }
}
