//
//  QuizViewModel.swift
//  RevisionApp
//
//  Created by Joe Taylor on 12/08/2024.
//

import SwiftUI

class QuizViewModel: ObservableObject {
    @Published var questionModel: [QuestionModel] = []
    @Published var score: Int
    @Published var currentQuestion: Int
    @Published var backgroundColor: Color = .white
    @Published var router: RouterProtocol
    @Published var showingAnswerSheet: Bool = false
    @Published var selectedAnswer: String = ""
    @Published var shuffledAnswers: [OptionModel] = []
    
    init(
        score: Int,
        currentQuestion: Int,
        router: RouterProtocol,
        showingCorrectAnswerSheet: Bool
    ) {
        self.score = score
        self.currentQuestion = currentQuestion
        self.router = router
        self.showingAnswerSheet = showingCorrectAnswerSheet
        loadQuestionsFromJSON()
        shuffleAnswers()
    }
    
    func loadQuestionsFromJSON() {
        if let url = Bundle.main.url(forResource: "architectureQuestions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([QuestionModel].self, from: data)
                self.questionModel = decodedData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("Could not find questions.json")
        }
    }
    
    func shuffleAnswers() {
        if !questionModel.isEmpty && currentQuestion < questionModel.count {
            shuffledAnswers = questionModel[currentQuestion].possibleAnswers.shuffled()
        }
    }
    
    func answerIsCorrect() {
        backgroundColor = Color("correct")
        score += 1
    }
    
    func answerIsIncorrect() {
        backgroundColor = Color("incorrect")
    }
    
    func answerPressed(answerIndex: Int) {
        selectedAnswer = shuffledAnswers[answerIndex].optionText 
        showingAnswerSheet = true
    }
    
    func nextQuestion() {
        showingAnswerSheet = false
        withAnimation(.easeInOut(duration: 0.5)) {
            self.backgroundColor = .white
            self.currentQuestion += 1
        }
        if checkIfQuizComplete() == true {
            router.push(to: .finishedQuizView(viewModel: self))
        } else {
            shuffleAnswers()
        }
    }
    
    func checkIfQuizComplete() -> Bool {
        //added for testing
        return currentQuestion == 1
//        return currentQuestion >= questionModel.count
    }
    
    func resetQuiz() {
        score = 0
        currentQuestion = 0
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
