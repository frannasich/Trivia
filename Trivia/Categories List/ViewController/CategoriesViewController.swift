//  CategoriesViewController.swift

import UIKit

protocol CategoriesDelegate {
    func toogleLoading()
    func reloadTable()
    func showError()
}

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var service = CategoriesService()
    private var viewModel : CategoriesViewModel?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CategoriesViewModel(service: self.service, delegate: CategoriesDelegate.self as! CategoriesDelegate)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        reloadTable()
      }
    
    func showQuestions(for category: Category){
        
            let questionViewController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
            questionViewController.title = category.name
            questionViewController.categoryID = category.id
                                  
        navigationController?.pushViewController(questionViewController, animated: true)
    }

}

extension CategoriesViewController: CategoriesDelegate{
    func toogleLoading() {
        <#code#>
    }
    
    func reloadTable(){
            viewModel?.getCategories{
                self.tableView.reloadData()
            }
        }
    
    func showError() {
        <#code#>
    }
}

extension CategoriesViewController: UITableViewDelegate {

        func tableView(_ tableview:UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            if let category = viewModel?.getCategory(at: indexPath.row) {
                showQuestions(for: category)
            }
        }
}

extension CategoriesViewController: UITableViewDataSource {
    
        func tableView(_ tableView:UITableView , numberOfRowsInSection section: Int) -> Int{
            return self.viewModel?.getCategoriesCount() ?? 1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = viewModel?.getCategory(at: indexPath.row).name
            
            return cell
        }
    }
