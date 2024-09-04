//
//  IncorrectAnswerSheet.swift
//  RevisionApp
//
//  Created by Joe Taylor on 04/09/2024.
//

import SwiftUI

struct IncorrectAnswerSheet: View {
    
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Your answer was incorrect 😢")
                .font(.title2)
                .bold()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("Correct answer:")
                        .font(.title3)
                        .bold()
                    Text(viewModel.questionModel[viewModel.currentQuestion].possibleAnswers.first(where: { $0.isAnswer })!.optionText)
                }
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color("incorrectSecondary"))
            .cornerRadius(10)
        }
    }
}

#Preview {
    IncorrectAnswerSheet(
        viewModel: QuizViewModel(
            score: 12,
            currentQuestion: 16,
            router: Router(),
            showingCorrectAnswerSheet: false
        )
    )
}
