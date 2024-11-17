//
//  QuizModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 12/08/2024.
//

import SwiftUI

struct OptionModel: Codable {
    let optionText: String
    let isAnswer: Bool
}

struct QuestionModel: Codable {
    let questionText: String
    let possibleAnswers: [OptionModel]
}

struct QuizModel: Codable {
    let name: String
    var questions: [QuestionModel]
    let category: Category?
}

enum Category: String, CaseIterable, Codable {
    case general, combine, architecture, swiftUI, uikit, accessibility, testing, debugging, coreData, networking, concurrency, security, designPatterns, appStore, other
}
