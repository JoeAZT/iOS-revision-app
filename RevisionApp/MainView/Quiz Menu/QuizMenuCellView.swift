//
//  QuizMenuCellView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 23/11/2024.
//

import SwiftUI

struct QuizMenuCellView: View {
    
    let quiz: String
    let quizCellHelper: QuizCellViewModel
    
    var body: some View {
        HStack {
            Text("🧠")
                .padding(12)
                .background(quizCellHelper.trophyColor(for: quizCellHelper.getScorePercentage(quiz: quiz)).linearGradient)
                .cornerRadius(12)
            Text(quiz)
            Spacer()
            HStack(spacing: 2) {
                if quizCellHelper.getScorePercentage(quiz: quiz) != 0 {
                    Text("\(quizCellHelper.getScorePercentage(quiz: quiz))")
                        .bold()
                    Text("points")
                        .opacity(0.8)
                } else {
                    Text("0")
                        .bold()
                        .opacity(0.5)
                    Text("points")
                        .opacity(0.4)
                }
            }
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(quizCellHelper.trophyColor(for: quizCellHelper.getScorePercentage(quiz: quiz)).linearGradient, lineWidth: 4)
        )
        .padding(.horizontal, 16)
    }
}
