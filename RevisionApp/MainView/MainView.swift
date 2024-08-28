//
//  MainView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 28/08/2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel

    var body: some View {
        NavigationStack(path: $viewModel.router.stack) {
            VStack {
                Text("Main menu")
                Button {
                    viewModel.didTapNavigateToQuiz()
                } label: {
                    Text("Start quiz")
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .quizView(let viewModel):
                    ContentView(viewModel: viewModel)
                }
            }
        }
    }
}
