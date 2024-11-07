//
//  QuizCarouselViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 18/09/2024.
//

import SwiftUI
import Combine

class QuizCarouselViewModel: ObservableObject {
    
    @Published var router: RouterProtocol
    @Published var selectedCategory: String
    var quizzess: [String] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(
        router: RouterProtocol,
        selectedCategory: String
    ) {
        self.router = router
        self.selectedCategory = selectedCategory
        configureSubscriptions()
    }
    
    //this needs to be navigate to category view
    func didTapNavigateToCategories(selectedCategory: String) {
        let catergoryViewModel = CatergoriesViewModel(category: selectedCategory)
        router.push(to: .quizCatergories(viewModel: catergoryViewModel))
    }
    
}
private extension QuizCarouselViewModel {
    func configureSubscriptions() {
        guard let router = router as? Router else { return }
        router.$stack
            .sink { [weak self] (newStack: [Route]) in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}
