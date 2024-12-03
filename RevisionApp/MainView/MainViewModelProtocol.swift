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
    var quizCellViewModel: QuizCellViewModelProtocol { get }
}
