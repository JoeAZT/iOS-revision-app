//
//  QuizMenuCellView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 23/11/2024.
//

import SwiftUI

struct QuizMenuCellView: View {
    
    let quiz: String
    let quizCellViewModel: QuizCellViewModelProtocol
    
    var body: some View {
        HStack {
            Text("🧠")
                .padding(12)
                .background(quizCellViewModel.trophyColor(for: quizCellViewModel.getScorePercentage(quiz: quiz)).linearGradient)
                .cornerRadius(12)
            Text(quiz)
            Spacer()
            HStack(spacing: 2) {
                if quizCellViewModel.getScorePercentage(quiz: quiz) != 0 {
                    Text("\(quizCellViewModel.getScorePercentage(quiz: quiz))")
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
                .stroke(quizCellViewModel.trophyColor(for: quizCellViewModel.getScorePercentage(quiz: quiz)).linearGradient, lineWidth: 4)
        )
        .padding(.horizontal, 16)
    }
}
