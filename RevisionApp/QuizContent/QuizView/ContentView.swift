//
//  ContentView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 12/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: QuizViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea(.all)
            VStack {
                if viewModel.questionModel.isEmpty {
                    Text("Loading questions...")
                        .font(.title)
                } else {
                    VStack {
                        HStack {
                            Text(viewModel.questionModel[viewModel.currentQuestion].questionText)
                                .font(.title)
                                .bold()
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                        
                        ForEach(0..<viewModel.questionModel[viewModel.currentQuestion].possibleAnswers.count) { answerIndex in
                            Button {
                                let selectedAnswer = viewModel.questionModel[viewModel.currentQuestion].possibleAnswers[answerIndex]
                                if selectedAnswer.isAnswer {
                                    viewModel.answerIsCorrect()
                                } else {
                                    viewModel.answerIsIncorrect()
                                }
                                viewModel.answerPressed()
                            } label: {
                                HStack {
                                    Text(viewModel.questionModel[viewModel.currentQuestion].possibleAnswers[answerIndex].optionText)
                                    Spacer()
                                }
                                .modifier(AnswerButton())
                            }
                        }
                    }
                    .padding()
                    .sheet(isPresented: $viewModel.showingCorrectAnswerSheet) {
                        AnswerSheetView(viewModel: viewModel)
                            .presentationDetents([.fraction(0.3)])
                            .interactiveDismissDisabled()
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("Score: \(viewModel.score)")
                    .bold()
            }
        }
    }
}
