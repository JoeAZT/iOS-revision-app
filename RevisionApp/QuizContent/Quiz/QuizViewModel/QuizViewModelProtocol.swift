//
//  QuizViewModelProtocol.swift
//  RevisionApp
//
//  Created by Joe Taylor on 17/11/2024.
//

import SwiftUI
import Combine

protocol QuizViewModelProtocol: ObservableObject {
    var selectedQuiz: String { get }
    var highScoreText: String? { get set }
    var quizModel: QuizModel? { get set }
    var score: Int { get set }
    var currentQuestionIndex: Int { get set }
    var backgroundColor: Color { get set }
    var showingAnswerSheet: Bool { get set }
    var selectedAnswer: String? { get set }
    var shuffledAnswers: [OptionModel] { get set }
    var quizCellHelper: QuizCellHelperProtocol { get }
    
    func shuffleAnswers()
    func answerIsCorrect()
    func answerIsIncorrect()
    func answerPressed(answerIndex: Int)
    func nextQuestion()
    func checkIfQuizComplete() -> Bool
    func completeQuiz()
    func resetQuiz()
    func didTapNavigateToPreviousView()
    func didTapNavigateToMainView()
}
