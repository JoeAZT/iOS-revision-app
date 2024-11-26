//
//  MainViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 28/08/2024.
//

import SwiftUI
import Combine

// MARK: - MainViewModel
class MainViewModel: MainViewModelProtocol {
    
    @Published var router: RouterProtocol
    @Published var quizzes: [String]?
    @Published var categories: [String]?
    
    private let quizLoader: QuizDataLoader
    internal var quizCellHelper: QuizCellHelperProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(
        router: RouterProtocol,
        quizLoader: QuizDataLoader,
        quizCellHelper: QuizCellHelperProtocol
    ) {
        self.router = router
        self.quizCellHelper = quizCellHelper
        self.quizLoader = quizLoader
        
        configureSubscriptions()
        loadData()
    }
    
    func trophyColor(for percentage: Int) -> CommodityColor {
        return quizCellHelper.trophyColorProvider.trophyColor(for: percentage)
    }
    
    func didTapNavigateToQuiz(selectedQuiz: String) {
        let quizViewModel = QuizViewModel(
            router: router,
            quizCellHelper: quizCellHelper,
            quizDataLoader: quizLoader,
            selectedQuiz: selectedQuiz
        )
        router.push(to: .quizView(viewModel: quizViewModel))
    }
    
    func getScorePercentage(quiz: String) -> Int {
        let bestScore = quizCellHelper.scoreManager.getScore(for: quiz)
        let totalQuestions = quizCellHelper.scoreManager.getTotalQuestions(for: quiz)
        return totalQuestions > 0 ? (bestScore * 100) / totalQuestions : 0
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

