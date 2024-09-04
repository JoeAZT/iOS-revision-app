//
//  AnswerSheetView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 03/09/2024.
//

import SwiftUI

struct AnswerSheetView: View {
    
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        
        VStack(alignment: .leading) {
        if viewModel.selectedAnswer == viewModel.questionModel[viewModel.currentQuestion].possibleAnswers.first(where: { $0.isAnswer })!.optionText {
            CorrectAnswerSheet()
        } else {
            IncorrectAnswerSheet(viewModel: viewModel)
        }
            Spacer()
            Button {
                viewModel.nextQuestion()
            } label: {
                Text("NEXT")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.black)
                    .cornerRadius(10)
            }
        }
        .padding()
        .background(viewModel.backgroundColor)
    }
}

#Preview {
    AnswerSheetView(
        viewModel: QuizViewModel(
            score: 12,
            currentQuestion: 16,
            router: Router(),
            showingCorrectAnswerSheet: false
        )
    )
}
