//
//  QuizViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 12/08/2024.
//

import SwiftUI
import Combine

class QuizViewModel: QuizViewModelProtocol {
    
    var selectedQuiz: String
    @Published var highScoreText: String? = nil
    @Published var quizModel: QuizModel? = nil
    @Published var score: Int = 0
    @Published var currentQuestionIndex: Int = 0
    @Published var backgroundColor: Color = .white
    @Published var showingAnswerSheet: Bool = false
    @Published var selectedAnswer: String? = nil
    @Published var shuffledAnswers: [OptionModel] = []
    
    private let router: RouterProtocol
    private let scoreManager: ScoreManaging
    private let quizDataLoader: QuizDataLoader
    
    init(
        router: RouterProtocol,
        scoreManager: ScoreManaging,
        quizDataLoader: QuizDataLoader,
        selectedQuiz: String
    ) {
        self.router = router
        self.scoreManager = scoreManager
        self.quizDataLoader = quizDataLoader
        self.selectedQuiz = selectedQuiz
        
        loadQuizData()
        shuffleAnswers()
    }
    
    // MARK: - Quiz Management
    
    private func loadQuizData() {
        quizModel = quizDataLoader.loadQuiz(named: selectedQuiz)
        shuffleAnswers()
    }
    
    func shuffleAnswers() {
        guard let questions = quizModel?.questions, currentQuestionIndex < questions.count else {
            shuffledAnswers = []
            return
        }
        shuffledAnswers = questions[currentQuestionIndex].possibleAnswers.shuffled()
    }
    
    // MARK: - Answer Handling
    
    func answerIsCorrect() {
        backgroundColor = Color("correct")
        score += 1
    }
    
    func answerIsIncorrect() {
        backgroundColor = Color("incorrect")
        if let currentQuestion = quizModel?.questions[currentQuestionIndex] {
            addIncorrectQuestion(currentQuestion)
        }
    }
    
    func answerPressed(answerIndex: Int) {
        guard answerIndex < shuffledAnswers.count else { return }
        selectedAnswer = shuffledAnswers[answerIndex].optionText
        showingAnswerSheet = true
    }
    
    private func addIncorrectQuestion(_ question: QuestionModel) {
        // Store incorrectly answered questions for potential later use
    }
    
    // MARK: - Quiz Progression
    
    func nextQuestion() {
        showingAnswerSheet = false
        
        withAnimation(.easeInOut(duration: 0.5)) {
            self.backgroundColor = .white
        }
        
        guard let questionsCount = quizModel?.questions.count, currentQuestionIndex < questionsCount - 1 else {
            highScoreText = setHighScoreText()
            scoreManager.updateScore(for: selectedQuiz, score: score)
            router.push(to: .finishedQuizView(viewModel: self))
            currentQuestionIndex += 1
            return
        }
        currentQuestionIndex += 1
        shuffleAnswers()
    }
    
    func checkIfQuizComplete() -> Bool {
        guard let questionsCount = quizModel?.questions.count else { return false }
        return currentQuestionIndex >= questionsCount
    }
    
    func completeQuiz() {
        scoreManager.markQuizAsCompleted(quiz: selectedQuiz)
        didTapNavigateToMainView()
    }
    
    func resetQuiz() {
        score = 0
        currentQuestionIndex = 0
        showingAnswerSheet = false
        selectedAnswer = nil
        shuffleAnswers()
        didTapNavigateToPreviousView()
    }
    
    // MARK: - Navigation
    
    func didTapNavigateToPreviousView() {
        router.pop()
    }
    
    func didTapNavigateToMainView() {
        router.popToRootView()
    }
    
    // MARK: - High Score Management
    
    private func setHighScoreText() -> String {
        let currentHighScore = scoreManager.getScore(for: selectedQuiz)
        if score > currentHighScore {
            return "🎉 New High Score 🎉"
        } else if score == currentHighScore {
            return "😎 Matched High Score 😎"
        } else {
            return ""
        }
    }
}
