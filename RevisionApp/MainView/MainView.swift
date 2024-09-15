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
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
                VStack {
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
                                
                                // Determine trophy color based on score percentage
                                Image(systemName: "trophy.fill")
                                    .foregroundColor(viewModel.trophyColor(for: scorePercentage))
                            }
                            .modifier(MainButtonStyle())
                        }
                    }

                    Spacer()
                }
                .padding(.horizontal)
                .navigationDestination(for: Route.self) { $0 }
            }
            .navigationTitle("Main menu")
        }
    }
}
