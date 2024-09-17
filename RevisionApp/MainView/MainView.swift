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
                    ScrollView {

                        DailyQuizView()

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
                                        .foregroundColor(viewModel.trophyColor(for: scorePercentage))
                                }
                                .modifier(MainButtonStyle())
                            }
                        }
                    }
                }
                .navigationDestination(for: Route.self) { $0 }
            }
            .navigationTitle("Main menu")
        }
    }
}

//import SwiftUI

//struct MainView: View {
//    @ObservedObject var viewModel: MainViewModel
//    private let scoreManager = ScoreManager()
//    
//    var body: some View {
//        NavigationStack(path: $viewModel.router.stack) {
//            ZStack {
//                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                    .ignoresSafeArea(.all)
//                
//                // Define the grid layout with two columns
//                let columns = [
//                    GridItem(.flexible(minimum: 200, maximum: 200)),
//                    GridItem(.flexible(minimum: 200, maximum: 200))
//                ]
//                
//                ScrollView {
//                    DailyQuizView()
//                    LazyVGrid(columns: columns, spacing: 20) {
//                        ForEach(viewModel.quizzes, id: \.self) { quiz in
//                            let bestScore = scoreManager.getScore(for: quiz)
//                            let totalQuestions = scoreManager.getTotalQuestions(for: quiz)
//                            let scorePercentage = totalQuestions > 0 ? (Double(bestScore) / Double(totalQuestions)) * 100 : 0
//                            
//                            Button(action: {
//                                viewModel.didTapNavigateToQuiz(selectedQuiz: quiz)
//                            }) {
//                                VStack {
//                                    Text(quiz)
//                                    Image(systemName: "trophy.fill")
//                                        .foregroundColor(viewModel.trophyColor(for: scorePercentage))
//                                }
//                                .modifier(MainButtonStyle())
//                            }
//                        }
//                    }
////                    .padding()
//                }
//                .padding()
//            }
//            .navigationTitle("Main menu")
//        }
//    }
//}

