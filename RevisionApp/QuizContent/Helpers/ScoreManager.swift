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
    
    //get quiz data from JSON file and implement quiz question count
    func getTotalQuestions(for quiz: String) -> Int {
        return 10
    }
    
    func updateScore(for quiz: String, score: Int) {
        var scores = UserDefaults.standard.dictionary(forKey: scoresKey) as? [String: Int] ?? [:]
        if score > (scores[quiz] ?? 0) {
            scores[quiz] = score
            UserDefaults.standard.setValue(scores, forKey: scoresKey)
        }
    }
}
