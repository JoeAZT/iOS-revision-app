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
    private let trophyColorProvider: TrophyColorProvider
    private let scoreManager: ScoreManager
    private var cancellables = Set<AnyCancellable>()
    
    init(
        router: RouterProtocol,
        quizLoader: QuizDataLoader,
        trophyColorProvider: TrophyColorProvider,
        scoreManger: ScoreManager
    ) {
        self.router = router
        self.quizLoader = quizLoader
        self.trophyColorProvider = trophyColorProvider
        self.scoreManager = scoreManger
        
        configureSubscriptions()
        loadData()
    }
    
    func trophyColor(for percentage: Int) -> CommodityColor {
        return trophyColorProvider.trophyColor(for: percentage)
    }
    
    func didTapNavigateToQuiz(selectedQuiz: String) {
        let quizViewModel = QuizViewModel(
            router: router,
            scoreManager: scoreManager,
            quizDataLoader: quizLoader,
            selectedQuiz: selectedQuiz
        )
        router.push(to: .quizView(viewModel: quizViewModel))
    }
    
    func getScorePercentage(quiz: String) -> Int {
        let bestScore = scoreManager.getScore(for: quiz)
        let totalQuestions = scoreManager.getTotalQuestions(for: quiz)
        print(quiz)
        print(totalQuestions > 0 ? (bestScore * 100) / totalQuestions : 0)
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

