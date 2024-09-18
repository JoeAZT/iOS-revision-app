//
//  MainView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 28/08/2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    private let scoreManager = ScoreManager()

    var body: some View {
        NavigationStack(path: $viewModel.router.stack) {
            ZStack {
                RadialGradient(colors: [Color.blue.opacity(0.2), Color.purple.opacity(0.1)], center: .center, startRadius: 50, endRadius: 400)
                    .ignoresSafeArea(.all)
                VStack {
                    ScrollView {
                        DailyQuizBannerView(viewModel: viewModel)
                        QuizCarouselView(viewModel: QuizCarouselViewModel(quizzess: viewModel.quizzes))
                        Text("Next quizzes")
                            .font(.title3)
                            .padding(.top)
                            .padding(.horizontal)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        ForEach(viewModel.quizzes, id: \.self) { quiz in
                            let bestScore = scoreManager.getScore(for: quiz)
                            let totalQuestions = scoreManager.getTotalQuestions(for: quiz)
                            let scorePercentage = totalQuestions > 0 ? (Double(bestScore) / Double(totalQuestions)) * 100 : 0

                            Button {
                                viewModel.didTapNavigateToQuiz(selectedQuiz: quiz)
                            } label: {
                                HStack {
                                    Text(quiz)
                                    Spacer()
                                    Image(systemName: "trophy.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(viewModel.trophyColor(for: scorePercentage))
                                        .padding(.vertical)
                                       
                                }
                                .modifier(MainButtonStyle())
                            }
                        }
                    }
                }
                .navigationDestination(for: Route.self) { $0 }
            }
            .navigationTitle("Quiz")
        }
    }
}
