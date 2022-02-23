//  CategoriesViewController.swift

import UIKit

class CategoriesViewController: UIViewController {
    private var viewModel: CategoriesViewModel!

    @IBOutlet weak var tableView: UITableView!
    
    private var categories = [Category]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CategoriesViewModel(service: CategoriesService())
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        getCategories()
      }

    func getCategories(){
        viewModel?.getCategories{
            self.tableView.reloadData()
        }

    }
}
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {

        func tableView(_ tableview:UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            showQuestions(for: viewModel.getCategory(at: indexPath.row))
            }
        func tableView(_ tableView:UITableView , numberOfRowsInSection section: Int) -> Int{
            viewModel.getCategoriesCount()
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = viewModel.categories[indexPath.row].name
            return cell
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath:
            IndexPath) -> UITableViewCell{
                let cell = self.tableView.dequeueReusableCell(withIdentifier:
            "cell", for: indexPath)
            cell.textLabel?.text =
                viewModel?.categories(indexPath.row].name
            return cell
        }
        
    }
        private func showQuestions(for category: Category){
                                      
                let questionViewController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
                questionViewController.title = categories.name
                questionViewController.categoryID = category.id
                                      
                navigationController?.pushViewController(questionViewController, animated: true)
        }

    
}
