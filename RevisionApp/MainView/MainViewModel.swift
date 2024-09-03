//
//  MainViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 28/08/2024.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject {
    
    @Published var router: RouterProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(
        router: RouterProtocol
    ) {
        self.router = router
        configureSubscriptions()
    }
    
    func didTapNavigateToQuiz() {
        router.push(to: .quizView(viewModel: quizViewModel))
    }
    
    var quizViewModel: QuizViewModel {
        .init(score: 0, currentQuestion: 0, router: router, showingCorrectAnswerSheet: false)
    }
}

private extension MainViewModel {
    func configureSubscriptions() {
        guard let router = router as? Router else { return }
        router.$stack
            .sink { [weak self] (newStack: [Route]) in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}
