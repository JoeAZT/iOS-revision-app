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
    @Published var shuffledAnswers: [OptionModel] = []  // New property for shuffled answers
    
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
        shuffleAnswers()  // Shuffle answers at the start
    }
    
    func loadQuestionsFromJSON() {
        if let url = Bundle.main.url(forResource: "combineQuestions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([QuestionModel].self, from: data)
                print("Decoded Data: \(decodedData)")  // Debug print statement
                self.questionModel = decodedData
                shuffleAnswers()  // Shuffle answers after loading questions
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("Could not find questions.json")  // Debug print statement
        }
    }
    
    // New method to shuffle the possible answers for the current question
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
        selectedAnswer = shuffledAnswers[answerIndex].optionText  // Use shuffled answers here
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
    
    //to be used on retry
    func resetQuiz() {
        score = 0
        currentQuestion = 0
        showingAnswerSheet = false
        shuffleAnswers()
        didTapNavigateToQuiz()
    }
    
    //To be used to navigate back to quiz from here
    func didTapNavigateToQuiz() {
        router.push(to: .quizView(viewModel: self))
    }
    
    func didTapNavigateToMainView() {
        router.popToRootView()
    }
}
