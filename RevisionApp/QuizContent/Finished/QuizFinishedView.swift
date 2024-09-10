//
//  QuizFinishedView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 10/09/2024.
//

import SwiftUI

struct QuizFinishedView: View {
    
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack {
            Text("🙌 Quiz Complete! 🙌")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("Score: \(viewModel.score) / \(viewModel.questionModel.count)")
                .font(.title)
                .padding()
            HStack {
                Button {
                    print("retry")
                } label: {
                    Text("Retry")
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.orange)
                        .cornerRadius(10)
                }
                Button {
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
    }
}

#Preview {
    QuizFinishedView(viewModel: QuizViewModel(score: 12, currentQuestion: 16, router: Router(), showingCorrectAnswerSheet: false))
}
