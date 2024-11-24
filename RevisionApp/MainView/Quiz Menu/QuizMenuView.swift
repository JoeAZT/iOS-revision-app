//
//  MainView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 28/08/2024.
//
//

import SwiftUI

struct QuizMenuView: View {
    @StateObject var viewModel: MainViewModel
    private let scoreManager = ScoreManager()
    
    var body: some View {
        NavigationStack(path: $viewModel.router.stack) {
            ZStack {
                RadialGradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)], center: .center, startRadius: 50, endRadius: 400)
                    .ignoresSafeArea(.all)
                VStack {
                    ScrollView {
                        BannerView(isDailyQuiz: true, viewModel: viewModel, quiz: "Daily Quiz")
                        QuizCarouselView(
                            viewModel: QuizCarouselViewModel(
                                router: viewModel.router,
                                selectedCategory: nil,
                                categories: viewModel.categories ?? [],
                                quizLoader: JSONQuizLoader(),
                                trophyColorProvider: DefaultTrophyColorProvider(),
                                scoreManager: ScoreManager())
                        )
                        BannerView(
                            isDailyQuiz: false,
                            viewModel: viewModel,
                            quiz: "Mistakes"
                        )
                        .padding(.top, 10)
                        Text("Next quizzes")
                            .font(.title3)
                            .padding(.top)
                            .padding(.horizontal)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if let quizzes = viewModel.quizzes {
                            ForEach(quizzes.filter { !scoreManager.isQuizCompleted(quiz: $0) }, id: \.self) { quiz in
                                Button {
                                    viewModel.didTapNavigateToQuiz(selectedQuiz: quiz)
                                } label: {
                                    QuizMenuCellView(
                                        quiz: quiz,
                                        viewModel: viewModel
                                    )
                                }
                            }
                        } else {
                            Text("No Quiz Data Found")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(.top, 20)
                        }
                        
                        // Completed Quizzes
                        Text("Completed Quizzes")
                            .font(.title3)
                            .padding(.top)
                            .padding(.horizontal)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        if let quizzes = viewModel.quizzes {
                            ForEach(quizzes.filter { scoreManager.isQuizCompleted(quiz: $0) }, id: \.self) { quiz in
                                Button {
                                    viewModel.didTapNavigateToQuiz(selectedQuiz: quiz)
                                } label: {
                                    QuizMenuCellView(quiz: quiz, viewModel: viewModel)
                                }
                            }
                        }
                    }
                }
                .navigationDestination(for: Route.self) { $0 }
            }
            .navigationTitle("Hey Joe 👋")
        }
    }
}
