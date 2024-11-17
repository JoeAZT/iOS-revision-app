
//  Tests.swift
//  RevisionApp
//
//  Created by Joe Taylor on 25/09/2024.


import XCTest
import Combine
@testable import RevisionApp
import SwiftUI

//class MainViewModelTests: XCTestCase {
//


import XCTest
@testable import RevisionApp

//class MainViewModelTests: XCTestCase {
//    
//    func makeSUT() -> MainViewModel {
//        
//        let mockRouter = MockRouter()
//        let quizLoader = MockQuizLoader(
//            quizNames: ["Quiz1"],
//            quizCategories: ["Category1"],
//            quiz: nil
//        )
//        let trophyColorProvider = DefaultTrophyColorProvider()
//        let scoreManager = ScoreManager()
//        
//        MainViewModel(
//            router: mockRouter,
//            quizLoader: quizLoader,
//            trophyColorProvider: trophyColorProvider,
//            scoreManger: scoreManager
//        )
//    }
//    
//    func testDidTapNavigateToQuiz() {
//        
//        let mockRouter = MockRouter()
//        let quizLoader = MockQuizLoader(
//            quizNames: ["Quiz1"],
//            quizCategories: ["Category1", "Category2"],
//            quiz: nil)
//        let trophyColorProvider = DefaultTrophyColorProvider()
//        
//        let viewModel = MainViewModel(
//            router: mockRouter,
//            quizLoader: quizLoader,
//            trophyColorProvider: trophyColorProvider,
//            scoreManger: scoreManager
//        )
//        
//        XCTAssertTrue(mockRouter.didPushRoute, "Expected MainViewModel to call push(to:) on router")
//        XCTAssertEqual(mockRouter.lastPushedRoute, .quizView(viewModel: viewModel))
//    }
//    
//    func testLoadQuizzes() {
//        let mockRouter = MockRouter()
//        let quizLoader = MockQuizLoader(quizNames: ["Quiz1", "Quiz2"], quizCategories: ["Category1", "Category2"])
//        let trophyColorProvider = DefaultTrophyColorProvider()
//        
//        let viewModel = MainViewModel(
//            router: mockRouter,
//            quizLoader: quizLoader,
//            trophyColorProvider: trophyColorProvider,
//            scoreManger: scoreManager
//        )
//        
//        XCTAssertEqual(viewModel.quizzes, ["Quiz1", "Quiz2"], "Expected quizzes to match test data from MockQuizLoader")
//        XCTAssertEqual(viewModel.categories, ["Category1", "Category2"], "Expected categories to match test data from MockQuizLoader")
//    }
//}


//class MainViewModelRouterTests: XCTestCase {
//    
//    func testPushRoute() {
//        let mockRouter = MockRouter()
//        let quizLoader = JSONQuizLoader()
//        let trophyColorProvider = DefaultTrophyColorProvider()
//        
//        let viewModel = MainViewModel(
//            router: mockRouter,
//            quizLoader: quizLoader,
//            trophyColorProvider: trophyColorProvider
//        )
//        
//        viewModel.didTapNavigateToQuiz(selectedQuiz: "Quiz1")
//        XCTAssertTrue(mockRouter.didPushRoute, "Expected push(to:) to be called on router")
//        if case let .quizView(viewModel: quizViewModel) = mockRouter.lastPushedRoute {
//            XCTAssertEqual(quizViewModel.selectedQuiz, "Quiz1", "Expected route to quizView with selectedQuiz as 'Quiz1'")
//        } else {
//            XCTFail("Expected quizView route to be pushed")
//        }
//    }
//    
//    func testPopRoute() {
//        let mockRouter = MockRouter()
//        mockRouter.stack = [.quizView(viewModel: QuizViewModel(router: mockRouter, selectedQuiz: "Quiz1"))]
//        mockRouter.pop()
//        XCTAssertTrue(mockRouter.didPop, "Expected pop() to be called on router")
//        XCTAssertTrue(mockRouter.stack.isEmpty, "Expected stack to be empty after pop")
//    }
//    
//    func testPopToRoot() {
//        let mockRouter = MockRouter()
//        mockRouter.stack = [
//            .quizView(
//                viewModel: QuizViewModel(
//                    router: mockRouter,
//                    selectedQuiz: "Quiz1"
//                )
//            ),
//            .categoryView(
//                viewModel: CatergoriesViewModel(
//                    category: "Mock category",
//                    quizzes: ["mock quiz 1", "mock quiz 2", "mock quiz 3",]
//                )
//            )
//        ]
//        
//        mockRouter.popToRootView()
//        XCTAssertTrue(mockRouter.didPopToRoot, "Expected popToRootView() to be called on router")
//        XCTAssertTrue(mockRouter.stack.isEmpty, "Expected stack to be empty after popToRootView")
//    }
//}


class RouterMock: RouterProtocol {
    var stack: [Route] = []

    func push(to route: Route) {
        stack.append(route)
    }

    func pop() {
        guard !stack.isEmpty else { return }
        stack.removeLast()
    }

    func popToRootView() {
        stack.removeAll()
    }
}
