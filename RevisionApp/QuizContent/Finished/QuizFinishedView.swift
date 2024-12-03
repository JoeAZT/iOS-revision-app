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
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.purple.opacity(0.1), .pink.opacity(0.1)]), center: .bottom, startRadius: 100, endRadius: 400)
                .ignoresSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Quiz Complete!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
                Text(viewModel.highScoreText ?? "")
                    .font(.title2)
                    .bold()
                Text("\(viewModel.score)/\(viewModel.quizModel?.questions.count ?? 10)")
                    .font(.system(size: 80))
                    .bold()
                //could we change this text based on the users score from the quiz.
                Text("Users who score 80% or more are more likely to pass their technical interviews and secure employment.")
                    .opacity(0.7)
                    .font(.subheadline)
                    .padding(.horizontal, 20)
                Spacer()
                HStack {
                    Button {
                        viewModel.resetQuiz()
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .bold()
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .strokeBorder(.white, lineWidth: 4)
                            )
                    }
                    Button {
                        viewModel.completeQuiz()
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
            .foregroundColor(.white)
            .navigationBarBackButtonHidden(true)
            .padding()
        }
        .background(
            Color.appBlack.ignoresSafeArea()
        )
    }
}

#Preview {
    FinishedQuizView(
        viewModel: QuizViewModel(
            router: Router(),
            quizCellViewModel: QuizCellViewModel(
                trophyColorProvider: DefaultTrophyColorProvider(),
                scoreManger: ScoreManager()),
            quizDataLoader: JSONQuizLoader(),
            selectedQuiz: "selectedQuiz"
        )
    )
}
