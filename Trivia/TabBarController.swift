//  TabBarController.swift

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstTabTitle = "Categories"
        let firstTabImage = UIImage(systemName: "list.dash")
        // let secondTabTitle = "Random"
        // let secondTabImage = UIImage(systemName: "shugle")
        
        let firstTabViewController = CategoriesViewController(nibName: "CategoriesViewController", bundle: nil)
        firstTabViewController.title = firstTabTitle
        
        let firstTabNavigationController = UINavigationController(rootViewController: firstTabViewController)
        
        firstTabNavigationController.tabBarItem = UITabBarItem(title: firstTabTitle, image: firstTabImage, selectedImage: nil)
        
    }
}
