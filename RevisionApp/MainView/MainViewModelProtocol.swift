//
//  MainViewModelProtocol.swift
//  RevisionApp
//
//  Created by Joe Taylor on 17/11/2024.
//

import SwiftUI

protocol MainViewModelProtocol: ObservableObject {
    var quizzes: [String]? { get }
    var categories: [String]? { get }
    func trophyColor(for percentage: Double) -> Color
    func didTapNavigateToQuiz(selectedQuiz: String)
}
