//
//  MockQuizLoader.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

@testable import RevisionApp
import Combine

class MockQuizLoader: QuizDataLoader {
    
    private let mockQuizNames: [String]
    private let mockQuizCategories: [String]
    private let mockQuiz: RevisionApp.QuizModel?
    
    // Initializer to allow custom mock data injection
    init(
        quizNames: [String] = [],
        quizCategories: [String] = [],
        quiz: RevisionApp.QuizModel?
    ) {
        self.mockQuizNames = quizNames
        self.mockQuizCategories = quizCategories
        self.mockQuiz = quiz
    }
    
    // MARK: - QuizLoader Protocol Methods
    
    func loadQuizNames() -> [String]? {
        return mockQuizNames
    }
    
    func loadQuizCategories() -> [String]? {
        return mockQuizCategories
    }
    
    func loadQuiz(named: String) -> RevisionApp.QuizModel? {
        return mockQuiz
    }
}
