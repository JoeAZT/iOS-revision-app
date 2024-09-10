//
//  QuizFinishedView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 10/09/2024.
//

import SwiftUI

struct FinishedQuizView: View {
    
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            Text("🙌 Quiz Complete! 🙌")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Score: \(viewModel.score)/\(viewModel.questionModel.count)")
                .font(.title)
            HStack {
                Button {
                    viewModel.resetQuiz()
                    print("retry")
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.purple)
                        .cornerRadius(10)
                }
                Button {
                    viewModel.didTapNavigateToMainView()
                    print("exit")
                } label: {
                    Text("Exit")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.green)
                        .cornerRadius(10)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

#Preview {
    FinishedQuizView(
        viewModel: QuizViewModel(
            score: 6,
            currentQuestion: 16,
            router: Router(),
            showingCorrectAnswerSheet: false
        )
    )
}
