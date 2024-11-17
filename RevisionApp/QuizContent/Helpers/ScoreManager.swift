//
//  ScoreManager.swift
//  RevisionApp
//
//  Created by Joe Taylor on 15/09/2024.
//

import Foundation

protocol ScoreManaging {
    func getScore(for quiz: String) -> Int
    func getTotalQuestions(for quiz: String) -> Int
    func updateScore(for quiz: String, score: Int)
    func markQuizAsCompleted(quiz: String)
    func isQuizCompleted(quiz: String) -> Bool
}

class ScoreManager: ScoreManaging {
    private let scoresKey = "quizScores"
    private let completedQuizzesKey = "completedQuizzes"
    private let storage: UserDefaults
    
    // MARK: - Initializer
    
    init(storage: UserDefaults = .standard) {
        self.storage = storage
    }
    
    // MARK: - Score Management
    
    func getScore(for quiz: String) -> Int {
        let scores = storage.dictionary(forKey: scoresKey) as? [String: Int] ?? [:]
        return scores[quiz] ?? 0
    }
    
    func getTotalQuestions(for quiz: String) -> Int {
        // Ideally, the total questions should be dynamically fetched based on quiz metadata.
        // Currently returning a hardcoded value for demonstration.
        return 10
    }
    
    func updateScore(for quiz: String, score: Int) {
        var scores = storage.dictionary(forKey: scoresKey) as? [String: Int] ?? [:]
        if score > (scores[quiz] ?? 0) {
            scores[quiz] = score
            storage.setValue(scores, forKey: scoresKey)
        }
    }
    
    // MARK: - Quiz Completion Management
    
    func markQuizAsCompleted(quiz: String) {
        var completedQuizzes = storage.stringArray(forKey: completedQuizzesKey) ?? []
        if !completedQuizzes.contains(quiz) {
            completedQuizzes.append(quiz)
            storage.setValue(completedQuizzes, forKey: completedQuizzesKey)
        }
    }
    
    func isQuizCompleted(quiz: String) -> Bool {
        let completedQuizzes = storage.stringArray(forKey: completedQuizzesKey) ?? []
        return completedQuizzes.contains(quiz)
    }
}
