//  CategoriesViewModel.swift

import Foundation

class CategoriesViewModel{
    private var categoriesService: CategoriesService
    private var delegate: CategoriesDelegate
    private var categories = [Category]()
    
    init(service: CategoriesService, delegate: CategoriesDelegate){
        self.categoriesService = service
        self.delegate = delegate
    }
    
    func getCategories(){
        categoriesService.getCategories{categories in
            self.delegate.toogleLoad()
            self.categories = categories
            self.delegate.reloadTable()
        } onError: {
            self.delegate.showError()
        }
    }
    
    func getCategory(at index: Int) -> Category {
        categories[index]
    }
    func getCategoriesCount() -> Int {
        categories.count
    }
}


