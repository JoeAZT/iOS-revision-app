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
                            Text("Easy quiz")
                            Spacer()
                            //amend this based on the users score - bronze, silver, gold
                            Image(systemName: "trophy.fill")
                                .foregroundColor(.gray.opacity(0.75))
                        }
                        .modifier(MainButtonStyle())
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
