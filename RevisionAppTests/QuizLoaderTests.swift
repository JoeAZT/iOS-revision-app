//
//  QuizLoaderTests.swift
//  RevisionApp
//
//  Created by Joe Taylor on 17/11/2024.
//

import XCTest
@testable import RevisionApp

class QuizLoaderTests: XCTestCase {
    
    var quizLoader: QuizDataLoader!

    override func setUp() {
        super.setUp()
        quizLoader = MockQuizLoader()
    }

    override func tearDown() {
        quizLoader = nil
        super.tearDown()
    }

    func testLoadQuizNames() {
        let quizNames = quizLoader.loadQuizNames()
        XCTAssertEqual(quizNames, ["mock quiz 1", "mock quiz 2", "mock quiz 3", "mock quiz 4"], "Expected quiz names to match mock data")
    }

    func testLoadQuizCategories() {
        let quizCategories = quizLoader.loadQuizCategories()
        XCTAssertEqual(quizCategories, ["mock category 1", "mock category 2", "mock category 3", "mock category 4"], "Expected quiz categories to match mock data")
    }

    func testLoadQuizByName() {
        let quiz = quizLoader.loadQuiz(named: "mock quiz 1")
        XCTAssertNotNil(quiz, "Expected quiz to be loaded")
        XCTAssertEqual(quiz?.name, "Mock Quiz Name", "Expected quiz name to match mock data")
        XCTAssertEqual(quiz?.questions.count, 1, "Expected one question in the mock quiz")
        XCTAssertEqual(quiz?.category, .architecture, "Expected category to match mock data")
    }
}
