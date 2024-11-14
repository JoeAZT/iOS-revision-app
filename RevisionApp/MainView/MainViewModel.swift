//
//  MainViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 28/08/2024.
//

import SwiftUI
import Combine

// MARK: - MainViewModel
class MainViewModel: ObservableObject {
    @Published var router: RouterProtocol
    @Published var quizzes: [String]?
    @Published var categories: [String]?
    
    private let quizLoader: QuizLoader
    private let trophyColorProvider: TrophyColorProvider
    private var cancellables = Set<AnyCancellable>()
    
    init(router: RouterProtocol,
         quizLoader: QuizLoader,
         trophyColorProvider: TrophyColorProvider) {
        self.router = router
        self.quizLoader = quizLoader
        self.trophyColorProvider = trophyColorProvider
        
        configureSubscriptions()
        loadData()
    }
    
    func trophyColor(for percentage: Double) -> Color {
        return trophyColorProvider.trophyColor(for: percentage)
    }
    
    func didTapNavigateToQuiz(selectedQuiz: String) {
        let quizViewModel = QuizViewModel(router: router, selectedQuiz: selectedQuiz)
        router.push(to: .quizView(viewModel: quizViewModel))
    }
    
    private func loadData() {
        self.quizzes = quizLoader.loadQuizNames()
        self.categories = quizLoader.loadQuizCategories()
    }
}

// MARK: - Private Methods
private extension MainViewModel {
    func configureSubscriptions() {
        guard let router = router as? Router else { return }
        router.$stack
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}

