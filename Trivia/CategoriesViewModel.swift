//  CategoriesViewModel.swift

import Foundation

class CategoriesViewModel{
    private let categoriesService: CategoriesService
    private var categories = [Category]()
    
    init(service: CategoriesService){
        self.categoriesService = service
    }
    func getCategories(completion: @escaping () -> Void ){
        categoriesService.getCategories{categories in self.categories = categories}
    }
    
    func getCategory(at index: Int) -> Category{
        categories[index]
    }
    func getCategoriesCount() -> Int{
        categories.count
    }
}


