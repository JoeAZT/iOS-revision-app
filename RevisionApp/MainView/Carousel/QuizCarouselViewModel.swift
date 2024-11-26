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

    var categories: [String]?
    private let quizLoader: QuizDataLoader
    private let quizCellHelper: QuizCellHelperProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(
        router: RouterProtocol,
        selectedCategory: String?,
        categories: [String]?,
        quizLoader: JSONQuizLoader,
        quizCellHelper: QuizCellHelperProtocol
    ) {
        self.router = router
        self.selectedCategory = selectedCategory
        self.categories = categories
        self.quizLoader = quizLoader
        self.quizCellHelper = quizCellHelper
        configureSubscriptions()
    }
    
    func didTapNavigateToCategoryView(selectedCategory: String) {
        let catergoryViewModel = CatergoriesViewModel(
            quizzes: loadCategoryFromJSON(selectedCategory: selectedCategory + " Categories") ?? ["No quiz data available"],
            category: selectedCategory,
            router: router,
            quizCellHelper: quizCellHelper,
            quizLoader: quizLoader
        )
        router.push(to: .categoryView(viewModel: catergoryViewModel))
    }
}

private extension QuizCarouselViewModel {
    func loadCategoryFromJSON(selectedCategory: String) -> [String]? {
        guard let url = Bundle.main.url(forResource: selectedCategory, withExtension: "json") else {
            print("Could not find \(selectedCategory).json")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(CategoryGroupModel.self, from: data)
            return decodedData.quizzes
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
            return nil
        }
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
