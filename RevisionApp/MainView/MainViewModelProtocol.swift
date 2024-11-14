//
//  MainViewModelProtocol.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

import SwiftUI
import Combine

protocol MainViewModelProtocol: ObservableObject {
    var router: RouterProtocol { get }
    var quizzes: [String]? { get }
    var categories: [String]? { get }
    
    func trophyColor(for percentage: Double) -> Color
    func didTapNavigateToQuiz(selectedQuiz: String)
}
