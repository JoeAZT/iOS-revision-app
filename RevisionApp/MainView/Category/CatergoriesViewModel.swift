//
//  CatergoriesViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/11/2024.
//

import SwiftUI
import Combine

class CatergoriesViewModel: ObservableObject {
    
    @Published var router: RouterProtocol
    var quizzes: [String]
    var category: String
    
    private let quizLoader: QuizDataLoader
    private let trophyColorProvider: TrophyColorProvider
    private let scoreManger: ScoreManager
    private var cancellables = Set<AnyCancellable>()
    
    init(
        quizzes: [String],
        category: String,
        router: RouterProtocol,
        quizLoader: QuizDataLoader,
        trophyColorProvider: TrophyColorProvider,
        scoreManger: ScoreManager
    ) {
        self.quizzes = quizzes
        self.category = category
        self.router = router
        self.quizLoader = quizLoader
        self.trophyColorProvider = trophyColorProvider
        self.scoreManger = scoreManger
    }
    
    func trophyColor(for percentage: Int) -> CommodityColor {
        return trophyColorProvider.trophyColor(for: percentage)
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
    
    private func loadData() {
//        self.quizzes = quizLoader.loadQuizNames()
//        self.category = quizLoader.loadQuizCategories()
//        self.quizzes = quizLoader.loadQuiz(named: category)?.questions
//        self.quizzes = quizLoader.loadQuizNames()
//        func loadQuizNames() -> [String]?
//        func loadQuizCategories() -> [String]?
    }
}
