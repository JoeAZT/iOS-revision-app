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
    
    internal let quizCellViewModel: QuizCellViewModelProtocol
    private let quizLoader: QuizDataLoader
    private var cancellables = Set<AnyCancellable>()
    
    init(
        quizzes: [String],
        category: String,
        router: RouterProtocol,
        quizCellViewModel: QuizCellViewModelProtocol,
        quizLoader: QuizDataLoader
    ) {
        self.quizzes = quizzes
        self.category = category
        self.router = router
        self.quizCellViewModel = quizCellViewModel
        self.quizLoader = quizLoader
    }
    
    func didTapNavigateToQuiz(selectedQuiz: String) {
        let quizViewModel = QuizViewModel(
            router: router,
            quizCellViewModel: quizCellViewModel,
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
