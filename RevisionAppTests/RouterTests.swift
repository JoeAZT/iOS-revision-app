//
//  RouterTests.swift
//  RevisionApp
//
//  Created by Joe Taylor on 14/11/2024.
//

import XCTest
@testable import RevisionApp

class RouterTests: XCTestCase {
    
    func makeQuizViewModel() -> QuizViewModel {
        QuizViewModel(
            router: MockRouter(),
            quizCellHelper: QuizCellHelper(
                trophyColorProvider: DefaultTrophyColorProvider(),
                scoreManger: MockScoreManager()
            ),
            quizDataLoader: MockQuizLoader(),
            selectedQuiz: "selectedQuiz"
        )
    }
    
    func makeCategoriesViewModel() -> CatergoriesViewModel {
        CatergoriesViewModel(
            quizzes: [],
            category: "selectedCategory",
            router: MockRouter(),
            quizCellHelper: QuizCellHelper(
                trophyColorProvider: DefaultTrophyColorProvider(),
                scoreManger: MockScoreManager()
            ),
            quizLoader: MockQuizLoader()
        )
    }
    
    func testPushAndPopRoutes() {
        let router = Router()
        
        let quizViewModel = makeQuizViewModel()
        router.push(to: .quizView(viewModel: quizViewModel))
        XCTAssertEqual(router.stack, [.quizView(viewModel: quizViewModel)], "Expected stack to contain pushed route")
        router.pop()
        XCTAssertTrue(router.stack.isEmpty, "Expected stack to be empty after pop")
    }
    
    func testPopToRoot() {
        let router = Router()
        
        router.push(to: .quizView(
            viewModel: makeQuizViewModel()
        ))
        
        router.push(
            to: .categoryView(
                viewModel: makeCategoriesViewModel()
            )
        )
        router.popToRootView()
        XCTAssertTrue(router.stack.isEmpty, "Expected stack to be empty after popToRootView")
    }
}
