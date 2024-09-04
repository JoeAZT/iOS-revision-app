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
    @Published var showingCorrectAnswerSheet: Bool = false
    @Published var selectedAnswer: String = ""
    
    init(
        score: Int,
        currentQuestion: Int,
        router: RouterProtocol,
        showingCorrectAnswerSheet: Bool
    ) {
        self.score = score
        self.currentQuestion = currentQuestion
        self.router = router
        self.showingCorrectAnswerSheet = showingCorrectAnswerSheet
        loadQuestionsFromJSON()
    }
    
    func loadQuestionsFromJSON() {
        if let url = Bundle.main.url(forResource: "interviewQuestions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode([QuestionModel].self, from: data)
                print("Decoded Data: \(decodedData)")  // Debug print statement
                self.questionModel = decodedData
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("Could not find questions.json")  // Debug print statement
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
        selectedAnswer = questionModel[currentQuestion].possibleAnswers[answerIndex].optionText
        showingCorrectAnswerSheet = true
    }
    
    func nextQuestion() {
        showingCorrectAnswerSheet = false
        withAnimation(.easeInOut(duration: 0.5)) {
            self.backgroundColor = .white
            self.currentQuestion += 1
        }
    }
}
