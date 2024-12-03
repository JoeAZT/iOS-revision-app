//
//  CategoryView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 07/11/2024.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel: CatergoriesViewModel
    //why do we need scoreManager here when we have it in the viewModel anyway?
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
//                            QuizMenuCellView(
//                                quiz: quiz,
//                                create a quizMenuC3llViewModel mate surely thats easier, nice try though :)
//                                quizCellHelper: viewModel.quizCellHelper
//                            )
                            HStack {
                                Text(quiz)
                                Spacer()
                                Image(systemName: "trophy.fill")
                                    .resizable()
                                    .scaledToFit()
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
