//
//  RouterTests.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

import XCTest
@testable import RevisionApp

class RouterTests: XCTestCase {
    
    func testPushAndPopRoutes() {
        let router = Router()
        
        let quizViewModel = QuizViewModel(
            router: MockRouter(),
            scoreManager: ScoreManager(),
            quizDataLoader: MockQuizLoader(quiz: nil),
            selectedQuiz: ""
        )
        router.push(to: .quizView(viewModel: quizViewModel))
        XCTAssertEqual(router.stack, [.quizView(viewModel: quizViewModel)], "Expected stack to contain pushed route")
        router.pop()
        XCTAssertTrue(router.stack.isEmpty, "Expected stack to be empty after pop")
    }
    
    func testPopToRoot() {
        let router = Router()
        
        router.push(to: .quizView(
            viewModel: QuizViewModel(
                router: MockRouter(),
                scoreManager: ScoreManager(),
                quizDataLoader: MockQuizLoader(quiz: nil),
                selectedQuiz: ""
            )
        ))
        router.push(to: .categoryView(viewModel: CatergoriesViewModel(category: "Category mock", quizzes: ["quizzes mock"])))
        
        router.popToRootView()
        XCTAssertTrue(router.stack.isEmpty, "Expected stack to be empty after popToRootView")
    }
}
