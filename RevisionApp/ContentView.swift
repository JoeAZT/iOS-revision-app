//
//  ContentView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 10/12/2024.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                QuizMenuView(
                    viewModel: MainViewModel(
                        router: Router(),
                        quizLoader: JSONQuizLoader(),
                        quizCellViewModel: QuizCellViewModel(
                            trophyColorProvider: DefaultTrophyColorProvider(),
                            scoreManger: ScoreManager()
                        )
                    )
                )
            } else {
                OnboardingView(viewModel: viewModel)
            }
        }
    }
}
