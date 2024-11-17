
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
        QuizViewModel(
            router: RouterMock(),
            scoreManager: ScoreManager(),
            quizDataLoader: MockQuizLoader(quiz: nil),
            selectedQuiz: "selectedQuiz"
        )
    }

    func testAnswerIsCorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.score, 0)
        viewModel.answerIsCorrect()
        XCTAssertEqual(viewModel.score, 1)
    }
    
    func testAnswerIsIncorrect() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.score, 0)
        viewModel.answerIsIncorrect()
        XCTAssertEqual(viewModel.score, 0)
    }
    
    func testNextQuestionButton() {
        let viewModel = makeSUT()
        XCTAssertEqual(viewModel.currentQuestionIndex, 0)
        viewModel.nextQuestion()
        XCTAssertEqual(viewModel.currentQuestionIndex, 1)
    }
    
    func testCheckIfTestIsComplete() {
        let viewModel = makeSUT()
        let isTestComplete = viewModel.checkIfQuizComplete()
    }
    
}
