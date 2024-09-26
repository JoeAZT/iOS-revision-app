
//  Tests.swift
//  RevisionApp
//
//  Created by Joe Taylor on 25/09/2024.


import XCTest
import Combine
@testable import RevisionApp
import SwiftUI

class QuizViewModelTests: XCTestCase {
    
    func makeSUT() -> QuizViewModel {
        QuizViewModel(router: RouterMock(), selectedQuiz: "mockQuiz")
    }

    func testAnswerIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.score, 0)
        XCTAssertEqual(viewModel.currentQuestionIndex, 0)
        viewModel.answerIsCorrect()
        XCTAssertEqual(viewModel.score, 1)
        XCTAssertEqual(viewModel.currentQuestionIndex, 0)
    }
    
    func testAnswerIsIncorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.score, 0)
        XCTAssertEqual(viewModel.currentQuestionIndex, 0)
        viewModel.answerIsCorrect()
        XCTAssertEqual(viewModel.score, 0)
        XCTAssertEqual(viewModel.currentQuestionIndex, 1)
    }
    
    func testCheckIfTestIsComplete() {
        let viewModel = makeSUT()
        let isTestComplete = viewModel.checkIfQuizComplete()
    }
    
}
