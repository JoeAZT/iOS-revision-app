//
//  QuizMenuCellView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 23/11/2024.
//

import SwiftUI

struct QuizMenuCellView: View {
    
    let quiz: String
    let viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .strokeBorder((viewModel.trophyColor(for: viewModel.getScorePercentage(quiz: quiz)).linearGradient), lineWidth: 4)
                .padding(.horizontal, 16)
            HStack {
                Image(systemName: "trophy.circle.fill")
                    .resizable()
                    .scaledToFit()
//                    .foregroundColor(viewModel.trophyColor(for: viewModel.getScorePercentage(quiz: quiz)).linearGradient)
                    .frame(height: 24)
                    .padding(.vertical)
                Text(quiz)
                Spacer()
                HStack(spacing: 2) {
                    if viewModel.getScorePercentage(quiz: quiz) != 0 {
                        Text("\(viewModel.getScorePercentage(quiz: quiz))")
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
            .padding(.horizontal, 32)
            .padding()
        }
    }
}
