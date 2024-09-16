//
//  QuizViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 12/08/2024.
//

import SwiftUI

class QuizViewModel: ObservableObject {
    var selectedQuiz: String
    var highScoreText: String = ""
    @Published var quizModel: QuizModel?
    @Published var score: Int = 0
    @Published var currentQuestionIndex: Int = 0
    @Published var backgroundColor: Color = .white
    @Published var router: RouterProtocol
    @Published var showingAnswerSheet: Bool = false
    @Published var selectedAnswer: String = ""
    @Published var shuffledAnswers: [OptionModel] = []
    
    private let scoreManager = ScoreManager()
    
    init(
        router: RouterProtocol,
        selectedQuiz: String
    ) {
        self.router = router
        self.selectedQuiz = selectedQuiz
        loadQuestionsFromJSON(selectedQuiz: selectedQuiz)
        shuffleAnswers()
    }
    
    func loadQuestionsFromJSON(selectedQuiz: String) {
        guard let url = Bundle.main.url(forResource: selectedQuiz, withExtension: "json") else {
            print("Could not find \(selectedQuiz).json")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(QuizModel.self, from: data)
            
            self.quizModel = decodedData
            shuffleAnswers()
            
        } catch {
            print("Error decoding JSON: \(error.localizedDescription)")
        }
    }
    
    func shuffleAnswers() {
        guard let questions = quizModel?.questions, currentQuestionIndex < questions.count else {
            shuffledAnswers = []
            return
        }
        shuffledAnswers = questions[currentQuestionIndex].possibleAnswers.shuffled()
    }
    
    func answerIsCorrect() {
        backgroundColor = Color("correct")
        score += 1
    }
    
    func answerIsIncorrect() {
        backgroundColor = Color("incorrect")
    }
    
    func answerPressed(answerIndex: Int) {
        guard answerIndex < shuffledAnswers.count else { return }
        selectedAnswer = shuffledAnswers[answerIndex].optionText
        showingAnswerSheet = true
    }
    
    func nextQuestion() {
        showingAnswerSheet = false
        
        withAnimation(.easeInOut(duration: 0.5)) {
            self.backgroundColor = .white
        }
        
        guard let questionsCount = quizModel?.questions.count, currentQuestionIndex < questionsCount - 1 else {
            highScoreText = setHighScoreText(quiz: selectedQuiz)
            router.push(to: .finishedQuizView(viewModel: self))
            return
        }
        
        currentQuestionIndex += 1
        shuffleAnswers()
    }
    
    func checkIfQuizComplete() -> Bool {
        guard let questionsCount = quizModel?.questions.count else { return false }
        return currentQuestionIndex >= questionsCount
    }
    
    func setHighScoreText(quiz: String) -> String {
        if score > scoreManager.getScore(for: quiz) {
            return "New High Score"
        } else if score == scoreManager.getScore(for: quiz) {
            return "Matched High Score"
        } else {
            return ""
        }
    }
    
    func completeQuiz() {
        scoreManager.updateScore(for: selectedQuiz, score: score)
        didTapNavigateToMainView()
    }
    
    func resetQuiz() {
        score = 0
        currentQuestionIndex = 0
        showingAnswerSheet = false
        shuffleAnswers()
        didTapNavigateToQuiz()
    }
    
    func didTapNavigateToQuiz() {
        router.pop()
    }
    
    func didTapNavigateToMainView() {
        router.popToRootView()
    }
}
