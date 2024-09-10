//
//  Routers.swift
//  RevisionApp
//
//  Created by Joe Taylor on 28/08/2024.
//

import SwiftUI

class Router: RouterProtocol, ObservableObject {
    @Published var stack: [Route] = []
    
    func push(to view: Route) {
        stack.append(view)
    }
    
    func pop() {
        stack.removeLast()
    }
    
    func popToRootView() {
        stack.removeAll()
    }
}

extension Route {
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.quizView, .quizView):
            return true
        case (.finishedQuizView, .finishedQuizView):
            return true
        case (.finishedQuizView, .quizView), (.quizView, .finishedQuizView):
            return true
        }
    }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.hashValue)
    }
}

extension Route: View {
    var body: some View {
        switch self {
        case .quizView(let viewModel):
            QuizView(viewModel: viewModel)
        case .finishedQuizView(let viewModel):
            FinishedQuizView(viewModel: viewModel)
        }
    }
}
