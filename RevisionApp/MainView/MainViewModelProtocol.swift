//
//  MainViewModelProtocol.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

import SwiftUI

protocol MainViewModelProtocol {
    var router: RouterProtocol { get }
    var quizzes: [String]? { get }
    var categories: [String]? { get }
    
    func trophyColor(for percentage: Double) -> Color
    func didTapNavigateToQuiz(selectedQuiz: String)
    
    //Might be worth changing these out for a service layer
    func loadQuizNamesFromJSON()
    func loadQuizCategoriesFromJSON()
}
