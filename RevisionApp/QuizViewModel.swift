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
    
    init(score: Int, currentQuestion: Int) {
        self.score = score
        self.currentQuestion = currentQuestion
        
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
        backgroundColor = .green
        score += 1
    }
    
    func answerIsIncorrect() {
        backgroundColor = .red
    }
    
    func increaseQuestionNumber() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(.easeInOut(duration: 0.5)) {
                self.backgroundColor = .white
                self.currentQuestion += 1
            }
        }
    }
}
