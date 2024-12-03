
//  Tests.swift
//  RevisionApp
//
//  Created by Joe Taylor on 25/09/2024.

import XCTest
import Combine
@testable import RevisionApp
import SwiftUI

class MainViewModelTests: XCTestCase {

    private var mockRouter: MockRouter!
    private var mockQuizLoader: MockQuizLoader!
    private var mockTrophyColorProvider: DefaultTrophyColorProvider!
    private var mockScoreManager: MockScoreManager!

    override func setUp() {
        super.setUp()
        mockRouter = MockRouter()
        mockQuizLoader = MockQuizLoader() // Uses the provided mock implementation
        mockTrophyColorProvider = DefaultTrophyColorProvider()
        mockScoreManager = MockScoreManager()
    }

    override func tearDown() {
        mockRouter = nil
        mockQuizLoader = nil
        mockTrophyColorProvider = nil
        mockScoreManager = nil
        super.tearDown()
    }

    func makeSUT() -> MainViewModel {
        MainViewModel(
            router: mockRouter,
            quizLoader: mockQuizLoader,
            quizCellHelper: QuizCellViewModel(
                trophyColorProvider: mockTrophyColorProvider,
                scoreManger: mockScoreManager
            )
        )
    }

    func testDidTapNavigateToQuiz() {
        // Arrange
        let viewModel = makeSUT()
        let selectedQuiz = "mock quiz 1" // Match with the mock data

        // Act
        viewModel.didTapNavigateToQuiz(selectedQuiz: selectedQuiz)

        // Assert
        XCTAssertTrue(mockRouter.didPushRoute, "Expected MainViewModel to call push(to:) on router")
        XCTAssertNotNil(mockRouter.lastPushedRoute, "Expected a route to be pushed")
        if case let .quizView(viewModel: quizViewModel) = mockRouter.lastPushedRoute {
            XCTAssertEqual(quizViewModel.selectedQuiz, selectedQuiz, "Expected pushed QuizViewModel to have the correct selected quiz")
        } else {
            XCTFail("Expected last route to be of type .quizView")
        }
    }

    func testLoadQuizzes() {
        // Arrange
        let viewModel = makeSUT()

        // Assert
        XCTAssertEqual(viewModel.quizzes, ["mock quiz 1", "mock quiz 2", "mock quiz 3", "mock quiz 4"], "Expected quizzes to match hardcoded mock data from MockQuizLoader")
        XCTAssertEqual(viewModel.categories, ["mock category 1", "mock category 2", "mock category 3", "mock category 4"], "Expected categories to match hardcoded mock data from MockQuizLoader")
    }
}
