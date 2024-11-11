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
    //need to fix the routes below because we need to be able to go to the new view
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
        case (.quizView, .quizView):
            return true
        case (.finishedQuizView, .finishedQuizView):
            return true
        case (.categoryView, .categoryView):
            return true
        default:
            print("default hit")
            return false
//        case (.finishedQuizView, .quizView), (.quizView, .finishedQuizView):
//            return true
        }
    }
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(self.hashValue)
    }
}


//extension Route: Hashable {
//    static func == (lhs: Route, rhs: Route) -> Bool {
//        switch (lhs, rhs) {
//        case (.quizView, .quizView):
//            return lhs == rhs
//        case (.finishedQuizView, .finishedQuizView):
//            return true
//        case (.quizCatergories, .quizCatergories):
//            return true
//        default:
//            return false
//        }
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(self.hashValue)
//    }
//}

extension Route: View {
    var body: some View {
        switch self {
        case .quizView(let viewModel):
            QuizView(viewModel: viewModel)
        case .finishedQuizView(let viewModel):
            FinishedQuizView(viewModel: viewModel)
        case .categoryView(let viewModel):
            CategoryView(selectedCategory: "", viewModel: viewModel)
        }
    }
}
