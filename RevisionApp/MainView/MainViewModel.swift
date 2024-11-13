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
    @Published var quizzes: [String] = []
    @Published var categories: [String] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(
        router: RouterProtocol
    ) {
        self.router = router
        configureSubscriptions()
        loadQuizNamesFromJSON()
        loadQuizCategoriesFromJSON()
    }
    
    func trophyColor(for percentage: Double) -> Color {
        switch percentage {
        case 100:
            return Color("gold")
        case 90..<100:
            return Color("silver")
        case 70..<90:
            return Color("bronze")
        default:
            return .gray.opacity(0.75)
        }
    }
    
    func didTapNavigateToQuiz(selectedQuiz: String) {
        let quizViewModel = QuizViewModel(router: router, selectedQuiz: selectedQuiz)
        router.push(to: .quizView(viewModel: quizViewModel))
    }
    
    func loadQuizNamesFromJSON() {
        guard let url = Bundle.main.url(forResource: "Quizzes", withExtension: "json") else {
            print("Could not find Quizzes.json")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([String].self, from: data)
            quizzes = decodedData
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }
    
    func loadQuizCategoriesFromJSON() {
        guard let url = Bundle.main.url(forResource: "Categories", withExtension: "json") else {
            print("Could not find Quizzes.json")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode([String].self, from: data)
            categories = decodedData
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
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

