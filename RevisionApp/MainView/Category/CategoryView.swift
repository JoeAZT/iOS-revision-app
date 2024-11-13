//
//  CategoryView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/11/2024.
//

import SwiftUI

struct CategoryView: View {
    
    var selectedCategory: String
    var viewModel: CatergoriesViewModel
    
    var body: some View {
        VStack {
            Text("we here now bro")
            ForEach(viewModel.quizzes, id: \.self) { quiz in
                VStack {
                    Text(quiz)
                }
            }
//            ForEach(viewModel.quizzes.filter { !scoreManager.isQuizCompleted(quiz: $0) }, id: \.self) { quiz in
//                let bestScore = scoreManager.getScore(for: quiz)
//                let totalQuestions = scoreManager.getTotalQuestions(for: quiz)
//                let scorePercentage = totalQuestions > 0 ? (Double(bestScore) / Double(totalQuestions)) * 100 : 0
//
//                Button {
//                    viewModel.didTapNavigateToQuiz(selectedQuiz: quiz)
//                } label: {
//                    HStack {
//                        Text(quiz)
//                        Spacer()
//                        Image(systemName: "trophy.fill")
//                            .resizable()
//                            .scaledToFit()
//                            .foregroundColor(viewModel.trophyColor(for: scorePercentage))
//                            .padding(.vertical)
//                    }
//                    .modifier(MainButtonStyle())
//                }
//            }
        }
    }
}

#Preview {
    CategoryView(
        selectedCategory: "General",
        viewModel: CatergoriesViewModel(
            category: "General",
            quizzes: []
        )
    )
}
