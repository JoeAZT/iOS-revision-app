//
//  ScoreManager.swift
//  RevisionApp
//
//  Created by Joe Taylor on 15/09/2024.
//

import Foundation

class ScoreManager {
    private let scoresKey = "quizScores"
    
    func getScore(for quiz: String) -> Int {
        let scores = UserDefaults.standard.dictionary(forKey: scoresKey) as? [String: Int] ?? [:]
        return scores[quiz] ?? 0
    }
    
    func getTotalQuestions(for quiz: String) -> Int {
        // This method should return the total number of questions for the quiz
        // For now, it's a placeholder and should be implemented according to your app's structure
        return 10 // Replace with actual implementation
    }
    
    func updateScore(for quiz: String, score: Int) {
        var scores = UserDefaults.standard.dictionary(forKey: scoresKey) as? [String: Int] ?? [:]
        if score > (scores[quiz] ?? 0) {
            scores[quiz] = score
            UserDefaults.standard.setValue(scores, forKey: scoresKey)
        }
    }
    
    func newHighScore() -> String {
        return "New high score"
    }
}
