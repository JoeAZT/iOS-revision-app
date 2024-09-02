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
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea(.all)
                VStack {
                    Button {
                        viewModel.didTapNavigateToQuiz()
                    } label: {
                        HStack {
                            Text("Start quiz")
                            Spacer()
                            Text("10/12")
                        }
                        .modifier(MainButtonStyle())
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .quizView(let viewModel):
                        ContentView(viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("Main menu")
            
        }
    }
}
