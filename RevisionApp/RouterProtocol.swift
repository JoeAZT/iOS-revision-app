//
//  RouterProtocol.swift
//  RevisionApp
//
//  Created by Joe Taylor on 28/08/2024.
//

import Combine
import SwiftUI

protocol RouterProtocol {
    var stack: [Route] { get set }
    func push(to view: Route)
    func pop()
    func popToRootView()
}

enum Route: Hashable {
    case quizView(viewModel: QuizViewModel)
    case finishedQuizView(viewModel: QuizViewModel)
    case quizCatergories(viewModel: CatergoriesViewModel)
}
