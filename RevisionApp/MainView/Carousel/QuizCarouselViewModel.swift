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
    var categories: [String]
    private var cancellables = Set<AnyCancellable>()
    
    init(
        router: RouterProtocol,
        selectedCategory: String,
        categories: [String]
    ) {
        self.router = router
        self.selectedCategory = selectedCategory
        self.categories = categories
        configureSubscriptions()
    }
    
    func didTapNavigateToCategoryView(selectedCategory: String) {
        let catergoryViewModel = CatergoriesViewModel(
            category: selectedCategory
        )
        router.push(to: .categoryView(viewModel: catergoryViewModel))
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
