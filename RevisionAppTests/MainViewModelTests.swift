
//  Tests.swift
//  RevisionApp
//
//  Created by Joe Taylor on 25/09/2024.


import XCTest
import Combine
@testable import RevisionApp
import SwiftUI

class MainViewModelTests: XCTestCase {

    func testDidTapNavigateToQuiz() {
        
        let mockRouter = MockRouter()
        let quizLoader = MockQuizLoader()
        let trophyColorProvider = DefaultTrophyColorProvider()
        let scoreManager = MockScoreManager()
        
        let viewModel = MainViewModel(
            router: mockRouter,
            quizLoader: quizLoader,
            trophyColorProvider: trophyColorProvider,
            scoreManger: scoreManager
        )
        
        XCTAssertTrue(mockRouter.didPushRoute, "Expected MainViewModel to call push(to:) on router")
//        XCTAssertEqual(mockRouter.lastPushedRoute, .quizView(viewModel: <#T##QuizViewModel#>)
//        XCTAssertEqual(mockRouter.lastPushedRoute, .quizView(viewModel: viewModel))
    }
    
    func testLoadQuizzes() {
        let mockRouter = MockRouter()
        let quizLoader = MockQuizLoader()
        let trophyColorProvider = DefaultTrophyColorProvider()
        
        let viewModel = MainViewModel(
            router: mockRouter,
            quizLoader: quizLoader,
            trophyColorProvider: trophyColorProvider,
            scoreManger: MockScoreManager()
        )
        
        XCTAssertEqual(viewModel.quizzes, ["Quiz1", "Quiz2"], "Expected quizzes to match test data from MockQuizLoader")
        XCTAssertEqual(viewModel.categories, ["Category1", "Category2"], "Expected categories to match test data from MockQuizLoader")
    }
}
