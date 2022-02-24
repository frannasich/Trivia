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
    func getCategories(completion: @escaping () -> Void ){
        categoriesService.getCategories{categories in
            self.categories = categories
            self.delegate.reloadTable()
        } onError: {
            self.delegate.showError()
        }
    }
    
    func getCategory(at index: Int) -> Category{
        categories[index]
    }
    func getCategoriesCount() -> Int{
        categories.count
    }
}


