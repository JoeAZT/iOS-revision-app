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
            HStack {
                Image(systemName: "trophy.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(viewModel.trophyColor(for: viewModel.getScorePercentage(quiz: quiz)))
                    .frame(height: 24)
                    .padding(.vertical)
                Text(quiz)
                Spacer()
                HStack(spacing: 2) {
                    Text("\(viewModel.getScorePercentage(quiz: quiz))")
                        .bold()
                    Text("points")
                        .opacity(0.8)
                }
            }
            .padding()
            .background(Color.white)
            .cornerRadius(20)
            .padding(.horizontal, 16)
        }
    }
}
