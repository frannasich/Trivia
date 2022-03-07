//  CategoriesViewController.swift

import UIKit

protocol CategoriesDelegate {
    func toogleLoad()
    func reloadTable()
    func showError()
}

class CategoriesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var service = CategoriesService()
    private var viewModel: CategoriesViewModel!


    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = CategoriesViewModel(service: service, delegate: self)
        self.viewModel?.getCategories()
        setupView()
      }
    
    private func setupView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "CategoriesListTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

    }
}

extension CategoriesViewController: CategoriesDelegate{
    func toogleLoad() {
        print("Cargando")
    }
    
    func reloadTable(){
        self.tableView.reloadData()
        }
    
    func showError() {
        print("Ha ocurrido un error")
    }

}

extension CategoriesViewController: UITableViewDelegate {

        func tableView(_ tableview:UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
                showQuestions(for: viewModel.getCategory(at: indexPath.row))
            }
    
    private func showQuestions(for category: Category){
            let questionViewController = QuestionViewController(nibName: "QuestionViewController", bundle: nil)
            questionViewController.title = category.name
            questionViewController.categoryID = category.id
                                  
        navigationController?.pushViewController(questionViewController, animated: true)

}
        }

extension CategoriesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.getCategoriesCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CategoriesListTableViewCell
        cell.categoriesNameLabel.text = self.viewModel?.getCategory(at: indexPath.row).name
        
        return cell
    }
    
}
