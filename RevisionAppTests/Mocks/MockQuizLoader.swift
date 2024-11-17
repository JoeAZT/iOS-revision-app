//
//  MockQuizLoader.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

@testable import RevisionApp
import Combine

class MockQuizLoader: QuizDataLoader {
    
    // MARK: - QuizLoader Protocol Methods
    
    func loadQuizNames() -> [String]? {
        return ["mock quiz 1", "mock quiz 2", "mock quiz 3", "mock quiz 4"]
    }
    
    func loadQuizCategories() -> [String]? {
        return ["mock category 1", "mock category 2", "mock category 3", "mock category 4"]
    }
    
    func loadQuiz(named: String) -> RevisionApp.QuizModel? {
        return QuizModel(
            name: "Mock Quiz Name",
            questions: [
                QuestionModel(
                    questionText: "mock question text",
                    possibleAnswers: [
                        OptionModel(optionText: "mock option text 1", isAnswer: false),
                        OptionModel(optionText: "mock option text 2", isAnswer: false),
                        OptionModel(optionText: "mock option text 3", isAnswer: false),
                        OptionModel(optionText: "mock option text 4", isAnswer: true)
                    ])
            ],
            category: .architecture
        )
    }
}
