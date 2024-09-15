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
//    var bestScore: Int = 0
}