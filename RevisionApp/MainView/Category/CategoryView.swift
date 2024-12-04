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
        VStack {
            ScrollView {
                ForEach(viewModel.quizzes.filter { !scoreManager.isQuizCompleted(quiz: $0) }, id: \.self) { quiz in
                    Button {
                        viewModel.didTapNavigateToQuiz(selectedQuiz: quiz)
                    } label: {
                        Button {
                            viewModel.didTapNavigateToQuiz(selectedQuiz: quiz)
                        } label: {
                            QuizMenuCellView(
                                quiz: quiz,
                                quizCellViewModel: viewModel.quizCellViewModel
                            )
                        }
                    }
                }
            }
        }
        .navigationTitle(viewModel.category)
    }
}
