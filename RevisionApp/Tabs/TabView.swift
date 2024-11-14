//
//  TabView.swift
//  RevisionApp
//
//  Created by Joe Taylor on 18/09/2024.
//

import SwiftUI

struct QuizTabView: View {
    
    // State to track the selected tab
    @State private var selectedTab: Tab = .quizMenu
    
    // Enum for tabs
    enum Tab {
        case quizMenu
        case profile
    }
    
    var body: some View {
        TabView {
            QuizMenuView(
                viewModel: MainViewModel(
                    router: Router(),
                    quizLoader: JSONQuizLoader(),
                    trophyColorProvider: DefaultTrophyColorProvider()
                )
            )
            .tabItem {
                Image(systemName: "questionmark.circle")
            }
            .tag(Tab.quizMenu)
            
            ProfileView()
                .tabItem {
                    Image(systemName: "circle.fill")
                }
                .tag(Tab.profile)
        }
        .accentColor(.black)
    }
}

#Preview {
    QuizTabView()
}
