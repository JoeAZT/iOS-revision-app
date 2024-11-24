//
//  CategoryView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/11/2024.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel: CatergoriesViewModel
    private let scoreManager = ScoreManager()
    
    var body: some View {
        ZStack {
            RadialGradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)], center: .center, startRadius: 50, endRadius: 400)
                .ignoresSafeArea(.all)
            VStack {
                ScrollView {
                    ForEach(viewModel.quizzes.filter { !scoreManager.isQuizCompleted(quiz: $0) }, id: \.self) { quiz in
                        
                        Button {
                            viewModel.didTapNavigateToQuiz(selectedQuiz: quiz)
                        } label: {
                            HStack {
                                Text(quiz)
                                Spacer()
                                Image(systemName: "trophy.fill")
                                    .resizable()
                                    .scaledToFit()
//                                    .foregroundColor(viewModel.trophyColor(for: scorePercentage))
                                    .padding(.vertical)
                            }
                            .modifier(MainButtonStyle())
                        }
                    }
                }
            }
        }
        .navigationTitle(viewModel.category)
    }
}

//#Preview {
//    CategoryView(
//        viewModel: CatergoriesViewModel(
//            category: "General",
//            quizzes: ["quiz 1", "quiz 2", "quiz 3", "quiz 4"]
//        )
//    )
//}
