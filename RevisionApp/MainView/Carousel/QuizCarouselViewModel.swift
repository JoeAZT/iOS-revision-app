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
    @Published var selectedCategory: String?

    let categories: [String]?
    private let quizLoader: QuizDataLoader
    private let quizCellHelper: QuizCellHelperProtocol
    private var cancellables = Set<AnyCancellable>()

    init(
        router: RouterProtocol,
        selectedCategory: String?,
        categories: [String]?,
        quizLoader: QuizDataLoader,
        quizCellHelper: QuizCellHelperProtocol
    ) {
        self.router = router
        self.selectedCategory = selectedCategory
        self.categories = categories
        self.quizLoader = quizLoader
        self.quizCellHelper = quizCellHelper
        configureSubscriptions()
    }

    var hasCategories: Bool {
        categories != nil && !categories!.isEmpty
    }

    var categoryData: [(Int, String)] {
        guard let categories = categories else { return [] }
        return Array(zip(categories.indices, categories))
    }

    var noDataMessage: String {
        "No Quiz Data Found"
    }

    func didTapNavigateToCategoryView(selectedCategory: String) {
        let quizzes = quizLoader.loadCategories(for: selectedCategory + " Categories") ?? ["No quiz data available"]
        let categoryViewModel = CatergoriesViewModel(
            quizzes: quizzes,
            category: selectedCategory,
            router: router,
            quizCellHelper: quizCellHelper,
            quizLoader: quizLoader
        )
        router.push(to: .categoryView(viewModel: categoryViewModel))
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
