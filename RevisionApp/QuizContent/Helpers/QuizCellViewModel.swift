//
//  QuizCellHelperProtocol.swift
//  RevisionApp
//
//  Created by Joe Taylor on 24/11/2024.
//

protocol QuizCellViewModelProtocol {
    
    var trophyColorProvider: TrophyColorProvider { get }
    var scoreManager: ScoreManager { get }
    
    func trophyColor(for percentage: Int) -> CommodityColor
    func getScorePercentage(quiz: String) -> Int
}

class QuizCellViewModel: QuizCellViewModelProtocol {
    
    let trophyColorProvider: TrophyColorProvider
    let scoreManager: ScoreManager
    
    init(
        trophyColorProvider: TrophyColorProvider,
        scoreManger: ScoreManager
    ) {
        self.trophyColorProvider = trophyColorProvider
        self.scoreManager = scoreManger
    }
    
    func trophyColor(for percentage: Int) -> CommodityColor {
        return trophyColorProvider.trophyColor(for: percentage)
    }
    
    func getScorePercentage(quiz: String) -> Int {
        let bestScore = scoreManager.getScore(for: quiz)
        let totalQuestions = scoreManager.getTotalQuestions(for: quiz)
        return totalQuestions > 0 ? (bestScore * 100) / totalQuestions : 0
    }
}
